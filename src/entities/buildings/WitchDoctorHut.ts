/**
 * WitchDoctorHut - Magic item crafting station.
 *
 * Crafts scrolls, cloaks, poisons, and other magical items.
 * Has a "Drop Items" ability for convenience.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class WitchDoctorHut extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.WITCH_DOCTOR_HUT,
      (unit) => new WitchDoctorHut(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // QM abilities and WDH Spellbook (A104) are on the unit type definition
  }
}
