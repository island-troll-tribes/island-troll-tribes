/**
 * TheOne - Ultimate boss entity, the final challenge.
 *
 * The One resides in a special arena and is invulnerable unless a troll
 * is present in the arena region (same pattern as Alligator Man).
 * It periodically gains levels over time (every 60 seconds) while alive.
 * On death, levelling stops but the entity is preserved for potential revival.
 *
 * The One extends BonyAnimal so it drops bones on death.
 */

import { Unit, Timer } from "w3ts";
import { BonyAnimal } from "../modules/BonyAnimal";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class TheOne extends BonyAnimal {
  private static instance: TheOne | null = null;
  private levelTimer: Timer | null = null;

  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.THE_ONE,
      (unit) => new TheOne(unit)
    );
  }

  static getInstance(): TheOne | null {
    return TheOne.instance;
  }

  override postCreate(): void {
    super.postCreate();
    if (TheOne.instance === null) {
      TheOne.instance = this;
    }
  }

  /** Start the periodic level-up timer (called after spawn/revive) */
  beginLevelling(): void {
    if (this.levelTimer) {
      this.levelTimer.destroy();
    }
    this.levelTimer = new Timer();
    this.levelTimer.start(60.0, true, () => {
      const u = this.getUnit();
      if (u.isAlive()) {
        // TODO: u.addLevels(1, true) - requires hero unit
      }
    });
  }

  override getNumCorpses(): number {
    return 3;
  }

  override postDeath(): void {
    // Stop levelling while dead, but do NOT destroy the entity
    // so it can be revived later.
    if (this.levelTimer) {
      this.levelTimer.destroy();
      this.levelTimer = null;
    }
  }
}
