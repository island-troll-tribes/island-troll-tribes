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
import { AbilityIds } from "../AbilityIds";

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

  // ═══════════════════════════════════════════════════════════════════
  // BEASTMASTER TALENTS
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "beastmaster_tame",
    name: "Tame",
    description: "Tames a wild animal, making it your loyal pet.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNCharm.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.PET_TAME }],
    ],
    allowedClasses: ["beastmaster"],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "beastmaster_pet_release",
    name: "Release Pet",
    description: "Releases your current pet back into the wild.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNUnload.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.PET_RELEASE }],
    ],
    allowedClasses: ["beastmaster"],
    treePosition: { row: 0, col: 0 },
  },
  {
    id: "beastmaster_feed_pet",
    name: "Feed Pet",
    description: "Feeds your pet raw meat, restoring its health and growing it.",
    category: TalentCategory.Support,
    iconPath: "ReplaceableTextures/CommandButtons/BTNMonsterLure.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.FEED_PET }],
    ],
    allowedClasses: ["beastmaster"],
    treePosition: { row: 0, col: 2 },
  },
  {
    id: "beastmaster_grow_pet",
    name: "Grow Pet",
    description: "Enhances your pet, increasing its combat stats and size.",
    category: TalentCategory.Support,
    iconPath: "ReplaceableTextures/CommandButtons/BTNRegenerate.blp",
    maxRank: 3,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.GROW_PET }],
      [{ type: TalentEffectType.Custom, customHandler: "grow_pet_rank2" }],
      [{ type: TalentEffectType.Custom, customHandler: "grow_pet_rank3" }],
    ],
    prerequisites: ["beastmaster_feed_pet"],
    allowedClasses: ["beastmaster"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 2 },
  },
  {
    id: "beastmaster_spirit_beast",
    name: "Spirit Beast",
    description: "Summons a spectral beast to fight alongside you.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNSpiritWolf.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.SPIRIT_BEAST }],
    ],
    prerequisites: ["beastmaster_tame"],
    allowedClasses: ["beastmaster"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 1 },
  },
  {
    id: "beastmaster_natures_bond",
    name: "Nature's Bond",
    description: "Strengthens the bond with your pet, sharing healing and buffs.",
    category: TalentCategory.Support,
    iconPath: "ReplaceableTextures/CommandButtons/BTNNaturalOrder.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.NATURES_BOND }],
    ],
    prerequisites: ["beastmaster_spirit_beast", "beastmaster_grow_pet"],
    allowedClasses: ["beastmaster"],
    requiredLevel: 5,
    treePosition: { row: 2, col: 1 },
  },
  {
    id: "beastmaster_druid_roar",
    name: "Feral Roar",
    description: "Lets out a fierce roar, increasing nearby allies' damage.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNRoar.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.DRUID_ROAR }],
    ],
    prerequisites: ["beastmaster_tame"],
    allowedClasses: ["beastmaster"],
    requiredLevel: 4,
    treePosition: { row: 1, col: 0 },
  },

  // ═══════════════════════════════════════════════════════════════════
  // THIEF TALENTS
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "thief_blur",
    name: "Blur",
    description: "Increases evasion, giving a chance to dodge attacks.",
    category: TalentCategory.Passive,
    iconPath: "ReplaceableTextures/CommandButtons/BTNEvasion.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.BLUR }],
    ],
    allowedClasses: ["thief"],
    treePosition: { row: 0, col: 0 },
  },
  {
    id: "thief_camouflage",
    name: "Camouflage",
    description: "Turns invisible when standing still. Moving breaks the effect.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNAmbush.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.CAMOFLAGE }],
    ],
    allowedClasses: ["thief"],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "thief_smoke_stream",
    name: "Smoke Stream",
    description: "Creates a cloud of smoke, concealing nearby allies.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNCloudOfFog.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.SMOKE_STREAM }],
    ],
    allowedClasses: ["thief"],
    treePosition: { row: 0, col: 2 },
  },
  {
    id: "thief_cloak",
    name: "Cloak",
    description: "Wraps the thief in shadow, granting temporary invisibility.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNInvisibility.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.CLOAK }],
    ],
    prerequisites: ["thief_camouflage"],
    allowedClasses: ["thief"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 1 },
  },
  {
    id: "thief_jealousy",
    name: "Jealousy",
    description: "Steals a portion of the target's gold and lumber.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNBanish.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.JEALOUSY }],
    ],
    prerequisites: ["thief_blur"],
    allowedClasses: ["thief"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 0 },
  },
  {
    id: "thief_nether_fade",
    name: "Nether Fade",
    description:
      "Phases into the nether, becoming invulnerable but unable to act.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNBansheeAdept.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.NETHER_FADE }],
    ],
    prerequisites: ["thief_smoke_stream"],
    allowedClasses: ["thief"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 2 },
  },
  {
    id: "thief_assassinate",
    name: "Assassinate",
    description:
      "A devastating strike from stealth that deals massive bonus damage.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNAssassinateRed.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.ASSASSINATE }],
    ],
    prerequisites: ["thief_cloak", "thief_jealousy"],
    allowedClasses: ["thief"],
    requiredLevel: 5,
    treePosition: { row: 2, col: 1 },
  },
  {
    id: "thief_teleport",
    name: "Blink",
    description: "Teleports the thief a short distance in the target direction.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNBlink.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.TELE_THIEF }],
    ],
    prerequisites: ["thief_cloak"],
    allowedClasses: ["thief"],
    requiredLevel: 4,
    treePosition: { row: 2, col: 0 },
  },

  // ═══════════════════════════════════════════════════════════════════
  // SCOUT TALENTS
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "scout_reveal",
    name: "Reveal",
    description: "Reveals an area of the map, removing fog of war temporarily.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNFarSight.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.REVEAL_ID }],
    ],
    allowedClasses: ["scout"],
    treePosition: { row: 0, col: 0 },
  },
  {
    id: "scout_track",
    name: "Track",
    description:
      "Marks a target unit, revealing it on the minimap for a duration.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNTrack.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.TRACK }],
    ],
    allowedClasses: ["scout"],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "scout_ward_area",
    name: "Ward Area",
    description: "Places an invisible ward that detects nearby enemy movement.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNSentryWard.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.WARD_AREA }],
    ],
    allowedClasses: ["scout"],
    treePosition: { row: 0, col: 2 },
  },
  {
    id: "scout_ensnare",
    name: "Ensnare",
    description: "Throws a net at a target, rooting it in place.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNEnsnare.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.ENSNARE }],
    ],
    prerequisites: ["scout_track"],
    allowedClasses: ["scout"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 1 },
  },
  {
    id: "scout_ping_enemy",
    name: "Ping Enemy",
    description: "Pings a detected enemy's position on the minimap for allies.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNRevealArrows.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.PING_ENEMY }],
    ],
    prerequisites: ["scout_reveal"],
    allowedClasses: ["scout"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 0 },
  },
  {
    id: "scout_bear_trap",
    name: "Lay Trap",
    description:
      "Places a hidden bear trap that damages and immobilizes enemies.",
    category: TalentCategory.Combat,
    iconPath: "ReplaceableTextures/CommandButtons/BTNGoblinLandMine.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.BEAR_TRAP }],
    ],
    prerequisites: ["scout_ward_area"],
    allowedClasses: ["scout"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 2 },
  },
  {
    id: "scout_sentinel",
    name: "Sentinel",
    description:
      "Sends an owl to a target tree, granting permanent vision of the area.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNSentinel.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.SENTINEL }],
    ],
    prerequisites: ["scout_ensnare", "scout_ping_enemy"],
    allowedClasses: ["scout"],
    requiredLevel: 5,
    treePosition: { row: 2, col: 0 },
  },
  {
    id: "scout_shadow_sight",
    name: "Shadow Sight",
    description:
      "Grants true sight, allowing detection of invisible units nearby.",
    category: TalentCategory.Passive,
    iconPath: "ReplaceableTextures/CommandButtons/BTNTrueShot.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.SHADOW_SIGHT }],
    ],
    prerequisites: ["scout_ensnare", "scout_bear_trap"],
    allowedClasses: ["scout"],
    requiredLevel: 5,
    treePosition: { row: 2, col: 2 },
  },

  // ═══════════════════════════════════════════════════════════════════
  // GATHERER TALENTS
  // ═══════════════════════════════════════════════════════════════════
  {
    id: "gatherer_find_tinder",
    name: "Find Tinder",
    description: "Finds tinder from nearby bushes, used for starting fires.",
    category: TalentCategory.Survival,
    iconPath: "ReplaceableTextures/CommandButtons/BTNBundleOfLumber.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.ID_FIND_TINDER }],
    ],
    allowedClasses: ["gatherer"],
    treePosition: { row: 0, col: 0 },
  },
  {
    id: "gatherer_find_stick",
    name: "Find Stick",
    description: "Finds a stick from the ground, a basic crafting material.",
    category: TalentCategory.Survival,
    iconPath: "ReplaceableTextures/CommandButtons/BTNNaturalOrder.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.ID_FIND_STICK }],
    ],
    allowedClasses: ["gatherer"],
    treePosition: { row: 0, col: 1 },
  },
  {
    id: "gatherer_find_stone",
    name: "Find Stone",
    description: "Picks up a stone from the environment for crafting.",
    category: TalentCategory.Survival,
    iconPath: "ReplaceableTextures/CommandButtons/BTNGolemThunderClap.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.ID_FIND_STONE }],
    ],
    allowedClasses: ["gatherer"],
    treePosition: { row: 0, col: 2 },
  },
  {
    id: "gatherer_item_radar",
    name: "Item Radar",
    description: "Pings nearby items on the minimap, helping locate resources.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNRevealArrows.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.ITEM_RADAR }],
    ],
    prerequisites: ["gatherer_find_stick"],
    allowedClasses: ["gatherer"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 1 },
  },
  {
    id: "gatherer_teleport",
    name: "Teleport",
    description: "Teleports back to your base camp fire.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNMassTeleport.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.TELEPORT }],
    ],
    prerequisites: ["gatherer_find_tinder"],
    allowedClasses: ["gatherer"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 0 },
  },
  {
    id: "gatherer_herb_gather",
    name: "Herb Gather",
    description:
      "Teleports to a nearby herb and picks it up instantly. Efficient for collecting rare herbs.",
    category: TalentCategory.Survival,
    iconPath: "ReplaceableTextures/CommandButtons/BTNHerb.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.TELE_HERB_GATHER }],
    ],
    prerequisites: ["gatherer_find_stone"],
    allowedClasses: ["gatherer"],
    requiredLevel: 3,
    treePosition: { row: 1, col: 2 },
  },
  {
    id: "gatherer_radar_gather",
    name: "Radar Gather",
    description:
      "Combines radar and teleport to find and collect a distant item in one action.",
    category: TalentCategory.Utility,
    iconPath: "ReplaceableTextures/CommandButtons/BTNLoadArrows.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.TELE_RADAR_GATHER }],
    ],
    prerequisites: ["gatherer_item_radar", "gatherer_teleport"],
    allowedClasses: ["gatherer"],
    requiredLevel: 5,
    treePosition: { row: 2, col: 0 },
  },
  {
    id: "gatherer_cook_meat",
    name: "Cook Meat",
    description:
      "Cooks raw meat without a fire, producing cooked meat that restores more health.",
    category: TalentCategory.Survival,
    iconPath: "ReplaceableTextures/CommandButtons/BTNMonsterLure.blp",
    maxRank: 1,
    effectsPerRank: [
      [{ type: TalentEffectType.GrantAbility, abilityId: AbilityIds.COOK_MEAT }],
    ],
    prerequisites: ["gatherer_item_radar", "gatherer_herb_gather"],
    allowedClasses: ["gatherer"],
    requiredLevel: 5,
    treePosition: { row: 2, col: 2 },
  },
];
