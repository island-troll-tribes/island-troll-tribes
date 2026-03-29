/**
 * Tannery - Hide processing station for leather armor.
 *
 * Processes animal hides into boots, gloves, and coats.
 * Recipes cover elk skin, wolf skin, and bear skin tiers.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Tannery extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.TANNERY,
      (unit) => new Tannery(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // QM abilities are on the unit type definition in BuildingObjects.ts
  }
}
