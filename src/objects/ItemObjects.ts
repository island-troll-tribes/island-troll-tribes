/**
 * ItemObjects - Compiletime definitions for all item types.
 *
 * All items derive from Boots of Speed ('bspd') as a generic base.
 * Stats sourced from wurst/objects/items/*.wurst.
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  const BASE = "bspd";

  function makeItem(id: string, name: string, cost: number, perishable?: boolean) {
    const item = objectData.items.copy(BASE, id);
    if (!item) return;
    item.name = name;
    item.goldCost = cost;
    item.droppedWhenCarrierDies = true;
    item.classification = perishable ? "Charged" : "Permanent";
  }

  // ── Raw Materials ──
  makeItem("I000", "Tinder",        2);
  makeItem("I001", "Clay Ball",     3);
  makeItem("I002", "Stick",         3);
  makeItem("I003", "Flint",         3);
  makeItem("I004", "Mana Crystal",  5);
  makeItem("I005", "Stone",         5, true);
  makeItem("I006", "Mushroom",      2);
  makeItem("I007", "Magic",         5, true);
  makeItem("I008", "Bone",          3);

  // ── Herbs ──
  makeItem("I010", "River Root",    3);
  makeItem("I011", "River Stem",    3);
  makeItem("I012", "Athelas Seed",  3);
  makeItem("I013", "Blue Herb",     3);
  makeItem("I014", "Yellow Herb",   3);
  makeItem("I015", "Orange Herb",   3);
  makeItem("I016", "Purple Herb",   3);

  // ── Animal Drops ──
  makeItem("I020", "Elk Hide",          9);
  makeItem("I021", "Jungle Wolf Hide",  15);
  makeItem("I022", "Jungle Bear Hide",  21);
  makeItem("I023", "Raw Meat",          2);
  makeItem("I024", "Cooked Meat",       2, true);
  makeItem("I025", "Hawk Egg",          5);
  makeItem("I026", "Honeycomb",         10, true);
  makeItem("I027", "Banana",            2, true);

  // ── Crafted Materials ──
  makeItem("I030", "Iron Ingot",         10);
  makeItem("I031", "Steel Ingot",        25);
  makeItem("I032", "Spirit of Water",    6);
  makeItem("I033", "Spirit of Wind",     6);
  makeItem("I034", "Spirit of Darkness", 12);
  makeItem("I035", "Poison",             8);
  makeItem("I036", "Ultra Poison",       16);
  makeItem("I037", "Living Clay",        10);
  makeItem("I038", "Magic Seed",         8);

  // ── Weapons: Spears ──
  makeItem("I03A", "Spear",                 5, true);
  makeItem("I041", "Iron Spear",            11, true);
  makeItem("I042", "Steel Spear",           23, true);
  makeItem("I043", "Dark Spear",            20, true);
  makeItem("I044", "Poison Spear",          10, true);
  makeItem("I045", "Refined Poison Spear",  14, true);
  makeItem("I046", "Ultra Poison Spear",    19, true);

  // ── Weapons: Axes ──
  makeItem("I047", "Stone Axe",     12);
  makeItem("I048", "Iron Axe",      25);
  makeItem("I049", "Steel Axe",     48);
  makeItem("I04A", "Battle Axe",    60);
  makeItem("I04B", "Mage Masher",   40);

  // ── Weapons: Ranged ──
  makeItem("I04C", "Blow Gun",       10);
  makeItem("I04D", "Thistles",       2, true);
  makeItem("I04E", "Dark Thistles",  3, true);
  makeItem("I04F", "Nets",           8, true);
  makeItem("I04G", "Hunting Net",    12, true);

  // ── Armor: Boots ──
  makeItem("I050", "Elk Skin Boots",   19);
  makeItem("I051", "Wolf Skin Boots",  33);
  makeItem("I052", "Bear Skin Boots",  47);
  makeItem("I053", "Bone Boots",       34);
  makeItem("I054", "Iron Boots",       55);
  makeItem("I055", "Steel Boots",      70);
  makeItem("I056", "Anabolic Boots",   85);

  // ── Armor: Gloves ──
  makeItem("I060", "Elk Skin Gloves",   19);
  makeItem("I061", "Wolf Skin Gloves",  33);
  makeItem("I062", "Bear Skin Gloves",  47);
  makeItem("I063", "Bone Gloves",       34);
  makeItem("I064", "Iron Gloves",       55);
  makeItem("I065", "Steel Gloves",      70);
  makeItem("I066", "Battle Gloves",     83);

  // ── Armor: Coats ──
  makeItem("I070", "Elk Skin Coat",   27);
  makeItem("I071", "Wolf Skin Coat",  49);
  makeItem("I072", "Bear Skin Coat",  70);
  makeItem("I073", "Bone Coat",       47);
  makeItem("I074", "Iron Coat",       63);
  makeItem("I075", "Steel Coat",      68);
  makeItem("I076", "Battle Armor",    66);

  // ── Shields ──
  makeItem("I07F", "Shield",         15);
  makeItem("I080", "Bone Shield",    30);
  makeItem("I081", "Iron Shield",    50);
  makeItem("I082", "Steel Shield",   65);
  makeItem("I083", "Battle Shield",  80);

  // ── Potions ──
  makeItem("I090", "Healing Potion",           10, true);
  makeItem("I091", "Mana Potion",              10, true);
  makeItem("I092", "Cure All",                 15, true);
  makeItem("I093", "Anabolic Potion",          20, true);
  makeItem("I094", "Oracle Potion",            12, true);
  makeItem("I095", "Disease Potion",           15, true);
  makeItem("I096", "Acid Bomb",                15, true);
  makeItem("I097", "Essence of Bees",          18, true);
  makeItem("I098", "Potion of Twin Islands",   20, true);
  makeItem("I099", "Nether Potion",            25, true);
  makeItem("I09A", "Fervor Potion",            18, true);
  makeItem("I09B", "Drunk's Potion",           12, true);
  makeItem("I09C", "Anti-Magic Potion",        20, true);
  makeItem("I09D", "Omnicure",                 30, true);
  makeItem("I09E", "Elemental Shield Potion",  22, true);

  // ── Scrolls ──
  makeItem("I0A0", "Scroll of Stone Armor",      15, true);
  makeItem("I0A1", "Scroll of Entangling Roots", 15, true);
  makeItem("I0A2", "Scroll of Cyclone",          18, true);
  makeItem("I0A3", "Scroll of Fireball",         20, true);
  makeItem("I0A4", "Scroll of Haste",            12, true);
  makeItem("I0A5", "Scroll of Tsunami",          25, true);
  makeItem("I0A6", "Scroll of Living Dead",      22, true);

  // ── Cloaks ──
  makeItem("I0B0", "Cloak of Flames",   40);
  makeItem("I0B1", "Cloak of Frost",    40);
  makeItem("I0B2", "Cloak of Healing",  40);
  makeItem("I0B3", "Cloak of Mana",     40);

  // ── Special Items ──
  makeItem("I0C0", "Gem of Knowledge",     50);
  makeItem("I0C1", "Medallion of Courage", 75);
  makeItem("I058", "Blink",                35, true);
  makeItem("I0C3", "Smoke Bomb",           15, true);
  makeItem("I0C4", "Fire Bomb",            15, true);
  makeItem("I0C5", "EMP",                  20, true);
  makeItem("I0C6", "Clay Explosion",       12, true);
  makeItem("I0C7", "Thief's Medallion",    40);
  makeItem("I0C8", "Bee Hive",             25);
  makeItem("I0C9", "Spirit Ward Kit",      15, true);
  makeItem("I0CA", "Repair Hammer",        20);
  makeItem("I0CB", "Hardened Scales",       30);

  // ── Salves ──
  makeItem("I9S0", "Armor Salve",    150, true);
  makeItem("I9S1", "Healing Salve",  100, true);
  makeItem("I9S2", "Hypnosis Salve", 100, true);
  makeItem("I9S3", "Poison Salve",   50,  true);
  makeItem("I9S4", "Speed Salve",    80,  true);

  // ── Building Kits ──
  makeItem("I0D0", "Camp Fire Kit",           5, true);
  makeItem("I0D1", "Tent Kit",               8, true);
  makeItem("I0D2", "Mud Hut Kit",            12, true);
  makeItem("I0D3", "Mixing Pot Kit",         10, true);
  makeItem("I0D4", "Armory Kit",             15, true);
  makeItem("I0D5", "Workshop Kit",           15, true);
  makeItem("I0D6", "Tannery Kit",            12, true);
  makeItem("I0D7", "Forge Kit",              12, true);
  makeItem("I0D8", "Witch Doctor's Hut Kit", 15, true);
  makeItem("I0D9", "Hatchery Kit",           10, true);
  makeItem("I0DA", "Teleport Beacon Kit",    20, true);
  makeItem("I0DB", "Troll Hut Kit",          15, true);
  makeItem("I0DC", "Storage Hut Kit",        10, true);
  makeItem("I0DD", "Smoke House Kit",        12, true);
  makeItem("I0DE", "Omnitower Kit",          25, true);
  makeItem("I0DF", "Transport Ship Kit",     20, true);
  makeItem("I0DG", "Ensnare Trap Kit",       10, true);
  makeItem("I0DH", "Mage Fire Kit",          8,  true);

  // ── Boss Drops ──
  makeItem("I057", "Alligator Gold",       100);
  makeItem("I0E0", "Hydra Claws",          104);
  makeItem("I0E1", "Hydra Fins",           104);
  makeItem("I0E2", "Hydra Scale",          52);
  makeItem("I0E3", "Hydra Hint",           10);
  makeItem("I0E4", "Horn of the Mammoth",  50);
  makeItem("I0E5", "Fire Pinion",          40);
  makeItem("I0E6", "Pain Pinion",          40);
  makeItem("I0E7", "Shadow Pinion",        40);
  makeItem("I0E8", "Hydra Scale Boots",    100);
  makeItem("I0E9", "Hydra Scale Gloves",   100);
  makeItem("I0EA", "Hydra Scale Coat",     156);

  return undefined;
});
