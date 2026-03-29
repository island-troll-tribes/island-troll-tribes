/**
 * AllRecipes - Complete crafting recipe definitions for all stations.
 *
 * Ported from 7 Wurst QuickMake files:
 * - ForgeQuickMake.wurst (21 recipes)
 * - ArmoryQuickMake.wurst (5 recipes)
 * - TanneryQuickMake.wurst (12 recipes)
 * - MixingPotQuickMake.wurst (20 recipes)
 * - WorkshopQuickMake.wurst (14 recipes)
 * - WitchDoctorHutQuickMake.wurst (15 recipes)
 * - BuildingQuickMake.wurst (14 recipes)
 *
 * Total: 101 recipes
 */

import { RecipeDefinition, CraftingStation } from "../../systems/crafting/RecipeDefinition";
import { ItemIds } from "../ItemIds";
import { AbilityIds } from "../AbilityIds";

// Helper aliases for readability
const Forge = CraftingStation.Forge;
const Armory = CraftingStation.Armory;
const Tannery = CraftingStation.Tannery;
const MixingPot = CraftingStation.MixingPot;
const Workshop = CraftingStation.Workshop;
const WDH = CraftingStation.WitchDoctorHut;
const Build = CraftingStation.CraftMaster;

// Shorthand for common herb lists
const ANY_SPECIAL_HERB = [ItemIds.BLUE_HERB, ItemIds.YELLOW_HERB, ItemIds.ORANGE_HERB, ItemIds.PURPLE_HERB];
const ANY_HERB_NO_ORANGE = [ItemIds.BLUE_HERB, ItemIds.YELLOW_HERB, ItemIds.PURPLE_HERB];
const ANY_HERB_NO_BLUE = [ItemIds.YELLOW_HERB, ItemIds.ORANGE_HERB, ItemIds.PURPLE_HERB];
const BONE_OR_STICK = [ItemIds.BONE, ItemIds.STICK];
const ANY_HIDE = [ItemIds.ELK_HIDE, ItemIds.JUNGLE_WOLF_HIDE, ItemIds.JUNGLE_BEAR_HIDE];
const ANY_SKIN_BOOTS = [ItemIds.ELK_SKIN_BOOTS, ItemIds.WOLF_SKIN_BOOTS, ItemIds.BEAR_SKIN_BOOTS];
const ANY_SKIN_GLOVES = [ItemIds.ELK_SKIN_GLOVES, ItemIds.WOLF_SKIN_GLOVES, ItemIds.BEAR_SKIN_GLOVES];
const ANY_SKIN_COAT = [ItemIds.ELK_SKIN_COAT, ItemIds.WOLF_SKIN_COAT, ItemIds.BEAR_SKIN_COAT];

// QM ability shorthand
const QM = AbilityIds;

/** Helper to create a simple recipe definition */
function r(
  id: string,
  name: string,
  station: CraftingStation,
  ingredients: (number | number[])[],
  outputItemId: number,
  iconPath: string,
  herbThreshold?: number,
  qmAbilityId?: number,
): RecipeDefinition {
  return {
    id,
    abilityId: qmAbilityId ?? 0,
    name,
    description: "",
    station,
    ingredients: ingredients.map(slot =>
      Array.isArray(slot)
        ? { acceptedItemIds: slot }
        : { acceptedItemIds: [slot] }
    ),
    outputItemId,
    iconPath,
    ...(herbThreshold !== undefined ? { herbThreshold } : {}),
  };
}

export const ALL_RECIPES: RecipeDefinition[] = [
  // ═══════════════════════════════════════════════════════════════════════
  // FORGE RECIPES (21)
  // ═══════════════════════════════════════════════════════════════════════

  r("iron_ingot", "Iron Ingot", Forge,
    [ItemIds.STONE, ItemIds.FLINT],
    ItemIds.IRON_INGOT, "ReplaceableTextures/CommandButtons/BTNHumanArmorUpOne.blp",
    undefined, QM.QM_IRON_INGOT),

  r("steel_ingot", "Steel Ingot", Forge,
    [ItemIds.IRON_INGOT, ItemIds.IRON_INGOT, ItemIds.FLINT, ItemIds.FLINT],
    ItemIds.STEEL_INGOT, "ReplaceableTextures/CommandButtons/BTNHumanArmorUpTwo.blp",
    undefined, QM.QM_STEEL_INGOT),

  r("spear", "Spear", Forge,
    [ItemIds.STONE, BONE_OR_STICK],
    ItemIds.SPEAR, "ReplaceableTextures/CommandButtons/BTNSteelRanged.blp",
    undefined, QM.QM_SPEAR),

  r("iron_spear", "Iron Spear", Forge,
    [ItemIds.IRON_INGOT, BONE_OR_STICK],
    ItemIds.IRON_SPEAR, "ReplaceableTextures/CommandButtons/BTNSteelRanged.blp",
    undefined, QM.QM_IRON_SPEAR),

  r("steel_spear", "Steel Spear", Forge,
    [ItemIds.STEEL_INGOT, BONE_OR_STICK],
    ItemIds.STEEL_SPEAR, "ReplaceableTextures/CommandButtons/BTNSteelRangedImproved.blp",
    undefined, QM.QM_STEEL_SPEAR),

  r("dark_spear", "Dark Spear", Forge,
    [ItemIds.SPIRIT_DARKNESS, BONE_OR_STICK],
    ItemIds.DARK_SPEAR, "ReplaceableTextures/CommandButtons/BTNDarkRitual.blp",
    undefined, QM.QM_DARK_SPEAR),

  r("iron_axe", "Iron Axe", Forge,
    [BONE_OR_STICK, ItemIds.IRON_INGOT, ItemIds.IRON_INGOT],
    ItemIds.IRON_AXE, "ReplaceableTextures/CommandButtons/BTNOrcMeleeUpTwo.blp",
    undefined, QM.QM_IRON_AXE),

  r("steel_axe", "Steel Axe", Forge,
    [BONE_OR_STICK, ItemIds.STEEL_INGOT, ItemIds.STEEL_INGOT],
    ItemIds.STEEL_AXE, "ReplaceableTextures/CommandButtons/BTNOrcMeleeUpThree.blp",
    undefined, QM.QM_STEEL_AXE),

  r("mage_masher", "Mage Masher", Forge,
    [BONE_OR_STICK, ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER, ItemIds.MANA_CRYSTAL],
    ItemIds.MAGE_MASHER, "ReplaceableTextures/CommandButtons/BTNImprovedMoonArmor.blp",
    undefined, QM.QM_MAGE_MASHER),

  r("shield", "Shield", Forge,
    [ANY_HIDE, ItemIds.STICK, ItemIds.STICK],
    ItemIds.SHIELD, "ReplaceableTextures/CommandButtons/BTNHumanArmorUpOne.blp",
    undefined, QM.QM_SHIELD),

  r("bone_shield", "Bone Shield", Forge,
    [ItemIds.SHIELD, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE],
    ItemIds.BONE_SHIELD, "ReplaceableTextures/CommandButtons/BTNThoriumArmor.blp",
    undefined, QM.QM_BONE_SHIELD),

  r("iron_shield", "Iron Shield", Forge,
    [ItemIds.SHIELD, ItemIds.IRON_INGOT, ItemIds.IRON_INGOT],
    ItemIds.IRON_SHIELD, "ReplaceableTextures/CommandButtons/BTNHumanArmorUpTwo.blp",
    undefined, QM.QM_IRON_SHIELD),

  r("steel_shield", "Steel Shield", Forge,
    [ItemIds.SHIELD, ItemIds.STEEL_INGOT, ItemIds.STEEL_INGOT],
    ItemIds.STEEL_SHIELD, "ReplaceableTextures/CommandButtons/BTNHumanArmorUpThree.blp",
    undefined, QM.QM_STEEL_SHIELD),

  r("bone_boots", "Bone Boots", Forge,
    [ANY_SKIN_BOOTS, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE],
    ItemIds.BONE_BOOTS, "ReplaceableTextures/CommandButtons/BTNBoots.blp",
    undefined, QM.QM_BONE_BOOTS),

  r("iron_boots", "Iron Boots", Forge,
    [ANY_SKIN_BOOTS, ItemIds.IRON_INGOT, ItemIds.IRON_INGOT],
    ItemIds.IRON_BOOTS, "ReplaceableTextures/CommandButtons/BTNBoots.blp",
    undefined, QM.QM_IRON_BOOTS),

  r("steel_boots", "Steel Boots", Forge,
    [ANY_SKIN_BOOTS, ItemIds.STEEL_INGOT, ItemIds.STEEL_INGOT],
    ItemIds.STEEL_BOOTS, "ReplaceableTextures/CommandButtons/BTNBoots.blp",
    undefined, QM.QM_STEEL_BOOTS),

  r("bone_gloves", "Bone Gloves", Forge,
    [ANY_SKIN_GLOVES, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE],
    ItemIds.BONE_GLOVES, "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    undefined, QM.QM_BONE_GLOVES),

  r("iron_gloves", "Iron Gloves", Forge,
    [ANY_SKIN_GLOVES, ItemIds.IRON_INGOT, ItemIds.IRON_INGOT],
    ItemIds.IRON_GLOVES, "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    undefined, QM.QM_IRON_GLOVES),

  r("steel_gloves", "Steel Gloves", Forge,
    [ANY_SKIN_GLOVES, ItemIds.STEEL_INGOT, ItemIds.STEEL_INGOT],
    ItemIds.STEEL_GLOVES, "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    undefined, QM.QM_STEEL_GLOVES),

  r("bone_coat", "Bone Coat", Forge,
    [ANY_SKIN_COAT, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE, ItemIds.BONE],
    ItemIds.BONE_COAT, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeThree.blp",
    undefined, QM.QM_BONE_COAT),

  r("iron_coat", "Iron Coat", Forge,
    [ANY_SKIN_COAT, ItemIds.IRON_INGOT, ItemIds.IRON_INGOT],
    ItemIds.IRON_COAT, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeThree.blp",
    undefined, QM.QM_IRON_COAT),

  r("steel_coat", "Steel Coat", Forge,
    [ANY_SKIN_COAT, ItemIds.STEEL_INGOT, ItemIds.STEEL_INGOT],
    ItemIds.STEEL_COAT, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeThree.blp",
    undefined, QM.QM_STEEL_COAT),

  // ═══════════════════════════════════════════════════════════════════════
  // ARMORY RECIPES (5)
  // ═══════════════════════════════════════════════════════════════════════

  r("anabolic_boots", "Anabolic Boots", Armory,
    [ItemIds.BONE_BOOTS, ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER, ItemIds.MANA_CRYSTAL, ItemIds.ANABOLIC_POTION, ItemIds.ANABOLIC_POTION],
    ItemIds.ANABOLIC_BOOTS, "ReplaceableTextures/CommandButtons/BTNBoots.blp",
    undefined, QM.QM_ANABOLIC_BOOTS),

  r("battle_armor", "Battle Armor", Armory,
    [ItemIds.BONE_COAT, ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER, ItemIds.MANA_CRYSTAL],
    ItemIds.BATTLE_ARMOR, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeThree.blp",
    undefined, QM.QM_BATTLE_ARMOR),

  r("battle_axe", "Battle Axe", Armory,
    [ItemIds.STICK, ItemIds.STEEL_INGOT, ItemIds.STEEL_INGOT, ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER, ItemIds.MANA_CRYSTAL],
    ItemIds.BATTLE_AXE, "ReplaceableTextures/CommandButtons/BTNOrcMeleeUpThree.blp",
    undefined, QM.QM_BATTLE_AXE),

  r("battle_gloves", "Battle Gloves", Armory,
    [ItemIds.BONE_GLOVES, ItemIds.STEEL_INGOT, ItemIds.STEEL_INGOT, ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER, ItemIds.MANA_CRYSTAL],
    ItemIds.BATTLE_GLOVES, "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    undefined, QM.QM_BATTLE_GLOVES),

  r("battle_shield", "Battle Shield", Armory,
    [ItemIds.BONE_SHIELD, ItemIds.ELK_HIDE, ItemIds.STEEL_INGOT, ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER, ItemIds.MANA_CRYSTAL],
    ItemIds.BATTLE_SHIELD, "ReplaceableTextures/CommandButtons/BTNHumanArmorUpThree.blp",
    undefined, QM.QM_BATTLE_SHIELD),

  // ═══════════════════════════════════════════════════════════════════════
  // TANNERY RECIPES (12)
  // ═══════════════════════════════════════════════════════════════════════

  r("elk_skin_boots", "Elk Skin Boots", Tannery,
    [ItemIds.ELK_HIDE, ItemIds.ELK_HIDE],
    ItemIds.ELK_SKIN_BOOTS, "ReplaceableTextures/CommandButtons/BTNBoots.blp",
    undefined, QM.QM_ELK_SKIN_BOOTS),

  r("wolf_skin_boots", "Wolf Skin Boots", Tannery,
    [ItemIds.JUNGLE_WOLF_HIDE, ItemIds.JUNGLE_WOLF_HIDE],
    ItemIds.WOLF_SKIN_BOOTS, "ReplaceableTextures/CommandButtons/BTNBoots.blp",
    undefined, QM.QM_JUNGLE_WOLF_SKIN_BOOTS),

  r("bear_skin_boots", "Bear Skin Boots", Tannery,
    [ItemIds.JUNGLE_BEAR_HIDE, ItemIds.JUNGLE_BEAR_HIDE],
    ItemIds.BEAR_SKIN_BOOTS, "ReplaceableTextures/CommandButtons/BTNBoots.blp",
    undefined, QM.QM_JUNGLE_BEAR_SKIN_BOOTS),

  r("elk_skin_gloves", "Elk Skin Gloves", Tannery,
    [ItemIds.ELK_HIDE, ItemIds.ELK_HIDE],
    ItemIds.ELK_SKIN_GLOVES, "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    undefined, QM.QM_ELK_SKIN_GLOVES),

  r("wolf_skin_gloves", "Wolf Skin Gloves", Tannery,
    [ItemIds.JUNGLE_WOLF_HIDE, ItemIds.JUNGLE_WOLF_HIDE],
    ItemIds.WOLF_SKIN_GLOVES, "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    undefined, QM.QM_JUNGLE_WOLF_SKIN_GLOVES),

  r("bear_skin_gloves", "Bear Skin Gloves", Tannery,
    [ItemIds.JUNGLE_BEAR_HIDE, ItemIds.JUNGLE_BEAR_HIDE],
    ItemIds.BEAR_SKIN_GLOVES, "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    undefined, QM.QM_JUNGLE_BEAR_SKIN_GLOVES),

  r("elk_skin_coat", "Elk Skin Coat", Tannery,
    [ItemIds.ELK_HIDE, ItemIds.ELK_HIDE, ItemIds.ELK_HIDE],
    ItemIds.ELK_SKIN_COAT, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeOne.blp",
    undefined, QM.QM_ELK_SKIN_COAT),

  r("wolf_skin_coat", "Wolf Skin Coat", Tannery,
    [ItemIds.JUNGLE_WOLF_HIDE, ItemIds.JUNGLE_WOLF_HIDE, ItemIds.JUNGLE_WOLF_HIDE],
    ItemIds.WOLF_SKIN_COAT, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeTwo.blp",
    undefined, QM.QM_JUNGLE_WOLF_SKIN_COAT),

  r("bear_skin_coat", "Bear Skin Coat", Tannery,
    [ItemIds.JUNGLE_BEAR_HIDE, ItemIds.JUNGLE_BEAR_HIDE, ItemIds.JUNGLE_BEAR_HIDE],
    ItemIds.BEAR_SKIN_COAT, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeThree.blp",
    undefined, QM.QM_JUNGLE_BEAR_SKIN_COAT),

  r("hydra_scale_boots", "Hydra Scale Boots", Tannery,
    [ItemIds.HYDRA_SCALE, ItemIds.HYDRA_SCALE],
    ItemIds.HYDRA_SCALE_BOOTS, "ReplaceableTextures/CommandButtons/BTNNagaArmorUp3.blp",
    undefined, QM.QM_HYDRA_SCALE_BOOTS),

  r("hydra_scale_gloves", "Hydra Scale Gloves", Tannery,
    [ItemIds.HYDRA_SCALE, ItemIds.HYDRA_SCALE],
    ItemIds.HYDRA_SCALE_GLOVES, "ReplaceableTextures/CommandButtons/BTNNagaArmorUp3.blp",
    undefined, QM.QM_HYDRA_SCALE_GLOVES),

  r("hydra_scale_coat", "Hydra Scale Coat", Tannery,
    [ItemIds.HYDRA_SCALE, ItemIds.HYDRA_SCALE, ItemIds.HYDRA_SCALE],
    ItemIds.HYDRA_SCALE_COAT, "ReplaceableTextures/CommandButtons/BTNNagaArmorUp3.blp",
    undefined, QM.QM_HYDRA_SCALE_COAT),

  // ═══════════════════════════════════════════════════════════════════════
  // MIXING POT RECIPES (20)
  // ═══════════════════════════════════════════════════════════════════════

  r("healing_potion", "Healing Potion", MixingPot,
    [ItemIds.RIVER_ROOT, ItemIds.ATHELAS_SEED],
    ItemIds.HEALING_POTION, "ReplaceableTextures/CommandButtons/BTNPotionRed.blp",
    undefined, QM.QM_HEALING_POTION),

  r("mana_potion", "Mana Potion", MixingPot,
    [ItemIds.RIVER_STEM, ItemIds.ATHELAS_SEED],
    ItemIds.MANA_POTION, "ReplaceableTextures/CommandButtons/BTNPotionBlue.blp",
    undefined, QM.QM_MANA_POTION),

  r("cure_all", "Cure All", MixingPot,
    [ItemIds.ATHELAS_SEED, ItemIds.ATHELAS_SEED, ItemIds.ATHELAS_SEED],
    ItemIds.CURE_ALL, "ReplaceableTextures/CommandButtons/BTNPotionGreen.blp",
    undefined, QM.QM_CURE_ALL),

  r("anti_magic_potion", "Anti-Magic Potion", MixingPot,
    [ItemIds.ATHELAS_SEED, ANY_SPECIAL_HERB],
    ItemIds.ANTI_MAGIC_POTION, "ReplaceableTextures/CommandButtons/BTNPotionPurple.blp",
    1, QM.QM_ANTI_MAGIC_POTION),

  r("acid_bomb", "Acid Bomb", MixingPot,
    [ANY_HERB_NO_ORANGE, ANY_SPECIAL_HERB, ANY_SPECIAL_HERB, ANY_HERB_NO_BLUE, ItemIds.RIVER_STEM, ItemIds.RIVER_STEM],
    ItemIds.ACID_BOMB, "ReplaceableTextures/CommandButtons/BTNAcidBomb.blp",
    3, QM.QM_ACID_BOMB),

  r("disease_potion", "Disease Potion", MixingPot,
    [ItemIds.RIVER_ROOT, ANY_HERB_NO_ORANGE, ANY_SPECIAL_HERB, ANY_SPECIAL_HERB, ANY_HERB_NO_BLUE],
    ItemIds.DISEASE_POTION, "ReplaceableTextures/CommandButtons/BTNPlagueCloud.blp",
    3, QM.QM_DISEASE_POTION),

  r("bee_hive", "Bee Hive", MixingPot,
    [ItemIds.RIVER_STEM, ItemIds.RIVER_STEM, ANY_SPECIAL_HERB],
    ItemIds.BEE_HIVE, "ReplaceableTextures/CommandButtons/BTNWispSplode.blp",
    1, QM.QM_BEE_HIVE),

  r("essence_bees", "Essence of Bees", MixingPot,
    [ANY_HERB_NO_ORANGE, [ItemIds.BLUE_HERB, ItemIds.YELLOW_HERB, ItemIds.ORANGE_HERB], [ItemIds.YELLOW_HERB, ItemIds.PURPLE_HERB, ItemIds.ORANGE_HERB], [ItemIds.ORANGE_HERB, ItemIds.PURPLE_HERB]],
    ItemIds.ESSENCE_BEES, "ReplaceableTextures/CommandButtons/BTNWispSplode.blp",
    2, QM.QM_ESSENCE_BEES),

  r("spirit_wind", "Spirit of Wind", MixingPot,
    [ItemIds.RIVER_STEM, ItemIds.RIVER_STEM],
    ItemIds.SPIRIT_WIND, "ReplaceableTextures/CommandButtons/BTNCyclone.blp",
    undefined, QM.QM_SPIRIT_WIND),

  r("spirit_water", "Spirit of Water", MixingPot,
    [ItemIds.RIVER_ROOT, ItemIds.RIVER_ROOT],
    ItemIds.SPIRIT_WATER, "ReplaceableTextures/CommandButtons/BTNWaterElemental.blp",
    undefined, QM.QM_SPIRIT_WATER),

  r("spirit_darkness", "Spirit of Darkness", MixingPot,
    [ItemIds.RIVER_ROOT, ItemIds.RIVER_STEM, ItemIds.ATHELAS_SEED, ItemIds.ATHELAS_SEED],
    ItemIds.SPIRIT_DARKNESS, "ReplaceableTextures/CommandButtons/BTNDarkSummoning.blp",
    undefined, QM.QM_SPIRIT_DARKNESS),

  r("anabolic_potion", "Anabolic Potion", MixingPot,
    [ItemIds.RIVER_STEM, ItemIds.RIVER_STEM, ItemIds.RIVER_STEM, ItemIds.RIVER_STEM],
    ItemIds.ANABOLIC_POTION, "ReplaceableTextures/CommandButtons/BTNPotionGreen.blp",
    undefined, QM.QM_ANABOLIC_POTION),

  r("fervor_potion", "Fervor Potion", MixingPot,
    [ItemIds.ATHELAS_SEED, ANY_SPECIAL_HERB, ANY_SPECIAL_HERB, ANY_SPECIAL_HERB],
    ItemIds.FERVOR_POTION, "ReplaceableTextures/CommandButtons/BTNPotionRed.blp",
    2, QM.QM_FERVOR_POTION),

  r("drunks_potion", "Drunk's Potion", MixingPot,
    [ItemIds.ATHELAS_SEED, ItemIds.ATHELAS_SEED, ItemIds.RIVER_ROOT, ItemIds.RIVER_ROOT, ANY_SPECIAL_HERB],
    ItemIds.DRUNKS_POTION, "ReplaceableTextures/CommandButtons/BTNPotionBlue.blp",
    1, QM.QM_DRUNKS_POTION),

  r("nether_potion", "Nether Potion", MixingPot,
    [ItemIds.ATHELAS_SEED, ItemIds.ATHELAS_SEED, ItemIds.RIVER_STEM, ItemIds.RIVER_STEM, ANY_SPECIAL_HERB],
    ItemIds.NETHER_POTION, "ReplaceableTextures/CommandButtons/BTNPotionPurple.blp",
    1, QM.QM_NETHER_POTION),

  r("gem_of_knowledge", "Gem of Knowledge", MixingPot,
    [ANY_HERB_NO_ORANGE, ANY_SPECIAL_HERB, ANY_SPECIAL_HERB, ANY_HERB_NO_BLUE],
    ItemIds.GEM_OF_KNOWLEDGE, "ReplaceableTextures/CommandButtons/BTNGem.blp",
    3, QM.QM_GEM_OF_KNOWLEDGE),

  r("oracle_potion", "Oracle Potion", MixingPot,
    [ItemIds.ATHELAS_SEED, ItemIds.ATHELAS_SEED, ANY_SPECIAL_HERB],
    ItemIds.ORACLE_POTION, "ReplaceableTextures/CommandButtons/BTNPotionGreen.blp",
    1, QM.QM_ORACLE_POTION),

  r("twin_islands", "Potion of Twin Islands", MixingPot,
    [ItemIds.ORANGE_HERB, ItemIds.ORANGE_HERB, ItemIds.ORANGE_HERB, ItemIds.PURPLE_HERB, ItemIds.PURPLE_HERB, ItemIds.PURPLE_HERB],
    ItemIds.POTION_TWIN_ISLANDS, "ReplaceableTextures/CommandButtons/BTNPotionBlue.blp",
    undefined, QM.QM_TWIN_ISLANDS),

  r("omnicure", "Omnicure", MixingPot,
    [ItemIds.ATHELAS_SEED, ItemIds.ATHELAS_SEED, ANY_SPECIAL_HERB, ANY_SPECIAL_HERB],
    ItemIds.OMNICURE, "ReplaceableTextures/CommandButtons/BTNPotionGreen.blp",
    1, QM.QM_OMNICURE),

  r("elemental_shield_potion", "Elemental Shield Potion", MixingPot,
    [ANY_SPECIAL_HERB, ItemIds.ATHELAS_SEED, ItemIds.RIVER_STEM],
    ItemIds.ELEMENTAL_SHIELD_POTION, "ReplaceableTextures/CommandButtons/BTNPotionBlue.blp",
    1, QM.QM_ELEMENTAL_SHIELD_POTION),

  // ═══════════════════════════════════════════════════════════════════════
  // WORKSHOP RECIPES (14)
  // ═══════════════════════════════════════════════════════════════════════

  r("blow_gun", "Blow Gun", Workshop,
    [ItemIds.STICK, ItemIds.CLAY_BALL],
    ItemIds.BLOW_GUN, "ReplaceableTextures/CommandButtons/BTNAlleriaFlute.blp",
    undefined, QM.QM_BLOW_GUN),

  r("nets", "Nets", Workshop,
    [ItemIds.TINDER, ItemIds.TINDER],
    ItemIds.NETS, "ReplaceableTextures/CommandButtons/BTNEnsnare.blp",
    undefined, QM.QM_NETS),

  r("ensnare_trap", "Ensnare Trap", Workshop,
    [ItemIds.TINDER, BONE_OR_STICK, ItemIds.STICK],
    ItemIds.ENSNARE_TRAP_KIT, "ReplaceableTextures/CommandButtons/BTNEnsnare.blp",
    undefined, QM.QM_ENSNARE_TRAP),

  r("mana_crystal", "Mana Crystal", Workshop,
    [ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER],
    ItemIds.MANA_CRYSTAL, "ReplaceableTextures/CommandButtons/BTNManaCrystal.blp",
    undefined, QM.QM_MANA_CRYSTAL),

  r("poison_spear", "Poison Spear", Workshop,
    [ItemIds.MUSHROOM, ItemIds.SPEAR],
    ItemIds.POISON_SPEAR, "ReplaceableTextures/CommandButtons/BTNEnvenomedSpear.blp",
    undefined, QM.QM_POISON_SPEAR),

  r("refined_poison_spear", "Refined Poison Spear", Workshop,
    [ItemIds.POISON, ItemIds.SPEAR],
    ItemIds.REFINED_POISON_SPEAR, "ReplaceableTextures/CommandButtons/BTNEnvenomedSpear.blp",
    undefined, QM.QM_REFINED_POISON_SPEAR),

  r("ultra_poison_spear", "Ultra Poison Spear", Workshop,
    [ItemIds.ULTRA_POISON, ItemIds.SPEAR],
    ItemIds.ULTRA_POISON_SPEAR, "ReplaceableTextures/CommandButtons/BTNEnvenomedSpear.blp",
    undefined, QM.QM_ULTRA_POISON_SPEAR),

  r("smoke_bomb", "Smoke Bomb", Workshop,
    [ItemIds.BANANA, ItemIds.SPIRIT_WIND],
    ItemIds.SMOKE_BOMB, "ReplaceableTextures/CommandButtons/BTNCloudOfFog.blp",
    undefined, QM.QM_SMOKE_BOMB),

  r("fire_bomb", "Fire Bomb", Workshop,
    [ItemIds.SMOKE_BOMB, ItemIds.FLINT, ItemIds.MANA_CRYSTAL],
    ItemIds.FIRE_BOMB, "ReplaceableTextures/CommandButtons/BTNFireBolt.blp",
    undefined, QM.QM_FIRE_BOMB),

  r("emp", "EMP", Workshop,
    [ItemIds.MANA_CRYSTAL, ItemIds.MANA_CRYSTAL, ItemIds.SPIRIT_WIND, ItemIds.SPIRIT_WATER],
    ItemIds.EMP, "ReplaceableTextures/CommandButtons/BTNPurge.blp",
    undefined, QM.QM_EMP),

  r("transport_ship", "Transport Ship Kit", Workshop,
    [ItemIds.STICK, ItemIds.STICK, ItemIds.CLAY_BALL, ItemIds.CLAY_BALL, ItemIds.ELK_HIDE, ItemIds.ELK_HIDE],
    ItemIds.TRANSPORT_SHIP_KIT, "ReplaceableTextures/CommandButtons/BTNHumanTransport.blp",
    undefined, QM.QM_TRANSPORT_SHIP),

  r("dark_thistles", "Dark Thistles", Workshop,
    [ItemIds.THISTLES, ItemIds.SPIRIT_DARKNESS],
    ItemIds.DARK_THISTLES, "ReplaceableTextures/CommandButtons/BTNNerubianWebSpinners.blp",
    undefined, QM.QM_DARK_THISTLES),

  r("hunting_net", "Hunting Net", Workshop,
    [ItemIds.NETS, ItemIds.STONE],
    ItemIds.HUNTING_NET, "ReplaceableTextures/CommandButtons/BTNEnsnare.blp",
    undefined, QM.QM_HUNTING_NET),

  r("living_clay", "Living Clay", Workshop,
    [ItemIds.CLAY_BALL, ItemIds.MANA_CRYSTAL],
    ItemIds.LIVING_CLAY, "ReplaceableTextures/CommandButtons/BTNGolemThunderClap.blp",
    undefined, QM.QM_LIVING_CLAY),

  // ═══════════════════════════════════════════════════════════════════════
  // WITCH DOCTOR HUT RECIPES (15)
  // ═══════════════════════════════════════════════════════════════════════

  r("cloak_flames", "Cloak of Flames", WDH,
    [ItemIds.MAGIC, ItemIds.BONE_COAT, ItemIds.FLINT],
    ItemIds.CLOAK_OF_FLAMES, "ReplaceableTextures/CommandButtons/BTNCloakOfFlames.blp",
    undefined, QM.QM_CLOAK_FLAMES),

  r("cloak_frost", "Cloak of Frost", WDH,
    [ItemIds.MAGIC, ItemIds.BONE_COAT, ItemIds.SPIRIT_WATER],
    ItemIds.CLOAK_OF_FROST, "ReplaceableTextures/CommandButtons/BTNCloakOfFrost.blp",
    undefined, QM.QM_CLOAK_FROST),

  r("cloak_healing", "Cloak of Healing", WDH,
    [ItemIds.MAGIC, ItemIds.BONE_COAT, ItemIds.ATHELAS_SEED],
    ItemIds.CLOAK_OF_HEALING, "ReplaceableTextures/CommandButtons/BTNCloakOfShadows.blp",
    undefined, QM.QM_CLOAK_HEALING),

  r("cloak_mana", "Cloak of Mana", WDH,
    [ItemIds.MAGIC, ItemIds.BONE_COAT, ItemIds.RIVER_STEM],
    ItemIds.CLOAK_OF_MANA, "ReplaceableTextures/CommandButtons/BTNCloakOfShadows.blp",
    undefined, QM.QM_CLOAK_MANA),

  r("poison", "Poison", WDH,
    [ItemIds.MUSHROOM, ItemIds.MUSHROOM, ItemIds.MUSHROOM],
    ItemIds.POISON, "ReplaceableTextures/CommandButtons/BTNOrbOfVenom.blp",
    undefined, QM.QM_POISON),

  r("scroll_armor", "Scroll of Stone Armor", WDH,
    [ItemIds.STONE, ItemIds.MANA_CRYSTAL],
    ItemIds.SCROLL_STONE_ARMOR, "ReplaceableTextures/CommandButtons/BTNScrollOfProtection.blp",
    undefined, QM.QM_SCROLL_ARMOR),

  r("scroll_cyclone", "Scroll of Cyclone", WDH,
    [ItemIds.SPIRIT_WIND, ItemIds.MANA_CRYSTAL],
    ItemIds.SCROLL_CYCLONE, "ReplaceableTextures/CommandButtons/BTNScrollOfProtection.blp",
    undefined, QM.QM_SCROLL_CYCLONE),

  r("scroll_living_dead", "Scroll of Living Dead", WDH,
    [ItemIds.BONE, ItemIds.MANA_CRYSTAL],
    ItemIds.SCROLL_LIVING_DEAD, "ReplaceableTextures/CommandButtons/BTNScrollOfProtection.blp",
    undefined, QM.QM_SCROLL_LIVING_DEAD),

  r("scroll_fireball", "Scroll of Fireball", WDH,
    [ItemIds.FLINT, ItemIds.MANA_CRYSTAL],
    ItemIds.SCROLL_FIREBALL, "ReplaceableTextures/CommandButtons/BTNScrollOfProtection.blp",
    undefined, QM.QM_SCROLL_FIREBALL),

  r("scroll_root", "Scroll of Entangling Roots", WDH,
    [ItemIds.TINDER, ItemIds.MANA_CRYSTAL],
    ItemIds.SCROLL_ENTANGLING_ROOTS, "ReplaceableTextures/CommandButtons/BTNScrollOfProtection.blp",
    undefined, QM.QM_SCROLL_ROOT),

  r("scroll_tsunami", "Scroll of Tsunami", WDH,
    [ItemIds.SPIRIT_WATER, ItemIds.MANA_CRYSTAL],
    ItemIds.SCROLL_TSUNAMI, "ReplaceableTextures/CommandButtons/BTNScrollOfProtection.blp",
    undefined, QM.QM_SCROLL_TSUNAMI),

  r("scroll_haste", "Scroll of Haste", WDH,
    [ItemIds.ANABOLIC_POTION, ItemIds.MANA_CRYSTAL],
    ItemIds.SCROLL_HASTE, "ReplaceableTextures/CommandButtons/BTNScrollOfProtection.blp",
    undefined, QM.QM_SCROLL_HASTE),

  r("ultra_poison", "Ultra Poison", WDH,
    [ItemIds.POISON, ItemIds.POISON],
    ItemIds.ULTRA_POISON, "ReplaceableTextures/CommandButtons/BTNOrbOfVenom.blp",
    undefined, QM.QM_ULTRA_POISON),

  r("magic_seed", "Magic Seed", WDH,
    [ItemIds.STICK, ItemIds.MANA_CRYSTAL],
    ItemIds.MAGIC_SEED, "ReplaceableTextures/CommandButtons/BTNTranquility.blp",
    undefined, QM.QM_MAGIC_SEED),

  r("spirit_ward", "Spirit Ward Kit", WDH,
    [ItemIds.MANA_CRYSTAL, ItemIds.MANA_CRYSTAL, ItemIds.MANA_CRYSTAL, ItemIds.STICK],
    ItemIds.SPIRIT_WARD_KIT, "ReplaceableTextures/CommandButtons/BTNSpiritWalker.blp",
    undefined, QM.QM_SPIRIT_WARD),

  // ═══════════════════════════════════════════════════════════════════════
  // BUILDING KIT RECIPES (14)
  // ═══════════════════════════════════════════════════════════════════════

  r("camp_fire_kit", "Camp Fire Kit", Build,
    [ItemIds.TINDER, ItemIds.FLINT, ItemIds.STICK],
    ItemIds.CAMP_FIRE_KIT, "ReplaceableTextures/CommandButtons/BTNBurningOil.blp",
    undefined, QM.QM_CAMP_FIRE_KIT),

  r("tent_kit", "Tent Kit", Build,
    [ItemIds.STICK, ANY_HIDE, ItemIds.STICK],
    ItemIds.TENT_KIT, "ReplaceableTextures/CommandButtons/BTNSacrificialPit.blp",
    undefined, QM.QM_TENT_KIT),

  r("smoke_house_kit", "Smoke House Kit", Build,
    [ItemIds.TINDER, ItemIds.CLAY_BALL, ItemIds.STICK],
    ItemIds.SMOKE_HOUSE_KIT, "ReplaceableTextures/CommandButtons/BTNSacrificialPit.blp",
    undefined, QM.QM_SMOKE_HOUSE_KIT),

  r("storage_hut_kit", "Storage Hut Kit", Build,
    [ItemIds.STICK, ItemIds.FLINT, ItemIds.STICK],
    ItemIds.STORAGE_HUT_KIT, "ReplaceableTextures/CommandButtons/BTNSacrificialPit.blp",
    undefined, QM.QM_STORAGE_HUT_KIT),

  r("mud_hut_kit", "Mud Hut Kit", Build,
    [ItemIds.CLAY_BALL, ItemIds.CLAY_BALL, ItemIds.CLAY_BALL, ItemIds.CLAY_BALL],
    ItemIds.MUD_HUT_KIT, "ReplaceableTextures/CommandButtons/BTNSacrificialPit.blp",
    undefined, QM.QM_MUD_HUT_KIT),

  r("mixing_pot_kit", "Mixing Pot Kit", Build,
    [ItemIds.STICK, ItemIds.CLAY_BALL, ItemIds.CLAY_BALL, ItemIds.CLAY_BALL],
    ItemIds.MIXING_POT_KIT, "ReplaceableTextures/CommandButtons/BTNCauldron.blp",
    undefined, QM.QM_MIXING_POT_KIT),

  r("armory_kit", "Armory Kit", Build,
    [ItemIds.STICK, ItemIds.IRON_INGOT, ItemIds.IRON_INGOT],
    ItemIds.ARMORY_KIT, "ReplaceableTextures/CommandButtons/BTNHumanArmorUpThree.blp",
    undefined, QM.QM_ARMORY_KIT),

  r("workshop_kit", "Workshop Kit", Build,
    [ItemIds.STICK, ItemIds.TINDER, ItemIds.CLAY_BALL, ItemIds.STICK],
    ItemIds.WORKSHOP_KIT, "ReplaceableTextures/CommandButtons/BTNWorkshop.blp",
    undefined, QM.QM_WORKSHOP_KIT),

  r("tannery_kit", "Tannery Kit", Build,
    [ItemIds.STICK, ItemIds.STICK, ItemIds.STONE, ItemIds.STONE, ItemIds.CLAY_BALL],
    ItemIds.TANNERY_KIT, "ReplaceableTextures/CommandButtons/BTNLeatherUpgradeOne.blp",
    undefined, QM.QM_TANNERY_KIT),

  r("witch_doctors_hut_kit", "Witch Doctor's Hut Kit", Build,
    [ItemIds.STICK, ItemIds.MANA_CRYSTAL, ItemIds.STICK, ItemIds.MANA_CRYSTAL, ItemIds.STICK],
    ItemIds.WITCH_DOCTORS_HUT_KIT, "ReplaceableTextures/CommandButtons/BTNVoodooLounge.blp",
    undefined, QM.QM_WITCH_DOCTORS_HUT_KIT),

  r("hatchery_kit", "Hatchery Kit", Build,
    [ItemIds.STONE, ItemIds.STONE, ItemIds.STONE, ItemIds.STICK, ItemIds.STICK, ItemIds.STICK],
    ItemIds.HATCHERY_KIT, "ReplaceableTextures/CommandButtons/BTNHatchery.blp",
    undefined, QM.QM_HATCHERY_KIT),

  r("teleport_beacon_kit", "Teleport Beacon Kit", Build,
    [ItemIds.STONE, ItemIds.STONE, ItemIds.MANA_CRYSTAL, ItemIds.STICK, ItemIds.TINDER],
    ItemIds.TELEPORT_BEACON_KIT, "ReplaceableTextures/CommandButtons/BTNTeleportBeacon.blp",
    undefined, QM.QM_TELEPORT_BEACON_KIT),

  r("troll_hut_kit", "Troll Hut Kit", Build,
    [ItemIds.TENT_KIT, ItemIds.ELK_HIDE, ItemIds.CLAY_BALL],
    ItemIds.TROLL_HUT_KIT, "ReplaceableTextures/CommandButtons/BTNTrollBurrow.blp",
    undefined, QM.QM_TROLL_HUT_KIT),

  r("forge_kit", "Forge Kit", Build,
    [ItemIds.FLINT, ItemIds.STONE, ItemIds.STONE, ItemIds.STONE],
    ItemIds.FORGE_KIT, "ReplaceableTextures/CommandButtons/BTNForge.blp",
    undefined, QM.QM_FORGE_KIT),
];
