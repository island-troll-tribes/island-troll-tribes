/**
 * ItemIds - WC3 item type ID constants.
 *
 * All FourCC item IDs used throughout the game, organized by category.
 * These correspond to items defined in the WC3 Object Editor.
 *
 * TODO: Generate these from the object editor data files (w3t).
 * For now, values are placeholder FourCC codes that will be mapped
 * to the actual IDs from the base.w3x object data.
 */

export namespace ItemIds {
  // ─── Raw Materials ─────────────────────────────────────────────────
  export const TINDER = FourCC("I000");
  export const CLAY_BALL = FourCC("I001");
  export const STICK = FourCC("I002");
  export const FLINT = FourCC("I003");
  export const MANA_CRYSTAL = FourCC("I004");
  export const STONE = FourCC("I005");
  export const MUSHROOM = FourCC("I006");
  export const MAGIC = FourCC("I007");
  export const BONE = FourCC("I008");

  // ─── Herbs ─────────────────────────────────────────────────────────
  export const RIVER_ROOT = FourCC("I010");
  export const RIVER_STEM = FourCC("I011");
  export const ATHELAS_SEED = FourCC("I012");
  export const BLUE_HERB = FourCC("I013");
  export const YELLOW_HERB = FourCC("I014");
  export const ORANGE_HERB = FourCC("I015");
  export const PURPLE_HERB = FourCC("I016");

  // ─── Animal Drops ──────────────────────────────────────────────────
  export const ELK_HIDE = FourCC("I020");
  export const JUNGLE_WOLF_HIDE = FourCC("I021");
  export const JUNGLE_BEAR_HIDE = FourCC("I022");
  export const RAW_MEAT = FourCC("I023");
  export const COOKED_MEAT = FourCC("I024");

  // ─── Crafted Materials ─────────────────────────────────────────────
  export const IRON_INGOT = FourCC("I030");
  export const STEEL_INGOT = FourCC("I031");
  export const SPIRIT_WATER = FourCC("I032");
  export const SPIRIT_WIND = FourCC("I033");
  export const SPIRIT_DARKNESS = FourCC("I034");
  export const POISON = FourCC("I035");
  export const ULTRA_POISON = FourCC("I036");

  // ─── Weapons ───────────────────────────────────────────────────────
  export const STONE_SPEAR = FourCC("I040");
  export const IRON_SPEAR = FourCC("I041");
  export const STEEL_SPEAR = FourCC("I042");
  export const DARK_SPEAR = FourCC("I043");
  export const STONE_AXE = FourCC("I044");
  export const IRON_AXE = FourCC("I045");
  export const STEEL_AXE = FourCC("I046");
  export const MAGE_MASHER = FourCC("I047");
  export const NET = FourCC("I048");

  // ─── Armor: Boots ──────────────────────────────────────────────────
  export const ELK_SKIN_BOOTS = FourCC("I050");
  export const WOLF_SKIN_BOOTS = FourCC("I051");
  export const BEAR_SKIN_BOOTS = FourCC("I052");
  export const BONE_BOOTS = FourCC("I053");
  export const IRON_BOOTS = FourCC("I054");
  export const STEEL_BOOTS = FourCC("I055");
  export const ANABOLIC_BOOTS = FourCC("I056");

  // ─── Armor: Gloves ─────────────────────────────────────────────────
  export const ELK_SKIN_GLOVES = FourCC("I060");
  export const WOLF_SKIN_GLOVES = FourCC("I061");
  export const BEAR_SKIN_GLOVES = FourCC("I062");
  export const BONE_GLOVES = FourCC("I063");
  export const IRON_GLOVES = FourCC("I064");
  export const STEEL_GLOVES = FourCC("I065");
  export const BATTLE_GLOVES = FourCC("I066");

  // ─── Armor: Coats ──────────────────────────────────────────────────
  export const ELK_SKIN_COAT = FourCC("I070");
  export const WOLF_SKIN_COAT = FourCC("I071");
  export const BEAR_SKIN_COAT = FourCC("I072");
  export const BONE_COAT = FourCC("I073");
  export const IRON_COAT = FourCC("I074");
  export const STEEL_COAT = FourCC("I075");
  export const BATTLE_ARMOR = FourCC("I076");

  // ─── Shields ───────────────────────────────────────────────────────
  export const BONE_SHIELD = FourCC("I080");
  export const IRON_SHIELD = FourCC("I081");
  export const STEEL_SHIELD = FourCC("I082");
  export const BATTLE_SHIELD = FourCC("I083");

  // ─── Potions ───────────────────────────────────────────────────────
  export const HEALING_POTION = FourCC("I090");
  export const MANA_POTION = FourCC("I091");
  export const CURE_ALL = FourCC("I092");
  export const ANABOLIC_POTION = FourCC("I093");
  export const ORACLE_POTION = FourCC("I094");
  export const DISEASE_POTION = FourCC("I095");
  export const ACID_BOMB = FourCC("I096");
  export const ESSENCE_OF_BEES = FourCC("I097");
  export const TWIN_ISLANDS_POTION = FourCC("I098");
  export const NETHER_POTION = FourCC("I099");
  export const FERVOR_POTION = FourCC("I09A");
  export const DRUNKS_POTION = FourCC("I09B");

  // ─── Scrolls ───────────────────────────────────────────────────────
  export const SCROLL_ARMOR = FourCC("I0A0");
  export const SCROLL_ROOT = FourCC("I0A1");
  export const SCROLL_CYCLONE = FourCC("I0A2");
  export const SCROLL_FIREBALL = FourCC("I0A3");
  export const SCROLL_HASTE = FourCC("I0A4");
  export const SCROLL_TSUNAMI = FourCC("I0A5");
  export const SCROLL_LIVING_DEAD = FourCC("I0A6");

  // ─── Cloaks ────────────────────────────────────────────────────────
  export const CLOAK_OF_FLAMES = FourCC("I0B0");
  export const CLOAK_OF_FROST = FourCC("I0B1");
  export const CLOAK_OF_HEALING = FourCC("I0B2");
  export const CLOAK_OF_MANA = FourCC("I0B3");

  // ─── Special Items ─────────────────────────────────────────────────
  export const GEM_OF_KNOWLEDGE = FourCC("I0C0");
  export const MEDALLION_OF_COURAGE = FourCC("I0C1");
  export const BLINK_DAGGER = FourCC("I0C2");
  export const SMOKE_BOMB = FourCC("I0C3");
  export const FIRE_BOMB = FourCC("I0C4");
  export const EMP = FourCC("I0C5");
  export const BLOW_GUN = FourCC("I0C6");
  export const LIVING_CLAY = FourCC("I0C7");
  export const MAGIC_SEED = FourCC("I0C8");
  export const SPIRIT_WARD = FourCC("I0C9");

  // ─── Building Kits ─────────────────────────────────────────────────
  export const CAMP_FIRE_KIT = FourCC("I0D0");
  export const TENT_KIT = FourCC("I0D1");
  export const MUD_HUT_KIT = FourCC("I0D2");
  export const MIXING_POT_KIT = FourCC("I0D3");
  export const ARMORY_KIT = FourCC("I0D4");
  export const WORKSHOP_KIT = FourCC("I0D5");
  export const TANNERY_KIT = FourCC("I0D6");
  export const FORGE_KIT = FourCC("I0D7");
  export const WITCH_DOCTOR_HUT_KIT = FourCC("I0D8");
  export const HATCHERY_KIT = FourCC("I0D9");
  export const TELEPORT_BEACON_KIT = FourCC("I0DA");
  export const TROLL_HUT_KIT = FourCC("I0DB");
}
