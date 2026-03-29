/**
 * Hostile - Base class for units that drop items on death.
 *
 * All animals, trolls, and bosses extend Hostile.
 * Handles item drops, corpse creation, and death counting.
 */

import { Unit } from "w3ts";
import { UnitEntity } from "../EntityManager";
import { GameConfig } from "../../config/GameConfig";

export abstract class Hostile extends UnitEntity {
  private dropOnDeath = true;

  constructor(unit: Unit) {
    super(unit);
  }

  /** Override to define what items this entity drops on death */
  getDrops(): number[] {
    return [];
  }

  /** Override to define how many corpses spawn on death */
  getNumCorpses(): number {
    return 1;
  }

  override onDeath(): void {
    if (this.dropOnDeath) {
      const pos = this.getPos();
      const config = GameConfig.getInstance();
      const numCorpses = Math.round(
        this.getNumCorpses() * config.getFoodForKillProportion()
      );
      const drops = this.getDrops();

      // Create item drops
      for (const itemId of drops) {
        CreateItem(itemId, pos.x, pos.y);
      }

      // Create corpses
      for (let i = 0; i < numCorpses; i++) {
        // corpse creation handled by WC3 engine via death animation
      }
    }

    super.onDeath();
  }

  setDropOnDeath(value: boolean): void {
    this.dropOnDeath = value;
  }

  getDropOnDeath(): boolean {
    return this.dropOnDeath;
  }
}
