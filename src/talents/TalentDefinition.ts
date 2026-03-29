/**
 * TalentDefinition - Data-driven talent/modifier definitions.
 *
 * Talents replace the legacy subclass spellbook system. Instead of abilities
 * being unlocked via spellbook level thresholds, they are now "talents" that
 * can be selected from a talent tree UI.
 *
 * Design principles:
 * - Each talent is a modifier that attaches to a Troll instance
 * - Talents can grant abilities, passive bonuses, or modify existing behavior
 * - Talent trees are per-class with shared trees available to all
 * - Prerequisites create branching paths within a tree
 * - Progress persists across the game session
 */

/** Categories for organizing talents in the UI */
export enum TalentCategory {
  /** Combat abilities (direct damage, crowd control) */
  Combat = "combat",
  /** Utility abilities (movement, vision, stealth) */
  Utility = "utility",
  /** Support abilities (healing, buffs, debuffs) */
  Support = "support",
  /** Survival abilities (crafting bonuses, resource gathering) */
  Survival = "survival",
  /** Passive stat modifiers */
  Passive = "passive",
}

/** What the talent actually does when applied */
export enum TalentEffectType {
  /** Grants a WC3 ability to the unit */
  GrantAbility = "grant_ability",
  /** Modifies a stat (str, agi, int, damage, armor, etc.) */
  StatModifier = "stat_modifier",
  /** Modifies an existing ability (range, damage, cooldown) */
  AbilityModifier = "ability_modifier",
  /** Triggers a custom script function */
  Custom = "custom",
}

/** A single effect applied by a talent */
export interface TalentEffect {
  type: TalentEffectType;

  /** For GrantAbility: the WC3 ability ID to add */
  abilityId?: number;

  /** For StatModifier: which stat and how much */
  stat?: string;
  value?: number;
  isPercent?: boolean;

  /** For AbilityModifier: which ability and what property to change */
  targetAbilityId?: number;
  property?: string;
  modifier?: number;

  /** For Custom: identifier of the custom handler */
  customHandler?: string;
}

/** A single talent definition */
export interface TalentDefinition {
  /** Unique identifier (e.g., "hunter_track", "mage_flame_spray") */
  id: string;

  /** Display name */
  name: string;

  /** Description shown in tooltip */
  description: string;

  /** Category for UI organization */
  category: TalentCategory;

  /** Icon path for the talent tree display */
  iconPath: string;

  /** Maximum rank (number of times it can be leveled) */
  maxRank: number;

  /** Effects applied per rank (array index = rank - 1) */
  effectsPerRank: TalentEffect[][];

  /** Talent point cost per rank */
  costPerRank?: number[];

  /** IDs of talents that must be unlocked first */
  prerequisites?: string[];

  /** Minimum troll level required to select this talent */
  requiredLevel?: number;

  /** Required class type (e.g., only available to Sub-class or higher) */
  requiredClassType?: string;

  /** Which class families can access this talent (empty = all) */
  allowedClasses?: string[];

  /** Position in the talent tree UI (row, column) */
  treePosition?: { row: number; col: number };
}

/** A talent tree definition - a visual grouping of talents */
export interface TalentTreeDefinition {
  /** Unique identifier (e.g., "hunter_combat", "shared_survival") */
  id: string;

  /** Display name */
  name: string;

  /** Description */
  description: string;

  /** Icon for the tab */
  iconPath: string;

  /** The talents in this tree, in display order */
  talentIds: string[];

  /** Which class families can see this tree (empty = all) */
  allowedClasses?: string[];

  /** Number of rows in the tree layout */
  rows: number;

  /** Number of columns in the tree layout */
  columns: number;
}
