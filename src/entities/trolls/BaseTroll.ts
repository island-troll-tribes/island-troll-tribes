/**
 * BaseTroll - Abstract base class for all troll entities.
 *
 * Every troll in the game (Hunter, Mage, Priest, etc.) extends this class.
 * Trolls are hero units controlled by players that can evolve through 3 tiers:
 *   BASE_CLASS (level 1+) → SUB_CLASS (level 6+) → SUPER_CLASS (level 9+ with Medallion)
 *
 * The new Talent system replaces the rigid evolution paths with a component-based
 * modifier system, while preserving the 3-tier class progression.
 *
 * Key differences from the Wurst version:
 * - Talents are attached as Components/Modifiers instead of spellbook swaps
 * - Stats and abilities are data-driven via TrollDefinition interfaces
 * - The transformation system hooks into W3TS Unit wrappers
 */

import { Unit } from "w3ts";
import { BonyAnimal } from "../modules/BonyAnimal";
import { TalentInstance } from "../../talents/TalentInstance";
import { ClassType, TrollDefinition } from "./TrollDefinition";

export abstract class BaseTroll extends BonyAnimal {
  /** Active talent instances attached to this troll */
  private talents: Map<string, TalentInstance> = new Map();

  /** The class definition for this troll's current form */
  protected definition: TrollDefinition;

  constructor(unit: Unit, definition: TrollDefinition) {
    super(unit);
    this.definition = definition;
  }

  // ─── Class Identity ────────────────────────────────────────────────

  /** Get the class type (BASE, SUB, SUPER) */
  getClassType(): ClassType {
    return this.definition.classType;
  }

  /** Get the base class family (e.g., Hunter for Warrior/Tracker/Juggernaut) */
  getBaseClassId(): string {
    return this.definition.baseClassId;
  }

  /** Get the display name of this class */
  getClassName(): string {
    return this.definition.name;
  }

  /** Get the definition data */
  getDefinition(): TrollDefinition {
    return this.definition;
  }

  // ─── Talent System ─────────────────────────────────────────────────

  /** Attach a talent modifier to this troll */
  attachTalent(talent: TalentInstance): boolean {
    if (this.talents.has(talent.getId())) return false;

    // Check prerequisites
    if (!talent.canAttach(this)) return false;

    this.talents.set(talent.getId(), talent);
    talent.onAttach(this);
    return true;
  }

  /** Remove a talent modifier from this troll */
  detachTalent(talentId: string): boolean {
    const talent = this.talents.get(talentId);
    if (!talent) return false;

    talent.onDetach(this);
    this.talents.delete(talentId);
    return true;
  }

  /** Check if a talent is currently attached */
  hasTalent(talentId: string): boolean {
    return this.talents.has(talentId);
  }

  /** Get a specific talent instance */
  getTalent(talentId: string): TalentInstance | undefined {
    return this.talents.get(talentId);
  }

  /** Get all active talents */
  getAllTalents(): TalentInstance[] {
    return [...this.talents.values()];
  }

  /** Get talents by category */
  getTalentsByCategory(category: string): TalentInstance[] {
    return [...this.talents.values()].filter(
      (t) => t.getDefinition().category === category
    );
  }

  // ─── Stats ─────────────────────────────────────────────────────────

  /** Get the experience multiplier for this class type (mirrors legacy system) */
  getExpMultiplier(): number {
    switch (this.definition.classType) {
      case ClassType.Base:
        return 4;
      case ClassType.Sub:
        return 3;
      case ClassType.Super:
        return 2;
    }
  }

  /** Get the max inventory slots for this class */
  getInventorySlots(): number {
    return this.definition.inventorySlots;
  }

  // ─── Evolution ─────────────────────────────────────────────────────

  /** Get available evolution paths from current class */
  getAvailableEvolutions(): string[] {
    return this.definition.evolutionTargets ?? [];
  }

  /** Check if this troll can evolve to a target class */
  canEvolveTo(targetClassId: string): boolean {
    const evolutions = this.getAvailableEvolutions();
    if (!evolutions.includes(targetClassId)) return false;

    const level = this.unit.level;
    const targetDef = TrollRegistry_getDefinition(targetClassId);
    if (!targetDef) return false;

    if (targetDef.classType === ClassType.Sub) {
      return level >= 6;
    }
    if (targetDef.classType === ClassType.Super) {
      return level >= 9; // Also requires Medallion of Courage (checked elsewhere)
    }
    return false;
  }

  // ─── Lifecycle ─────────────────────────────────────────────────────

  override postCreate(): void {
    super.postCreate();
    // Correct unit color for hero units
    this.unit.color = this.unit.owner.color;
  }

  override postDeath(): void {
    // Trolls preserve their entity for revive (do NOT call super which destroys)
  }

  override postRevive(): void {
    this.unit.color = this.unit.owner.color;
  }
}

/**
 * Forward declaration - resolved at runtime by TrollRegistry.
 * Avoids circular dependency between BaseTroll and TrollRegistry.
 */
declare function TrollRegistry_getDefinition(
  classId: string
): TrollDefinition | undefined;
