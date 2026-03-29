/**
 * Forge - Crafting building entity.
 *
 * Processes metal recipes: iron/steel ingots, weapons, armor.
 * Has QuickMake abilities added in postCreate.
 */

import { Unit } from "w3ts";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Building extends UnitEntity {
  constructor(unit: Unit) {
    super(unit);
  }

  override postDeath(): void {
    // Buildings are destroyed on death, don't preserve entity
    this.destroy();
  }
}

export class Forge extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(UnitTypeIds.FORGE, (unit) => new Forge(unit));
  }

  override postCreate(): void {
    super.postCreate();
    // Crafting abilities are added by the CraftingEngine
    // based on recipes tagged with CraftingStation.Forge
  }
}
