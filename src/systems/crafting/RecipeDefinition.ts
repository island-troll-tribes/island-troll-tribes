/**
 * RecipeDefinition - Data-driven crafting recipe definitions.
 *
 * All recipes are defined as pure TypeScript interfaces, making them:
 * - Easy to read and modify from any device
 * - Easy to generate via AI
 * - Validatable at compile time
 * - Searchable and filterable
 *
 * Recipe system mirrors the original QuickMake.wurst but with cleaner data separation.
 */

/** Which crafting station processes this recipe */
export enum CraftingStation {
  /** No station needed - hand crafting near items */
  Handheld = "handheld",
  /** Forge - metals, weapons, basic armor */
  Forge = "forge",
  /** Armory - enchanted armor and weapons */
  Armory = "armory",
  /** Tannery - animal hides to armor */
  Tannery = "tannery",
  /** Mixing Pot - herbs to potions */
  MixingPot = "mixing_pot",
  /** Workshop - traps, bombs, magical items */
  Workshop = "workshop",
  /** Witch Doctor's Hut - scrolls, cloaks */
  WitchDoctorHut = "witch_doctor_hut",
  /** Craft Master - building kits */
  CraftMaster = "craft_master",
}

/** A single ingredient slot in a recipe */
export interface RecipeSlot {
  /**
   * Item type IDs accepted in this slot.
   * Multiple IDs means any of them can satisfy the slot (OR logic).
   * This mirrors the QuickMake `add(asList(...))` pattern.
   */
  acceptedItemIds: number[];

  /** Display name for tooltip (optional - derived from item data if omitted) */
  displayName?: string;
}

/** A complete crafting recipe definition */
export interface RecipeDefinition {
  /** Unique identifier */
  id: string;

  /** The ability ID that triggers this recipe when cast */
  abilityId: number;

  /** Display name shown in recipe book */
  name: string;

  /** Description / tooltip */
  description: string;

  /** Which station processes this recipe */
  station: CraftingStation;

  /** Ordered list of ingredient slots */
  ingredients: RecipeSlot[];

  /** The item type ID produced */
  outputItemId: number;

  /** Number of output items produced (default 1) */
  outputCount?: number;

  /** Icon path for the recipe book UI */
  iconPath: string;

  /** Hotkey for the ability button */
  hotkey?: string;

  /** Button position (x, y) in the spellbook */
  buttonPos?: { x: number; y: number };

  /**
   * Special herb threshold - limits how many of the same special herb
   * can be used in the recipe. Used for Mixing Pot recipes.
   * 0 = no limit (default)
   */
  herbThreshold?: number;

  /** Whether this is a special recipe handled by Mixing.ts or Tanning.ts */
  specialHandler?: "mixing" | "tanning";
}

/** Grouping of recipes into a spellbook page for UI */
export interface RecipeBookPage {
  /** Page name */
  name: string;

  /** Icon for the tab */
  iconPath: string;

  /** Recipe IDs on this page */
  recipeIds: string[];
}

/** Complete recipe book for a crafting station */
export interface RecipeBook {
  /** Station this book belongs to */
  station: CraftingStation;

  /** Pages in the book */
  pages: RecipeBookPage[];
}
