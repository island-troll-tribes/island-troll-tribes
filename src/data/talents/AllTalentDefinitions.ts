/**
 * AllTalentDefinitions - Data-driven talent definitions for all classes.
 *
 * This converts the legacy SpellBookHashMap.wurst ability progression
 * into a talent-tree-based system. Each talent grants one or more abilities
 * or stat modifiers that unlock through the talent tree UI.
 *
 * Initial talents map 1:1 to the legacy abilities for gameplay parity.
 * New talent designs can be added later without code changes.
 */

import {
  TalentDefinition,
  TalentCategory,
  TalentEffectType,
} from "../../talents/TalentDefinition";

export const TALENT_DEFINITIONS: TalentDefinition[] = [
  // ═══════════════════════════════════════════════════════════════════
  // SHARED SURVIVAL TALENTS (available to all classes)
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "survival_hp_1",
    name: "Toughness",
    description: "Increases maximum hit points by 20/40/60.",
    category: TalentCategory.Passive,
    iconPath: "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower.blp",
    maxRank: 3,
    effectsPerRank: [
      [{ type: TalentEffectType.StatModifier, stat: "maxHP", value: 20 }],
      [{ type: TalentEffectType.StatModifier, stat: "maxHP", value: 40 }],
      [{ type: TalentEffectType.StatModifier, stat: "maxHP", value: 60 }],
    ],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "survival_str_1",
    name: "Strength Training",
    description: "Increases strength by 1/2/3.",
    category: TalentCategory.Passive,
    iconPath: "ReplaceableTextures/CommandButtons/BTNGauntletsOfOgrePower+1.blp",
    maxRank: 3,
    effectsPerRank: [
      [{ type: TalentEffectType.StatModifier, stat: "strength", value: 1 }],
      [{ type: TalentEffectType.StatModifier, stat: "strength", value: 2 }],
      [{ type: TalentEffectType.StatModifier, stat: "strength", value: 3 }],
    ],
    treePosition: { row: 0, col: 0 },
  },
  {
    id: "survival_agi_1",
    name: "Agility Training",
    description: "Increases agility by 1/2/3.",
    category: TalentCategory.Passive,
    iconPath: "ReplaceableTextures/CommandButtons/BTNSlippersOfAgility.blp",
    maxRank: 3,
    effectsPerRank: [
      [{ type: TalentEffectType.StatModifier, stat: "agility", value: 1 }],
      [{ type: TalentEffectType.StatModifier, stat: "agility", value: 2 }],
      [{ type: TalentEffectType.StatModifier, stat: "agility", value: 3 }],
    ],
    treePosition: { row: 0, col: 2 },
  },

  // ═══════════════════════════════════════════════════════════════════
  // HUNTER COMBAT TALENTS
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "hunter_track",
    name: "Track",
    description: "Reveals a target unit's location for a duration.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNTrack.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }], // Placeholder ability ID
    ],
    allowedClasses: ["hunter"],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "hunter_giant_swing",
    name: "Giant Swing",
    description: "A powerful melee swing that deals bonus damage in an arc.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNCriticalStrike.blp",
    maxRank: 3,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
      [{ type: TalentEffectType.Custom, customHandler: "giant_swing_rank2" }],
      [{ type: TalentEffectType.Custom, customHandler: "giant_swing_rank3" }],
    ],
    prerequisites: ["hunter_track"],
    allowedClasses: ["hunter"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 1 },
  },
  {
    id: "hunter_endurance",
    name: "Endurance",
    description: "Increases attack speed and movement speed for a duration.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNCommand.blp",
    maxRank: 3,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
      [{ type: TalentEffectType.Custom, customHandler: "endurance_rank2" }],
      [{ type: TalentEffectType.Custom, customHandler: "endurance_rank3" }],
    ],
    prerequisites: ["hunter_track"],
    allowedClasses: ["hunter"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 0 },
  },
  {
    id: "hunter_dysentery",
    name: "Dysentery",
    description: "Poisons an enemy, causing them to periodically drop items.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNPlagueCloud.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    prerequisites: ["hunter_track"],
    allowedClasses: ["hunter"],
    requiredLevel: 4,
    treePosition: { row: 1, col: 2 },
  },
  {
    id: "hunter_sniff",
    name: "Sniff",
    description: "Reveals nearby items and herbs on the minimap.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNFarSight.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    allowedClasses: ["hunter"],
    requiredLevel: 2,
    treePosition: { row: 0, col: 2 },
  },

  // ═══════════════════════════════════════════════════════════════════
  // MAGE COMBAT TALENTS
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "mage_spirit_prison",
    name: "Spirit Prison",
    description: "Traps a target unit in a spirit prison, disabling it.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNManaBurn.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    allowedClasses: ["mage"],
    treePosition: { row: 0, col: 0 },
  },
  {
    id: "mage_flame_spray",
    name: "Flame Spray",
    description: "Sprays fire in a cone, dealing damage over time.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNBreathOfFire.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    allowedClasses: ["mage"],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "mage_pump_up",
    name: "Pump Up",
    description: "Temporarily increases a friendly unit's damage.",
    category: TalentCategory.Support,
    iconPath: "ReplaceableTextures/CommandButtons/BTNBerserk.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    allowedClasses: ["mage"],
    treePosition: { row: 0, col: 2 },
  },
  {
    id: "mage_mage_fire",
    name: "Mage Fire",
    description: "Creates a fire at target location that damages enemies.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNFire.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    prerequisites: ["mage_flame_spray"],
    allowedClasses: ["mage"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 1 },
  },
  {
    id: "mage_depress",
    name: "Depress",
    description: "Reduces a target's damage output.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNCurse.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    prerequisites: ["mage_pump_up"],
    allowedClasses: ["mage"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 2 },
  },
  {
    id: "mage_metronome",
    name: "Metronome",
    description: "Casts a random spell from the mage's arsenal.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNCharm.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    prerequisites: ["mage_mage_fire", "mage_depress"],
    allowedClasses: ["mage"],
    requiredLevel: 5,
    treePosition: { row: 2, col: 1 },
  },

  // ═══════════════════════════════════════════════════════════════════
  // PRIEST SUPPORT TALENTS
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "priest_anti_magic",
    name: "Anti-Magic AOE",
    description: "Creates a zone that dispels magical effects.",
    category: TalentCategory.Support,
    iconPath: "ReplaceableTextures/CommandButtons/BTNAntiMagicShell.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    allowedClasses: ["priest"],
    treePosition: { row: 0, col: 0 },
  },
  {
    id: "priest_cure_all",
    name: "Cure All",
    description: "Removes all negative effects from target ally.",
    category: TalentCategory.Support,
    iconPath: "ReplaceableTextures/CommandButtons/BTNResurrection.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
    ],
    allowedClasses: ["priest"],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "priest_healing_wave",
    name: "Healing Wave",
    description: "A bouncing wave of healing energy.",
    category: TalentCategory.Support,
    iconPath: "ReplaceableTextures/CommandButtons/BTNHealingWave.blp",
    maxRank: 3,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: 0 }],
      [{ type: TalentEffectType.Custom, customHandler: "healing_wave_rank2" }],
      [{ type: TalentEffectType.Custom, customHandler: "healing_wave_rank3" }],
    ],
    prerequisites: ["priest_cure_all"],
    allowedClasses: ["priest"],
    requiredLevel: 4,
    treePosition: { row: 1, col: 1 },
  },
];
