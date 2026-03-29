/**
 * AlligatorMan - Island guardian boss with ensnare ability.
 *
 * Each island has an Alligator Man guarding it. The alligator is
 * invulnerable unless a troll is present on its island (handled by
 * region enter/leave triggers). Drops alligator gold and bones on death.
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class AlligatorMan extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.ALLIGATOR_MAN,
      (unit) => new AlligatorMan(unit)
    );
  }

  override getDrops(): number[] {
    return [ItemIds.BONE, ItemIds.BONE, ItemIds.ALLIGATOR_GOLD];
  }

  override getNumCorpses(): number {
    return 10;
  }
}
