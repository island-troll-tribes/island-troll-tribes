/**
 * GreenFish - Non-hostile aquatic animal that drops river root/stem.
 *
 * Green fish are found in rivers and provide herb ingredients.
 * They yield more corpses than regular fish.
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class GreenFish extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.GREEN_FISH,
      (unit) => new GreenFish(unit)
    );
  }

  override getNumCorpses(): number {
    return 3;
  }
}
