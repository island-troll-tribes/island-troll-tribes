/**
 * ItemObjects - Compiletime definitions for all item types.
 *
 * All items derive from Boots of Speed ('bspd') as a generic base.
 * Stats sourced from wurst/objects/items/*.wurst.
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  const BASE = "bspd";

  function makeItem(id: string, name: string, cost: number, abilities?: string, perishable?: boolean, model?: string) {
    const item = objectData.items.copy(BASE, id);
    if (!item) return;
    item.name = name;
    item.goldCost = cost;
    item.droppedWhenCarrierDies = true;
    item.classification = perishable ? "Charged" : "Permanent";
    if (abilities) {
      item.abilities = abilities;
    } else {
      item.abilities = "";
    }
    if (model) item.modelUsed = model;
  }

  // Model path prefixes
  const MI = "Models\\Items\\";
  const MB = "Models\\Buildings\\";

  // Ability ID shorthands for item ability strings
  // Speed bonuses
  const SPD60  = "A0E0";
  const SPD80  = "A0E2";
  const SPD100 = "A0E3";
  const SPD200 = "A0E4";
  // Armor bonuses
  const ARM1  = "A0B0";
  const ARM2  = "A0B1";
  const ARM3  = "A0B2";
  const ARM5  = "A0B4";
  const ARM7  = "A0B5";
  const ARM10 = "A0B6";
  // Strength bonuses
  const STR2 = "A0C0";
  const STR3 = "AIs3";
  const STR4 = "AIs4";
  const STR8 = "A0C1";
  // Intelligence bonuses
  const INT1  = "A0D0";
  const INT2  = "A0D1";
  const INT3  = "AIi3";
  const INT5  = "A0D2";
  const INT6  = "AIi6";
  const INT10 = "A0D4";
  // All stats bonuses
  const ALL4 = "A0D6";
  const ALL5 = "AIx5";
  // Attack speed bonuses
  const AS10 = "A0F0";
  const AS15 = "A0F1";
  const AS20 = "A0F2";
  const AS25 = "A0F3";
  const AS30 = "A0F4";
  const AS35 = "A0F5";
  // Standard WC3 attack damage bonuses
  const ATK1 = "AItg"; // +1 damage
  const ATK2 = "AIat"; // +2 damage (custom in Wurst)

  // comma-join helper
  function ab(...ids: string[]) { return ids.join(","); }

  // ── Raw Materials ──
  makeItem("I000", "Tinder",        2);
  makeItem("I001", "Clay Ball",     3);
  makeItem("I002", "Stick",         3, ATK1);  // +1 damage
  makeItem("I003", "Flint",         3);
  makeItem("I004", "Mana Crystal",  5, undefined, false, MI+"ManaStone.mdx");
  makeItem("I005", "Stone",         5, undefined, true);
  makeItem("I006", "Mushroom",      2);
  makeItem("I007", "Magic",         5, undefined, true);
  makeItem("I008", "Bone",          3, ATK2);  // +2 damage

  // ── Herbs ──
  makeItem("I010", "River Root",    3, undefined, false, MI+"RiverRootsBlue.mdx");
  makeItem("I011", "River Stem",    3, undefined, false, MI+"RiverStemBrown.mdx");
  makeItem("I012", "Athelas Seed",  3);
  makeItem("I013", "Blue Herb",     3);
  makeItem("I014", "Yellow Herb",   3);
  makeItem("I015", "Orange Herb",   3);
  makeItem("I016", "Purple Herb",   3);

  // ── Animal Drops ──
  makeItem("I020", "Elk Hide",          9, undefined, false, MI+"HideElk.mdx");
  makeItem("I021", "Jungle Wolf Hide",  15, undefined, false, MI+"HideWolf.mdx");
  makeItem("I022", "Jungle Bear Hide",  21, undefined, false, MI+"HideBear.mdx");
  makeItem("I023", "Raw Meat",          2, undefined, false, MI+"Ham.mdx");
  makeItem("I024", "Cooked Meat",       2, undefined, true, MI+"Ham.mdx");
  makeItem("I025", "Hawk Egg",          5);
  makeItem("I026", "Honeycomb",         10, undefined, true, MI+"Honeycomb.mdx");
  makeItem("I027", "Banana",            2, undefined, true, MI+"Banana.mdx");

  // ── Crafted Materials ──
  makeItem("I030", "Iron Ingot",         10, undefined, false, MI+"IronIngot.mdx");
  makeItem("I031", "Steel Ingot",        25, undefined, false, MI+"SteelIngot.mdx");
  makeItem("I032", "Spirit of Water",    6, undefined, false, MI+"SpiritOfWater.mdx");
  makeItem("I033", "Spirit of Wind",     6, undefined, false, MI+"SpiritOfWind.mdx");
  makeItem("I034", "Spirit of Darkness", 12, undefined, false, MI+"OrbDarknessX.mdx");
  makeItem("I035", "Poison",             8, undefined, false, MI+"Poison.mdx");
  makeItem("I036", "Ultra Poison",       16, undefined, false, MI+"UltraPoison.mdx");
  makeItem("I037", "Living Clay",        10);
  makeItem("I038", "Magic Seed",         8);

  // ── Weapons: Spears ──
  makeItem("I03A", "Spear",                 5, undefined, true, MI+"Spears.mdx");
  makeItem("I041", "Iron Spear",            11, undefined, true, MI+"Spears.mdx");
  makeItem("I042", "Steel Spear",           23, undefined, true, MI+"Spears.mdx");
  makeItem("I043", "Dark Spear",            20, undefined, true, MI+"Spears.mdx");
  makeItem("I044", "Poison Spear",          10, undefined, true, MI+"Spears.mdx");
  makeItem("I045", "Refined Poison Spear",  14, undefined, true, MI+"Spears.mdx");
  makeItem("I046", "Ultra Poison Spear",    19, undefined, true, MI+"Spears.mdx");

  // ── Weapons: Axes (damage + attack tree ability) ──
  makeItem("I047", "Stone Axe",     12, undefined, false, MI+"StoneAxe.mdx");
  makeItem("I048", "Iron Axe",      25, undefined, false, MI+"IronAxe.mdx");
  makeItem("I049", "Steel Axe",     48, undefined, false, MI+"SteelAxe.mdx");
  makeItem("I04A", "Battle Axe",    60, undefined, false, MI+"BattleAxe.mdx");
  makeItem("I04B", "Mage Masher",   40, undefined, false, MI+"MageMasher.mdx");

  // ── Weapons: Ranged ──
  makeItem("I04C", "Blow Gun",       10, undefined, false, MI+"BlowGun.mdx");
  makeItem("I04D", "Thistles",       2, undefined, true);
  makeItem("I04E", "Dark Thistles",  3, undefined, true);
  makeItem("I04F", "Nets",           8, undefined, true);
  makeItem("I04G", "Hunting Net",    12, undefined, true);

  // ── Armor: Boots (speed + int + armor) ──
  makeItem("I050", "Elk Skin Boots",   19, ab(SPD60, INT2), false, MI+"SkinBoots.mdx");
  makeItem("I051", "Wolf Skin Boots",  33, ab(SPD60, INT3, ARM2), false, MI+"WolfHideBoots.mdx");
  makeItem("I052", "Bear Skin Boots",  47, ab(SPD60, INT5, ARM3), false, MI+"SkinBoots.mdx");
  makeItem("I053", "Bone Boots",       34, ab(SPD60, INT3, ARM2), false, MI+"BoneBoots.mdx");
  makeItem("I054", "Iron Boots",       55, ab(SPD80, INT6, ARM3), false, MI+"IronBoots.mdx");
  makeItem("I055", "Steel Boots",      70, ab(SPD100, INT10, ARM5), false, MI+"IronBoots.mdx");
  makeItem("I056", "Anabolic Boots",   85, ab(SPD200, ALL4, ARM5), false, MI+"IronBoots.mdx");

  // ── Armor: Gloves (attack speed + attack bonus + armor) ──
  makeItem("I060", "Elk Skin Gloves",   19, ab(AS10), false, MI+"SkinGloves.mdx");
  makeItem("I061", "Wolf Skin Gloves",  33, ab(AS15, ATK2, ARM2), false, MI+"SkinGloves.mdx");
  makeItem("I062", "Bear Skin Gloves",  47, ab(AS20, ARM3), false, MI+"SkinGloves.mdx");
  makeItem("I063", "Bone Gloves",       34, ab(AS20, ATK1, ARM2), false, MI+"BoneGloves.mdx");
  makeItem("I064", "Iron Gloves",       55, ab(AS25, ATK2, ARM3), false, MI+"IronGloves.mdx");
  makeItem("I065", "Steel Gloves",      70, ab(AS35, ARM5), false, MI+"IronGloves.mdx");
  makeItem("I066", "Battle Gloves",     83, ab(AS30, ALL4, ARM5), false, MI+"BattleGloves.mdx");

  // ── Armor: Coats (str + int + armor) ──
  makeItem("I070", "Elk Skin Coat",   27, ab(STR2, INT1, ARM1), false, MI+"SkinCoat.mdx");
  makeItem("I071", "Wolf Skin Coat",  49, ab(STR3, INT2, ARM2), false, MI+"SkinCoat.mdx");
  makeItem("I072", "Bear Skin Coat",  70, ab(STR4, INT3, ARM3), false, MI+"SkinCoat.mdx");
  makeItem("I073", "Bone Coat",       47, ab(STR3, INT2, ARM2), false, MI+"BoneCoat.mdx");
  makeItem("I074", "Iron Coat",       63, ab(STR4, INT3, ARM3), false, MI+"Armor.mdx");
  makeItem("I075", "Steel Coat",      68, ab(STR8, INT6, ARM5), false, MI+"Armor.mdx");
  makeItem("I076", "Battle Armor",    66, ab(ALL4, ARM7), false, MI+"Armor.mdx");

  // ── Shields ──
  makeItem("I07F", "Shield",         15, ab(ARM2), false, MI+"Shield.mdx");
  makeItem("I080", "Bone Shield",    30, ab(ARM3), false, MI+"BoneShield.mdx");
  makeItem("I081", "Iron Shield",    50, ab(ARM5), false, MI+"IronShield.mdx");
  makeItem("I082", "Steel Shield",   65, ab(ARM7), false, MI+"SteelShield.mdx");
  makeItem("I083", "Battle Shield",  80, ab(ARM10), false, MI+"BattleShield.mdx");

  // ── Potions ──
  makeItem("I090", "Healing Potion",           10, undefined, true, MI+"PotionRed.mdx");
  makeItem("I091", "Mana Potion",              10, undefined, true, MI+"PotionBlueLesser.mdx");
  makeItem("I092", "Cure All",                 15, undefined, true, MI+"PotionGreen.mdx");
  makeItem("I093", "Anabolic Potion",          20, undefined, true, MI+"PotionGreen.mdx");
  makeItem("I094", "Oracle Potion",            12, undefined, true, MI+"PotionOracle.mdx");
  makeItem("I095", "Disease Potion",           15, undefined, true, MI+"PotionPurpleLesser.mdx");
  makeItem("I096", "Acid Bomb",                15, undefined, true);
  makeItem("I097", "Essence of Bees",          18, undefined, true);
  makeItem("I098", "Potion of Twin Islands",   20, undefined, true, MI+"PotionBlueLesser.mdx");
  makeItem("I099", "Nether Potion",            25, undefined, true, MI+"PotionPurpleSmall.mdx");
  makeItem("I09A", "Fervor Potion",            18, undefined, true, MI+"PotionRed.mdx");
  makeItem("I09B", "Drunk's Potion",           12, undefined, true, MI+"PotionBlueLesser.mdx");
  makeItem("I09C", "Anti-Magic Potion",        20, undefined, true, MI+"PotionAntiMagic.mdx");
  makeItem("I09D", "Omnicure",                 30, undefined, true, MI+"PotionGreen.mdx");
  makeItem("I09E", "Elemental Shield Potion",  22, undefined, true, MI+"PotionInvulnerability.mdx");

  // ── Scrolls ──
  makeItem("I0A0", "Scroll of Stone Armor",      15, undefined, true, MI+"ScrollYellow.mdx");
  makeItem("I0A1", "Scroll of Entangling Roots", 15, undefined, true, MI+"ScrollRegen.mdx");
  makeItem("I0A2", "Scroll of Cyclone",          18, undefined, true, MI+"ScrollCyan.mdx");
  makeItem("I0A3", "Scroll of Fireball",         20, undefined, true, MI+"ScrollRed.mdx");
  makeItem("I0A4", "Scroll of Haste",            12, undefined, true, MI+"ScrollHaste.mdx");
  makeItem("I0A5", "Scroll of Tsunami",          25, undefined, true, MI+"ScrollPurple.mdx");
  makeItem("I0A6", "Scroll of Living Dead",      22, undefined, true, MI+"ScrollOrange.mdx");

  // ── Cloaks ──
  makeItem("I0B0", "Cloak of Flames",   40, undefined, false, MI+"Cloak.mdx");
  makeItem("I0B1", "Cloak of Frost",    40, undefined, false, MI+"Cloak.mdx");
  makeItem("I0B2", "Cloak of Healing",  40, undefined, false, MI+"Cloak.mdx");
  makeItem("I0B3", "Cloak of Mana",     40, undefined, false, MI+"Cloak.mdx");

  // ── Special Items ──
  makeItem("I0C0", "Gem of Knowledge",     50, undefined, false, MI+"GemOfKnowledge.mdx");
  makeItem("I0C1", "Medallion of Courage", 75, undefined, false, MI+"Crown.mdx");
  makeItem("I058", "Blink",                35, undefined, true);
  makeItem("I0C3", "Smoke Bomb",           15, undefined, true);
  makeItem("I0C4", "Fire Bomb",            15, undefined, true, MI+"LiquidFire.mdx");
  makeItem("I0C5", "EMP",                  20, undefined, true);
  makeItem("I0C6", "Clay Explosion",       12, undefined, true);
  makeItem("I0C7", "Thief's Medallion",    40);
  makeItem("I0C8", "Bee Hive",             25);
  makeItem("I0C9", "Spirit Ward Kit",      15, undefined, true);
  makeItem("I0CA", "Repair Hammer",        20);
  makeItem("I0CB", "Hardened Scales",       30, undefined, false, MI+"HydraCoat.mdx");

  // ── Salves ──
  makeItem("I9S0", "Armor Salve",    150, undefined, true);
  makeItem("I9S1", "Healing Salve",  100, undefined, true);
  makeItem("I9S2", "Hypnosis Salve", 100, undefined, true);
  makeItem("I9S3", "Poison Salve",   50,  undefined, true);
  makeItem("I9S4", "Speed Salve",    80,  undefined, true);

  // ── Building Kits ──
  makeItem("I0D0", "Camp Fire Kit",           5, undefined, true);
  makeItem("I0D1", "Tent Kit",               8, undefined, true);
  makeItem("I0D2", "Mud Hut Kit",            12, undefined, true);
  makeItem("I0D3", "Mixing Pot Kit",         10, undefined, true);
  makeItem("I0D4", "Armory Kit",             15, undefined, true);
  makeItem("I0D5", "Workshop Kit",           15, undefined, true);
  makeItem("I0D6", "Tannery Kit",            12, undefined, true);
  makeItem("I0D7", "Forge Kit",              12, undefined, true);
  makeItem("I0D8", "Witch Doctor's Hut Kit", 15, undefined, true);
  makeItem("I0D9", "Hatchery Kit",           10, undefined, true);
  makeItem("I0DA", "Teleport Beacon Kit",    20, undefined, true);
  makeItem("I0DB", "Troll Hut Kit",          15, undefined, true);
  makeItem("I0DC", "Storage Hut Kit",        10, undefined, true);
  makeItem("I0DD", "Smoke House Kit",        12, undefined, true);
  makeItem("I0DE", "Omnitower Kit",          25, undefined, true);
  makeItem("I0DF", "Transport Ship Kit",     20, undefined, true);
  makeItem("I0DG", "Ensnare Trap Kit",       10, undefined, true);
  makeItem("I0DH", "Mage Fire Kit",          8,  undefined, true);

  // ── Boss Drops (with stat abilities) ──
  makeItem("I057", "Alligator Gold",       100);
  makeItem("I0E0", "Hydra Claws",          104, ab(AS35, ALL5), false, MI+"HydraClaws.mdx");
  makeItem("I0E1", "Hydra Fins",           104, ab(SPD100, ALL5, ARM5), false, MI+"HydraFins.mdx");
  makeItem("I0E2", "Hydra Scale",          52, undefined, false, MI+"HydraScale.mdx");
  makeItem("I0E3", "Hydra Hint",           10);
  makeItem("I0E4", "Horn of the Mammoth",  50, undefined, false, MI+"HornOfMammoth.mdx");
  makeItem("I0E5", "Fire Pinion",          40);
  makeItem("I0E6", "Pain Pinion",          40);
  makeItem("I0E7", "Shadow Pinion",        40);
  makeItem("I0E8", "Hydra Scale Boots",    100, ab(SPD100, ALL5, ARM5), false, MI+"HydraFins.mdx");
  makeItem("I0E9", "Hydra Scale Gloves",   100, ab(AS35, ALL5, ARM5), false, MI+"HydraClaws.mdx");
  makeItem("I0EA", "Hydra Scale Coat",     156, ab(ALL4, ARM10), false, MI+"HydraCoat.mdx");

  return undefined;
});
