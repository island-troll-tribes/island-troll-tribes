/**
 * CraftingEngine - Core crafting system that processes recipes.
 *
 * Replaces the original QuickMake.wurst, Mixing.wurst, and Tanning.wurst.
 *
 * Pipeline:
 * 1. Player casts a crafting ability at a station (or from inventory)
 * 2. Engine looks up the recipe definition for the ability
 * 3. Caster drops all items to ground temporarily
 * 4. Engine searches nearby ground for matching ingredients within range
 * 5. Items are matched against recipe slots in order
 * 6. If all slots filled: ingredients consumed, output item created
 * 7. Remaining items returned to inventory
 *
 * Range values (from original):
 * - Troll (handheld): 100
 * - Craft Master: 300
 * - Buildings: 700
 */

import { Unit, Trigger, Item } from "w3ts";
import { RecipeDefinition, CraftingStation } from "./RecipeDefinition";
import { ALL_RECIPES } from "../../data/recipes/AllRecipes";
import { TrollRegistry } from "../../entities/trolls/TrollRegistry";
import { ItemIds } from "../../data/ItemIds";

/** Special herb item IDs for threshold checking */
const SPECIAL_HERBS = [
  ItemIds.BLUE_HERB,
  ItemIds.YELLOW_HERB,
  ItemIds.PURPLE_HERB,
  ItemIds.ORANGE_HERB,
];

/** Search range by caster type */
const RANGE_TROLL = 100;
const RANGE_CRAFT_MASTER = 300;
const RANGE_BUILDING = 700;

export class CraftingEngine {
  private static instance: CraftingEngine;
  private recipes: Map<number, RecipeDefinition> = new Map(); // abilityId → recipe
  private recipesByStation: Map<CraftingStation, RecipeDefinition[]> = new Map();
  private castTrigger: Trigger | null = null;
  private enabled = false;

  private constructor() {
    this.loadRecipes();
  }

  static getInstance(): CraftingEngine {
    if (!CraftingEngine.instance) {
      CraftingEngine.instance = new CraftingEngine();
    }
    return CraftingEngine.instance;
  }

  /** Load all recipe definitions from data files */
  private loadRecipes(): void {
    for (const recipe of ALL_RECIPES) {
      this.recipes.set(recipe.abilityId, recipe);

      const stationRecipes =
        this.recipesByStation.get(recipe.station) ?? [];
      stationRecipes.push(recipe);
      this.recipesByStation.set(recipe.station, stationRecipes);
    }
  }

  /** Enable the crafting system (called when gameplay starts) */
  enable(): void {
    if (this.enabled) return;
    this.enabled = true;

    this.castTrigger = new Trigger();
    this.castTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT);
    this.castTrigger.addAction(() => this.onSpellCast());
  }

  /** Disable crafting (for special phases) */
  disable(): void {
    this.enabled = false;
    if (this.castTrigger) {
      this.castTrigger.enabled = false;
    }
  }

  private onSpellCast(): void {
    const caster = Unit.fromEvent();
    if (!caster) return;

    const abilityId = GetSpellAbilityId();
    const recipe = this.recipes.get(abilityId);
    if (!recipe) return;

    this.processRecipe(caster, recipe);
  }

  /**
   * Core recipe processing logic.
   * Mirrors the QuickMake.onCast() flow from the original Wurst code.
   */
  private processRecipe(caster: Unit, recipe: RecipeDefinition): void {
    const pos = { x: caster.x, y: caster.y };
    const range = this.getSearchRange(caster);
    const matchedItems: Item[] = [];
    const inventory = this.getInventoryItems(caster);

    // Track special herb usage for threshold checking
    const herbCounts = new Map<number, number>();
    for (const herbId of SPECIAL_HERBS) {
      herbCounts.set(herbId, 0);
    }

    // Drop all items to simplify ground search
    this.dropAllItems(caster);

    // Fill recipe slots in order
    let allSlotsFilled = true;
    for (const slot of recipe.ingredients) {
      let found: Item | null = null;

      for (const acceptedId of slot.acceptedItemIds) {
        found = this.findNearestItem(pos, range, acceptedId);

        // Handle herb threshold
        if (found && recipe.herbThreshold && herbCounts.has(found.typeId)) {
          const count = (herbCounts.get(found.typeId) ?? 0) + 1;
          herbCounts.set(found.typeId, count);

          if (count > recipe.herbThreshold) {
            found = null;
          }
        }

        if (found) {
          found.visible = false; // Hide from further matches
          matchedItems.push(found);
          break;
        }
      }

      if (!found) {
        allSlotsFilled = false;
        break;
      }
    }

    // Restore visibility
    for (const item of matchedItems) {
      item.visible = true;
    }

    // If all slots matched, add items to inventory to trigger transmutation
    if (allSlotsFilled && matchedItems.length === recipe.ingredients.length) {
      // Remove matched items from the "to restore" list
      for (const matched of matchedItems) {
        const idx = inventory.indexOf(matched);
        if (idx >= 0) inventory.splice(idx, 1);
        caster.addItem(matched);
      }

      // Handle special station-specific processing
      if (recipe.specialHandler === "mixing") {
        this.handleMixing(caster);
      } else if (recipe.specialHandler === "tanning") {
        this.handleTanning(caster, recipe.abilityId);
      }
    }

    // Restore remaining inventory items
    for (const item of inventory) {
      caster.addItem(item);
    }
  }

  /** Get the search range based on the caster type */
  private getSearchRange(caster: Unit): number {
    if (TrollRegistry.isTroll(caster)) {
      return RANGE_TROLL;
    }
    // Check for Craft Master unit type
    if (caster.typeId === FourCC("h00J")) {
      // UNIT_CRAFT_MASTER
      return RANGE_CRAFT_MASTER;
    }
    return RANGE_BUILDING;
  }

  /** Find the nearest item of a specific type within range */
  private findNearestItem(
    pos: { x: number; y: number },
    range: number,
    itemTypeId: number
  ): Item | null {
    // Use WC3 rect-based item enumeration
    const r = Rect(
      pos.x - range,
      pos.y - range,
      pos.x + range,
      pos.y + range
    );
    let found: Item | null = null;

    EnumItemsInRect(r, null, () => {
      const item = Item.fromHandle(GetEnumItem());
      if (item && item.typeId === itemTypeId && item.visible) {
        found = item;
      }
    });

    RemoveRect(r);
    return found;
  }

  /** Get all items currently in a unit's inventory */
  private getInventoryItems(unit: Unit): Item[] {
    const items: Item[] = [];
    for (let i = 0; i < 6; i++) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item) {
        items.push(Item.fromHandle(item));
      }
    }
    return items;
  }

  /** Drop all items from a unit's inventory to the ground */
  private dropAllItems(unit: Unit): void {
    for (let i = 5; i >= 0; i--) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item) {
        unit.removeItem(Item.fromHandle(item));
      }
    }
  }

  /** Handle Mixing Pot special recipes (herb combinations) */
  private handleMixing(caster: Unit): void {
    // Mixing pot recipes use special multi-condition evaluation
    // instead of the standard slot-matching system.
    // This will be implemented when porting Mixing.wurst
  }

  /** Handle Tannery special recipes (hide-to-armor conversion) */
  private handleTanning(caster: Unit, abilityId: number): void {
    // Tanning uses a different validation flow:
    // checks exact inventory contents against a HashMap lookup.
    // This will be implemented when porting Tanning.wurst
  }

  /** Get all recipes for a specific station */
  getRecipesForStation(station: CraftingStation): RecipeDefinition[] {
    return this.recipesByStation.get(station) ?? [];
  }

  /** Get a recipe by its ability ID */
  getRecipe(abilityId: number): RecipeDefinition | undefined {
    return this.recipes.get(abilityId);
  }
}
