/**
 * BuffObjects - Compiletime definitions for custom buffs.
 *
 * Buffs are visual effects/debuffs shown on units. They're referenced
 * by abilities via the `buffs` property string.
 *
 * Base buff type: Bhea (Heal) is a generic base to copy from.
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  const BASE = "Bhea"; // Heal buff — generic base

  function makeBuff(id: string, name: string, tooltip?: string) {
    const b = objectData.buffs.copy(BASE, id);
    if (!b) return;
    b.nameEditorOnly = name;
    b.tooltip = name;
    if (tooltip) b.tooltipExtended = tooltip;
  }

  makeBuff("B100", "Anchor Soul",           "This unit's soul is anchored.");
  makeBuff("B101", "Attraction",            "This unit is attracted.");
  makeBuff("B102", "Beast Spirit",          "This unit is empowered by a beast spirit.");
  makeBuff("B103", "Bonfire Heat",          "This unit is warmed by a bonfire.");
  makeBuff("B104", "Camouflage",            "This unit is camouflaged.");
  makeBuff("B105", "Cloak",                 "This unit is cloaked.");
  makeBuff("B106", "Depressed Arrow",       "This unit is depressed by an arrow.");
  makeBuff("B107", "Depressed Aura",        "This unit is depressed by an aura.");
  makeBuff("B108", "Depressed Thistle",     "This unit is depressed by a thistle.");
  makeBuff("B109", "Dysentery",             "This unit has dysentery.");
  makeBuff("B10A", "Fortitude",             "This unit has increased fortitude.");
  makeBuff("B10B", "Froze to the Bone",     "This unit is frozen to the bone.");
  makeBuff("B10C", "Ghost Demon Soul Burn", "This unit's soul is burning.");
  makeBuff("B10D", "Haste",                 "This unit is moving faster.");
  makeBuff("B10E", "Healing",               "This unit is being healed.");
  makeBuff("B10F", "Heated",                "This unit is heated.");
  makeBuff("B10G", "Hypnotized",            "This unit is hypnotized.");
  makeBuff("B10H", "Map Magic",             "This unit is affected by map magic.");
  makeBuff("B10I", "Nether",                "This unit is in the nether.");
  makeBuff("B10J", "Slowed",                "This unit is slowed.");
  makeBuff("B10K", "Stone Armor",           "This unit has stone armor.");
  makeBuff("B10L", "The Glow",              "This unit has The Glow.");
  makeBuff("B10M", "Unholy Fire",           "This unit is engulfed in unholy fire.");

  return undefined;
});
