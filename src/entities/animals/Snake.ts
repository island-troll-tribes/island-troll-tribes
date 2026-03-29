/**
 * Snake - Small hostile animal with poison attack.
 *
 * Snakes are dangerous due to their poison but otherwise weak.
 * They do not drop items directly; their death is handled with a
 * slight delay to allow the poison death animation to play.
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Snake extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.SNAKE,
      (unit) => new Snake(unit)
    );
  }

  override getNumCorpses(): number {
    return 0;
  }
}
