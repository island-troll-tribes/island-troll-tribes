/**
 * Fish - Non-hostile aquatic animal.
 *
 * Fish are found in water and provide a food source for trolls.
 * They do not actively attack players. Drops are handled by
 * the WC3 object editor loot tables.
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Fish extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.FISH,
      (unit) => new Fish(unit)
    );
  }

  override getNumCorpses(): number {
    return 0;
  }
}
