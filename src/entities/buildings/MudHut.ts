/**
 * MudHut - Medium-tier shelter building.
 *
 * Provides better sleeping and healing than a tent.
 * Mid-tier shelter between Tent and Troll Hut.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class MudHut extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.MUD_HUT,
      (unit) => new MudHut(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // Sleep Inside Hut ability (A407) is on the unit type definition
  }
}
