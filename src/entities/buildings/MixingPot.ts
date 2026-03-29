/**
 * MixingPot - Potion and herb crafting station.
 *
 * Handles potion brewing and herb mixing. Has a special "Mix Herbs"
 * ability in addition to standard QuickMake recipes. Recipes include
 * healing potions, mana potions, cure-alls, anabolic potions, oracle
 * potions, and spirit essences.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class MixingPot extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.MIXING_POT,
      (unit) => new MixingPot(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // QM abilities, POT_MIX_HERBS (A05S), and Mixing Pot Spellbook (A103)
    // are all on the unit type definition in BuildingObjects.ts
  }
}
