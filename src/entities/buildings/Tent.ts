/**
 * Tent - Basic shelter building for sleeping and healing.
 *
 * The tent provides a place for trolls to sleep and recover health.
 * It is the most basic shelter type and is the cheapest to build.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Tent extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.TENT,
      (unit) => new Tent(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // TODO: Add sleep/heal aura ability
  }
}
