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
  ) {
    const u = objectData.units.copy(BASE, id);
    if (!u) return;

    u.name = name;

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

  //                id       name                  tier dmg  as    ms   sD    sN    scale
  // ── Hunter Line ──
  makeTroll("O001", "Hunter",              0, 13, 1.75, 300, 1000,  500);
  makeTroll("O002", "Hunter",              0, 13, 1.75, 300, 1000,  500);  // alt skin
  makeTroll("O010", "Warrior",             1, 16, 1.65, 300, 1300,  800);
  makeTroll("O011", "Tracker",             1, 14, 1.75, 310, 1300,  800);
  makeTroll("O012", "Juggernaut",          2, 18, 1.60, 330, 1700, 1400, 1.35);

  // ── Mage Line ──
  makeTroll("O003", "Mage",               0, 11, 1.77, 270,  950,  500);
  makeTroll("O004", "Mage",               0, 11, 1.77, 270,  950,  500);  // alt skin
  makeTroll("O030", "Elementalist",        1, 11, 1.75, 280, 1250,  800);
  makeTroll("O031", "Elementalist",        1, 11, 1.75, 280, 1250,  800);  // alt skin
  makeTroll("O032", "Hypnotist",           1, 11, 1.75, 280, 1250,  800);
  makeTroll("O033", "Dementia Master",     2, 14, 1.50, 300, 1600, 1200);

  // ── Priest Line ──
  makeTroll("O005", "Priest",              0, 10, 1.77, 270, 1100,  650);
  makeTroll("O040", "Booster",             1, 10, 1.75, 280, 1250,  800);
  makeTroll("O041", "Booster",             1, 10, 1.75, 280, 1250,  800);  // alt skin
  makeTroll("O042", "Master Healer",       1, 10, 1.75, 280, 1250,  800);
  makeTroll("O043", "Master Healer",       1, 10, 1.75, 280, 1250,  800);  // alt skin
  makeTroll("O044", "Sage",                2, 13, 1.50, 300, 1800,  800);

  // ── Beastmaster Line ──
  makeTroll("O006", "Beastmaster",         0, 13, 1.77, 300, 1400,  675);
  makeTroll("O007", "Beastmaster",         0, 13, 1.77, 300, 1400,  675);  // alt skin
  makeTroll("O020", "Shapeshifter Wolf",   1, 10, 1.40, 310, 1500, 1000);
  makeTroll("O021", "Shapeshifter Bear",   1, 17, 2.50, 300, 1500, 1000, 1.15);
  makeTroll("O022", "Shapeshifter Panther",1, 12, 1.75, 320, 1500, 1000);
  makeTroll("O023", "Shapeshifter Tiger",  1, 13, 1.75, 320, 1500, 1000, 1.10);
  makeTroll("O024", "Druid",               1, 13, 1.75, 300, 1500, 1000);
  makeTroll("O025", "Jungle Tyrant",       2, 17, 1.55, 330, 1700, 1000);

  // ── Thief Line ──
  makeTroll("O008", "Thief",               0, 10, 2.00, 300,  800, 1800);
  makeTroll("O050", "Escape Artist",       1, 12, 1.85, 300, 1400, 1800);
  makeTroll("O051", "Contortionist",       1, 11, 1.75, 300, 1400, 1800);
  makeTroll("O052", "Assassin",            2, 14, 1.85, 300, 1600, 1800);

  // ── Scout Line ──
  makeTroll("O009", "Scout",               0, 10, 2.00, 300, 1300, 1300);
  makeTroll("O060", "Observer",            1, 12, 1.70, 300, 1500, 1600, 1.10);
  makeTroll("O061", "Trapper",             1, 12, 1.70, 300, 1300, 1500, 1.10);
  makeTroll("O062", "Spy",                 2, 15, 1.60, 330, 1600, 1800, 1.10);

  // ── Gatherer Line ──
  makeTroll("O00A", "Gatherer",            0, 10, 2.00, 300, 1800,  900);
  makeTroll("O070", "Radar Gatherer",      1, 10, 1.70, 310, 1800, 1800);
  makeTroll("O071", "Herb Master",         1, 10, 1.70, 300, 1800, 1800);
  makeTroll("O072", "Omnigatherer",        2, 15, 1.45, 300, 1800, 1800);

  // ── Special ──
  makeTroll("O080", "Repick Troll",        0, 10, 2.00, 270,  800,  500);
  makeTroll("O081", "Random Troll",        0, 10, 2.00, 270,  800,  500);
  makeTroll("O082", "The One",             2, 30, 1.20, 350, 1800, 1800, 1.50);

  return undefined;
});
