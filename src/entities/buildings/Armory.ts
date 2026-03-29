/**
 * Armory - Crafting station for advanced armor and battle equipment.
 *
 * Recipes: Anabolic Boots, Battle Armor, Battle Gloves, Battle Axe,
 * Battle Shield. QuickMake abilities are added in postCreate.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Armory extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.ARMORY,
      (unit) => new Armory(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // QM abilities are on the unit type definition in BuildingObjects.ts
  }
}
