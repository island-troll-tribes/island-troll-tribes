/**
 * BuildingObjects - Compiletime definitions for buildings and special units.
 *
 * Stats sourced from wurst/objects/units/Buildings/*.wurst.
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  function makeBuilding(
    baseType: string, id: string, name: string, hp: number,
    sightDay?: number, sightNight?: number, scaling?: number,
  ) {
    const u = objectData.units.copy(baseType, id);
    if (!u) return;
    u.name = name;
    u.hitPointsMaximumBase = hp;
    if (sightDay) u.sightRadiusDay = sightDay;
    if (sightNight) u.sightRadiusNight = sightNight;
    if (scaling) u.scalingValueundefined = scaling;
  }

  function makeSpecial(
    baseType: string, id: string, name: string, hp: number, moveSpeed?: number,
  ) {
    const u = objectData.units.copy(baseType, id);
    if (!u) return;
    u.name = name;
    u.hitPointsMaximumBase = hp;
    if (moveSpeed) u.speedBase = moveSpeed;
  }

  // ── Crafting Buildings ──
  makeBuilding("hhou", "h001", "Forge",              500, 900, 600);
  makeBuilding("hhou", "h002", "Armory",             500, 900, 600);
  makeBuilding("hhou", "h003", "Tannery",            500, 900, 600);
  makeBuilding("hhou", "h004", "Mixing Pot",         350, 900, 600);
  makeBuilding("hhou", "h005", "Workshop",           500, 900, 600);
  makeBuilding("hhou", "h006", "Witch Doctor's Hut", 500, 900, 600);
  makeBuilding("hhou", "h007", "Craft Master",       750, 900, 600);

  // ── Living Buildings ──
  makeBuilding("hhou", "h008", "Camp Fire",          100, 900, 600);
  makeBuilding("hhou", "h009", "Tent",               100, 900, 600);
  makeBuilding("hhou", "h00A", "Mud Hut",            250, 900, 600, 0.80);
  makeBuilding("hhou", "h00B", "Troll Hut",          250, 900, 600, 0.80);
  makeBuilding("hhou", "h00C", "Hatchery",           200, 900, 600);
  makeBuilding("hhou", "h00D", "Teleportation Beacon", 300, 900, 600);

  // ── Defense / Utility Buildings ──
  makeBuilding("hhou", "h00E", "Ensnare Trap",       100);
  makeBuilding("hhou", "h00F", "Spirit Ward",        200, 900, 600);
  makeBuilding("hwtw", "h00G", "Omnitower",          400, 1200, 800);
  makeBuilding("hhou", "h00H", "Storage Hut",        250, 900, 600);
  makeBuilding("hhou", "h00I", "Smoke House",        250, 900, 600);

  // ── Special Units ──
  makeSpecial("nwlg", "n070", "Living Clay",         100, 270);
  makeSpecial("hhou", "n071", "Bear Trap",            50);
  makeSpecial("hhou", "n072", "Spiked Trap",          50);
  makeSpecial("hhou", "n073", "Trap",                 50);
  makeSpecial("nwlg", "n074", "Bee",                  30, 400);
  makeSpecial("hhou", "n075", "Bee Hive",            150);
  makeSpecial("hhou", "n076", "Uber Hive",           300);
  makeSpecial("hhou", "n077", "Meat",                 50);
  makeSpecial("ngme", "n078", "Troll Merchant",      500);
  makeSpecial("hhou", "n079", "Fire",                 50);
  makeSpecial("hhou", "n07A", "Mage Fire",            75);
  makeSpecial("hhou", "n07B", "Mage Fire (Summoned)", 75);
  makeSpecial("nbot", "n07C", "Troll Transport Ship", 400, 300);
  makeSpecial("nwlg", "n07D", "Locust Skeleton",      50, 200);
  makeSpecial("hhou", "n07E", "Building Tree",       500);
  makeSpecial("hhou", "n07F", "Hidden Stash",        100);
  makeSpecial("hhou", "n07G", "Ominous Altar",       500);
  makeSpecial("hhou", "n07H", "Troll Totem",         300);

  // ── Trade Ships ──
  makeSpecial("nbot", "n080", "Trade Ship", 500, 120);
  makeSpecial("nbot", "n081", "Trade Ship", 500, 120);
  makeSpecial("nbot", "n082", "Trade Ship", 500, 120);
  makeSpecial("nbot", "n083", "Trade Ship", 500, 120);
  makeSpecial("nbot", "n084", "Trade Ship", 500, 120);
  makeSpecial("nbot", "n085", "Trade Ship", 500, 120);

  // ── Herb Bushes ──
  makeSpecial("hhou", "n0A0", "Athelas Bush",     100);
  makeSpecial("hhou", "n0A1", "Blue Herb Bush",   100);
  makeSpecial("hhou", "n0A2", "Orange Herb Bush", 100);
  makeSpecial("hhou", "n0A3", "Purple Herb Bush", 100);
  makeSpecial("hhou", "n0A4", "Yellow Herb Bush", 100);
  makeSpecial("hhou", "n0A5", "Water Herb Bush",  100);
  makeSpecial("hhou", "n0A6", "Mushroom Colony",  100);
  makeSpecial("hhou", "n0A7", "Scout's Bush",     100);
  makeSpecial("hhou", "n0A8", "Thief's Bush",     100);
  makeSpecial("hhou", "n0A9", "Thistle Shrub",    100);

  // ── Dragons ──
  makeSpecial("nwlg", "n090", "Bronze Dragon",           500, 350);
  makeSpecial("nwlg", "n091", "Bronze Dragon Hatchling", 200, 300);
  makeSpecial("nwlg", "n092", "Greater Bronze Dragon",   800, 350);
  makeSpecial("nwlg", "n093", "Forest Dragon",           500, 350);
  makeSpecial("nwlg", "n094", "Forest Dragon Hatchling", 200, 300);
  makeSpecial("nwlg", "n095", "Greater Forest Dragon",   800, 350);
  makeSpecial("nwlg", "n096", "Nether Dragon",           500, 350);
  makeSpecial("nwlg", "n097", "Nether Dragon Hatchling", 200, 300);
  makeSpecial("nwlg", "n098", "Greater Nether Dragon",   800, 350);
  makeSpecial("nwlg", "n099", "Red Dragon",              500, 350);
  makeSpecial("nwlg", "n09A", "Red Dragon Hatchling",    200, 300);
  makeSpecial("nwlg", "n09B", "Greater Red Dragon",      800, 350);

  return undefined;
});
