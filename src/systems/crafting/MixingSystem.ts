/**
 * MixingSystem - Herb combination logic for the Mixing Pot.
 *
 * Ported from wurst/systems/crafting/Mixing.wurst
 *
 * When a troll (or mixing pot building) casts a "Mix Herbs" ability,
 * all herbs in the caster's inventory are evaluated against a priority-ordered
 * list of mix rules. The first matching rule consumes all herbs and produces
 * the corresponding potion/item.
 *
 * Herb types:
 *   Base herbs:    River Root, River Stem, Athelas Seed
 *   Special herbs: Blue, Yellow, Orange, Purple
 *
 * Priority is determined by evaluation order -- the first matching recipe wins.
 * Higher-priority recipes require rarer/more-specific combinations.
 *
 * Trigger abilities:
 *   - ABILITY_MIX_HERBS            (Herb Master troll ability)
 *   - ABILITY_POT_MIX_HERBS        (Mixing Pot building ability)
 *   - ABILITY_OMNIGATHERER_MIX_HERBS (Omnigatherer special ability)
 */

import { Unit, Item, Trigger } from "w3ts";
import { ItemIds } from "../../data/ItemIds";

// ─── Herb item IDs ──────────────────────────────────────────────────────────

/** All herb item type IDs that get consumed during mixing */
const ALL_HERB_IDS: Set<number> = new Set([
  ItemIds.RIVER_ROOT,
  ItemIds.RIVER_STEM,
  ItemIds.ATHELAS_SEED,
  ItemIds.BLUE_HERB,
  ItemIds.YELLOW_HERB,
  ItemIds.ORANGE_HERB,
  ItemIds.PURPLE_HERB,
]);

/** The four "special" (colored) herbs */
const SPECIAL_HERB_IDS: number[] = [
  ItemIds.BLUE_HERB,
  ItemIds.YELLOW_HERB,
  ItemIds.ORANGE_HERB,
  ItemIds.PURPLE_HERB,
];

// ─── Ability IDs (placeholders -- must be mapped to real object IDs) ────────

/** Mix Herbs ability on Herb Master troll */
export const ABILITY_MIX_HERBS = FourCC("A0M0");

/** Mix Herbs ability on Mixing Pot building */
export const ABILITY_POT_MIX_HERBS = FourCC("A0M1");

/** Mix Herbs ability on Omnigatherer */
export const ABILITY_OMNIGATHERER_MIX_HERBS = FourCC("A0M2");

// ─── Types ──────────────────────────────────────────────────────────────────

/** Counts of each herb type in the caster's inventory */
interface HerbCounts {
  blue: number;
  orange: number;
  purple: number;
  yellow: number;
  root: number;
  stem: number;
  athelas: number;
  /** Total special (colored) herbs */
  specCount: number;
  /** Number of distinct special herb types present */
  specTypes: number;
}

/**
 * A single mix rule: a predicate on herb counts and the resulting item.
 * Rules are evaluated in priority order (index 0 = highest priority).
 */
interface MixRule {
  /** Human-readable name for debugging / tooltips */
  name: string;
  /** Returns true if the herb combination satisfies this rule */
  matches: (h: HerbCounts) => boolean;
  /** Item type ID produced when this rule matches */
  outputItemId: number;
}

// ─── Mix Rules (priority-ordered, highest first) ────────────────────────────
// Order faithfully mirrors Mixing.wurst to preserve original game balance.

const MIX_RULES: MixRule[] = [
  {
    name: "Essence of Bees",
    matches: (h) => h.specTypes > 2 && h.specCount > 3,
    outputItemId: ItemIds.ESSENCE_OF_BEES,
  },
  {
    name: "Twin Islands Potion",
    matches: (h) =>
      (h.yellow > 2 && h.blue > 2) || (h.orange > 2 && h.purple > 2),
    outputItemId: ItemIds.TWIN_ISLANDS_POTION,
  },
  {
    name: "Nether Potion",
    matches: (h) => h.specCount > 0 && h.stem > 1 && h.athelas > 1,
    outputItemId: ItemIds.NETHER_POTION,
  },
  {
    name: "Drunk's Potion",
    matches: (h) => h.specCount > 0 && h.root > 1 && h.athelas > 1,
    outputItemId: ItemIds.DRUNKS_POTION,
  },
  {
    name: "Fervor Potion",
    matches: (h) => h.specCount > 2 && h.specTypes > 1 && h.athelas > 0,
    outputItemId: ItemIds.FERVOR_POTION,
  },
  {
    name: "Disease Potion",
    matches: (h) => h.specTypes > 1 && h.specCount > 3 && h.root > 0,
    outputItemId: ItemIds.DISEASE_POTION,
  },
  {
    name: "Acid Bomb",
    matches: (h) => h.specTypes > 1 && h.specCount > 3 && h.stem > 1,
    outputItemId: ItemIds.ACID_BOMB,
  },
  {
    name: "Bee Hive",
    matches: (h) => h.specCount > 0 && h.stem > 1,
    outputItemId: ItemIds.BEE_HIVE,
  },
  {
    name: "Spirit of Darkness",
    matches: (h) => h.stem > 0 && h.root > 0 && h.athelas === 2,
    outputItemId: ItemIds.SPIRIT_DARKNESS,
  },
  {
    name: "Anabolic Potion",
    matches: (h) => h.stem > 3,
    outputItemId: ItemIds.ANABOLIC_POTION,
  },
  {
    name: "Omnicure",
    matches: (h) => h.athelas > 1 && h.specTypes > 1,
    outputItemId: ItemIds.OMNICURE,
  },
  {
    name: "Oracle Potion",
    matches: (h) => h.athelas > 1 && h.specCount > 0,
    outputItemId: ItemIds.ORACLE_POTION,
  },
  {
    name: "Mana Potion",
    matches: (h) => h.stem > 0 && h.athelas > 0,
    outputItemId: ItemIds.MANA_POTION,
  },
  {
    name: "Healing Potion",
    matches: (h) => h.root > 0 && h.athelas > 0,
    outputItemId: ItemIds.HEALING_POTION,
  },
  {
    name: "Gem of Knowledge",
    matches: (h) => h.specTypes >= 2 && h.specCount >= 4,
    outputItemId: ItemIds.GEM_OF_KNOWLEDGE,
  },
  {
    name: "Anti-Magic Potion",
    matches: (h) => h.specCount > 0 && h.athelas > 0,
    outputItemId: ItemIds.ANTI_MAGIC_POTION,
  },
  {
    name: "Spirit of Wind",
    matches: (h) => h.stem > 1,
    outputItemId: ItemIds.SPIRIT_WIND,
  },
  {
    name: "Spirit of Water",
    matches: (h) => h.root > 1,
    outputItemId: ItemIds.SPIRIT_WATER,
  },
  {
    name: "Cure All",
    matches: (h) => h.athelas > 2,
    outputItemId: ItemIds.CURE_ALL,
  },
];

// ─── Core Logic ─────────────────────────────────────────────────────────────

/**
 * Count all herbs in a unit's inventory.
 * Reuses a single object to avoid GC pressure (WC3 Lua GC is disabled).
 */
const _herbCounts: HerbCounts = {
  blue: 0,
  orange: 0,
  purple: 0,
  yellow: 0,
  root: 0,
  stem: 0,
  athelas: 0,
  specCount: 0,
  specTypes: 0,
};

function countHerbs(caster: Unit): HerbCounts {
  const h = _herbCounts;
  h.blue = 0;
  h.orange = 0;
  h.purple = 0;
  h.yellow = 0;
  h.root = 0;
  h.stem = 0;
  h.athelas = 0;

  for (let i = 0; i < 6; i++) {
    const itemHandle = UnitItemInSlot(caster.handle, i);
    if (!itemHandle) continue;
    const typeId = GetItemTypeId(itemHandle);

    if (typeId === ItemIds.BLUE_HERB) h.blue++;
    else if (typeId === ItemIds.ORANGE_HERB) h.orange++;
    else if (typeId === ItemIds.PURPLE_HERB) h.purple++;
    else if (typeId === ItemIds.YELLOW_HERB) h.yellow++;
    else if (typeId === ItemIds.RIVER_ROOT) h.root++;
    else if (typeId === ItemIds.RIVER_STEM) h.stem++;
    else if (typeId === ItemIds.ATHELAS_SEED) h.athelas++;
  }

  h.specCount = h.blue + h.orange + h.purple + h.yellow;
  h.specTypes = 0;
  if (h.blue > 0) h.specTypes++;
  if (h.orange > 0) h.specTypes++;
  if (h.purple > 0) h.specTypes++;
  if (h.yellow > 0) h.specTypes++;

  return h;
}

/**
 * Remove all herb items from the caster's inventory.
 * Iterates slots in reverse to avoid index shifting issues.
 */
function removeAllHerbs(caster: Unit): void {
  for (let i = 5; i >= 0; i--) {
    const itemHandle = UnitItemInSlot(caster.handle, i);
    if (!itemHandle) continue;
    const typeId = GetItemTypeId(itemHandle);
    if (ALL_HERB_IDS.has(typeId)) {
      RemoveItem(itemHandle);
    }
  }
}

/**
 * Evaluate the herb mix for a caster and produce the result.
 *
 * @param caster The unit performing the mix (troll or mixing pot building).
 * @returns The item type ID of the produced item, or 0 if no recipe matched.
 */
export function mix(caster: Unit): number {
  const h = countHerbs(caster);

  for (const rule of MIX_RULES) {
    if (rule.matches(h)) {
      removeAllHerbs(caster);
      caster.addItemById(rule.outputItemId);
      return rule.outputItemId;
    }
  }

  // No recipe matched -- herbs are NOT consumed
  return 0;
}

// ─── MixingSystem Singleton ─────────────────────────────────────────────────

export class MixingSystem {
  private static instance: MixingSystem;
  private trigger: Trigger | null = null;
  private enabled = false;

  /** Ability IDs that trigger mixing */
  private readonly mixAbilityIds: Set<number> = new Set([
    ABILITY_MIX_HERBS,
    ABILITY_POT_MIX_HERBS,
    ABILITY_OMNIGATHERER_MIX_HERBS,
  ]);

  private constructor() {}

  static getInstance(): MixingSystem {
    if (!MixingSystem.instance) {
      MixingSystem.instance = new MixingSystem();
    }
    return MixingSystem.instance;
  }

  /** Enable the mixing system (called when gameplay starts) */
  enable(): void {
    if (this.enabled) return;
    this.enabled = true;

    this.trigger = new Trigger();
    this.trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT);
    this.trigger.addAction(() => this.onSpellCast());
  }

  /** Disable the mixing system */
  disable(): void {
    this.enabled = false;
    if (this.trigger) {
      this.trigger.enabled = false;
    }
  }

  /**
   * Register an additional ability ID that triggers mixing.
   * Useful for custom/class-specific mix abilities.
   */
  registerMixAbility(abilityId: number): void {
    this.mixAbilityIds.add(abilityId);
  }

  private onSpellCast(): void {
    const abilityId = GetSpellAbilityId();
    if (!this.mixAbilityIds.has(abilityId)) return;

    const caster = Unit.fromEvent();
    if (!caster) return;

    mix(caster);
  }

  /**
   * Get all mix rules (read-only). Useful for UI tooltips and recipe displays.
   */
  getRules(): ReadonlyArray<Readonly<MixRule>> {
    return MIX_RULES;
  }
}
