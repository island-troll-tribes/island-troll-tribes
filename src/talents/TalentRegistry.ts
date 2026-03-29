/**
 * TalentRegistry - Central system for defining, unlocking, and tracking talents.
 *
 * Manages:
 * - Global talent definitions (loaded from data files)
 * - Talent tree layouts for UI rendering
 * - Per-player talent point tracking
 * - Talent unlock/rank-up validation
 *
 * Replaces the legacy systems:
 * - SpellBookHashMap.wurst (ability progression per level)
 * - SpellBookInitializer.wurst (spellbook creation)
 * - AutoSkill.wurst (automatic skill leveling)
 */

import { MapPlayer } from "w3ts";
import { TalentDefinition, TalentTreeDefinition } from "./TalentDefinition";
import { TalentInstance } from "./TalentInstance";
import { BaseTroll } from "../entities/trolls/BaseTroll";
import { TALENT_DEFINITIONS } from "../data/talents/AllTalentDefinitions";
import { TALENT_TREE_DEFINITIONS } from "../data/talents/TalentTrees";

/** Per-player talent progress tracking */
interface PlayerTalentProgress {
  /** Available talent points to spend */
  availablePoints: number;
  /** Total talent points earned */
  totalPointsEarned: number;
  /** Talents that have been unlocked (id → current rank) */
  unlockedTalents: Map<string, number>;
}

export class TalentRegistry {
  private static definitions: Map<string, TalentDefinition> = new Map();
  private static trees: Map<string, TalentTreeDefinition> = new Map();
  private static playerProgress: Map<number, PlayerTalentProgress> = new Map();

  /** Initialize with all talent and tree definitions */
  static initialize(): void {
    for (const def of TALENT_DEFINITIONS) {
      TalentRegistry.definitions.set(def.id, def);
    }
    for (const tree of TALENT_TREE_DEFINITIONS) {
      TalentRegistry.trees.set(tree.id, tree);
    }
  }

  /** Initialize talent tracking for a player */
  static initPlayer(playerIndex: number): void {
    TalentRegistry.playerProgress.set(playerIndex, {
      availablePoints: 0,
      totalPointsEarned: 0,
      unlockedTalents: new Map(),
    });
  }

  /** Award talent points to a player (called on level-up) */
  static awardPoints(playerIndex: number, points: number): void {
    const progress = TalentRegistry.playerProgress.get(playerIndex);
    if (progress) {
      progress.availablePoints += points;
      progress.totalPointsEarned += points;
    }
  }

  /** Get available talent points for a player */
  static getAvailablePoints(playerIndex: number): number {
    return (
      TalentRegistry.playerProgress.get(playerIndex)?.availablePoints ?? 0
    );
  }

  /**
   * Attempt to unlock or rank-up a talent for a player's troll.
   * Returns true if successful.
   */
  static unlockTalent(
    playerIndex: number,
    talentId: string,
    troll: BaseTroll
  ): boolean {
    const progress = TalentRegistry.playerProgress.get(playerIndex);
    if (!progress) return false;

    const definition = TalentRegistry.definitions.get(talentId);
    if (!definition) return false;

    // Check if player has points
    const cost = definition.costPerRank?.[0] ?? 1;
    if (progress.availablePoints < cost) return false;

    const currentRank = progress.unlockedTalents.get(talentId) ?? 0;

    if (currentRank === 0) {
      // First unlock - create and attach
      const instance = new TalentInstance(definition);
      if (!troll.attachTalent(instance)) return false;

      progress.unlockedTalents.set(talentId, 1);
      progress.availablePoints -= cost;
      return true;
    } else if (currentRank < definition.maxRank) {
      // Rank up existing talent
      const instance = troll.getTalent(talentId);
      if (!instance) return false;

      const rankCost = definition.costPerRank?.[currentRank] ?? 1;
      if (progress.availablePoints < rankCost) return false;

      if (!instance.rankUp(troll)) return false;

      progress.unlockedTalents.set(talentId, currentRank + 1);
      progress.availablePoints -= rankCost;
      return true;
    }

    return false;
  }

  /** Get a talent definition by ID */
  static getDefinition(talentId: string): TalentDefinition | undefined {
    return TalentRegistry.definitions.get(talentId);
  }

  /** Get all talent definitions */
  static getAllDefinitions(): TalentDefinition[] {
    return [...TalentRegistry.definitions.values()];
  }

  /** Get a talent tree definition */
  static getTree(treeId: string): TalentTreeDefinition | undefined {
    return TalentRegistry.trees.get(treeId);
  }

  /** Get all talent trees available to a specific class */
  static getTreesForClass(classId: string): TalentTreeDefinition[] {
    return [...TalentRegistry.trees.values()].filter(
      (tree) =>
        !tree.allowedClasses ||
        tree.allowedClasses.length === 0 ||
        tree.allowedClasses.includes(classId)
    );
  }

  /** Get player's progress for UI rendering */
  static getPlayerProgress(
    playerIndex: number
  ): PlayerTalentProgress | undefined {
    return TalentRegistry.playerProgress.get(playerIndex);
  }

  /** Check if a talent's prerequisites are met for a player */
  static arePrerequisitesMet(
    playerIndex: number,
    talentId: string
  ): boolean {
    const definition = TalentRegistry.definitions.get(talentId);
    if (!definition?.prerequisites) return true;

    const progress = TalentRegistry.playerProgress.get(playerIndex);
    if (!progress) return false;

    return definition.prerequisites.every(
      (prereq) => (progress.unlockedTalents.get(prereq) ?? 0) > 0
    );
  }
}
