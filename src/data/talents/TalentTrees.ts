/**
 * TalentTrees - Layout definitions for talent tree UI.
 *
 * Each tree defines a visual grid of talents that players navigate.
 * Trees can be class-specific or shared across all classes.
 */

import { TalentTreeDefinition } from "../../talents/TalentDefinition";

export const TALENT_TREE_DEFINITIONS: TalentTreeDefinition[] = [
  // ─── Shared Trees ──────────────────────────────────────────────────
  {
    id: "shared_survival",
    name: "Survival",
    description: "Common survival talents available to all trolls.",
    iconPath: "ReplaceableTextures/CommandButtons/BTNHeal.blp",
    talentIds: ["survival_hp_1", "survival_str_1", "survival_agi_1"],
    rows: 4,
    columns: 3,
  },

  // ─── Hunter Trees ──────────────────────────────────────────────────
  {
    id: "hunter_combat",
    name: "Hunter Combat",
    description: "Tracking, hunting, and combat abilities for the Hunter.",
    iconPath: "ReplaceableTextures/CommandButtons/BTNForestTroll.blp",
    talentIds: [
      "hunter_track",
      "hunter_sniff",
      "hunter_giant_swing",
      "hunter_endurance",
      "hunter_dysentery",
    ],
    allowedClasses: ["hunter"],
    rows: 5,
    columns: 3,
  },

  // ─── Mage Trees ────────────────────────────────────────────────────
  {
    id: "mage_combat",
    name: "Mage Spells",
    description: "Offensive and utility spells for the Mage.",
    iconPath: "ReplaceableTextures/CommandButtons/BTNForestTrollShadowPriest.blp",
    talentIds: [
      "mage_spirit_prison",
      "mage_flame_spray",
      "mage_pump_up",
      "mage_mage_fire",
      "mage_depress",
      "mage_metronome",
    ],
    allowedClasses: ["mage"],
    rows: 5,
    columns: 3,
  },

  // ─── Priest Trees ──────────────────────────────────────────────────
  {
    id: "priest_support",
    name: "Priest Support",
    description: "Healing and support abilities for the Priest.",
    iconPath: "ReplaceableTextures/CommandButtons/BTNWitchDoctor.blp",
    talentIds: [
      "priest_anti_magic",
      "priest_cure_all",
      "priest_healing_wave",
    ],
    allowedClasses: ["priest"],
    rows: 5,
    columns: 3,
  },
];
