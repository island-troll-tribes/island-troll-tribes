/**
 * AllRecipes - Data-driven recipe definitions for all crafting stations.
 *
 * Each recipe is a pure data definition that the CraftingEngine processes.
 * This consolidates all the scattered Wurst QuickMake files:
 * - ForgeQuickMake.wurst (24 recipes)
 * - ArmoryQuickMake.wurst (5 recipes)
 * - TanneryQuickMake.wurst (9 recipes)
 * - MixingPotQuickMake.wurst (21 recipes)
 * - WorkshopQuickMake.wurst (10 recipes)
 * - WitchDoctorHutQuickMake.wurst (12 recipes)
 * - BuildingQuickMake.wurst (12 recipes)
 *
 * Total: ~93 recipes
 *
 * TODO: Port all 93 recipes from the Wurst QuickMake files.
 * Below are representative examples from each station.
 */

import { RecipeDefinition, CraftingStation } from "../../systems/crafting/RecipeDefinition";
import { ItemIds } from "../ItemIds";

export const ALL_RECIPES: RecipeDefinition[] = [
  // ═══════════════════════════════════════════════════════════════════
  // FORGE RECIPES
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "iron_ingot",
    abilityId: 0, // Placeholder - will be mapped to actual ability ID
    name: "Iron Ingot",
    description: "Smelts stone and flint into an iron ingot.\n\n2x Stone + 2x Flint",
    station: CraftingStation.Forge,
    ingredients: [
      { acceptedItemIds: [ItemIds.STONE] },
      { acceptedItemIds: [ItemIds.STONE] },
      { acceptedItemIds: [ItemIds.FLINT] },
      { acceptedItemIds: [ItemIds.FLINT] },
    ],
    outputItemId: ItemIds.IRON_INGOT,
    iconPath: "ReplaceableTextures/CommandButtons/BTNHumanArmorUpOne.blp",
  },
  {
    id: "steel_ingot",
    abilityId: 0,
    name: "Steel Ingot",
    description: "Refines iron into steel.\n\n2x Iron Ingot + 2x Flint",
    station: CraftingStation.Forge,
    ingredients: [
      { acceptedItemIds: [ItemIds.IRON_INGOT] },
      { acceptedItemIds: [ItemIds.IRON_INGOT] },
      { acceptedItemIds: [ItemIds.FLINT] },
      { acceptedItemIds: [ItemIds.FLINT] },
    ],
    outputItemId: ItemIds.STEEL_INGOT,
    iconPath: "ReplaceableTextures/CommandButtons/BTNHumanArmorUpTwo.blp",
  },
  {
    id: "iron_spear",
    abilityId: 0,
    name: "Iron Spear",
    description: "A sturdy iron-tipped spear.\n\nBone or Stick + Iron Ingot",
    station: CraftingStation.Forge,
    ingredients: [
      { acceptedItemIds: [ItemIds.BONE, ItemIds.STICK], displayName: "Bone or Stick" },
      { acceptedItemIds: [ItemIds.IRON_INGOT] },
    ],
    outputItemId: ItemIds.IRON_SPEAR,
    iconPath: "ReplaceableTextures/CommandButtons/BTNSteelRanged.blp",
  },
  {
    id: "steel_spear",
    abilityId: 0,
    name: "Steel Spear",
    description: "A deadly steel-tipped spear.\n\nBone or Stick + Steel Ingot",
    station: CraftingStation.Forge,
    ingredients: [
      { acceptedItemIds: [ItemIds.BONE, ItemIds.STICK], displayName: "Bone or Stick" },
      { acceptedItemIds: [ItemIds.STEEL_INGOT] },
    ],
    outputItemId: ItemIds.STEEL_SPEAR,
    iconPath: "ReplaceableTextures/CommandButtons/BTNSteelRangedImproved.blp",
  },
  {
    id: "steel_axe",
    abilityId: 0,
    name: "Steel Axe",
    description: "A powerful steel axe.\n\nBone or Stick + 2x Steel Ingot",
    station: CraftingStation.Forge,
    ingredients: [
      { acceptedItemIds: [ItemIds.BONE, ItemIds.STICK], displayName: "Bone or Stick" },
      { acceptedItemIds: [ItemIds.STEEL_INGOT] },
      { acceptedItemIds: [ItemIds.STEEL_INGOT] },
    ],
    outputItemId: ItemIds.STEEL_AXE,
    iconPath: "ReplaceableTextures/CommandButtons/BTNOrcMeleeUpThree.blp",
  },

  // ═══════════════════════════════════════════════════════════════════
  // MIXING POT RECIPES
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "healing_potion",
    abilityId: 0,
    name: "Healing Potion",
    description: "A basic healing potion.\n\nRiver Root + River Stem + Athelas Seed",
    station: CraftingStation.MixingPot,
    ingredients: [
      { acceptedItemIds: [ItemIds.RIVER_ROOT] },
      { acceptedItemIds: [ItemIds.RIVER_STEM] },
      { acceptedItemIds: [ItemIds.ATHELAS_SEED] },
    ],
    outputItemId: ItemIds.HEALING_POTION,
    iconPath: "ReplaceableTextures/CommandButtons/BTNPotionRed.blp",
  },
  {
    id: "mana_potion",
    abilityId: 0,
    name: "Mana Potion",
    description: "Restores mana.\n\nRiver Root + River Stem + Athelas Seed",
    station: CraftingStation.MixingPot,
    ingredients: [
      { acceptedItemIds: [ItemIds.RIVER_ROOT] },
      { acceptedItemIds: [ItemIds.RIVER_STEM] },
      { acceptedItemIds: [ItemIds.ATHELAS_SEED] },
    ],
    outputItemId: ItemIds.MANA_POTION,
    iconPath: "ReplaceableTextures/CommandButtons/BTNPotionBlue.blp",
  },

  // ═══════════════════════════════════════════════════════════════════
  // BUILDING KIT RECIPES
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "camp_fire_kit",
    abilityId: 0,
    name: "Camp Fire Kit",
    description: "Materials for a camp fire.\n\nTinder + Flint + Stick",
    station: CraftingStation.CraftMaster,
    ingredients: [
      { acceptedItemIds: [ItemIds.TINDER] },
      { acceptedItemIds: [ItemIds.FLINT] },
      { acceptedItemIds: [ItemIds.STICK] },
    ],
    outputItemId: ItemIds.CAMP_FIRE_KIT,
    iconPath: "ReplaceableTextures/CommandButtons/BTNBurningOil.blp",
  },
  {
    id: "tent_kit",
    abilityId: 0,
    name: "Tent Kit",
    description: "Materials for a basic tent.\n\nStick + Hide + Stick",
    station: CraftingStation.CraftMaster,
    ingredients: [
      { acceptedItemIds: [ItemIds.STICK] },
      { acceptedItemIds: [ItemIds.ELK_HIDE] },
      { acceptedItemIds: [ItemIds.STICK] },
    ],
    outputItemId: ItemIds.TENT_KIT,
    iconPath: "ReplaceableTextures/CommandButtons/BTNSacrificialPit.blp",
  },
  {
    id: "forge_kit",
    abilityId: 0,
    name: "Forge Kit",
    description: "Materials for a forge.\n\nFlint + 3x Stone",
    station: CraftingStation.CraftMaster,
    ingredients: [
      { acceptedItemIds: [ItemIds.FLINT] },
      { acceptedItemIds: [ItemIds.STONE] },
      { acceptedItemIds: [ItemIds.STONE] },
      { acceptedItemIds: [ItemIds.STONE] },
    ],
    outputItemId: ItemIds.FORGE_KIT,
    iconPath: "ReplaceableTextures/CommandButtons/BTNForge.blp",
  },
];
