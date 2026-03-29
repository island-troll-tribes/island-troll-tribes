/**
 * Bear - Tough hostile animal that drops bear hide, raw meat, and bone.
 *
 * Bears are the strongest common animals on the islands.
 * They can be tamed by the Beastmaster class line.
 * Only neutral-hostile bears drop hides (prevents pet hide farming).
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class Bear extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.JUNGLE_BEAR,
      (unit) => new Bear(unit)
    );
  }

  override getDrops(): number[] {
    return [ItemIds.JUNGLE_BEAR_HIDE, ItemIds.RAW_MEAT, ItemIds.BONE];
  }

  override getNumCorpses(): number {
    return 7;
  }
}
