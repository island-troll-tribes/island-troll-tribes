/**
 * RespawnSystem - Grace period auto-revive and post-grace respawn mechanics.
 *
 * Ports Respawn.wurst grace period and respawn delay logic.
 *
 * Grace Period Phase (first 8 minutes by default):
 * - Dead trolls auto-revive after 10 seconds
 * - Mammoth gate stays invulnerable
 * - Kills don't count toward elimination
 *
 * Post-Grace Phase:
 * - Respawn delay = (elapsed_minutes)^2 seconds (quadratic)
 * - Requires team to have a Spirit Ward building
 * - Heat is reset to maximum on revive
 * - Timer dialog shown to tribe during wait
 *
 * Special cases:
 * - If forced duel timer active and delay exceeds remaining time, no revive
 * - Respawn location chosen from team structures (prioritized by type/level)
 */

import { Unit, Timer, Trigger, MapPlayer } from "w3ts";
import { GameConfig } from "../../config/GameConfig";
import { TribeManager } from "../../core/TribeManager";
import { PlayerManager } from "../../core/PlayerManager";
import { AbilityIds } from "../../data/AbilityIds";

// ─── Constants ───────────────────────────────────────────────────────────

/** Delay before auto-revive during grace period (seconds) */
const GRACE_PERIOD_REVIVE_DELAY = 10.0;

/** Additional time after grace period before mammoth gate opens */
const MAMMOTH_GATE_EXTRA_DURATION = 60.0;

// ─── Types ───────────────────────────────────────────────────────────────

/** Pending respawn entry */
interface PendingRespawn {
  playerId: number;
  timer: Timer;
  /** Time remaining for display */
  delay: number;
}

// ─── RespawnSystem ───────────────────────────────────────────────────────

export class RespawnSystem {
  private static instance: RespawnSystem;

  /** Whether we are in the grace period */
  private graceActive = false;

  /** Game start timestamp (seconds) */
  private gameStartTime = 0;

  /** Grace period timer */
  private graceTimer: Timer | null = null;

  /** Mammoth gate timer */
  private mammothGateTimer: Timer | null = null;

  /** Pending respawns by player ID */
  private pendingRespawns: Map<number, PendingRespawn> = new Map();

  /** Reference to mammoth gate unit (if exists) */
  private mammothGate: Unit | null = null;

  /** Death trigger */
  private deathTrigger: Trigger | null = null;

  private constructor() {}

  static getInstance(): RespawnSystem {
    if (!RespawnSystem.instance) {
      RespawnSystem.instance = new RespawnSystem();
    }
    return RespawnSystem.instance;
  }

  /**
   * Initialize the respawn system. Should be called at gameplay start.
   * @param mammothGate Optional reference to the mammoth gate unit
   */
  initialize(mammothGate?: Unit): void {
    const config = GameConfig.getInstance();

    this.gameStartTime = 0; // Will use TimerGetElapsed(GetGameTimer())
    this.mammothGate = mammothGate ?? null;

    if (config.GRACE_PERIOD_DURATION > 0) {
      this.startGracePeriod();
    }

    // Register death trigger
    this.deathTrigger = new Trigger();
    this.deathTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH);
    this.deathTrigger.addAction(() => this.onTrollDeath());
  }

  /** Start the grace period */
  private startGracePeriod(): void {
    const config = GameConfig.getInstance();

    this.graceActive = true;

    // Make mammoth gate invulnerable
    if (this.mammothGate) {
      this.mammothGate.addAbility(AbilityIds.INVULNERABLE);
    }

    // Grace period end timer
    this.graceTimer = new Timer();
    this.graceTimer.start(config.GRACE_PERIOD_DURATION, false, () => {
      this.endGracePeriod();
    });

    // Mammoth gate timer (grace + extra duration)
    if (this.mammothGate) {
      this.mammothGateTimer = new Timer();
      this.mammothGateTimer.start(
        config.GRACE_PERIOD_DURATION + MAMMOTH_GATE_EXTRA_DURATION,
        false,
        () => {
          this.openMammothGate();
        }
      );
    }

    print(
      "|cff00ffffGrace period active!|r Your troll will auto-revive for " +
        `${config.GRACE_PERIOD_DURATION} seconds.`
    );
  }

  /** End the grace period */
  private endGracePeriod(): void {
    this.graceActive = false;

    if (this.graceTimer) {
      this.graceTimer.destroy();
      this.graceTimer = null;
    }

    print(
      "|cffff8800Grace period is over.|r " +
        "Now you will not be automatically revived when you die! " +
        "You can still be revived if your team builds a Spirit Ward!"
    );
  }

  /** Open/destroy the mammoth gate */
  private openMammothGate(): void {
    if (this.mammothGateTimer) {
      this.mammothGateTimer.destroy();
      this.mammothGateTimer = null;
    }

    if (this.mammothGate) {
      this.mammothGate.removeAbility(AbilityIds.INVULNERABLE);
      this.mammothGate.kill();
      this.mammothGate = null;
    }
  }

  /** Handle a troll death */
  private onTrollDeath(): void {
    const dead = Unit.fromHandle(GetDyingUnit());
    if (!dead || !dead.isHero()) return;

    const playerId = dead.owner.id;
    if (playerId >= 12) return; // Not a real player

    // Cancel any existing pending respawn
    this.cancelPendingRespawn(playerId);

    if (this.graceActive) {
      // Auto-revive during grace period
      this.scheduleRespawn(playerId, dead, GRACE_PERIOD_REVIVE_DELAY);
      print(
        `|cff00ff00${dead.owner.name}|r will revive in ` +
          `${GRACE_PERIOD_REVIVE_DELAY} seconds (grace period).`
      );
    } else if (GameConfig.getInstance().RESPAWN_SYSTEM_ENABLED) {
      // Post-grace: check for Spirit Ward and calculate delay
      this.handlePostGraceRespawn(playerId, dead);
    }
    // If neither grace nor respawn system: permanent death
  }

  /** Handle respawn after grace period ends */
  private handlePostGraceRespawn(playerId: number, dead: Unit): void {
    const config = GameConfig.getInstance();
    const tribeManager = TribeManager.getInstance();

    // Check if tribe has a Spirit Ward
    const playerHandle = MapPlayer.fromIndex(playerId);
    if (!playerHandle) return;
    const tribe = tribeManager.getTribeForPlayer(playerHandle);
    if (tribe === undefined) return;

    // TODO: Check for Spirit Ward building in tribe
    // For now, always allow respawn if system is enabled

    // Calculate quadratic delay: (minutes_elapsed)^2
    const elapsedSeconds = TimerGetElapsed(GetGameTimer());
    const elapsedMinutes = elapsedSeconds / 60.0;
    const delay = Math.max(10, Math.floor(elapsedMinutes * elapsedMinutes));

    // Check if forced duel would make respawn pointless
    if (config.FORCED_DUEL_AFTER > 0) {
      const forcedDuelRemaining = config.FORCED_DUEL_AFTER - elapsedSeconds;
      if (delay > forcedDuelRemaining) {
        print(
          `|cffff0000${dead.owner.name}|r cannot respawn - ` +
            "forced duel is imminent!"
        );
        return;
      }
    }

    this.scheduleRespawn(playerId, dead, delay);
    print(
      `|cff00ff00${dead.owner.name}|r will respawn in ${delay} seconds.`
    );
  }

  /** Schedule a troll respawn after a delay */
  private scheduleRespawn(playerId: number, troll: Unit, delay: number): void {
    const timer = new Timer();

    const pending: PendingRespawn = {
      playerId,
      timer,
      delay,
    };

    this.pendingRespawns.set(playerId, pending);

    timer.start(delay, false, () => {
      this.executeRespawn(playerId, troll);
    });
  }

  /** Execute the actual respawn */
  private executeRespawn(playerId: number, troll: Unit): void {
    this.cancelPendingRespawn(playerId);

    const config = GameConfig.getInstance();
    const tribeManager = TribeManager.getInstance();
    const playerHandle = MapPlayer.fromIndex(playerId);
    const tribe = playerHandle ? tribeManager.getTribeForPlayer(playerHandle) : undefined;

    // Find respawn location (prefer tribe structures)
    let respawnX = troll.x;
    let respawnY = troll.y;

    // TODO: Find best tribe structure for respawn location
    // For now, revive at death location

    // Revive the hero
    troll.revive(respawnX, respawnY, true);

    // Reset heat to maximum
    const player = MapPlayer.fromIndex(playerId);
    if (player) {
      player.setState(PLAYER_STATE_RESOURCE_GOLD, config.HEAT_MAXIMUM);
    }

    // Restore mana
    troll.mana = troll.maxMana;

    print(
      `|cff00ff00${troll.owner.name}|r has been revived!`
    );
  }

  /** Cancel a pending respawn for a player */
  private cancelPendingRespawn(playerId: number): void {
    const pending = this.pendingRespawns.get(playerId);
    if (pending) {
      pending.timer.destroy();
      this.pendingRespawns.delete(playerId);
    }
  }

  /** Check if a player has a pending respawn */
  hasPendingRespawn(playerId: number): boolean {
    return this.pendingRespawns.has(playerId);
  }

  /** Check if grace period is currently active */
  isGraceActive(): boolean {
    return this.graceActive;
  }

  /** Clean up all timers and triggers */
  destroy(): void {
    if (this.graceTimer) {
      this.graceTimer.destroy();
      this.graceTimer = null;
    }
    if (this.mammothGateTimer) {
      this.mammothGateTimer.destroy();
      this.mammothGateTimer = null;
    }
    if (this.deathTrigger) {
      this.deathTrigger.destroy();
      this.deathTrigger = null;
    }
    for (const [, pending] of this.pendingRespawns) {
      pending.timer.destroy();
    }
    this.pendingRespawns.clear();
  }
}
