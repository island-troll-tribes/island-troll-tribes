/**
 * TeleportBeacon - Teleportation building that mirrors unit positions.
 *
 * Teleports a friendly ground unit to the opposite side of the beacon
 * (180 degree rotation around the beacon center). Can be upgraded by
 * feeding it a Magic item to increase the teleport range.
 *
 * Levels:
 * - Level 1: 700 range, base functionality
 * - Level 2: 1100 range (upgraded with Magic item)
 */

import { Unit } from "w3ts";
import { Building } from "./Forge";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class TeleportBeacon extends Building {
  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.TELEPORT_BEACON,
      (unit) => new TeleportBeacon(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();
    // TODO: Add ABILITY_TELEPORT_BEACON
    // TODO: Register event listeners for:
    //   - Item pickup (Magic upgrade)
    //   - Unit selection/deselection (range indicator effects)
    //   - Spell cast (teleport logic: mirror position 180 degrees)
  }
}
