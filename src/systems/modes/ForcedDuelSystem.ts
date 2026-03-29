/**
 * ForcedDuelSystem - Teleports all remaining tribes to a duel arena.
 *
 * Ports ForcedDuel.wurst.
 *
 * After a configurable delay (default disabled, set via `-fd N`):
 * 1. All surviving trolls teleport to the dueling area
 * 2. Buffs removed, HP/mana/heat reset to max
 * 3. 3-second pause before combat begins
 * 4. Last tribe standing wins
 */

import { Unit, Timer, MapPlayer } from "w3ts";
import { GameConfig } from "../../config/GameConfig";
import { TribeManager } from "../../core/TribeManager";

// ─── Constants ───────────────────────────────────────────────────────────

/** Pause duration before duel starts (seconds) */
const PRE_DUEL_PAUSE = 3.0;

/**
 * Duel area center and radius.
 * TODO: Extract actual coordinates from base.w3x gg_rct_Dualing_Area.
 */
const DUEL_AREA = {
  centerX: 0,
  centerY: 0,
  radius: 2000,
};

// ─── ForcedDuelSystem ────────────────────────────────────────────────────

export class ForcedDuelSystem {
  private static instance: ForcedDuelSystem;

  private duelTimer: Timer | null = null;
  private unpauseTimer: Timer | null = null;
  private duelActive = false;

  private constructor() {}

  static getInstance(): ForcedDuelSystem {
    if (!ForcedDuelSystem.instance) {
      ForcedDuelSystem.instance = new ForcedDuelSystem();
    }
    return ForcedDuelSystem.instance;
  }

  /** Schedule the forced duel. Call during gameplay phase. */
  schedule(): void {
    const config = GameConfig.getInstance();
    if (config.FORCED_DUEL_AFTER <= 0) return;

    this.duelTimer = new Timer();
    this.duelTimer.start(config.FORCED_DUEL_AFTER, false, () => {
      this.duelTimer?.destroy();
      this.duelTimer = null;
      this.executeDuel();
    });

    const minutes = Math.floor(config.FORCED_DUEL_AFTER / 60);
    print(`|cffff8800Forced duel|r will begin in ${minutes} minutes!`);
  }

  /** Execute the forced duel */
  private executeDuel(): void {
    this.duelActive = true;
    const config = GameConfig.getInstance();
    const tribeManager = TribeManager.getInstance();

    print("|cffff0000FORCED DUEL!|r All trolls are being teleported to the arena!");

    // Gather all living trolls
    const trolls: Unit[] = [];
    const g = CreateGroup();
    GroupEnumUnitsInRect(g, GetWorldBounds(), null);
    ForGroup(g, () => {
      const u = Unit.fromHandle(GetEnumUnit());
      if (u && u.isHero() && u.isAlive() && u.owner.id < 12) {
        trolls.push(u);
      }
    });
    DestroyGroup(g);

    // Teleport each troll to a random point in the duel area
    for (const troll of trolls) {
      const angle = Math.random() * 2 * Math.PI;
      const dist = Math.random() * DUEL_AREA.radius;
      const x = DUEL_AREA.centerX + dist * Math.cos(angle);
      const y = DUEL_AREA.centerY + dist * Math.sin(angle);

      // Pause troll
      troll.paused = true;

      // Teleport
      troll.x = x;
      troll.y = y;

      // Remove all buffs
      // WC3 trick: remove positive and negative buffs via UnitRemoveBuffs
      UnitRemoveBuffs(troll.handle, true, true);

      // Reset stats
      troll.life = troll.maxLife;
      troll.mana = troll.maxMana;

      // Reset heat
      const player = troll.owner;
      player.setState(PLAYER_STATE_RESOURCE_GOLD, config.HEAT_MAXIMUM);

      // Pan camera for the player
      if (GetLocalPlayer() === player.handle) {
        PanCameraToTimed(x, y, 0.5);
      }
    }

    // Unpause after delay
    this.unpauseTimer = new Timer();
    this.unpauseTimer.start(PRE_DUEL_PAUSE, false, () => {
      this.unpauseTimer?.destroy();
      this.unpauseTimer = null;

      for (const troll of trolls) {
        if (troll.isAlive()) {
          troll.paused = false;
        }
      }

      print("|cffff0000FIGHT!|r");
    });
  }

  /** Check if duel is currently active */
  isDuelActive(): boolean {
    return this.duelActive;
  }

  /** Clean up */
  destroy(): void {
    if (this.duelTimer) {
      this.duelTimer.destroy();
      this.duelTimer = null;
    }
    if (this.unpauseTimer) {
      this.unpauseTimer.destroy();
      this.unpauseTimer = null;
    }
  }
}
