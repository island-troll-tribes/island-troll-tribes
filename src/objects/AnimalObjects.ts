/**
 * AnimalObjects - Compiletime definitions for all animal and boss units.
 *
 * Stats sourced from wurst/objects/units/Animals/*.wurst.
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  function makeUnit(
    baseType: string, id: string, name: string, hp: number,
    damage: number, atkSpeed: number, moveSpeed: number,
    level: number, scaling?: number, defense?: number,
  ) {
    const u = objectData.units.copy(baseType, id);
    if (!u) return;
    u.name = name;
    u.hitPointsMaximumBase = hp;
    u.speedBase = moveSpeed;
    u.levelundefined = level;
    u.sightRadiusDay = 200;
    u.sightRadiusNight = 200;
    if (damage > 0) {
      u.attack1DamageBase = damage;
      u.attack1CooldownTime = atkSpeed;
      u.attack1Range = 128;
    }
    if (defense) u.defenseBase = defense;
    if (scaling) u.scalingValueundefined = scaling;
  }

  //              base     id      name                   hp   dmg  as    ms   lvl  scale  def
  // ── Elk Family ──
  makeUnit("nder", "n001", "Adult Elk",              140,  8, 1.75, 320, 0, 2.10);
  makeUnit("nder", "n002", "Elk",                    115,  0, 1.75, 500, 3, 2.10);
  makeUnit("nder", "n003", "Elk Adolescent",         115,  4, 1.75, 350, 0, 1.60);
  makeUnit("nder", "n004", "Fawn",                    45,  0, 1.75, 250, 0, 1.10);

  // ── Wolf Family ──
  makeUnit("nwlg", "n020", "Adult Jungle Wolf",      315, 17, 1.20, 320, 0, 1.15);
  makeUnit("nwlg", "n021", "Jungle Wolf",            135, 14, 1.75, 400, 7, 1.00);
  makeUnit("nwlg", "n022", "Wolf Adolescent",        100, 10, 1.75, 350, 0, 0.80);
  makeUnit("nwlt", "n023", "Wolf Pup",                45,  0, 1.75, 250, 0, 0.60);

  // ── Bear Family ──
  makeUnit("nplb", "n010", "Adult Jungle Bear",      300, 21, 1.75, 320, 0, 1.35, 3);
  makeUnit("nplb", "n011", "Jungle Bear",            255, 15, 1.75, 270, 8, 1.25, 3);
  makeUnit("nplb", "n012", "Bear Adolescent",        170, 10, 1.75, 300, 0, 0.90, 2);
  makeUnit("nplb", "n013", "Bear Cub",                45,  0, 1.75, 250, 0, 0.60);

  // ── Cats ──
  makeUnit("nwlg", "n030", "Panther",               200, 14, 1.50, 350, 6,  1.00);
  makeUnit("nwlg", "n031", "Elder Panther",          350, 18, 1.30, 370, 10, 1.20);

  // ── Other ──
  makeUnit("nwlg", "n040", "Snake",                  80,  8, 1.50, 300, 3);
  makeUnit("nder", "n041", "Fish",                    50,  0, 2.00, 200, 1);
  makeUnit("nder", "n042", "Green Fish",              50,  0, 2.00, 200, 1);

  // ── Hawks ──
  makeUnit("nwlg", "n050", "Hawk",                  120, 10, 1.75, 350, 4);
  makeUnit("nwlg", "n051", "Hawk Adolescent",        80,  6, 1.75, 300, 2);
  makeUnit("nwlg", "n052", "Hawk Hatchling",         45,  0, 1.75, 250, 0);
  makeUnit("nwlg", "n053", "Alpha Hawk",            200, 14, 1.50, 400, 6);

  // ── Bosses ──
  function makeBoss(
    baseType: string, id: string, name: string, hp: number,
    damage: number, atkSpeed: number, moveSpeed: number,
    level: number, defense: number, scaling?: number,
  ) {
    const u = objectData.units.copy(baseType, id);
    if (!u) return;
    u.name = name;
    u.hitPointsMaximumBase = hp;
    u.attack1DamageBase = damage;
    u.attack1CooldownTime = atkSpeed;
    u.attack1Range = 128;
    u.speedBase = moveSpeed;
    u.levelundefined = level;
    u.defenseBase = defense;
    u.sightRadiusDay = 600;
    u.sightRadiusNight = 400;
    if (scaling) u.scalingValueundefined = scaling;
  }

  makeBoss("nplb", "n060", "Alligator Man",   900, 30, 1.50, 270, 15,  5, 1.50);
  makeBoss("nplb", "n061", "Ancient Hydra",   1200, 40, 1.30, 250, 20,  8, 2.00);
  makeBoss("nplb", "n062", "Lesser Hydra",     600, 25, 1.50, 280, 12,  4, 1.50);
  makeBoss("nplb", "n063", "Mammoth",         1500, 35, 1.80, 200, 18, 10, 2.50);
  makeBoss("nplb", "n064", "Disco Duck",       800, 28, 1.40, 300, 14,  6, 1.80);

  return undefined;
});
