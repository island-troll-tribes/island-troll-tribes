/**
 * Wolf - Hostile animal that drops wolf hide, raw meat, and bone.
 *
 * Wolves are aggressive predators found across the islands.
 * They can be tamed by the Beastmaster class line.
 * Only neutral-hostile wolves drop hides (prevents pet hide farming).
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class Wolf extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.JUNGLE_WOLF,
      (unit) => new Wolf(unit)
    );
  }

  override getDrops(): number[] {
    return [ItemIds.JUNGLE_WOLF_HIDE, ItemIds.RAW_MEAT, ItemIds.BONE];
  }

  override getNumCorpses(): number {
    return 4;
  }
}
