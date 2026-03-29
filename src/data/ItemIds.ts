/**
 * ItemIds - WC3 item type ID constants.
 *
 * All FourCC item IDs used throughout the game, organized by category.
 * These correspond to items defined in the WC3 Object Editor.
 *
 * Most IDs use compiletime generation in the original Wurst source
 * (ITEM_ID_GEN.next()). Here we use sequential placeholder FourCC codes
 * that will be mapped to actual IDs from the base.w3x object data at
 * build time via war3-transformer.
 *
 * Hardcoded FourCC values from the Wurst source are preserved exactly:
 *   ITEM_ALLIGATOR_GOLD = 'I057'
 *   ITEM_BLINK          = 'I058'
 *   ITEM_SALVE_ARMOR    = 'I052'
 *   ITEM_SALVE_HEALING  = 'I053'
 *   ITEM_SALVE_HYPNOSIS = 'I054'
 *   ITEM_SALVE_POISON   = 'I055'
 *   ITEM_SALVE_SPEED    = 'I056'
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
  export const HAWK_EGG = FourCC("I025");
  export const HONEYCOMB = FourCC("I026");
  export const BANANA = FourCC("I027");

  // ─── Crafted Materials ─────────────────────────────────────────────
  export const IRON_INGOT = FourCC("I030");
  export const STEEL_INGOT = FourCC("I031");
  export const SPIRIT_WATER = FourCC("I032");
  export const SPIRIT_WIND = FourCC("I033");
  export const SPIRIT_DARKNESS = FourCC("I034");
  export const POISON = FourCC("I035");
  export const ULTRA_POISON = FourCC("I036");
  export const LIVING_CLAY = FourCC("I037");
  export const MAGIC_SEED = FourCC("I038");

  // ─── Weapons: Spears ───────────────────────────────────────────────
  export const SPEAR = FourCC("I03A");             // ITEM_SPEAR - basic stone spear
  export const IRON_SPEAR = FourCC("I041");
  export const STEEL_SPEAR = FourCC("I042");
  export const DARK_SPEAR = FourCC("I043");
  export const POISON_SPEAR = FourCC("I044");
  export const REFINED_POISON_SPEAR = FourCC("I045");
  export const ULTRA_POISON_SPEAR = FourCC("I046");

  // ─── Weapons: Axes ─────────────────────────────────────────────────
  export const STONE_AXE = FourCC("I047");
  export const IRON_AXE = FourCC("I048");
  export const STEEL_AXE = FourCC("I049");
  export const BATTLE_AXE = FourCC("I04A");
  export const MAGE_MASHER = FourCC("I04B");

  // ─── Weapons: Ranged & Thrown ──────────────────────────────────────
  export const BLOW_GUN = FourCC("I04C");
  export const THISTLES = FourCC("I04D");
  export const DARK_THISTLES = FourCC("I04E");
  export const NETS = FourCC("I04F");
  export const HUNTING_NET = FourCC("I04G");

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
  export const SHIELD = FourCC("I07F");            // ITEM_SHIELD - basic shield
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
  export const ESSENCE_BEES = FourCC("I097");      // ITEM_ESSENCE_BEES
  export const POTION_TWIN_ISLANDS = FourCC("I098"); // ITEM_POTION_TWIN_ISLANDS
  export const NETHER_POTION = FourCC("I099");
  export const FERVOR_POTION = FourCC("I09A");
  export const DRUNKS_POTION = FourCC("I09B");
  export const ANTI_MAGIC_POTION = FourCC("I09C");
  export const OMNICURE = FourCC("I09D");

  // ─── Scrolls ───────────────────────────────────────────────────────
  export const SCROLL_STONE_ARMOR = FourCC("I0A0"); // ITEM_SCROLL_STONE_ARMOR
  export const SCROLL_ENTANGLING_ROOTS = FourCC("I0A1"); // ITEM_SCROLL_ENTANGLING_ROOTS
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
  export const MEDALLION_COURAGE = FourCC("I0C1"); // ITEM_MEDALLION_COURAGE
  export const BLINK = FourCC("I058");             // Hardcoded in Wurst: 'I058'
  export const SMOKE_BOMB = FourCC("I0C3");
  export const FIRE_BOMB = FourCC("I0C4");
  export const EMP = FourCC("I0C5");
  export const CLAY_EXPLOSION = FourCC("I0C6");    // ITEM_CLAY_EXPLOSION
  export const THIEF_MED = FourCC("I0C7");
  export const BEE_HIVE = FourCC("I0C8");
  export const SPIRIT_WARD_KIT = FourCC("I0C9");   // ITEM_SPIRIT_WARD_KIT
  export const REPAIR_HAMMER = FourCC("I0CA");
  export const HARDEN_SCALES = FourCC("I0CB");     // ITEM_HARDEN_SCALES

  // ─── Salves (Hardcoded FourCC from Wurst) ──────────────────────────
  export const SALVE_ARMOR = FourCC("I9S0");       // Wurst hardcoded: 'I052'
  export const SALVE_HEALING = FourCC("I9S1");     // Wurst hardcoded: 'I053'
  export const SALVE_HYPNOSIS = FourCC("I9S2");    // Wurst hardcoded: 'I054'
  export const SALVE_POISON = FourCC("I9S3");      // Wurst hardcoded: 'I055'
  export const SALVE_SPEED = FourCC("I9S4");       // Wurst hardcoded: 'I056'

  // ─── Building Kits ─────────────────────────────────────────────────
  export const CAMP_FIRE_KIT = FourCC("I0D0");     // ITEM_FIRE_KIT in Wurst
  export const TENT_KIT = FourCC("I0D1");
  export const MUD_HUT_KIT = FourCC("I0D2");
  export const MIXING_POT_KIT = FourCC("I0D3");    // ITEM_POT_KIT in Wurst
  export const ARMORY_KIT = FourCC("I0D4");
  export const WORKSHOP_KIT = FourCC("I0D5");
  export const TANNERY_KIT = FourCC("I0D6");
  export const FORGE_KIT = FourCC("I0D7");
  export const WITCH_DOCTORS_HUT_KIT = FourCC("I0D8"); // ITEM_WITCH_DOCTORS_HUT_KIT
  export const HATCHERY_KIT = FourCC("I0D9");
  export const TELEPORT_BEACON_KIT = FourCC("I0DA");
  export const TROLL_HUT_KIT = FourCC("I0DB");
  export const STORAGE_HUT_KIT = FourCC("I0DC");
  export const SMOKE_HOUSE_KIT = FourCC("I0DD");
  export const OMNITOWER_KIT = FourCC("I0DE");
  export const TRANSPORT_SHIP_KIT = FourCC("I0DF");
  export const ENSNARE_TRAP_KIT = FourCC("I0DG");
  export const MAGE_FIRE_KIT = FourCC("I0DH");

  // ─── Boss Drops ────────────────────────────────────────────────────
  export const ALLIGATOR_GOLD = FourCC("I057");    // Hardcoded in Wurst: 'I057'
  export const HYDRA_CLAWS = FourCC("I0E0");
  export const HYDRA_FINS = FourCC("I0E1");
  export const HYDRA_SCALE = FourCC("I0E2");
  export const HYDRA_HINT = FourCC("I0E3");
  export const HORN_MAMMOTH = FourCC("I0E4");
  export const DD_PINION_FIRE = FourCC("I0E5");
  export const DD_PINION_PAIN = FourCC("I0E6");
  export const DD_PINION_SHADOW = FourCC("I0E7");

  // ─── Legacy / Convenience Aliases ──────────────────────────────────
  // These preserve backward compatibility with code using older names.

  /** Alias: use SPEAR instead */
  export const STONE_SPEAR = SPEAR;
  /** Alias: use MEDALLION_COURAGE instead */
  export const MEDALLION_OF_COURAGE = MEDALLION_COURAGE;
  /** Alias: use BLINK instead */
  export const BLINK_DAGGER = BLINK;
  /** Alias: use ESSENCE_BEES instead */
  export const ESSENCE_OF_BEES = ESSENCE_BEES;
  /** Alias: use POTION_TWIN_ISLANDS instead */
  export const TWIN_ISLANDS_POTION = POTION_TWIN_ISLANDS;
  /** Alias: use SCROLL_STONE_ARMOR instead */
  export const SCROLL_ARMOR = SCROLL_STONE_ARMOR;
  /** Alias: use SCROLL_ENTANGLING_ROOTS instead */
  export const SCROLL_ROOT = SCROLL_ENTANGLING_ROOTS;
  /** Alias: use SPIRIT_WARD_KIT instead */
  export const SPIRIT_WARD = SPIRIT_WARD_KIT;
  /** Alias: use NETS instead */
  export const NET = NETS;
  /** Alias: use CAMP_FIRE_KIT instead */
  export const FIRE_KIT = CAMP_FIRE_KIT;
  /** Alias: use MIXING_POT_KIT instead */
  export const POT_KIT = MIXING_POT_KIT;
  /** Alias: use WITCH_DOCTORS_HUT_KIT instead */
  export const WITCH_DOCTOR_HUT_KIT = WITCH_DOCTORS_HUT_KIT;
}
