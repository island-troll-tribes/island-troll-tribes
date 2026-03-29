/**
 * SurvivalSystem - Heat/Cold survival mechanics.
 *
 * Ported from wurst/systems/core/StatLoss.wurst and wurst/objects/abilities/Heat.wurst.
 *
 * Manages three degrading stats for each living troll:
 *   1. Heat  - stored as the player's gold resource (0 to heatMaximum).
 *              Displayed in the WC3 gold UI. Reaching 0 kills the troll.
 *   2. Energy (Mana) - decreases over time. Reaching 0 kills the troll.
 *   3. Health - slowly degrades every tick.
 *
 * Two periodic timers drive the system:
 *   - **Stat Loss timer** (default 3 s): subtracts heat, mana, and HP from
 *     every living troll. Camouflage triples all losses; bonfire aura reduces
 *     heat loss by 2; Frozen debuff adds 1-5 extra heat loss; depression
 *     stacks add extra energy loss.
 *   - **Stat Gain timer** (default 35 s): adds heat based on equipped gear
 *     (coat +5, boots/gloves +2 each, fire pinion +8) and time-of-day (+3
 *     during daytime 6:00-18:00). The Glow buff adds +2.
 *
 * A fast ANIMATION_PERIOD check (0.03 s) monitors for stat-death as quickly
 * as possible so the kill is attributed to the nearest enemy troll when one
 * is in experience range.
 *
 * Key design decisions vs. the original Wurst code:
 *   - Uses W3TS wrappers exclusively (Timer, Unit, MapPlayer, Group).
 *   - Avoids per-tick allocations: the troll list is fetched once per tick
 *     from PlayerManager rather than maintaining a separate set.
 *   - Item type sets are pre-built as ReadonlySet<number> for O(1) lookup.
 *   - Buff ability IDs are FourCC placeholders that must be mapped to actual
 *     object editor IDs once the .w3x is wired up.
 */

import { Timer, Unit, MapPlayer, Group } from "w3ts";
import { GameConfig } from "../../config/GameConfig";
import { ItemIds } from "../../data/ItemIds";
import { UnitTypeIds } from "../../data/UnitIds";

// ─── Buff / Ability FourCC placeholders ─────────────────────────────────
// These must match the compiled IDs from the WC3 object editor.
// TODO: Wire to actual IDs extracted from base.w3x.

/** Buff applied by the bonfire aura ability (reduces heat loss by 2). */
const BUFF_BON_FIRE_HEAT = FourCC("B000");

/** Buff applied when a unit is camouflaged (triples stat loss). */
const BUFF_CAMOUFLAGE = FourCC("B001");

/** Frozen-to-the-bone debuff (adds 1-5 random extra heat loss). */
const BUFF_FROZE_TO_BONE = FourCC("B002");

/** The Glow buff from Priest (+2 heat gain per gain tick). */
const BUFF_THE_GLOW = FourCC("B003");

/** Anchor Soul buff (prevents stat-death). */
const BUFF_ANCHOR_SOUL = FourCC("B004");

/** Depression debuffs from Hypnotist abilities. */
const BUFF_DEPRESSED_AURA = FourCC("B005");
const BUFF_DEPRESSED_ARROW = FourCC("B006");
const BUFF_DEPRESSED_THISTLE = FourCC("B007");

// ─── Fire ranges (from Heat.wurst) ─────────────────────────────────────
const CAMP_FIRE_HEAT_RANGE = 380.0;
const MAGE_FIRE_HEAT_RANGE = 600.0;

// ─── Animation period for fast stat-death check ─────────────────────────
const ANIMATION_PERIOD = 0.03;

// ─── Experience range for kill attribution ──────────────────────────────
const EXP_RANGE = 1200.0;

// ─── Item type sets for O(1) gear lookup ────────────────────────────────

/** All coat item type IDs. */
const COAT_IDS: ReadonlySet<number> = new Set([
  ItemIds.ELK_SKIN_COAT,
  ItemIds.WOLF_SKIN_COAT,
  ItemIds.BEAR_SKIN_COAT,
  ItemIds.BONE_COAT,
  ItemIds.IRON_COAT,
  ItemIds.STEEL_COAT,
  ItemIds.BATTLE_ARMOR,
  // Hydra Scale Coat and Cloaks are also in the COAT_LIST in the original
  ItemIds.CLOAK_OF_FLAMES,
  ItemIds.CLOAK_OF_FROST,
  ItemIds.CLOAK_OF_HEALING,
  ItemIds.CLOAK_OF_MANA,
]);

/** All boots item type IDs. */
const BOOTS_IDS: ReadonlySet<number> = new Set([
  ItemIds.ELK_SKIN_BOOTS,
  ItemIds.WOLF_SKIN_BOOTS,
  ItemIds.BEAR_SKIN_BOOTS,
  ItemIds.BONE_BOOTS,
  ItemIds.IRON_BOOTS,
  ItemIds.STEEL_BOOTS,
  ItemIds.ANABOLIC_BOOTS,
]);

/** All gloves item type IDs. */
const GLOVES_IDS: ReadonlySet<number> = new Set([
  ItemIds.ELK_SKIN_GLOVES,
  ItemIds.WOLF_SKIN_GLOVES,
  ItemIds.BEAR_SKIN_GLOVES,
  ItemIds.BONE_GLOVES,
  ItemIds.IRON_GLOVES,
  ItemIds.STEEL_GLOVES,
  ItemIds.BATTLE_GLOVES,
]);

/**
 * Fire Pinion item ID.
 * TODO: Add to ItemIds.ts once the Pinion items are defined there.
 * Using a placeholder FourCC for now.
 */
const ITEM_DD_PINION_FIRE = FourCC("I0E0");

/** Unit type IDs that count as fires for the heat-cast system. */
const FIRE_UNIT_IDS: ReadonlySet<number> = new Set([
  UnitTypeIds.CAMP_FIRE,
  // TODO: Add MAGE_FIRE unit type ID once defined in UnitIds.ts.
]);

// ─── Troll tracking helper ──────────────────────────────────────────────

/**
 * Reusable group for enumerating trolls / nearby units.
 * We keep a single instance to avoid per-tick allocations (critical because
 * WC3 1.32+ has a broken GC).
 */
let enumGroup: Group | null = null;

function getEnumGroup(): Group {
  if (!enumGroup) {
    enumGroup = new Group();
  }
  return enumGroup;
}

// ─── Minimal troll registry interface ───────────────────────────────────
// The system needs a list of all living trolls each tick. This is provided
// by an external registration mechanism (e.g. PlayerManager or a dedicated
// TrollGroup). To avoid a hard circular dependency we accept registration
// through a simple array.

/** Registered living troll units. Other systems call registerTroll /
 *  deregisterTroll to keep this list in sync. */
const livingTrolls: Unit[] = [];

// ─────────────────────────────────────────────────────────────────────────

export class SurvivalSystem {
  private static instance: SurvivalSystem;

  private config: GameConfig;

  /** Timer that fires every statLossInterval (default 3 s). */
  private statLossTimer: Timer | null = null;

  /** Timer that fires every statGainInterval (default 35 s). */
  private statGainTimer: Timer | null = null;

  /** Fast timer for stat-death detection (~0.03 s). */
  private deathCheckTimer: Timer | null = null;

  /** Whether the cycle is currently running. */
  private running = false;

  private constructor() {
    this.config = GameConfig.getInstance();
  }

  static getInstance(): SurvivalSystem {
    if (!SurvivalSystem.instance) {
      SurvivalSystem.instance = new SurvivalSystem();
    }
    return SurvivalSystem.instance;
  }

  // ─── Troll Registration ─────────────────────────────────────────────

  /**
   * Register a troll unit so the survival system tracks it.
   * Call when a troll spawns or revives.
   */
  static registerTroll(troll: Unit): void {
    if (!livingTrolls.includes(troll)) {
      livingTrolls.push(troll);
    }
  }

  /**
   * Deregister a troll unit (e.g. on permanent death or removal).
   */
  static deregisterTroll(troll: Unit): void {
    const idx = livingTrolls.indexOf(troll);
    if (idx >= 0) {
      // Swap-remove to avoid shifting the whole array.
      livingTrolls[idx] = livingTrolls[livingTrolls.length - 1];
      livingTrolls.pop();
    }
  }

  // ─── Lifecycle ──────────────────────────────────────────────────────

  /**
   * Start the stat loss / gain cycle. Called when the Gameplay state begins.
   */
  startStatLossCycle(): void {
    if (this.running) return;
    this.running = true;

    const statLossInterval = this.config.getStatLossInterval();
    const statGainInterval = this.config.getStatGainInterval();

    // --- Stat loss timer (heat, mana, HP degrade) ---
    this.statLossTimer = new Timer();
    this.statLossTimer.start(statLossInterval, true, () => {
      this.onStatLossTick();
    });

    // --- Stat gain timer (gear / time-of-day heat recovery) ---
    this.statGainTimer = new Timer();
    this.statGainTimer.start(statGainInterval, true, () => {
      this.onStatGainTick();
    });

    // --- Fast death-check timer ---
    this.deathCheckTimer = new Timer();
    this.deathCheckTimer.start(ANIMATION_PERIOD, true, () => {
      this.onDeathCheckTick();
    });
  }

  /**
   * Stop all survival timers. Called on game end / postgame.
   */
  stopStatLossCycle(): void {
    if (!this.running) return;
    this.running = false;

    if (this.statLossTimer) {
      this.statLossTimer.pause();
      this.statLossTimer.destroy();
      this.statLossTimer = null;
    }
    if (this.statGainTimer) {
      this.statGainTimer.pause();
      this.statGainTimer.destroy();
      this.statGainTimer = null;
    }
    if (this.deathCheckTimer) {
      this.deathCheckTimer.pause();
      this.deathCheckTimer.destroy();
      this.deathCheckTimer = null;
    }
  }

  // ─── Heat Management ────────────────────────────────────────────────

  /**
   * Get the current heat value for a player (stored as gold, 0..heatMax).
   */
  getHeat(player: MapPlayer): number {
    return player.getState(PLAYER_STATE_RESOURCE_GOLD);
  }

  /**
   * Set the heat value for a player, clamped to [0, heatMaximum].
   */
  setHeat(player: MapPlayer, value: number): void {
    const max = this.config.getHeatMaximum();
    const clamped = Math.max(0, Math.min(value, max));
    player.setState(PLAYER_STATE_RESOURCE_GOLD, clamped);
  }

  /**
   * Add heat to a player (can be negative to subtract).
   */
  addHeat(player: MapPlayer, delta: number): void {
    this.setHeat(player, this.getHeat(player) + delta);
  }

  /**
   * Get the heat for the owner of a unit.
   */
  getHeatForUnit(unit: Unit): number {
    return this.getHeat(unit.owner);
  }

  /**
   * Set the heat for the owner of a unit.
   */
  setHeatForUnit(unit: Unit, value: number): void {
    this.setHeat(unit.owner, value);
  }

  // ─── Gear Checks ───────────────────────────────────────────────────

  /**
   * Check if a unit has a coat equipped (any item in inventory that is a coat).
   * Returns true if at least one coat-type item is found.
   */
  hasCoat(unit: Unit): boolean {
    const size = unit.inventorySize;
    for (let i = 0; i < size; i++) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item != null && COAT_IDS.has(GetItemTypeId(item!))) {
        return true;
      }
    }
    return false;
  }

  /**
   * Get the heat bonus from equipped coat(s).
   * In the original, any coat provides a flat +5 heat per gain tick.
   */
  getCoatBonus(unit: Unit): number {
    const size = unit.inventorySize;
    for (let i = 0; i < size; i++) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item != null && COAT_IDS.has(GetItemTypeId(item!))) {
        return 5;
      }
    }
    return 0;
  }

  /**
   * Get the heat bonus from equipped boots.
   * In the original, any boots provide a flat +2 heat per gain tick.
   */
  getBootBonus(unit: Unit): number {
    const size = unit.inventorySize;
    for (let i = 0; i < size; i++) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item != null && BOOTS_IDS.has(GetItemTypeId(item!))) {
        return 2;
      }
    }
    return 0;
  }

  /**
   * Get the heat bonus from equipped gloves.
   * In the original, any gloves provide a flat +2 heat per gain tick.
   */
  getGloveBonus(unit: Unit): number {
    const size = unit.inventorySize;
    for (let i = 0; i < size; i++) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item != null && GLOVES_IDS.has(GetItemTypeId(item!))) {
        return 2;
      }
    }
    return 0;
  }

  /**
   * Check if a unit has the Fire Pinion equipped (+8 heat per gain tick).
   */
  getFirePinionBonus(unit: Unit): number {
    const size = unit.inventorySize;
    for (let i = 0; i < size; i++) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item != null && GetItemTypeId(item!) === ITEM_DD_PINION_FIRE) {
        return 8;
      }
    }
    return 0;
  }

  /**
   * Check if a unit is near a campfire or mage fire.
   * Searches for allied fire-type buildings within range.
   */
  isNearFire(unit: Unit): boolean {
    const g = getEnumGroup();
    g.clear();

    // Search at campfire range (wider mage fire range checked separately if
    // we add a MAGE_FIRE unit type). For now we use the larger of the two.
    const searchRange = Math.max(CAMP_FIRE_HEAT_RANGE, MAGE_FIRE_HEAT_RANGE);
    GroupEnumUnitsInRange(
      g.handle,
      GetUnitX(unit.handle),
      GetUnitY(unit.handle),
      searchRange,
      undefined
    );

    let found = false;
    g.for(() => {
      const enumUnit = GetEnumUnit()!;
      if (!found && FIRE_UNIT_IDS.has(GetUnitTypeId(enumUnit))) {
        // Check that the fire is allied.
        if (IsUnitAlly(enumUnit, unit.owner.handle)) {
          found = true;
        }
      }
    });
    g.clear();
    return found;
  }

  // ─── Core Tick Callbacks ───────────────────────────────────────────

  /**
   * Stat loss tick - runs every statLossInterval (default 3 seconds).
   *
   * For every living troll, subtract heat, mana, and HP. Various buffs
   * modify the loss amounts:
   *   - Camouflage: triples all losses
   *   - Bonfire aura: reduces heat loss by 2
   *   - Frozen-to-the-bone: adds 1-5 random extra heat loss
   *   - Depression stacks: add extra energy (mana) loss
   */
  onStatLossTick(): void {
    const lossAmount = this.config.getStatLossAmount();

    for (let i = livingTrolls.length - 1; i >= 0; i--) {
      const troll = livingTrolls[i];

      // Skip dead trolls.
      if (!UnitAlive(troll.handle)) continue;

      let heatLoss = lossAmount;
      let energyLoss = lossAmount;
      let healthLoss = lossAmount;

      // --- Camouflage penalty: triple all losses ---
      if (GetUnitAbilityLevel(troll.handle, BUFF_CAMOUFLAGE) > 0) {
        heatLoss *= 3;
        energyLoss *= 3;
        healthLoss *= 3;
      }

      // --- Bonfire aura: reduce heat loss by 2 ---
      if (GetUnitAbilityLevel(troll.handle, BUFF_BON_FIRE_HEAT) > 0) {
        heatLoss -= 2;
      }

      // --- Frozen debuff: add 1-5 random extra heat loss ---
      if (GetUnitAbilityLevel(troll.handle, BUFF_FROZE_TO_BONE) > 0) {
        heatLoss += GetRandomInt(1, 5);
      }

      // --- Depression stacks: extra energy loss ---
      const numDepression =
        (GetUnitAbilityLevel(troll.handle, BUFF_DEPRESSED_AURA) > 0 ? 1 : 0) +
        (GetUnitAbilityLevel(troll.handle, BUFF_DEPRESSED_ARROW) > 0
          ? 1
          : 0) +
        (GetUnitAbilityLevel(troll.handle, BUFF_DEPRESSED_THISTLE) > 0
          ? 1
          : 0);

      for (let d = 0; d < numDepression; d++) {
        energyLoss += GetRandomInt(1, 3);
      }
      if (numDepression > 1) {
        energyLoss += GetRandomInt(1, 6);
        if (numDepression > 2) {
          energyLoss += GetRandomInt(1, 6) + GetRandomInt(1, 6);
        }
      }

      // --- Apply losses ---

      // Heat (player gold).
      this.addHeat(troll.owner, -heatLoss);

      // Energy (unit mana).
      const newMana = Math.max(0, troll.mana - energyLoss);
      troll.mana = newMana;

      // Health - deal "fake" damage to avoid waking sleeping units.
      // We directly subtract HP. The original uses a helper that fires a
      // code-sourced damage event so that damage listeners can see it, but
      // for now a direct HP subtraction is equivalent for gameplay.
      const newHp = troll.life - healthLoss;
      if (newHp > 0.405) {
        troll.life = newHp;
      }
    }
  }

  /**
   * Stat gain tick - runs every statGainInterval (default 35 seconds).
   *
   * Adds heat to every living troll based on:
   *   - Daytime bonus (+3 between 6:00 and 18:00 game time)
   *   - The Glow buff (+2)
   *   - Equipped gear: coat (+5), boots (+2), gloves (+2), fire pinion (+8)
   */
  onStatGainTick(): void {
    for (let i = livingTrolls.length - 1; i >= 0; i--) {
      const troll = livingTrolls[i];
      if (!UnitAlive(troll.handle)) continue;

      let heat = 0;

      // --- Daytime bonus ---
      const timeOfDay = GetTimeOfDay();
      if (timeOfDay >= 6 && timeOfDay <= 18) {
        heat += 3;
      }

      // --- The Glow buff ---
      if (GetUnitAbilityLevel(troll.handle, BUFF_THE_GLOW) > 0) {
        heat += 2;
      }

      // --- Equipped gear bonuses ---
      heat += this.getCoatBonus(troll);
      heat += this.getBootBonus(troll);
      heat += this.getGloveBonus(troll);
      heat += this.getFirePinionBonus(troll);

      // Apply heat gain.
      if (heat > 0) {
        this.addHeat(troll.owner, heat);
      }
    }
  }

  /**
   * Fast death-check tick (~0.03 s). Kills any troll whose heat or mana
   * has reached zero, attributing the kill to the nearest enemy troll
   * when one is within experience range (defaulting to suicide).
   */
  private onDeathCheckTick(): void {
    for (let i = livingTrolls.length - 1; i >= 0; i--) {
      const troll = livingTrolls[i];
      if (!UnitAlive(troll.handle)) continue;

      // Anchor Soul prevents stat-death.
      if (GetUnitAbilityLevel(troll.handle, BUFF_ANCHOR_SOUL) > 0) {
        if (troll.mana < 1) troll.mana = 1;
        if (this.getHeat(troll.owner) < 1) this.setHeat(troll.owner, 1);
        continue;
      }

      // Check death conditions.
      const heat = this.getHeat(troll.owner);
      if (troll.mana >= 1 && heat >= 1) continue;

      // Find nearest enemy troll for kill attribution.
      const killer = this.findNearestEnemyTroll(troll, EXP_RANGE);

      // Deal lethal damage. If no enemy found, it is a suicide.
      const source = killer !== null ? killer : troll;
      UnitDamageTarget(
        source.handle,
        troll.handle,
        troll.life + 10, // overkill to guarantee death
        false,
        false,
        ATTACK_TYPE_CHAOS,
        DAMAGE_TYPE_UNIVERSAL,
        WEAPON_TYPE_WHOKNOWS
      );
    }
  }

  /**
   * Find the nearest enemy troll within a given range of a unit.
   */
  private findNearestEnemyTroll(
    origin: Unit,
    range: number
  ): Unit | null {
    const g = getEnumGroup();
    g.clear();

    GroupEnumUnitsInRange(
      g.handle,
      GetUnitX(origin.handle),
      GetUnitY(origin.handle),
      range,
      undefined
    );

    let nearest: unit | null = null;
    let nearestDist = range * range + 1;

    const ox = GetUnitX(origin.handle);
    const oy = GetUnitY(origin.handle);

    g.for(() => {
      const u = GetEnumUnit()!;
      // Must be an alive enemy troll.
      if (
        UnitAlive(u) &&
        IsUnitEnemy(u, origin.owner.handle) &&
        IsUnitType(u, UNIT_TYPE_HERO)
      ) {
        const dx = GetUnitX(u) - ox;
        const dy = GetUnitY(u) - oy;
        const dist = dx * dx + dy * dy;
        if (dist < nearestDist) {
          nearestDist = dist;
          nearest = u;
        }
      }
    });

    g.clear();

    if (nearest !== null) {
      return Unit.fromHandle(nearest) ?? null;
    }
    return null;
  }

  // ─── Config Accessors (delegating to GameConfig) ────────────────────

  /** Alias for readability. */
  getHeatMaximum(): number {
    return this.config.getHeatMaximum();
  }
}
