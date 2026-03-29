/**
 * TrollObjects - Compiletime definitions for all troll hero units.
 *
 * Uses war3-transformer compiletime() to create custom hero units in the
 * WC3 Object Editor at build time. All trolls derive from Blademaster ('Obla').
 *
 * Stats sourced from wurst/objects/units/TrollUnitFactory.wurst and
 * wurst/objects/units/TrollUnitInitializer.wurst.
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  // All trolls derive from Blademaster
  const BASE = "Obla";

  // Helper to create a troll with tier-based defaults
  function makeTroll(
    id: string, name: string, tier: number,
    damage: number, atkSpeed: number, moveSpeed: number,
    sightDay: number, sightNight: number, scaling?: number,
    model?: string, heroAbils?: string, normalAbils?: string,
  ) {
    const u = objectData.units.copy(BASE, id);
    if (!u) return;

    u.name = name;
    if (model) u.modelFile = model;

    // Tier: 0=base, 1=sub, 2=super
    const startStats = tier === 0 ? 1 : tier === 1 ? 6 : 9;
    const hp = tier === 2 ? 210 : 192;
    const mana = tier === 2 ? 210 : 192;

    u.hitPointsMaximumBase = hp;
    u.startingStrength = startStats;
    u.startingAgility = startStats;
    u.startingIntelligence = startStats;
    u.strengthPerLevel = 1.0;
    u.agilityPerLevel = 1.0;
    u.intelligencePerLevel = 1.0;
    u.manaMaximum = mana;
    u.manaInitialAmount = mana;
    u.hitPointsRegenerationRate = 0;
    u.manaRegeneration = 0;

    u.attack1DamageBase = damage;
    u.attack1CooldownTime = atkSpeed;
    u.attack1Range = 128;
    u.speedBase = moveSpeed;
    u.turnRate = 1.80;
    u.animationRunSpeed = 290;
    u.sightRadiusDay = sightDay;
    u.sightRadiusNight = sightNight;

    if (scaling) u.scalingValueundefined = scaling;
    if (heroAbils) u.hero = heroAbils;
    if (normalAbils) u.normal = normalAbils;
  }

  // Custom model paths
  const M = "Models\\Units\\";
  const S = "Models\\Units\\Skins\\";

  // Hero ability strings: comma-separated FourCC IDs for hero abilities (class selectors)
  // Normal ability strings: comma-separated FourCC IDs for normal (always-on) abilities
  // Ability FourCC IDs reference those defined in ClassAbilityObjects.ts

  // ── Hunter Line ──
  // Hunter: hero=[Track, Warrior selector, Tracker selector], normal=[Hunter Web]
  makeTroll("O001", "Hunter",              0, 13, 1.75, 300, 1000,  500, undefined, "units\\creeps\\ForestTrollTrapper\\ForestTrollTrapper", "A073,A011,A00T", "A09Q");
  makeTroll("O002", "Hunter",              0, 13, 1.75, 300, 1000,  500, undefined, S+"AxeTroll.mdx", "A073,A011,A00T", "A09Q");
  // Warrior: hero=[Giant Swing, Juggernaut selector], normal=[Warrior Spellbook, Hunter Web]
  makeTroll("O010", "Warrior",             1, 16, 1.65, 300, 1300,  800, undefined, M+"TrollOverlord.mdx", "A01P,A013", "A012,A09Q");
  // Tracker: hero=[Tracker Spellbook, Juggernaut selector], normal=[Hunter Web]
  makeTroll("O011", "Tracker",             1, 14, 1.75, 310, 1300,  800, undefined, "units\\creeps\\IceTroll\\IceTroll", "A00U,A013", "A09Q");
  // Juggernaut: hero=[Rage], normal=[Hunter Web, Juggernaut Spellbook]
  makeTroll("O012", "Juggernaut",          2, 18, 1.60, 330, 1700, 1400, 1.35,     M+"TrollOverlord.mdx", "A01K", "A09Q,A014");

  // ── Mage Line ──
  // Mage: hero=[Mage Spellbook, Elementalist sel, Hypnotist sel, DM sel], normal=[Negative Blast]
  makeTroll("O003", "Mage",               0, 11, 1.77, 270,  950,  500, undefined, "units\\creeps\\WitchDoctor\\WitchDoctor", "A000,A004,A018,A006", "A03K");
  makeTroll("O004", "Mage",               0, 11, 1.77, 270,  950,  500, undefined, S+"TrollShaman.mdx", "A001,A004,A018,A006", "A03M");
  // Elementalist: hero=[Elementalist New Spellbook, DM selector], normal=[Sub Mage Inherited Spellbook]
  makeTroll("O030", "Elementalist",        1, 11, 1.75, 280, 1250,  800, undefined, M+"Elementalist.mdx", "A005,A006", "A002");
  makeTroll("O031", "Elementalist",        1, 11, 1.75, 280, 1250,  800, undefined, S+"ChaosTrollNecromancer.mdx", "A005,A006", "A003");
  // Hypnotist: hero=[Hypnotist Spellbook, DM selector], normal=[Sub Mage Inherited Spellbook]
  makeTroll("O032", "Hypnotist",           1, 11, 1.75, 280, 1250,  800, undefined, M+"TrollSlasher.mdx", "A019,A006", "A002");
  // Dementia Master: hero=[DM Spellbook], normal=[DM Inherited Spellbook]
  makeTroll("O033", "Dementia Master",     2, 14, 1.50, 300, 1600, 1200, undefined, "units\\creeps\\DarkTrollShadowPriest\\DarkTrollShadowPriest", "A007", "A008");

  // ── Priest Line ──
  // Priest: hero=[Priest Spellbook, Booster sel, Master Healer sel, Sage sel], normal=[The Glow]
  makeTroll("O005", "Priest",              0, 10, 1.77, 270, 1100,  650, undefined, "units\\creeps\\HeroShadowHunter\\HeroShadowHunter", "A009,A01B,A00B,A00D", "A40G");
  // Booster: hero=[Booster Spellbook, Sage selector], normal=[Sub Priest Spellbook]
  makeTroll("O040", "Booster",             1, 10, 1.75, 280, 1250,  800, undefined, "units\\creeps\\ForestTrollShadowPriest\\ForestTrollShadowPriest", "A01E,A00D", "A00A");
  makeTroll("O041", "Booster",             1, 10, 1.75, 280, 1250,  800, undefined, S+"ForestTrollCaster.mdx", "A01E,A00D", "A00A");
  // Master Healer: hero=[Master Healer Spellbook, Sage selector], normal=[Sub Priest Spellbook]
  makeTroll("O042", "Master Healer",       1, 10, 1.75, 280, 1250,  800, undefined, M+"HeroShadowHunter.mdx", "A00C,A00D", "A00A");
  makeTroll("O043", "Master Healer",       1, 10, 1.75, 280, 1250,  800, undefined, S+"DrakkariHero.mdx", "A00C,A00D", "A00A");
  // Sage: hero=[Sage Spellbook], normal=[Sage Inherited Spellbook]
  makeTroll("O044", "Sage",                2, 13, 1.50, 300, 1800,  800, undefined, M+"Sage.mdx", "A00E", "A00F");

  // ── Beastmaster Line ──
  // Beastmaster: hero=[Spirit Beast, Shapeshifter sel, Druid sel], normal=[Pet Spells, Spirit Beast]
  makeTroll("O006", "Beastmaster",         0, 13, 1.77, 300, 1400,  675, undefined, "units\\creeps\\Shaman\\Shaman", "A09E,A017,A015", "A06Q,A09E");
  makeTroll("O007", "Beastmaster",         0, 13, 1.77, 300, 1400,  675, undefined, S+"Shama1.mdx", "A09E,A017,A015", "A06Q,A09E");
  // Shapeshifter Wolf: hero=[Shapeshifter Form, JT selector], normal=[Wolf Hunger]
  makeTroll("O020", "Shapeshifter Wolf",   1, 10, 1.40, 310, 1500, 1000, undefined, "units\\creeps\\DireWolf\\DireWolf", "A017,A01F", "A02J");
  // Shapeshifter Bear: hero=[Shapeshifter Form, JT selector], normal=[Bear Bulwark, Armor Bonus 4]
  makeTroll("O021", "Shapeshifter Bear",   1, 17, 2.50, 300, 1500, 1000, 1.15,     "units\\creeps\\GrizzlyBear\\GrizzlyBear", "A017,A01F", "A027");
  // Shapeshifter Panther: hero=[Shapeshifter Form, JT selector], normal=[Panther Prowl]
  makeTroll("O022", "Shapeshifter Panther",1, 12, 1.75, 320, 1500, 1000, undefined, M+"Panther.mdx", "A017,A01F", "A09N");
  // Shapeshifter Tiger: hero=[Shapeshifter Form, JT selector], normal=[Tiger Vicious Strike]
  makeTroll("O023", "Shapeshifter Tiger",  1, 13, 1.75, 320, 1500, 1000, 1.10,     M+"Tiger.mdx", "A017,A01F", "A02H");
  // Druid: hero=[Druid Spellbook, JT selector], normal=[Pet Spells]
  makeTroll("O024", "Druid",               1, 13, 1.75, 300, 1500, 1000, undefined, M+"DruidoftheClawForestTrollV3.mdx", "A016,A01F", "A06Q");
  // Jungle Tyrant: hero=[], normal=[JT Evolution, Pet Spells, Rendo Devour]
  makeTroll("O025", "Jungle Tyrant",       2, 17, 1.55, 330, 1700, 1000, undefined, "units\\creeps\\JungleBeast\\JungleBeast", undefined, "A01G,A06Q,A0A5");

  // ── Thief Line ──
  // Thief: hero=[Cloak, EA sel, Contortionist sel, Assassin sel], normal=[Teleport]
  makeTroll("O008", "Thief",               0, 10, 2.00, 300,  800, 1800, undefined, "units\\creeps\\DarkTrollTrapper\\DarkTrollTrapper", "A066,A00I,A00K,A00M", "A060");
  // Escape Artist: hero=[EA Spellbook, Assassin selector], normal=[Teleport]
  makeTroll("O050", "Escape Artist",       1, 12, 1.85, 300, 1400, 1800, undefined, "units\\creeps\\DarkTroll\\DarkTroll", "A00J,A00M", "A060");
  // Contortionist: hero=[Contortionist Spellbook, Assassin selector], normal=[Teleport]
  makeTroll("O051", "Contortionist",       1, 11, 1.75, 300, 1400, 1800, undefined, M+"Troll_for_Super_Panda.mdx", "A00L,A00M", "A060");
  // Assassin: hero=[Assassinate], normal=[Assassin Spellbook, Teleport]
  makeTroll("O052", "Assassin",            2, 14, 1.85, 300, 1600, 1800, undefined, "units\\creeps\\DarkTrollTrapper\\DarkTrollTrapper", "A02G", "A00N,A060");

  // ── Scout Line ──
  // Scout: hero=[Reveal, Observer sel, Trapper sel, Spy sel], normal=[Ping Enemy]
  makeTroll("O009", "Scout",               0, 10, 2.00, 300, 1300, 1300, undefined, M+"ScoutUnsub.mdx", "A070,A00O,A40Q,A00Q", "A077");
  // Observer: hero=[Observer Ward Area, Spy selector], normal=[Observer Spellbook, Greater Reveal]
  makeTroll("O060", "Observer",            1, 12, 1.70, 300, 1500, 1600, 1.10,     M+"Observer.mdx", "A07B,A00Q", "A00P,A071");
  // Trapper: hero=[Trapper Spellbook, Spy selector], normal=[Greater Reveal]
  makeTroll("O061", "Trapper",             1, 12, 1.70, 300, 1300, 1500, 1.10,     M+"Trapper.mdx", "A40R,A00Q", "A071");
  // Spy: hero=[Chain Reveal], normal=[Spy Inherited Spellbook]
  makeTroll("O062", "Spy",                 2, 15, 1.60, 330, 1600, 1800, 1.10,     M+"Spy.mdx", "A072", "A00R");

  // ── Gatherer Line ──
  // Gatherer: hero=[Item Radar, Radar Gatherer sel, Herb Master sel, Omnigatherer sel], normal=[Salve Recipe]
  makeTroll("O00A", "Gatherer",            0, 10, 2.00, 300, 1800,  900, undefined, M+"Gatherer.mdx", "A07F,A00V,A00Y,A00Z", "A0FB");
  // Radar Gatherer: hero=[Tele Radar Gather, Omnigatherer sel], normal=[Radar Gatherer Spellbook]
  makeTroll("O070", "Radar Gatherer",      1, 10, 1.70, 310, 1800, 1800, undefined, M+"TerrorTroll.mdx", "A08A,A00Z", "A00W");
  // Herb Master: hero=[Tele Herb Gather, Omnigatherer sel], normal=[Mix Herbs]
  makeTroll("O071", "Herb Master",         1, 10, 1.70, 300, 1800, 1800, undefined, "units\\creeps\\IceTrollShadowPriest\\IceTrollShadowPriest", "A089,A00Z", "A05Q");
  // Omnigatherer: hero=[Item Warp], normal=[Omnigatherer Inherited Spellbook]
  makeTroll("O072", "Omnigatherer",        2, 15, 1.45, 300, 1800, 1800, undefined, M+"TerrorTroll.mdx", "A08B", "A010");

  // ── Special ──
  makeTroll("O080", "Repick Troll",        0, 10, 2.00, 270,  800,  500);
  makeTroll("O081", "Random Troll",        0, 10, 2.00, 270,  800,  500);
  makeTroll("O082", "The One",             2, 30, 1.20, 350, 1800, 1800, 1.50);

  return undefined;
});
