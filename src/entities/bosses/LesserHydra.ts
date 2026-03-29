/**
 * LesserHydra - Weaker hydra variant spawned from Ancient Hydra death.
 *
 * Two Lesser Hydras spawn when the Ancient Hydra dies. They have complex
 * respawn behavior: when killed, they may split into additional hydras
 * after a delay. When all lesser hydras are dead, they drop hydra scales.
 * They automatically despawn after 60 seconds of no combat.
 *
 * Drop mechanics:
 * - Drops are only created when ALL lesser hydras are dead
 * - Each dead hydra drops 3 hydra scales at its death position
 */

import { Unit, Timer } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class LesserHydra extends Hostile {
  /** Track all living lesser hydra instances for respawn logic */
  private static instances: LesserHydra[] = [];
  private static despawnTimer: Timer | null = null;

  private deathX = 0;
  private deathY = 0;
  private spawnedAdditional = false;

  constructor(unit: Unit) {
    super(unit);
    LesserHydra.instances.push(this);

    // Reset despawn timer on each new hydra
    LesserHydra.resetDespawnTimer();
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.LESSER_HYDRA,
      (unit) => new LesserHydra(unit)
    );
  }

  private static resetDespawnTimer(): void {
    if (!LesserHydra.despawnTimer) {
      LesserHydra.despawnTimer = new Timer();
    }
    LesserHydra.despawnTimer.start(60.0, false, () =>
      LesserHydra.despawnAll()
    );
  }

  private static despawnAll(): void {
    for (const hydra of LesserHydra.instances) {
      hydra.destroy();
    }
    LesserHydra.instances = [];

    if (LesserHydra.despawnTimer) {
      LesserHydra.despawnTimer.destroy();
      LesserHydra.despawnTimer = null;
    }
  }

  private static checkAllDead(): void {
    const alive = LesserHydra.instances.filter((h) =>
      h.getUnit().isAlive()
    );

    if (alive.length === 0) {
      // All dead: drop loot from each corpse position
      for (const hydra of LesserHydra.instances) {
        for (let i = 0; i < 3; i++) {
          CreateItem(ItemIds.HYDRA_SCALE, hydra.deathX, hydra.deathY);
        }
      }

      // Clean up
      for (const hydra of LesserHydra.instances) {
        hydra.destroy();
      }
      LesserHydra.instances = [];

      if (LesserHydra.despawnTimer) {
        LesserHydra.despawnTimer.destroy();
        LesserHydra.despawnTimer = null;
      }
    }
  }

  override getNumCorpses(): number {
    return 4;
  }

  /** Suppress normal drop behavior; drops handled collectively */
  override getDrops(): number[] {
    return [];
  }

  override onDeath(): void {
    const pos = this.getPos();
    this.deathX = pos.x;
    this.deathY = pos.y;

    // TODO: After 2.5s delay, maybe spawn additional lesser hydras
    // if (!this.spawnedAdditional) { spawn 2 more at deathPos }

    LesserHydra.checkAllDead();
    // Do not call super.onDeath() - we manage cleanup via checkAllDead
  }

  override postDeath(): void {
    // Override to prevent automatic entity destruction
  }
}
