/**
 * TalentInstance - Runtime instance of a talent attached to a troll.
 *
 * Manages the lifecycle of a talent modifier:
 * - Checking prerequisites
 * - Applying/removing effects
 * - Tracking current rank
 * - Hooking into WC3 ability/stat systems
 */

import { Unit } from "w3ts";
import {
  TalentDefinition,
  TalentEffect,
  TalentEffectType,
} from "./TalentDefinition";
import type { BaseTroll } from "../entities/trolls/BaseTroll";

export class TalentInstance {
  private definition: TalentDefinition;
  private currentRank = 0;
  private appliedEffects: TalentEffect[] = [];

  constructor(definition: TalentDefinition) {
    this.definition = definition;
  }

  getId(): string {
    return this.definition.id;
  }

  getDefinition(): TalentDefinition {
    return this.definition;
  }

  getCurrentRank(): number {
    return this.currentRank;
  }

  getMaxRank(): number {
    return this.definition.maxRank;
  }

  isMaxRank(): boolean {
    return this.currentRank >= this.definition.maxRank;
  }

  /** Check if this talent can be attached to the given troll */
  canAttach(troll: BaseTroll): boolean {
    // Check class restriction
    if (
      this.definition.allowedClasses &&
      this.definition.allowedClasses.length > 0
    ) {
      if (!this.definition.allowedClasses.includes(troll.getBaseClassId())) {
        return false;
      }
    }

    // Check level requirement
    if (this.definition.requiredLevel) {
      if (troll.getUnit().level < this.definition.requiredLevel) {
        return false;
      }
    }

    // Check prerequisites
    if (this.definition.prerequisites) {
      for (const prereq of this.definition.prerequisites) {
        if (!troll.hasTalent(prereq)) {
          return false;
        }
      }
    }

    return true;
  }

  /** Called when the talent is first attached to a troll */
  onAttach(troll: BaseTroll): void {
    this.rankUp(troll);
  }

  /** Called when the talent is removed from a troll */
  onDetach(troll: BaseTroll): void {
    this.removeAllEffects(troll.getUnit());
    this.currentRank = 0;
  }

  /** Increase the rank of this talent by 1 */
  rankUp(troll: BaseTroll): boolean {
    if (this.isMaxRank()) return false;

    const newRank = this.currentRank + 1;
    const effects = this.definition.effectsPerRank[newRank - 1];

    if (!effects) return false;

    // Remove previous rank's effects if upgrading
    if (this.currentRank > 0) {
      this.removeAllEffects(troll.getUnit());
    }

    // Apply new rank's effects
    for (const effect of effects) {
      this.applyEffect(troll.getUnit(), effect);
      this.appliedEffects.push(effect);
    }

    this.currentRank = newRank;
    return true;
  }

  private applyEffect(unit: Unit, effect: TalentEffect): void {
    switch (effect.type) {
      case TalentEffectType.GrantAbility:
        if (effect.abilityId) {
          unit.addAbility(effect.abilityId);
        }
        break;

      case TalentEffectType.StatModifier:
        this.applyStatModifier(unit, effect);
        break;

      case TalentEffectType.AbilityModifier:
        // Modify an existing ability's properties
        if (effect.targetAbilityId && effect.property && effect.modifier) {
          // Uses WC3 ability field modification natives
          // BlzSetAbilityRealLevelField, etc.
        }
        break;

      case TalentEffectType.Custom:
        // Custom handlers are registered separately
        break;
    }
  }

  private removeAllEffects(unit: Unit): void {
    for (const effect of this.appliedEffects) {
      this.removeEffect(unit, effect);
    }
    this.appliedEffects = [];
  }

  private removeEffect(unit: Unit, effect: TalentEffect): void {
    switch (effect.type) {
      case TalentEffectType.GrantAbility:
        if (effect.abilityId) {
          unit.removeAbility(effect.abilityId);
        }
        break;

      case TalentEffectType.StatModifier:
        this.removeStatModifier(unit, effect);
        break;
    }
  }

  private applyStatModifier(unit: Unit, effect: TalentEffect): void {
    if (!effect.stat || effect.value === undefined) return;

    switch (effect.stat) {
      case "strength":
        unit.strength = unit.strength + effect.value;
        break;
      case "agility":
        unit.agility = unit.agility + effect.value;
        break;
      case "intelligence":
        unit.intelligence = unit.intelligence + effect.value;
        break;
      case "maxHP":
        unit.maxLife += effect.value;
        break;
      case "maxMana":
        unit.maxMana += effect.value;
        break;
    }
  }

  private removeStatModifier(unit: Unit, effect: TalentEffect): void {
    if (!effect.stat || effect.value === undefined) return;

    switch (effect.stat) {
      case "strength":
        unit.strength = unit.strength - effect.value;
        break;
      case "agility":
        unit.agility = unit.agility - effect.value;
        break;
      case "intelligence":
        unit.intelligence = unit.intelligence - effect.value;
        break;
      case "maxHP":
        unit.maxLife -= effect.value;
        break;
      case "maxMana":
        unit.maxMana -= effect.value;
        break;
    }
  }
}
