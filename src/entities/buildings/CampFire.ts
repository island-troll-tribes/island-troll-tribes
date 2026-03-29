/**
 * CampFire - Heat source building that provides warmth and cooks meat.
 *
 * The camp fire provides a heat aura that reduces heat loss for nearby
 * trolls (reduces heat stat loss by 2). It can also be used to cook
 * raw meat into cooked meat by dropping raw meat near it.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class CampFire extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.CAMP_FIRE,
      (unit) => new CampFire(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // TODO: Add heat aura ability
    // TODO: Add meat cooking trigger (raw meat dropped nearby -> cooked meat)
  }
}
