/**
 * Panther - Stealthy hostile animal that drops bones and raw meat.
 *
 * Panthers have shadow meld / prowl and are dangerous ambush predators.
 * They drop two bones instead of hide, making them a good bone source.
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class Panther extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.PANTHER,
      (unit) => new Panther(unit)
    );
  }

  override getDrops(): number[] {
    return [ItemIds.BONE, ItemIds.BONE];
  }

  override getNumCorpses(): number {
    return 8;
  }
}
