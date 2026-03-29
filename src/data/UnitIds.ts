/**
 * UnitIds - WC3 unit type ID constants.
 *
 * All FourCC unit IDs used throughout the game, organized by category.
 * These correspond to units defined in the WC3 Object Editor.
 *
 * Hero units (trolls, bosses like The One) use HERO_ID_GEN in Wurst,
 * prefixed with 'O' (custom hero). Non-hero units use UNIT_ID_GEN,
 * prefixed with various letters (n, h, etc.).
 *
 * All values are placeholder FourCC codes that will be mapped to
 * actual IDs from the base.w3x object data at build time.
 */

export namespace UnitTypeIds {
  // ─── Trolls: Base Classes (HERO_ID_GEN) ────────────────────────────
  export const HUNTER = FourCC("O001");
  export const HUNTER_1 = FourCC("O002");          // Alternate skin
  export const MAGE = FourCC("O003");
  export const MAGE_1 = FourCC("O004");            // Alternate skin
  export const PRIEST = FourCC("O005");
  export const BEASTMASTER = FourCC("O006");
  export const BEASTMASTER_1 = FourCC("O007");     // Alternate skin
  export const THIEF = FourCC("O008");
  export const SCOUT = FourCC("O009");
  export const GATHERER = FourCC("O00A");

  // ─── Trolls: Hunter Line (HERO_ID_GEN) ────────────────────────────
  export const WARRIOR = FourCC("O010");
  export const TRACKER = FourCC("O011");
  export const JUGGERNAUT = FourCC("O012");

  // ─── Trolls: Mage Line (HERO_ID_GEN) ─────────────────────────────
  export const ELEMENTALIST = FourCC("O030");
  export const ELEMENTALIST_1 = FourCC("O031");    // Alternate skin
  export const HYPNOTIST = FourCC("O032");
  export const DEMENTIA_MASTER = FourCC("O033");

  // ─── Trolls: Priest Line (HERO_ID_GEN) ────────────────────────────
  export const BOOSTER = FourCC("O040");
  export const BOOSTER_1 = FourCC("O041");         // Alternate skin
  export const MASTER_HEALER = FourCC("O042");
  export const MASTER_HEALER_1 = FourCC("O043");   // Alternate skin
  export const SAGE = FourCC("O044");

  // ─── Trolls: Beastmaster Line (HERO_ID_GEN) ───────────────────────
  export const SHAPESHIFTER_WOLF = FourCC("O020");
  export const SHAPESHIFTER_BEAR = FourCC("O021");
  export const SHAPESHIFTER_PANTHER = FourCC("O022");
  export const SHAPESHIFTER_TIGER = FourCC("O023");
  export const DRUID = FourCC("O024");
  export const JUNGLE_TYRANT = FourCC("O025");

  // ─── Trolls: Thief Line (HERO_ID_GEN) ─────────────────────────────
  export const ESCAPE_ARTIST = FourCC("O050");
  export const CONTORTIONIST = FourCC("O051");
  export const ASSASSIN = FourCC("O052");

  // ─── Trolls: Scout Line (HERO_ID_GEN) ─────────────────────────────
  export const OBSERVER = FourCC("O060");
  export const TRAPPER = FourCC("O061");
  export const SPY = FourCC("O062");

  // ─── Trolls: Gatherer Line (HERO_ID_GEN) ──────────────────────────
  export const RADAR_GATHERER = FourCC("O070");
  export const HERB_MASTER = FourCC("O071");
  export const OMNIGATHERER = FourCC("O072");

  // ─── Selection Units (HERO_ID_GEN) ─────────────────────────────────
  export const REPICK_TROLL = FourCC("O080");
  export const RANDOM_TROLL = FourCC("O081");
  export const ONE = FourCC("O082");               // UNIT_ONE - "The One" boss (hero type)

  // ─── Animals: Elk Family ───────────────────────────────────────────
  export const ADULT_ELK = FourCC("n001");
  export const ELK = FourCC("n002");
  export const ELK_ADOLESCENT = FourCC("n003");
  export const FAWN = FourCC("n004");

  // ─── Animals: Bear Family ──────────────────────────────────────────
  export const ADULT_JUNGLE_BEAR = FourCC("n010");
  export const JUNGLE_BEAR = FourCC("n011");
  export const BEAR_ADOLESCENT = FourCC("n012");
  export const BEAR_CUB = FourCC("n013");

  // ─── Animals: Wolf Family ──────────────────────────────────────────
  export const ADULT_JUNGLE_WOLF = FourCC("n020");
  export const JUNGLE_WOLF = FourCC("n021");
  export const WOLF_ADOLESCENT = FourCC("n022");
  export const WOLF_PUP = FourCC("n023");

  // ─── Animals: Cats ─────────────────────────────────────────────────
  export const PANTHER = FourCC("n030");
  export const ELDER_PANTHER = FourCC("n031");

  // ─── Animals: Other ────────────────────────────────────────────────
  export const SNAKE = FourCC("n040");
  export const FISH = FourCC("n041");
  export const GREEN_FISH = FourCC("n042");

  // ─── Animals: Hawks ────────────────────────────────────────────────
  export const HAWK = FourCC("n050");
  export const HAWK_ADOLESCENT = FourCC("n051");
  export const HAWK_HATCHLING = FourCC("n052");
  export const ALPHA_HAWK = FourCC("n053");

  // ─── Bosses (UNIT_ID_GEN unless noted) ─────────────────────────────
  export const ALLIGATOR_MAN = FourCC("n060");
  export const ANCIENT_HYDRA = FourCC("n061");
  export const LESSER_HYDRA = FourCC("n062");
  export const MAMMOTH = FourCC("n063");
  export const DISCO_DUCK = FourCC("n064");
  // Note: THE_ONE uses HERO_ID_GEN, listed above as ONE

  // ─── Buildings ─────────────────────────────────────────────────────
  export const FORGE = FourCC("h001");
  export const ARMORY = FourCC("h002");
  export const TANNERY = FourCC("h003");
  export const POT = FourCC("h004");               // UNIT_POT - Mixing Pot
  export const WORKSHOP = FourCC("h005");
  export const WITCH_DOCTORS_HUT = FourCC("h006");
  export const CRAFT_MASTER = FourCC("h007");
  export const BONFIRE = FourCC("h008");           // UNIT_BONFIRE - Camp fire
  export const TENT = FourCC("h009");
  export const MUD_HUT = FourCC("h00A");
  export const TROLL_HUT = FourCC("h00B");
  export const HATCHERY = FourCC("h00C");
  export const TELEPORTATION_BEACON = FourCC("h00D");
  export const ENSNARE_TRAP = FourCC("h00E");
  export const SPIRIT_WARD = FourCC("h00F");
  export const OMNITOWER = FourCC("h00G");
  export const STORAGE_HUT = FourCC("h00H");
  export const SMOKE_HOUSE = FourCC("h00I");

  // ─── Special Units ─────────────────────────────────────────────────
  export const LIVING_CLAY = FourCC("n070");
  export const BEAR_TRAP = FourCC("n071");         // UNIT_BEAR_TRAP
  export const SPIKED_TRAP = FourCC("n072");       // UNIT_SPIKED_TRAP
  export const TRAP = FourCC("n073");              // UNIT_TRAP
  export const BEE = FourCC("n074");
  export const BEE_HIVE = FourCC("n075");
  export const UBER_HIVE = FourCC("n076");
  export const MEAT = FourCC("n077");
  export const TROLL_MERCHANT = FourCC("n078");
  export const FIRE = FourCC("n079");              // UNIT_FIRE
  export const MAGE_FIRE = FourCC("n07A");
  export const MAGE_FIRE_SUMMONED = FourCC("n07B");
  export const TROLL_TRANSPORT_SHIP = FourCC("n07C");
  export const LOCUST_SKELETON = FourCC("n07D");
  export const BUILDING_TREE = FourCC("n07E");
  export const HIDDEN_STASH = FourCC("n07F");
  export const OMINOUS_ALTAR = FourCC("n07G");
  export const TROLL_TOTEM = FourCC("n07H");

  // ─── Trade Ships ───────────────────────────────────────────────────
  export const TRADE_SHIP_1 = FourCC("n080");
  export const TRADE_SHIP_2 = FourCC("n081");
  export const TRADE_SHIP_3 = FourCC("n082");
  export const TRADE_SHIP_4 = FourCC("n083");
  export const TRADE_SHIP_5 = FourCC("n084");
  export const TRADE_SHIP_6 = FourCC("n085");

  // ─── Dragons ───────────────────────────────────────────────────────
  export const BRONZE_DRAGON = FourCC("n090");
  export const BRONZE_DRAGON_HATCHLING = FourCC("n091");
  export const GREATER_BRONZE_DRAGON = FourCC("n092");
  export const FOREST_DRAGON = FourCC("n093");
  export const FOREST_DRAGON_HATCHLING = FourCC("n094");
  export const GREATER_FOREST_DRAGON = FourCC("n095");
  export const NETHER_DRAGON = FourCC("n096");
  export const NETHER_DRAGON_HATCHLING = FourCC("n097");
  export const GREATER_NETHER_DRAGON = FourCC("n098");
  export const RED_DRAGON = FourCC("n099");
  export const RED_DRAGON_HATCHLING = FourCC("n09A");
  export const GREATER_RED_DRAGON = FourCC("n09B");

  // ─── Herb Bushes ───────────────────────────────────────────────────
  export const ATHELAS_BUSH = FourCC("n0A0");
  export const BLUE_HERB_BUSH = FourCC("n0A1");
  export const ORANGE_HERB_BUSH = FourCC("n0A2");
  export const PURPLE_HERB_BUSH = FourCC("n0A3");
  export const YELLOW_HERB_BUSH = FourCC("n0A4");
  export const WATER_HERB_BUSH = FourCC("n0A5");
  export const MUSHROOM_COLONY = FourCC("n0A6");
  export const SCOUTS_BUSH = FourCC("n0A7");
  export const THIEFS_BUSH = FourCC("n0A8");
  export const THISTLE_SHRUB = FourCC("n0A9");

  // ─── Legacy / Convenience Aliases ──────────────────────────────────
  // These preserve backward compatibility with code using older names.

  /** Alias: use POT instead */
  export const MIXING_POT = POT;
  /** Alias: use BONFIRE instead */
  export const CAMP_FIRE = BONFIRE;
  /** Alias: use TELEPORTATION_BEACON instead */
  export const TELEPORT_BEACON = TELEPORTATION_BEACON;
  /** Alias: use WITCH_DOCTORS_HUT instead */
  export const WITCH_DOCTOR_HUT = WITCH_DOCTORS_HUT;
  /** Alias: use ONE instead */
  export const THE_ONE = ONE;
}
