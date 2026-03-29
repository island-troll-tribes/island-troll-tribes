/**
 * AbilityIds - WC3 ability type ID constants.
 * BuffIds   - WC3 buff type ID constants.
 *
 * All FourCC ability/buff IDs used throughout the game, organized by category.
 * These correspond to abilities defined in the WC3 Object Editor.
 *
 * Most IDs use compiletime generation in the original Wurst source
 * (ABIL_ID_GEN.next() / BUFF_ID_GEN.next()). Here we use sequential
 * placeholder FourCC codes that will be mapped to actual IDs from the
 * base.w3x object data at build time via war3-transformer.
 *
 * Abilities use "A000"-"A999" for compiletime placeholders.
 * Buffs use "B100"-"B199" for compiletime placeholders.
 *
 * Hardcoded FourCC values from the Wurst source are preserved exactly:
 *   ACTIVATE_RUNE                = 'ACTR'
 *   ADVANCED_RADAR_SPELLBOOK_ID  = 'A0JN'
 *   INT_BONUS_3                  = 'AIi3'
 *   INT_BONUS_4                  = 'AIi4'
 *   INT_BONUS_6                  = 'AIi6'
 *   INVULNERABLE                 = 'Avul'
 *   LOCUST                       = 'Aloc'
 *   PET_FOLLOW                   = 'A01C'
 *   PET_GO_TO_HATCHERY           = 'A03O'
 *   PET_SCOUT                    = 'A03L'
 *   PET_SPELLS                   = 'A06Q'
 *   PET_STAY                     = 'A01D'
 *   SALVE_RECIPE                 = 'A0FB'
 *   STATS_BONUS_5                = 'AIx5'
 *   STR_BONUS_1                  = 'AIs1'
 *   STR_BONUS_3                  = 'AIs3'
 *   STR_BONUS_4                  = 'AIs4'
 *   STR_BONUS_6                  = 'AIs6'
 */

export namespace AbilityIds {
  // ─── Troll Class Spellbooks ────────────────────────────────────────
  export const MAGE_SPELLBOOK = FourCC("A000");
  export const MAGE_LEGACY_SPELLBOOK = FourCC("A001");
  export const SUB_MAGE_INHERITED_SPELLBOOK = FourCC("A002");
  export const SUB_MAGE_LEGACY_INHERITED_SPELLBOOK = FourCC("A003");
  export const ELEMENTALIST = FourCC("A004");
  export const ELEMENTALIST_NEW_SPELLBOOK = FourCC("A005");
  export const DEMENTIA_MASTER = FourCC("A006");
  export const DEMENTIA_MASTER_SPELLBOOK = FourCC("A007");
  export const DEMENTIA_MASTER_INHERITED_SPELLBOOK = FourCC("A008");
  export const PRIEST_SPELLBOOK = FourCC("A009");
  export const SUB_PRIEST_SPELLBOOK = FourCC("A00A");
  export const MASTER_HEALER = FourCC("A00B");
  export const MASTER_HEALER_SPELLBOOK = FourCC("A00C");
  export const SAGE = FourCC("A00D");
  export const SAGE_SPELLBOOK = FourCC("A00E");
  export const SAGE_INHERITED_SPELLBOOK = FourCC("A00F");
  export const SUB_THIEF_SPELLBOOK = FourCC("A00G");
  export const PHYSICAL_SPELLBOOK_THIEF = FourCC("A00H");
  export const ESCAPE_ARTIST = FourCC("A00I");
  export const ESCAPE_ARTIST_SPELLBOOK = FourCC("A00J");
  export const CONTORTIONIST = FourCC("A00K");
  export const CONTORTIONIST_SPELLBOOK = FourCC("A00L");
  export const ASSASSIN = FourCC("A00M");
  export const ASSASSIN_SPELLBOOK = FourCC("A00N");
  export const OBSERVER = FourCC("A00O");
  export const OBSERVER_SPELLBOOK = FourCC("A00P");
  export const SPY = FourCC("A00Q");
  export const SPY_INHERITED_SPELLBOOK = FourCC("A00R");
  export const SPY_INHERITED_SKILL_ID = FourCC("A00S");
  export const TRACKER = FourCC("A00T");
  export const TRACKER_SPELLBOOK = FourCC("A00U");
  export const RADAR_GATHERER = FourCC("A00V");
  export const RADAR_GATHERER_SPELLBOOK = FourCC("A00W");
  export const GATHERER_SPELLBOOK = FourCC("A00X");
  export const HERB_MASTER = FourCC("A00Y");
  export const OMNIGATHERER = FourCC("A00Z");
  export const OMNIGATHERER_INHERITED_SPELLBOOK = FourCC("A010");
  export const WARRIOR = FourCC("A011");
  export const WARRIOR_SPELLBOOK = FourCC("A012");
  export const JUGGERNAUT = FourCC("A013");
  export const JUGGERNAUT_SPELLBOOK = FourCC("A014");
  export const DRUID = FourCC("A015");
  export const DRUID_SPELLBOOK = FourCC("A016");
  export const SHAPESHIFTER = FourCC("A017");
  export const HYPNOTIST = FourCC("A018");
  export const HYPNOTIST_SPELLBOOK = FourCC("A019");
  export const HYPNOTIST_LEGACY_SPELLBOOK = FourCC("A01A");
  export const BOOSTER = FourCC("A01B");
  export const BOOSTER_SPELLBOOK = FourCC("A01E");
  export const JUNGLE_TYRANT = FourCC("A01F");
  export const JUNGLE_TYRANT_EVOLUTION = FourCC("A01G");
  export const ADVANCED_RADAR_SPELLBOOK_ID = FourCC("A0JN"); // Hardcoded
  export const SPELLBOOK_PLACEHOLDER = FourCC("A01H");

  // ─── Combat Abilities ──────────────────────────────────────────────
  export const BASH = FourCC("A01I");
  export const CRIT = FourCC("A01J");
  export const RAGE = FourCC("A01K");
  export const ANGER = FourCC("A01L");
  export const LEGACY_ANGER = FourCC("A01M");
  export const PUMP_UP = FourCC("A01N");
  export const LEGACY_PUMP_UP = FourCC("A01O");
  export const GIANT_SWING = FourCC("A01P");
  export const GIANT_SWING_SS = FourCC("A01Q");
  export const ENSNARE = FourCC("A01R");
  export const ENSNARE_TRAP = FourCC("A01S");
  export const BOSS_ENSNARE = FourCC("A01T");
  export const SPIKED_TRAP = FourCC("A01U");
  export const BEAR_TRAP = FourCC("A01V");
  export const TRACK_TRAP = FourCC("A01W");
  export const HOWL_OF_TERROR = FourCC("A01X");
  export const JUMP = FourCC("A01Y");
  export const BLUR = FourCC("A01Z");
  export const HARDENED_SKIN = FourCC("A020");
  export const PANIC = FourCC("A021");
  export const EXHAUST = FourCC("A022");
  export const BARK_SKIN = FourCC("A023");
  export const SPELL_SHIELD = FourCC("A024");
  export const SPELL_DMG_REDUCTION = FourCC("A025");
  export const MAGIC_RESIST = FourCC("A026");
  export const BEAR_BULWARK = FourCC("A027");
  export const BEAR_BLOCK = FourCC("A028");
  export const BEAR_ENDURANCE = FourCC("A029");
  export const FORTITUDE = FourCC("A02A");
  export const ENDURANCE = FourCC("A02B");
  export const SELF_PRESERVATION = FourCC("A02C");
  export const REINCARNATION = FourCC("A02D");
  export const SUPERSUB_COURAGE = FourCC("A02E");
  export const ASSASINATE = FourCC("A02F");
  export const ASSASSINATE = FourCC("A02G");
  export const TIGER_VICIOUS_STRIKE = FourCC("A02H");
  export const TIGER_VICIOUS_STRIKE_CRIPPLE = FourCC("A02I");
  export const WOLF_HUNGER = FourCC("A02J");
  export const WOLF_VAMPIRIC_ATTACK = FourCC("A02K");
  export const HURL_BOULDER = FourCC("A02L");
  export const NULL_DAMAGE = FourCC("A02M");
  export const NULL_DAMAGE_SUB = FourCC("A02N");

  // ─── Magic Abilities ───────────────────────────────────────────────
  export const FIREBOLT = FourCC("A030");
  export const FLAME_SPRAY = FourCC("A031");
  export const LEGACY_FLAME_SPRAY = FourCC("A032");
  export const FROST_BLAST = FourCC("A033");
  export const FROST_ARMOR = FourCC("A034");
  export const METEOR = FourCC("A035");
  export const MAGE_FIRE = FourCC("A036");
  export const LEGACY_MAGE_FIRE = FourCC("A037");
  export const DEMENTIA_MASTER_MAGE_FIRE = FourCC("A038");
  export const DEMENTIA_MASTER_ANGER = FourCC("A039");
  export const DEMENTIA_MASTER_STUPEFY = FourCC("A03A");
  export const DEMENTIA_SUMMONING = FourCC("A03B");
  export const DEPRESS = FourCC("A03C");
  export const LEGACY_DEPRESS = FourCC("A03D");
  export const DEPRESSION_AURA = FourCC("A03E");
  export const DEPRESSION_ORB = FourCC("A03F");
  export const DEMENTIA_DEPRESSION_AURA = FourCC("A03G");
  export const DD_DEPRESS_AURA = FourCC("A03H");
  export const DD_IMMOLATION = FourCC("A03I");
  export const DD_MOVE_SPEED = FourCC("A03J");
  export const NEGATIVE_BLAST = FourCC("A03K");
  export const LEGACY_NEGATIVE_BLAST = FourCC("A03M");
  export const NEGATIVE_BLAST_SUB = FourCC("A03N");
  export const STUPEFY = FourCC("A03P");
  export const STUPEFY_LEGACY = FourCC("A03Q");
  export const DOOMSDAY = FourCC("A03R");
  export const METRONOME = FourCC("A03S");
  export const LEGACY_METRONOME = FourCC("A03T");
  export const METRONOME_FROSTNOVA = FourCC("A03U");
  export const METRONOME_FROSTNOVAULT = FourCC("A03V");
  export const METRONOME_IMPALE = FourCC("A03W");
  export const METRONOME_MANABURN = FourCC("A03X");
  export const OVERCHARGE = FourCC("A03Y");
  export const LIGHTING_SHIELD = FourCC("A03Z");
  export const CYCLONE = FourCC("A040");
  export const TSUNAMI = FourCC("A041");
  export const DARK_GATE = FourCC("A042");
  export const LIGHT_GATE = FourCC("A043");
  export const ZAP = FourCC("A044");
  export const ANGELIC_ELEMENTAL = FourCC("A045");
  export const SAGE_ANGELIC_ELEMENTAL = FourCC("A046");
  export const SKELETAL_MINION = FourCC("A047");
  export const EARTH_GUARDIAN = FourCC("A048");
  export const MAGIC_MIST = FourCC("A049");
  export const ANTI_MAGIC = FourCC("A04A");
  export const ANTI_MAGIC_AOE = FourCC("A04B");

  // ─── Priest/Healing ────────────────────────────────────────────────
  export const HEALING_WAVE = FourCC("A050");
  export const MH_HEALING_WAVE = FourCC("A051");
  export const SAGE_HEALING_WAVE = FourCC("A052");
  export const HEALING_POTION = FourCC("A053");
  export const REJUVENATION = FourCC("A054");
  export const REJUV_HEALING = FourCC("A055");
  export const REJUV_MANA = FourCC("A056");
  export const RANGED_HEAL = FourCC("A057");
  export const REPLENISH_ENERGY = FourCC("A058");
  export const REPLENISH_HEALTH = FourCC("A059");
  export const SAGE_REPLENISH_ENERGY = FourCC("A05A");
  export const BREATH_OF_LIFE = FourCC("A05B");
  export const CURE_ALL = FourCC("A05C");
  export const CURE_ALL_ITEM = FourCC("A05D");
  export const OMNICURE = FourCC("A05E");
  export const OMNICURE_ITEM = FourCC("A05F");
  export const TROLL_BATTLE_CALL = FourCC("A05G");
  export const SAGE_TROLL_BATTLE_CALL = FourCC("A05H");
  export const INCREASE_METABOLISM = FourCC("A05I");
  export const SAGE_INCREASE_METABOLISM = FourCC("A05J");
  export const MIX_ENERGY = FourCC("A05K");
  export const MIX_HEAT = FourCC("A05L");
  export const MH_MIX_ENERGY = FourCC("A05M");
  export const MH_MIX_HEAT = FourCC("A05N");
  export const SAGE_MIX_ENERGY = FourCC("A05O");
  export const SAGE_MIX_HEAT = FourCC("A05P");
  export const MIX_HERBS = FourCC("A05Q");
  export const OMNIGATHERER_MIX_HERBS = FourCC("A05R");
  export const POT_MIX_HERBS = FourCC("A05S");
  export const MEDITATE = FourCC("A05T");
  export const SPIRIT_LINK = FourCC("A05U");
  export const SPIRITUAL_GUIDANCE = FourCC("A05V");
  export const ANCHOR_SOUL = FourCC("A05W");
  export const SPIRIT_PRISON = FourCC("A05X");
  export const LEGACY_SPIRIT_PRISON = FourCC("A05Y");
  export const SPIRIT_PRISON_CAGE = FourCC("A05Z");

  // ─── Thief Abilities ───────────────────────────────────────────────
  export const CAMOFLAGE = FourCC("A060");
  export const AS_CAMOFLAGE = FourCC("A061");
  export const SMOKE_STREAM = FourCC("A062");
  export const AS_SMOKE_STREAM = FourCC("A063");
  export const TELE_THIEF = FourCC("A064");
  export const AS_TELE_THIEF = FourCC("A065");
  export const CLOAK = FourCC("A066");
  export const SUB_CLOAK = FourCC("A067");
  export const NETHER_FADE = FourCC("A068");
  export const JEALOUSY = FourCC("A069");
  export const LEGACY_JEALOUSY = FourCC("A06A");
  export const SEIZURES = FourCC("A06B");
  export const DREAM_EATER = FourCC("A06C");
  export const LEGACY_DREAM_EATER = FourCC("A06D");
  export const HYPNOSIS = FourCC("A06E");
  export const LEGACY_HYPNOSIS = FourCC("A06F");

  // ─── Scout Abilities ───────────────────────────────────────────────
  export const REVEAL_ID = FourCC("A070");
  export const GREATER_REVEAL_ID = FourCC("A071");
  export const CHAIN_REVEAL = FourCC("A072");
  export const TRACK = FourCC("A073");
  export const TRACKER_TRACK = FourCC("A074");
  export const SNIFF = FourCC("A075");
  export const SNIFF_TRACK = FourCC("A076");
  export const PING_ENEMY = FourCC("A077");
  export const SPY_PING_ENEMY = FourCC("A078");
  export const WARD_AREA = FourCC("A079");
  export const SPY_WARD_AREA = FourCC("A07A");
  export const OBSERVER_WARD_AREA = FourCC("A07B");
  export const SPY_BEAR_TRAP = FourCC("A07C");
  export const SENTINEL = FourCC("A07D");
  export const SHADOW_SIGHT = FourCC("A07E");
  export const ITEM_RADAR = FourCC("A07F");

  // ─── Gatherer Abilities ────────────────────────────────────────────
  export const ID_FIND_TINDER = FourCC("A080");
  export const ID_FIND_CLAYBALL = FourCC("A081");
  export const ID_FIND_STICK = FourCC("A082");
  export const ID_FIND_FLINT = FourCC("A083");
  export const ID_FIND_MANA = FourCC("A084");
  export const ID_FIND_MUSHROOM = FourCC("A085");
  export const ID_FIND_STONE = FourCC("A086");
  export const TELEPORT = FourCC("A087");
  export const TELE_GATHER_OMNI = FourCC("A088");
  export const TELE_HERB_GATHER = FourCC("A089");
  export const TELE_RADAR_GATHER = FourCC("A08A");
  export const ITEM_WARP = FourCC("A08B");
  export const REDUCE_FOOD = FourCC("A08C");
  export const LEGACY_REDUCE_FOOD = FourCC("A08D");
  export const COOK_MEAT = FourCC("A08E");

  // ─── Beastmaster/Pet Abilities ─────────────────────────────────────
  export const PET_FOLLOW = FourCC("A01C");            // Hardcoded
  export const PET_STAY = FourCC("A01D");              // Hardcoded
  export const PET_GO_TO_HATCHERY = FourCC("A03O");    // Hardcoded
  export const PET_SCOUT = FourCC("A03L");             // Hardcoded
  export const PET_SPELLS = FourCC("A06Q");            // Hardcoded
  export const PET_TAME = FourCC("A090");
  export const PET_TAME_SHAPESHIFTER = FourCC("A091");
  export const PET_RELEASE = FourCC("A092");
  export const PET_RELEASE_SHAPESHIFTER = FourCC("A093");
  export const PET_SLEEP = FourCC("A094");
  export const PET_SLEEP_SHAPESHIFTER = FourCC("A095");
  export const PET_REVIVE_INFO = FourCC("A096");
  export const PET_ARMOR = FourCC("A097");
  export const PET_DAMAGE = FourCC("A098");
  export const PET_MAGIC_RESIST = FourCC("A099");
  export const FEED_PET = FourCC("A09A");
  export const GROW_PET = FourCC("A09B");
  export const TOGGLE_PET_CONTROL = FourCC("A09C");
  export const TOGGLE_PET_CONTROL_SHAPESHIFTER = FourCC("A09D");
  export const SPIRIT_BEAST = FourCC("A09E");
  export const SPIRIT_BEAST_SHAPESHIFTER = FourCC("A09F");
  export const SHAPESHIFTER_FORM = FourCC("A09G");
  export const NATURES_BOND = FourCC("A09H");
  export const DRUID_ROAR = FourCC("A09I");
  export const TRANSFORM_BEAR = FourCC("A09J");
  export const TRANSFORM_PANTHER = FourCC("A09K");
  export const TRANSFORM_TIGER = FourCC("A09L");
  export const TRANSFORM_WOLF = FourCC("A09M");
  export const PANTHER_PROWL = FourCC("A09N");
  export const PANTHER_SHADOW_MELD = FourCC("A09O");
  export const SNAKE_POISON = FourCC("A09P");
  export const HUNTER_WEB = FourCC("A09Q");
  export const ELK_CRITTER_ID = FourCC("A09R");
  export const CAT_GRACE = FourCC("A09S");

  // ─── Rendo Pet Abilities ───────────────────────────────────────────
  export const RENDO_HAWK_EYE = FourCC("A0A0");
  export const RENDO_ELK_JUMP = FourCC("A0A1");
  export const RENDO_WOLF_BITE = FourCC("A0A2");
  export const RENDO_SNAKE_TOXIN = FourCC("A0A3");
  export const RENDO_PANTHER_INSTINCT = FourCC("A0A4");
  export const RENDO_DEVOUR = FourCC("A0A5");

  // ─── Stat Bonuses: Armor ───────────────────────────────────────────
  export const ARMOR_BONUS_1 = FourCC("A0B0");
  export const ARMOR_BONUS_2 = FourCC("A0B1");
  export const ARMOR_BONUS_3 = FourCC("A0B2");
  export const ARMOR_BONUS_4 = FourCC("A0B3");
  export const ARMOR_BONUS_5 = FourCC("A0B4");
  export const ARMOR_BONUS_7 = FourCC("A0B5");
  export const ARMOR_BONUS_10 = FourCC("A0B6");
  export const ARMOR_SPELLBOOK_ID = FourCC("A0B7");

  // ─── Stat Bonuses: Strength ────────────────────────────────────────
  export const STR_BONUS_1 = FourCC("AIs1");           // Hardcoded
  export const STR_BONUS_2 = FourCC("A0C0");
  export const STR_BONUS_3 = FourCC("AIs3");           // Hardcoded
  export const STR_BONUS_4 = FourCC("AIs4");           // Hardcoded
  export const STR_BONUS_6 = FourCC("AIs6");           // Hardcoded
  export const STR_BONUS_8 = FourCC("A0C1");

  // ─── Stat Bonuses: Intelligence ────────────────────────────────────
  export const INT_BONUS_1 = FourCC("A0D0");
  export const INT_BONUS_2 = FourCC("A0D1");
  export const INT_BONUS_3 = FourCC("AIi3");           // Hardcoded
  export const INT_BONUS_4 = FourCC("AIi4");           // Hardcoded
  export const INT_BONUS_5 = FourCC("A0D2");
  export const INT_BONUS_6 = FourCC("AIi6");           // Hardcoded
  export const INT_BONUS_8 = FourCC("A0D3");
  export const INT_BONUS_10 = FourCC("A0D4");

  // ─── Stat Bonuses: All Stats ───────────────────────────────────────
  export const STATS_BONUS_3 = FourCC("A0D5");
  export const STATS_BONUS_4 = FourCC("A0D6");
  export const STATS_BONUS_5 = FourCC("AIx5");         // Hardcoded

  // ─── Stat Bonuses: Speed ───────────────────────────────────────────
  export const SPEED_BONUS_60 = FourCC("A0E0");
  export const SPEED_BONUS_70 = FourCC("A0E1");
  export const SPEED_BONUS_80 = FourCC("A0E2");
  export const SPEED_BONUS_100 = FourCC("A0E3");
  export const SPEED_BONUS_200 = FourCC("A0E4");
  export const SPEED_INCREASE = FourCC("A0E5");

  // ─── Stat Bonuses: Attack Speed ────────────────────────────────────
  export const ATTACK_SPEED_10 = FourCC("A0F0");
  export const ATTACK_SPEED_15 = FourCC("A0F1");
  export const ATTACK_SPEED_20 = FourCC("A0F2");
  export const ATTACK_SPEED_25 = FourCC("A0F3");
  export const ATTACK_SPEED_30 = FourCC("A0F4");
  export const ATTACK_SPEED_35 = FourCC("A0F5");

  // ─── Building/Crafting Spellbooks ──────────────────────────────────
  export const BUILDING_CRAFT_SPELLBOOK_ID = FourCC("A100");
  export const BUILDING_CRAFT_SECOND_SPELLBOOK_ID = FourCC("A101");
  export const FORGE_SPELLBOOK_ID = FourCC("A102");
  export const MIXING_POT_SPELLBOOK_ID = FourCC("A103");
  export const WDH_SPELLBOOK_ID = FourCC("A104");
  export const WORKSHOP_SPELLBOOK_ID = FourCC("A105");
  export const BUILDING_SELECT_LONG_RANGE = FourCC("A106");

  // ─── QuickMake Abilities ───────────────────────────────────────────
  export const QM_ACID_BOMB = FourCC("A200");
  export const QM_ANABOLIC_BOOTS = FourCC("A201");
  export const QM_ANABOLIC_POTION = FourCC("A202");
  export const QM_ANTI_MAGIC_POTION = FourCC("A203");
  export const QM_ARMORY_KIT = FourCC("A204");
  export const QM_BASIC_BOOTS = FourCC("A205");
  export const QM_BASIC_COAT = FourCC("A206");
  export const QM_BASIC_GLOVES = FourCC("A207");
  export const QM_BATTLE_ARMOR = FourCC("A208");
  export const QM_BATTLE_AXE = FourCC("A209");
  export const QM_BATTLE_GLOVES = FourCC("A20A");
  export const QM_BATTLE_SHIELD = FourCC("A20B");
  export const QM_BEE_HIVE = FourCC("A20C");
  export const QM_BLOW_GUN = FourCC("A20D");
  export const QM_BONE_BOOTS = FourCC("A20E");
  export const QM_BONE_COAT = FourCC("A20F");
  export const QM_BONE_GLOVES = FourCC("A20G");
  export const QM_BONE_SHIELD = FourCC("A20H");
  export const QM_CAMP_FIRE_KIT = FourCC("A20I");
  export const QM_CLOAK_FLAMES = FourCC("A20J");
  export const QM_CLOAK_FROST = FourCC("A20K");
  export const QM_CLOAK_HEALING = FourCC("A20L");
  export const QM_CLOAK_MANA = FourCC("A20M");
  export const QM_CURE_ALL = FourCC("A20N");
  export const QM_DARK_SPEAR = FourCC("A20O");
  export const QM_DARK_THISTLES = FourCC("A20P");
  export const QM_DISEASE_POTION = FourCC("A20Q");
  export const QM_DRUNKS_POTION = FourCC("A20R");
  export const QM_ELEMENTAL_SHIELD_POTION = FourCC("A20S");
  export const QM_ELK_SKIN_BOOTS = FourCC("A20T");
  export const QM_ELK_SKIN_COAT = FourCC("A20U");
  export const QM_ELK_SKIN_GLOVES = FourCC("A20V");
  export const QM_EMP = FourCC("A20W");
  export const QM_ENSNARE_TRAP = FourCC("A20X");
  export const QM_ESSENCE_BEES = FourCC("A20Y");
  export const QM_FERVOR_POTION = FourCC("A20Z");
  export const QM_FIRE_BOMB = FourCC("A210");
  export const QM_FORGE_KIT = FourCC("A211");
  export const QM_GEM_OF_KNOWLEDGE = FourCC("A212");
  export const QM_HATCHERY_KIT = FourCC("A213");
  export const QM_HEALING_POTION = FourCC("A214");
  export const QM_HUNTING_NET = FourCC("A215");
  export const QM_HYDRA_SCALE_BOOTS = FourCC("A216");
  export const QM_HYDRA_SCALE_COAT = FourCC("A217");
  export const QM_HYDRA_SCALE_GLOVES = FourCC("A218");
  export const QM_IRON_AXE = FourCC("A219");
  export const QM_IRON_BOOTS = FourCC("A21A");
  export const QM_IRON_COAT = FourCC("A21B");
  export const QM_IRON_GLOVES = FourCC("A21C");
  export const QM_IRON_INGOT = FourCC("A21D");
  export const QM_IRON_SHIELD = FourCC("A21E");
  export const QM_IRON_SPEAR = FourCC("A21F");
  export const QM_JUNGLE_BEAR_SKIN_BOOTS = FourCC("A21G");
  export const QM_JUNGLE_BEAR_SKIN_COAT = FourCC("A21H");
  export const QM_JUNGLE_BEAR_SKIN_GLOVES = FourCC("A21I");
  export const QM_JUNGLE_WOLF_SKIN_BOOTS = FourCC("A21J");
  export const QM_JUNGLE_WOLF_SKIN_COAT = FourCC("A21K");
  export const QM_JUNGLE_WOLF_SKIN_GLOVES = FourCC("A21L");
  export const QM_LIVING_CLAY = FourCC("A21M");
  export const QM_MAGE_MASHER = FourCC("A21N");
  export const QM_MAGIC_SEED = FourCC("A21O");
  export const QM_MANA_CRYSTAL = FourCC("A21P");
  export const QM_MANA_POTION = FourCC("A21Q");
  export const QM_MIXING_POT_KIT = FourCC("A21R");
  export const QM_MUD_HUT_KIT = FourCC("A21S");
  export const QM_NETHER_POTION = FourCC("A21T");
  export const QM_NETS = FourCC("A21U");
  export const QM_OMNICURE = FourCC("A21V");
  export const QM_OMNI_TOWER_KIT = FourCC("A21W");
  export const QM_ORACLE_POTION = FourCC("A21X");
  export const QM_POISON = FourCC("A21Y");
  export const QM_POISON_SPEAR = FourCC("A21Z");
  export const QM_REFINED_POISON_SPEAR = FourCC("A220");
  export const QM_SCROLL_ARMOR = FourCC("A221");
  export const QM_SCROLL_CYCLONE = FourCC("A222");
  export const QM_SCROLL_FIREBALL = FourCC("A223");
  export const QM_SCROLL_LIVING_DEAD = FourCC("A224");
  export const QM_SCROLL_ROOT = FourCC("A225");
  export const QM_SCROLL_HASTE = FourCC("A226");
  export const QM_SCROLL_TSUNAMI = FourCC("A227");
  export const QM_SHIELD = FourCC("A228");
  export const QM_SMOKE_BOMB = FourCC("A229");
  export const QM_SMOKE_HOUSE_KIT = FourCC("A22A");
  export const QM_SPEAR = FourCC("A22B");
  export const QM_SPIRIT_DARKNESS = FourCC("A22C");
  export const QM_SPIRIT_WARD = FourCC("A22D");
  export const QM_SPIRIT_WATER = FourCC("A22E");
  export const QM_SPIRIT_WIND = FourCC("A22F");
  export const QM_STEEL_AXE = FourCC("A22G");
  export const QM_STEEL_BOOTS = FourCC("A22H");
  export const QM_STEEL_COAT = FourCC("A22I");
  export const QM_STEEL_GLOVES = FourCC("A22J");
  export const QM_STEEL_INGOT = FourCC("A22K");
  export const QM_STEEL_SHIELD = FourCC("A22L");
  export const QM_STEEL_SPEAR = FourCC("A22M");
  export const QM_STONE_AXE = FourCC("A22N");
  export const QM_STORAGE_HUT_KIT = FourCC("A22O");
  export const QM_TANNERY_KIT = FourCC("A22P");
  export const QM_TELEPORT_BEACON_KIT = FourCC("A22Q");
  export const QM_TENT_KIT = FourCC("A22R");
  export const QM_TRANSPORT_SHIP = FourCC("A22S");
  export const QM_TROLL_HUT_KIT = FourCC("A22T");
  export const QM_TWIN_ISLANDS = FourCC("A22U");
  export const QM_ULTRA_POISON = FourCC("A22V");
  export const QM_ULTRA_POISON_SPEAR = FourCC("A22W");
  export const QM_WITCH_DOCTORS_HUT_KIT = FourCC("A22X");
  export const QM_WORKSHOP_KIT = FourCC("A22Y");

  // ─── Item Abilities ────────────────────────────────────────────────
  export const BANANA_HEALING = FourCC("A300");
  export const ANABOLIC_EVASION = FourCC("A301");
  export const BONE_THISTLE = FourCC("A302");
  export const DARK_THISTLE = FourCC("A303");
  export const THISTLE = FourCC("A304");
  export const SPEAR = FourCC("A305");
  export const SPEAR_CAST = FourCC("A306");
  export const SPEAR_DARK = FourCC("A307");
  export const SPEAR_IRON = FourCC("A308");
  export const SPEAR_STEEL = FourCC("A309");
  export const SPEAR_POISON = FourCC("A30A");
  export const SPEAR_RPOISON = FourCC("A30B");
  export const SPEAR_UPOISON = FourCC("A30C");
  export const SPEAR_RESIST = FourCC("A30D");
  export const CLOAK_FLAMES = FourCC("A30E");
  export const ICE_VEIL = FourCC("A30F");
  export const ICE_VEIL_DEBUFF = FourCC("A30G");
  export const NETHER_POTION_BANISH = FourCC("A30H");
  export const DRUNK_POTION = FourCC("A30I");
  export const MAXIMUM_FERVOR = FourCC("A30J");
  export const HASTE_AOE = FourCC("A30K");
  export const DYSENTERY = FourCC("A30L");
  export const ROOT_CAST = FourCC("A30M");
  export const ROOT_TROLL = FourCC("A30N");
  export const ROOT_HOSTILE = FourCC("A30O");
  export const BRAMBLE = FourCC("A30P");
  export const BONFIRE_AURA = FourCC("A30Q");
  export const PAIN_AURA = FourCC("A30R");
  export const HYDRA_CLAWS_POISON = FourCC("A30S");
  export const HYDRA_BREATH = FourCC("A30T");
  export const EXTREME_HEAT = FourCC("A30U");
  export const SALVE_RECIPE = FourCC("A0FB");          // Hardcoded

  // ─── Special/Misc ──────────────────────────────────────────────────
  export const ACTIVATE_RUNE = FourCC("ACTR");         // Hardcoded
  export const INVULNERABLE = FourCC("Avul");          // Hardcoded
  export const LOCUST = FourCC("Aloc");                // Hardcoded
  export const ATTACK_TREE = FourCC("A400");
  export const DROP_ITEMS = FourCC("A401");
  export const UNLOAD_ITEMS = FourCC("A402");
  export const PACK_BUILDING = FourCC("A403");
  export const SHOP_SHARING = FourCC("A404");
  export const SLEEP_OUTSIDE = FourCC("A405");
  export const SLEEP_INSIDE_TENT = FourCC("A406");
  export const SLEEP_INSIDE_HUT = FourCC("A407");
  export const HIDE_BEACON = FourCC("A408");
  export const QUERY_BEACON = FourCC("A409");
  export const CAMP_FIRE_HEAT_CAST = FourCC("A40A");
  export const MAGE_FIRE_HEAT_CAST = FourCC("A40B");
  export const CAMP_FIRE_UNSAFE_HEAT = FourCC("A40C");
  export const MAGE_FIRE_UNSAFE_HEAT = FourCC("A40D");
  export const WARD_DESTROY = FourCC("A40E");
  export const HERO_GLOW = FourCC("A40F");
  export const THE_GLOW = FourCC("A40G");
  export const INVOKE_RUNE_1 = FourCC("A40H");
  export const INVOKE_RUNE_2 = FourCC("A40I");
  export const INVOKE_RUNE_3 = FourCC("A40J");
  export const GUI_DRUID = FourCC("A40K");
  export const INVENTORY_3_SLOT = FourCC("A40L");
  export const INVENTORY_4_SLOT = FourCC("A40M");
  export const INVENTORY_5_SLOT = FourCC("A40N");
  export const INVENTORY_BUILDING_2_SLOT = FourCC("A40O");
  export const INVENTORY_BUILDING_3_SLOT = FourCC("A40P");
  export const TRAPPER = FourCC("A40Q");
  export const TRAPPER_SPELLBOOK = FourCC("A40R");
}

export namespace BuffIds {
  export const ANCHOR_SOUL = FourCC("B100");
  export const ATTRACTION = FourCC("B101");
  export const BEAST_SPIRIT = FourCC("B102");
  export const BON_FIRE_HEAT = FourCC("B103");
  export const CAMOFLAGE = FourCC("B104");
  export const CLOAK = FourCC("B105");
  export const DEPRESSED_ARROW = FourCC("B106");
  export const DEPRESSED_AURA = FourCC("B107");
  export const DEPRESSED_THISTLE = FourCC("B108");
  export const DYSENTERY = FourCC("B109");
  export const FORTITUDE = FourCC("B10A");
  export const FROZE_TO_BONE = FourCC("B10B");
  export const GHOST_DEMON_SOUL_BURN = FourCC("B10C");
  export const HASTE = FourCC("B10D");
  export const HEALING = FourCC("B10E");
  export const HEATED = FourCC("B10F");
  export const HYPNOTIZED = FourCC("B10G");
  export const MAP_MAGIC = FourCC("B10H");
  export const NETHER = FourCC("B10I");
  export const SLOWED = FourCC("B10J");
  export const STONE_ARMOR = FourCC("B10K");
  export const THE_GLOW = FourCC("B10L");
  export const UNHOLY_FIRE = FourCC("B10M");
}
