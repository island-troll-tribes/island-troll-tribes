/**
 * AncientHydra - Powerful boss with breath of frost attack.
 *
 * The Ancient Hydra is summoned via the Hydra Spawn system. It actively
 * seeks out and attacks trolls using Breath of Frost. On death it spawns
 * two Lesser Hydras. It is immune to sleep and ignores creep guard behavior.
 *
 * Special mechanics:
 * - Periodically uses Breath of Frost on nearby enemies (4s cycle, 10s cooldown)
 * - Attacks toward the center of the map when no targets are nearby
 * - Reflects Nether Potion banish back onto the caster
 * - Captures bees (from Essence of Bees) for the neutral hostile player
 */

import { Unit, Timer } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";

export class AncientHydra extends Hostile {
  private attackTimer: Timer | null = null;
  private frostReady = true;

  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.ANCIENT_HYDRA,
      (unit) => new AncientHydra(unit)
    );
  }

  override postCreate(): void {
    super.postCreate();

    // Disable sleep so the hydra stays active at night
    // TODO: unit.addSleep(false), unit.setCreepGuard(false)

    // Start periodic attack behavior
    this.attackTimer = new Timer();
    this.attackTimer.start(4.0, true, () => this.attackCenter());
  }

  private attackCenter(): void {
    // TODO: Implement Breath of Frost targeting logic
    // - If frostReady and enemy within 600 range, use Breath of Frost
    // - Otherwise move toward map center and attack
  }

  override getNumCorpses(): number {
    return 8;
  }

  override onDeath(): void {
    // Clean up the periodic timer
    if (this.attackTimer) {
      this.attackTimer.destroy();
      this.attackTimer = null;
    }

    // TODO: Spawn two Lesser Hydras at death position
    // createUnit(PLAYER_NEUTRAL_AGGRESSIVE, UNIT_LESSER_HYDRA, pos, randomAngle) x2

    super.onDeath();
  }
}
