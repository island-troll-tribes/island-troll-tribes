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
    model?: string,
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
  }

  // Custom model paths
  const M = "Models\\Units\\";
  const S = "Models\\Units\\Skins\\";

  //                id       name                  tier dmg  as    ms   sD    sN    scale  model
  // ── Hunter Line ──
  makeTroll("O001", "Hunter",              0, 13, 1.75, 300, 1000,  500, undefined, "units\\creeps\\ForestTrollTrapper\\ForestTrollTrapper");
  makeTroll("O002", "Hunter",              0, 13, 1.75, 300, 1000,  500, undefined, S+"AxeTroll.mdx");
  makeTroll("O010", "Warrior",             1, 16, 1.65, 300, 1300,  800, undefined, M+"TrollOverlord.mdx");
  makeTroll("O011", "Tracker",             1, 14, 1.75, 310, 1300,  800, undefined, "units\\creeps\\IceTroll\\IceTroll");
  makeTroll("O012", "Juggernaut",          2, 18, 1.60, 330, 1700, 1400, 1.35,     M+"TrollOverlord.mdx");

  // ── Mage Line ──
  makeTroll("O003", "Mage",               0, 11, 1.77, 270,  950,  500, undefined, "units\\creeps\\WitchDoctor\\WitchDoctor");
  makeTroll("O004", "Mage",               0, 11, 1.77, 270,  950,  500, undefined, S+"TrollShaman.mdx");
  makeTroll("O030", "Elementalist",        1, 11, 1.75, 280, 1250,  800, undefined, M+"Elementalist.mdx");
  makeTroll("O031", "Elementalist",        1, 11, 1.75, 280, 1250,  800, undefined, S+"ChaosTrollNecromancer.mdx");
  makeTroll("O032", "Hypnotist",           1, 11, 1.75, 280, 1250,  800, undefined, M+"TrollSlasher.mdx");
  makeTroll("O033", "Dementia Master",     2, 14, 1.50, 300, 1600, 1200, undefined, "units\\creeps\\DarkTrollShadowPriest\\DarkTrollShadowPriest");

  // ── Priest Line ──
  makeTroll("O005", "Priest",              0, 10, 1.77, 270, 1100,  650, undefined, "units\\creeps\\HeroShadowHunter\\HeroShadowHunter");
  makeTroll("O040", "Booster",             1, 10, 1.75, 280, 1250,  800, undefined, "units\\creeps\\ForestTrollShadowPriest\\ForestTrollShadowPriest");
  makeTroll("O041", "Booster",             1, 10, 1.75, 280, 1250,  800, undefined, S+"ForestTrollCaster.mdx");
  makeTroll("O042", "Master Healer",       1, 10, 1.75, 280, 1250,  800, undefined, M+"HeroShadowHunter.mdx");
  makeTroll("O043", "Master Healer",       1, 10, 1.75, 280, 1250,  800, undefined, S+"DrakkariHero.mdx");
  makeTroll("O044", "Sage",                2, 13, 1.50, 300, 1800,  800, undefined, M+"Sage.mdx");

  // ── Beastmaster Line ──
  makeTroll("O006", "Beastmaster",         0, 13, 1.77, 300, 1400,  675, undefined, "units\\creeps\\Shaman\\Shaman");
  makeTroll("O007", "Beastmaster",         0, 13, 1.77, 300, 1400,  675, undefined, S+"Shama1.mdx");
  makeTroll("O020", "Shapeshifter Wolf",   1, 10, 1.40, 310, 1500, 1000, undefined, "units\\creeps\\DireWolf\\DireWolf");
  makeTroll("O021", "Shapeshifter Bear",   1, 17, 2.50, 300, 1500, 1000, 1.15,     "units\\creeps\\GrizzlyBear\\GrizzlyBear");
  makeTroll("O022", "Shapeshifter Panther",1, 12, 1.75, 320, 1500, 1000, undefined, M+"Panther.mdx");
  makeTroll("O023", "Shapeshifter Tiger",  1, 13, 1.75, 320, 1500, 1000, 1.10,     M+"Tiger.mdx");
  makeTroll("O024", "Druid",               1, 13, 1.75, 300, 1500, 1000, undefined, M+"DruidoftheClawForestTrollV3.mdx");
  makeTroll("O025", "Jungle Tyrant",       2, 17, 1.55, 330, 1700, 1000, undefined, "units\\creeps\\JungleBeast\\JungleBeast");

  // ── Thief Line ──
  makeTroll("O008", "Thief",               0, 10, 2.00, 300,  800, 1800, undefined, "units\\creeps\\DarkTrollTrapper\\DarkTrollTrapper");
  makeTroll("O050", "Escape Artist",       1, 12, 1.85, 300, 1400, 1800, undefined, "units\\creeps\\DarkTroll\\DarkTroll");
  makeTroll("O051", "Contortionist",       1, 11, 1.75, 300, 1400, 1800, undefined, M+"Troll_for_Super_Panda.mdx");
  makeTroll("O052", "Assassin",            2, 14, 1.85, 300, 1600, 1800, undefined, "units\\creeps\\DarkTrollTrapper\\DarkTrollTrapper");

  // ── Scout Line ──
  makeTroll("O009", "Scout",               0, 10, 2.00, 300, 1300, 1300, undefined, M+"ScoutUnsub.mdx");
  makeTroll("O060", "Observer",            1, 12, 1.70, 300, 1500, 1600, 1.10,     M+"Observer.mdx");
  makeTroll("O061", "Trapper",             1, 12, 1.70, 300, 1300, 1500, 1.10,     M+"Trapper.mdx");
  makeTroll("O062", "Spy",                 2, 15, 1.60, 330, 1600, 1800, 1.10,     M+"Spy.mdx");

  // ── Gatherer Line ──
  makeTroll("O00A", "Gatherer",            0, 10, 2.00, 300, 1800,  900, undefined, M+"Gatherer.mdx");
  makeTroll("O070", "Radar Gatherer",      1, 10, 1.70, 310, 1800, 1800, undefined, M+"TerrorTroll.mdx");
  makeTroll("O071", "Herb Master",         1, 10, 1.70, 300, 1800, 1800, undefined, "units\\creeps\\IceTrollShadowPriest\\IceTrollShadowPriest");
  makeTroll("O072", "Omnigatherer",        2, 15, 1.45, 300, 1800, 1800, undefined, M+"TerrorTroll.mdx");

  // ── Special ──
  makeTroll("O080", "Repick Troll",        0, 10, 2.00, 270,  800,  500);
  makeTroll("O081", "Random Troll",        0, 10, 2.00, 270,  800,  500);
  makeTroll("O082", "The One",             2, 30, 1.20, 350, 1800, 1800, 1.50);

  return undefined;
});
