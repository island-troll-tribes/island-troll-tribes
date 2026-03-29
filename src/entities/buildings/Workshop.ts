/**
 * Workshop - Utility item crafting station.
 *
 * Crafts utility items: living clay, hunting nets, dark thistles,
 * ensnare traps, mana crystals, poison spears, nets, and blow guns.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Workshop extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.WORKSHOP,
      (unit) => new Workshop(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // Crafting abilities are added by the CraftingEngine
    // based on recipes tagged with CraftingStation.Workshop
  }
}
