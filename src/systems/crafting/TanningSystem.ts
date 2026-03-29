/**
 * TanningSystem - Hide-to-armor conversion at the Tannery.
 *
 * Ported from wurst/systems/crafting/Tanning.wurst
 *
 * The tannery converts animal hides into armor pieces (boots, gloves, coats).
 * Each recipe is triggered by a QuickMake ability on the tannery building.
 * When cast, the system checks whether the tannery's inventory contains the
 * exact required hides (in order), consumes them, and produces the armor item.
 *
 * Recipes:
 *   Boots  = 2 hides of same type
 *   Gloves = 2 hides of same type
 *   Coat   = 3 hides of same type
 *
 * Animal types: Elk, Jungle Wolf, Jungle Bear, Hydra (scales)
 *
 * The original Wurst code uses a HashMap<abilityId, Pair<outputItem, List<inputItems>>>.
 * This port uses a flat array of TanneryRecipe objects for the same lookup,
 * avoiding runtime Map allocations.
 */

import { Unit, Item, Trigger } from "w3ts";
import { ItemIds } from "../../data/ItemIds";
import { AbilityIds } from "../../data/AbilityIds";

// ─── Ability IDs (wired to real QM constants from AbilityIds.ts) ────────

export const ABILITY_QM_ELK_SKIN_BOOTS = AbilityIds.QM_ELK_SKIN_BOOTS;
export const ABILITY_QM_ELK_SKIN_GLOVES = AbilityIds.QM_ELK_SKIN_GLOVES;
export const ABILITY_QM_ELK_SKIN_COAT = AbilityIds.QM_ELK_SKIN_COAT;

export const ABILITY_QM_JUNGLE_WOLF_SKIN_BOOTS = AbilityIds.QM_JUNGLE_WOLF_SKIN_BOOTS;
export const ABILITY_QM_JUNGLE_WOLF_SKIN_GLOVES = AbilityIds.QM_JUNGLE_WOLF_SKIN_GLOVES;
export const ABILITY_QM_JUNGLE_WOLF_SKIN_COAT = AbilityIds.QM_JUNGLE_WOLF_SKIN_COAT;

export const ABILITY_QM_JUNGLE_BEAR_SKIN_BOOTS = AbilityIds.QM_JUNGLE_BEAR_SKIN_BOOTS;
export const ABILITY_QM_JUNGLE_BEAR_SKIN_GLOVES = AbilityIds.QM_JUNGLE_BEAR_SKIN_GLOVES;
export const ABILITY_QM_JUNGLE_BEAR_SKIN_COAT = AbilityIds.QM_JUNGLE_BEAR_SKIN_COAT;

export const ABILITY_QM_HYDRA_SCALE_BOOTS = AbilityIds.QM_HYDRA_SCALE_BOOTS;
export const ABILITY_QM_HYDRA_SCALE_GLOVES = AbilityIds.QM_HYDRA_SCALE_GLOVES;
export const ABILITY_QM_HYDRA_SCALE_COAT = AbilityIds.QM_HYDRA_SCALE_COAT;

// ─── Types ──────────────────────────────────────────────────────────────────

/** A single tannery recipe: ability triggers conversion of inputs to output */
interface TanneryRecipe {
  /** The QuickMake ability ID that triggers this recipe */
  abilityId: number;
  /** The item type ID produced */
  outputItemId: number;
  /**
   * Required input item type IDs in order.
   * The tannery inventory must contain these items (taken from the first N slots).
   */
  requiredItems: number[];
  /** Human-readable name for debugging */
  name: string;
}

// ─── Recipe Data ────────────────────────────────────────────────────────────

const TANNERY_RECIPES: TanneryRecipe[] = [
  // ── Elk Hide ────────────────────────────────────────────────────────
  {
    abilityId: ABILITY_QM_ELK_SKIN_BOOTS,
    outputItemId: ItemIds.ELK_SKIN_BOOTS,
    requiredItems: [ItemIds.ELK_HIDE, ItemIds.ELK_HIDE],
    name: "Elk Skin Boots",
  },
  {
    abilityId: ABILITY_QM_ELK_SKIN_GLOVES,
    outputItemId: ItemIds.ELK_SKIN_GLOVES,
    requiredItems: [ItemIds.ELK_HIDE, ItemIds.ELK_HIDE],
    name: "Elk Skin Gloves",
  },
  {
    abilityId: ABILITY_QM_ELK_SKIN_COAT,
    outputItemId: ItemIds.ELK_SKIN_COAT,
    requiredItems: [ItemIds.ELK_HIDE, ItemIds.ELK_HIDE, ItemIds.ELK_HIDE],
    name: "Elk Skin Coat",
  },

  // ── Jungle Wolf Hide ────────────────────────────────────────────────
  {
    abilityId: ABILITY_QM_JUNGLE_WOLF_SKIN_BOOTS,
    outputItemId: ItemIds.WOLF_SKIN_BOOTS,
    requiredItems: [ItemIds.JUNGLE_WOLF_HIDE, ItemIds.JUNGLE_WOLF_HIDE],
    name: "Jungle Wolf Skin Boots",
  },
  {
    abilityId: ABILITY_QM_JUNGLE_WOLF_SKIN_GLOVES,
    outputItemId: ItemIds.WOLF_SKIN_GLOVES,
    requiredItems: [ItemIds.JUNGLE_WOLF_HIDE, ItemIds.JUNGLE_WOLF_HIDE],
    name: "Jungle Wolf Skin Gloves",
  },
  {
    abilityId: ABILITY_QM_JUNGLE_WOLF_SKIN_COAT,
    outputItemId: ItemIds.WOLF_SKIN_COAT,
    requiredItems: [
      ItemIds.JUNGLE_WOLF_HIDE,
      ItemIds.JUNGLE_WOLF_HIDE,
      ItemIds.JUNGLE_WOLF_HIDE,
    ],
    name: "Jungle Wolf Skin Coat",
  },

  // ── Jungle Bear Hide ────────────────────────────────────────────────
  {
    abilityId: ABILITY_QM_JUNGLE_BEAR_SKIN_BOOTS,
    outputItemId: ItemIds.BEAR_SKIN_BOOTS,
    requiredItems: [ItemIds.JUNGLE_BEAR_HIDE, ItemIds.JUNGLE_BEAR_HIDE],
    name: "Jungle Bear Skin Boots",
  },
  {
    abilityId: ABILITY_QM_JUNGLE_BEAR_SKIN_GLOVES,
    outputItemId: ItemIds.BEAR_SKIN_GLOVES,
    requiredItems: [ItemIds.JUNGLE_BEAR_HIDE, ItemIds.JUNGLE_BEAR_HIDE],
    name: "Jungle Bear Skin Gloves",
  },
  {
    abilityId: ABILITY_QM_JUNGLE_BEAR_SKIN_COAT,
    outputItemId: ItemIds.BEAR_SKIN_COAT,
    requiredItems: [
      ItemIds.JUNGLE_BEAR_HIDE,
      ItemIds.JUNGLE_BEAR_HIDE,
      ItemIds.JUNGLE_BEAR_HIDE,
    ],
    name: "Jungle Bear Skin Coat",
  },

  // ── Hydra Scales ────────────────────────────────────────────────────
  {
    abilityId: ABILITY_QM_HYDRA_SCALE_BOOTS,
    outputItemId: ItemIds.HYDRA_SCALE_BOOTS,
    requiredItems: [ItemIds.HYDRA_SCALE, ItemIds.HYDRA_SCALE],
    name: "Hydra Scale Boots",
  },
  {
    abilityId: ABILITY_QM_HYDRA_SCALE_GLOVES,
    outputItemId: ItemIds.HYDRA_SCALE_GLOVES,
    requiredItems: [ItemIds.HYDRA_SCALE, ItemIds.HYDRA_SCALE],
    name: "Hydra Scale Gloves",
  },
  {
    abilityId: ABILITY_QM_HYDRA_SCALE_COAT,
    outputItemId: ItemIds.HYDRA_SCALE_COAT,
    requiredItems: [
      ItemIds.HYDRA_SCALE,
      ItemIds.HYDRA_SCALE,
      ItemIds.HYDRA_SCALE,
    ],
    name: "Hydra Scale Coat",
  },
];

// ─── Core Logic ─────────────────────────────────────────────────────────────

/**
 * Get the inventory item type IDs from the first N slots of a unit.
 * Mirrors the Wurst `tannery.getInventory().take(recipe.size())` pattern.
 */
function getInventorySlotTypes(unit: Unit, slotCount: number): number[] {
  const types: number[] = [];
  for (let i = 0; i < slotCount && i < 6; i++) {
    const itemHandle = UnitItemInSlot(unit.handle, i);
    if (itemHandle) {
      types.push(GetItemTypeId(itemHandle));
    }
  }
  return types;
}

/**
 * Check if two item type ID arrays are equal (same length, same values in order).
 */
function arraysEqual(a: number[], b: number[]): boolean {
  if (a.length !== b.length) return false;
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) return false;
  }
  return true;
}

/**
 * Attempt to tan hides at a tannery using the given QuickMake ability.
 *
 * The system checks the tannery's first N inventory slots (where N is the
 * recipe's required item count) against the recipe's required item list.
 * If the items match exactly (type and order), they are consumed and the
 * output armor item is created.
 *
 * @param tannery   The tannery building unit.
 * @param abilityId The QuickMake ability that was cast.
 * @returns true if tanning succeeded, false if ingredients did not match.
 */
export function tan(tannery: Unit, abilityId: number): boolean {
  const recipe = findRecipeByAbility(abilityId);
  if (!recipe) return false;

  const slotCount = recipe.requiredItems.length;
  const inventoryTypes = getInventorySlotTypes(tannery, slotCount);

  if (!arraysEqual(inventoryTypes, recipe.requiredItems)) {
    return false;
  }

  // Consume the matching items from the first N slots
  for (let i = slotCount - 1; i >= 0; i--) {
    const itemHandle = UnitItemInSlot(tannery.handle, i);
    if (itemHandle) {
      RemoveItem(itemHandle);
    }
  }

  // Produce the output item
  tannery.addItemById(recipe.outputItemId);
  return true;
}

/**
 * Look up a tannery recipe by its ability ID.
 */
function findRecipeByAbility(abilityId: number): TanneryRecipe | null {
  for (const recipe of TANNERY_RECIPES) {
    if (recipe.abilityId === abilityId) {
      return recipe;
    }
  }
  return null;
}

// ─── TanningSystem Singleton ────────────────────────────────────────────────

export class TanningSystem {
  private static instance: TanningSystem;
  private trigger: Trigger | null = null;
  private enabled = false;

  /** Set of all tannery ability IDs for fast lookup */
  private readonly tanneryAbilityIds: Set<number>;

  private constructor() {
    this.tanneryAbilityIds = new Set(
      TANNERY_RECIPES.map((r) => r.abilityId)
    );
  }

  static getInstance(): TanningSystem {
    if (!TanningSystem.instance) {
      TanningSystem.instance = new TanningSystem();
    }
    return TanningSystem.instance;
  }

  /** Enable the tanning system (called when gameplay starts) */
  enable(): void {
    if (this.enabled) return;
    this.enabled = true;

    this.trigger = new Trigger();
    this.trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT);
    this.trigger.addAction(() => this.onSpellCast());
  }

  /** Disable the tanning system */
  disable(): void {
    this.enabled = false;
    if (this.trigger) {
      this.trigger.enabled = false;
    }
  }

  private onSpellCast(): void {
    const abilityId = GetSpellAbilityId();
    if (!this.tanneryAbilityIds.has(abilityId)) return;

    const caster = Unit.fromEvent();
    if (!caster) return;

    tan(caster, abilityId);
  }

  /** Get all tannery recipes (read-only). Useful for UI displays. */
  getRecipes(): ReadonlyArray<Readonly<TanneryRecipe>> {
    return TANNERY_RECIPES;
  }

  /** Check if an ability ID is a tannery recipe */
  isTanneryAbility(abilityId: number): boolean {
    return this.tanneryAbilityIds.has(abilityId);
  }
}
