/**
 * Hatchery - Pet raising building for the Beastmaster class.
 *
 * Used to hatch hawk eggs and raise animal babies into pets.
 * Primarily used by the Beastmaster class line.
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class Hatchery extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.HATCHERY,
      (unit) => new Hatchery(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // TODO: Add egg hatching / pet raising abilities
  }
}
