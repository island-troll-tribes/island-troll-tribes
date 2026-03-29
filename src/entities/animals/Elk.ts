/**
 * Elk - Basic animal entity.
 *
 * The most common animal in the game. Drops raw meat and elk hide on death.
 * Elk retreat to specific areas when attacked (ElkRetreat behavior).
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class Elk extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(UnitTypeIds.ELK, (unit) => new Elk(unit));
  }

  override getDrops(): number[] {
    return [ItemIds.RAW_MEAT, ItemIds.ELK_HIDE, ItemIds.BONE];
  }

  override getNumCorpses(): number {
    return 1;
  }
}
