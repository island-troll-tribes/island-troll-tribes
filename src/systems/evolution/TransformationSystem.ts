/**
 * TransformationSystem - Handles troll class evolution (Base → Sub → Super).
 *
 * Ports Transformation.wurst and TrollUpgrade.wurst:
 * - Uses WC3 Bear Form ability to swap unit types (no replacement needed)
 * - Preserves stats (STR/AGI/INT) across transformation
 * - Runs prior/after callbacks for name, color, and corpse fixing
 * - Registers all 35 valid transformation pairs at initialization
 *
 * WC3 Mechanic: Bear Form abilities auto-swap unit type when added then removed.
 * The ability definition maps originID ↔ targetID at compile time via war3-transformer.
 */

import { Unit, Trigger, MapPlayer } from "w3ts";
import { UnitTypeIds } from "../../data/UnitIds";

/** Callback that runs before or after a transformation */
export type TransformCallback = (target: Unit, previousTypeId: number) => void;

/** A registered transformation pair: origin → target, with the ability ID used to perform it */
interface TransformationEntry {
  originId: number;
  targetId: number;
  abilityId: number;
}

/**
 * All valid troll evolution paths.
 * Each pair is [originUnitTypeId, targetUnitTypeId].
 */
const TROLL_EVOLUTION_PAIRS: [number, number][] = [
  // Hunter line
  [UnitTypeIds.HUNTER, UnitTypeIds.WARRIOR],
  [UnitTypeIds.HUNTER, UnitTypeIds.TRACKER],
  [UnitTypeIds.HUNTER, UnitTypeIds.JUGGERNAUT],
  [UnitTypeIds.WARRIOR, UnitTypeIds.JUGGERNAUT],
  [UnitTypeIds.TRACKER, UnitTypeIds.JUGGERNAUT],
  // Beastmaster line
  [UnitTypeIds.BEASTMASTER, UnitTypeIds.SHAPESHIFTER_WOLF],
  [UnitTypeIds.BEASTMASTER, UnitTypeIds.DRUID],
  [UnitTypeIds.BEASTMASTER, UnitTypeIds.JUNGLE_TYRANT],
  [UnitTypeIds.SHAPESHIFTER_WOLF, UnitTypeIds.JUNGLE_TYRANT],
  [UnitTypeIds.DRUID, UnitTypeIds.JUNGLE_TYRANT],
  // Priest line
  [UnitTypeIds.PRIEST, UnitTypeIds.BOOSTER],
  [UnitTypeIds.PRIEST, UnitTypeIds.MASTER_HEALER],
  [UnitTypeIds.PRIEST, UnitTypeIds.SAGE],
  [UnitTypeIds.BOOSTER, UnitTypeIds.SAGE],
  [UnitTypeIds.MASTER_HEALER, UnitTypeIds.SAGE],
  // Mage line
  [UnitTypeIds.MAGE, UnitTypeIds.ELEMENTALIST],
  [UnitTypeIds.MAGE, UnitTypeIds.HYPNOTIST],
  [UnitTypeIds.MAGE, UnitTypeIds.DEMENTIA_MASTER],
  [UnitTypeIds.ELEMENTALIST, UnitTypeIds.DEMENTIA_MASTER],
  [UnitTypeIds.HYPNOTIST, UnitTypeIds.DEMENTIA_MASTER],
  // Scout line
  [UnitTypeIds.SCOUT, UnitTypeIds.TRAPPER],
  [UnitTypeIds.SCOUT, UnitTypeIds.OBSERVER],
  [UnitTypeIds.SCOUT, UnitTypeIds.SPY],
  [UnitTypeIds.TRAPPER, UnitTypeIds.SPY],
  [UnitTypeIds.OBSERVER, UnitTypeIds.SPY],
  // Gatherer line
  [UnitTypeIds.GATHERER, UnitTypeIds.RADAR_GATHERER],
  [UnitTypeIds.GATHERER, UnitTypeIds.HERB_MASTER],
  [UnitTypeIds.GATHERER, UnitTypeIds.OMNIGATHERER],
  [UnitTypeIds.RADAR_GATHERER, UnitTypeIds.OMNIGATHERER],
  [UnitTypeIds.HERB_MASTER, UnitTypeIds.OMNIGATHERER],
  // Thief line
  [UnitTypeIds.THIEF, UnitTypeIds.CONTORTIONIST],
  [UnitTypeIds.THIEF, UnitTypeIds.ESCAPE_ARTIST],
  [UnitTypeIds.THIEF, UnitTypeIds.ASSASSIN],
  [UnitTypeIds.CONTORTIONIST, UnitTypeIds.ASSASSIN],
  [UnitTypeIds.ESCAPE_ARTIST, UnitTypeIds.ASSASSIN],
];

/** Ability ID → target unit type ID mapping for evolution spell detection */
interface UpgradeMapping {
  abilityId: number;
  targetUnitId: number;
}

export class TransformationSystem {
  private static instance: TransformationSystem;

  /** Map from "originId:targetId" → abilityId for Bear Form trick */
  private transformAbilities: Map<string, number> = new Map();

  /** Callbacks run before transformation */
  private priorCallbacks: TransformCallback[] = [];

  /** Callbacks run after transformation */
  private afterCallbacks: TransformCallback[] = [];

  /** Upgrade ability → target unit mapping (for spell-finish detection) */
  private upgradeMap: Map<number, number> = new Map();

  /** Trigger for detecting evolution spell casts */
  private spellTrigger: Trigger | null = null;

  /** Next available ability ID for Bear Form generation */
  private nextAbilityId: number = 0;

  private constructor() {}

  static getInstance(): TransformationSystem {
    if (!TransformationSystem.instance) {
      TransformationSystem.instance = new TransformationSystem();
    }
    return TransformationSystem.instance;
  }

  /**
   * Initialize all transformation pairs.
   * Must be called after map is loaded (in MAIN_AFTER hook).
   *
   * In the final build, the Bear Form abilities are generated at compile time
   * by war3-transformer. At runtime, we just register the ability IDs.
   */
  initialize(): void {
    // Register all valid evolution paths
    for (const [originId, targetId] of TROLL_EVOLUTION_PAIRS) {
      this.registerTransformation(originId, targetId);
    }

    // Register default after-effects
    this.registerAfterEffect((target, _prevId) => {
      // Correct unit color (WC3 resets to slot color after Bear Form)
      target.color = target.owner.color;
    });

    // Set up the spell-finish trigger for evolution detection
    this.spellTrigger = new Trigger();
    this.spellTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_FINISH);
    this.spellTrigger.addAction(() => this.onSpellFinish());
  }

  /**
   * Register a transformation pair.
   * Returns the ability ID used for the Bear Form trick.
   */
  registerTransformation(originId: number, targetId: number): number {
    const key = this.makeKey(originId, targetId);
    if (this.transformAbilities.has(key)) {
      return this.transformAbilities.get(key)!;
    }

    // In the real build, this ability is created at compile time by war3-transformer.
    // The ability ID must match what was generated in the object data.
    // For now, we use a placeholder that will be resolved during compilation.
    const abilityId = this.nextAbilityId++;
    this.transformAbilities.set(key, abilityId);
    return abilityId;
  }

  /** Register a callback to run before any transformation */
  registerPriorEffect(callback: TransformCallback): void {
    this.priorCallbacks.push(callback);
  }

  /** Register a callback to run after any transformation */
  registerAfterEffect(callback: TransformCallback): void {
    this.afterCallbacks.push(callback);
  }

  /**
   * Register an upgrade ability mapping (ability cast → unit transformation).
   * When a troll casts this ability, they evolve to the target unit type.
   */
  registerUpgrade(abilityId: number, targetUnitId: number): void {
    this.upgradeMap.set(abilityId, targetUnitId);
  }

  /**
   * Transform a unit from its current type to a target type.
   *
   * Uses the WC3 Bear Form trick:
   * 1. Add the pre-generated Bear Form ability
   * 2. The ability auto-morphs the unit
   * 3. Remove the ability
   *
   * Stats (STR/AGI/INT) are preserved across the transformation.
   */
  transformUnit(origin: Unit, targetId: number): boolean {
    const originId = origin.typeId;
    if (originId === targetId) return false;

    const key = this.makeKey(originId, targetId);
    const abilityId = this.transformAbilities.get(key);

    if (abilityId === undefined) {
      print(`TransformationSystem: No path registered from ${originId} to ${targetId}`);
      return false;
    }

    // Run prior callbacks
    for (const cb of this.priorCallbacks) {
      cb(origin, targetId);
    }

    // Save stats (WC3 can reset them during Bear Form morph)
    const str = origin.strength;
    const agi = origin.agility;
    const int = origin.intelligence;
    const hp = origin.life;
    const mp = origin.mana;

    // Perform the Bear Form trick
    origin.addAbility(abilityId);
    origin.removeAbility(abilityId);

    // Restore stats
    origin.strength = str;
    origin.agility = agi;
    origin.intelligence = int;
    origin.life = hp;
    origin.mana = mp;

    // Run after callbacks
    for (const cb of this.afterCallbacks) {
      cb(origin, originId);
    }

    return true;
  }

  /**
   * Upgrade a troll (the full evolution process).
   * Preserves stats, resets level, applies auto-skill, and closes UI.
   */
  upgradeUnit(origin: Unit, targetId: number): void {
    // Save stats before the transformation
    const str = origin.strength;
    const agi = origin.agility;
    const int = origin.intelligence;

    // Perform the transformation
    this.transformUnit(origin, targetId);

    // Reset experience (troll starts at level 1 in new class)
    // The removeLevels call strips hero levels for the XP system
    // TODO: Consider keeping XP with reduced level requirement instead
    const currentLevel = origin.level;
    if (currentLevel > 1) {
      SetHeroLevel(origin.handle, 1, false);
    }

    // Restore stats (they get wiped by level reset)
    origin.strength = str;
    origin.agility = agi;
    origin.intelligence = int;

    // Close the ability menu for the local player
    if (GetLocalPlayer() === origin.owner.handle) {
      ForceUICancel();
    }
  }

  /** Handle evolution spell casts */
  private onSpellFinish(): void {
    const caster = Unit.fromHandle(GetSpellAbilityUnit());
    const abilityId = GetSpellAbilityId();

    if (!caster) return;

    const targetId = this.upgradeMap.get(abilityId);
    if (targetId === undefined) return;

    // Perform the upgrade
    this.upgradeUnit(caster, targetId);
  }

  /** Create a lookup key from origin and target IDs */
  private makeKey(originId: number, targetId: number): string {
    return `${originId}:${targetId}`;
  }
}
