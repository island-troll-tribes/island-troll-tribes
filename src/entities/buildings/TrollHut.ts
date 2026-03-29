/**
 * TrollHut - Best shelter building.
 *
 * Provides the strongest sleeping and healing bonuses.
 * Top-tier shelter, most expensive to build.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class TrollHut extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.TROLL_HUT,
      (unit) => new TrollHut(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // Sleep Inside Hut ability (A407) is on the unit type definition
  }
}
