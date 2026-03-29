/**
 * TrollDefinition - Data-driven definition for troll classes.
 *
 * All troll stats, abilities, and progression are defined as pure data.
 * This makes it easy to add/modify classes and enables AI-assisted content generation.
 *
 * The 3-tier class system:
 *   Base Class (Hunter, Mage, etc.) - available at game start
 *   Sub Class (Warrior, Tracker, etc.) - unlocks at level 6
 *   Super Class (Juggernaut, etc.) - unlocks at level 9 + Medallion of Courage
 */

export enum ClassType {
  Base = "BASE_CLASS",
  Sub = "SUB_CLASS",
  Super = "SUPER_CLASS",
}

/** Stat growth per level */
export interface StatGrowth {
  strengthPerLevel: number;
  agilityPerLevel: number;
  intelligencePerLevel: number;
}

/** Base stats at class creation */
export interface BaseStats {
  startingStrength: number;
  startingAgility: number;
  startingIntelligence: number;
  baseHP: number;
  baseMana: number;
  attackDamage: number;
  attackSpeed: number;
  moveSpeed: number;
  armor: number;
}

/** Ability that unlocks at a specific level threshold */
export interface AbilityUnlock {
  abilityId: number;
  unlockLevel: number;
  maxRank?: number;
}

/** Complete definition for a troll class */
export interface TrollDefinition {
  /** Unique string identifier (e.g., "hunter", "warrior") */
  id: string;

  /** WC3 unit type ID (FourCC) */
  unitTypeId: number;

  /** Display name */
  name: string;

  /** Class tier */
  classType: ClassType;

  /** The root base class family (e.g., "hunter" for all hunter variants) */
  baseClassId: string;

  /** Base stats when this class form is created */
  stats: BaseStats;

  /** Stat growth rates */
  growth: StatGrowth;

  /** Number of inventory slots */
  inventorySlots: number;

  /** Abilities that unlock at specific levels */
  abilities: AbilityUnlock[];

  /** IDs of classes this troll can evolve into */
  evolutionTargets?: string[];

  /** Tooltip description */
  description: string;

  /** Icon path for UI display */
  iconPath: string;

  /** Model path */
  modelPath: string;

  /** Available talent tree paths for this class */
  talentTreeIds?: string[];
}

/** Family grouping for troll classes (all forms of one base class) */
export interface TrollFamily {
  /** The base class ID */
  baseId: string;

  /** Display name for the family */
  familyName: string;

  /** All class IDs in this family tree */
  classIds: string[];

  /** The sub-class options available from the base */
  subClassIds: string[];

  /** The super-class (final evolution) */
  superClassId: string;
}
