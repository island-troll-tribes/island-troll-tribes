/**
 * Hawk - Flying animal that drops hawk eggs and bones.
 *
 * Hawks are flying units that circle the islands. They extend BonyAnimal
 * so they always drop a bone. If a Beastmaster is nearby, an extra egg drops.
 * Hawks can be raised in the Hatchery by the Beastmaster class line.
 */

import { Unit } from "w3ts";
import { BonyAnimal } from "../modules/BonyAnimal";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class Hawk extends BonyAnimal {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.HAWK,
      (unit) => new Hawk(unit)
    );
  }

  override getDrops(): number[] {
    const drops = super.getDrops();
    drops.push(ItemIds.HAWK_EGG);

    // TODO: Check for nearby Beastmaster and drop an additional egg
    // if one is within 400 range.

    return drops;
  }

  override getNumCorpses(): number {
    return 0;
  }
}
