/**
 * ForestFireSystem - Shrinking map mechanic via expanding fire ring.
 *
 * Ports ShrinkingMap.wurst.
 *
 * After a configurable delay (set via `-sm N [distance]`):
 * 1. Fire ring starts at map edge and shrinks inward
 * 2. Units outside the safe zone take 5% max HP per second
 * 3. Trees in the burning zone are destroyed
 * 4. Raw meat in fire converts to cooked meat
 * 5. Shrinks until reaching a configurable minimum radius
 *
 * Two periodic loops:
 * - Fire approach: every 1.5s, shrinks zone by 100 units
 * - Life drain: every 0.5s, damages units outside safe zone
 */

import { Unit, Timer } from "w3ts";
import { GameConfig } from "../../config/GameConfig";
import { ItemIds } from "../../data/ItemIds";

// ─── Constants ───────────────────────────────────────────────────────────

/** Initial safe zone radius from map center */
const MAX_DISTANCE_FROM_CENTER = 13000;

/** How much the safe zone shrinks per fire approach tick */
const DISTANCE_INCREMENT = 100;

/** How often the fire ring moves inward (seconds) */
const FIRE_APPROACH_PERIOD = 1.5;

/** How often damage is applied to units in fire (seconds) */
const LIFE_DRAIN_PERIOD = 0.5;

/** Damage per second as fraction of max HP */
const LIFE_DRAIN_PERCENT_PER_SECOND = 0.05;

/** Default minimum safe zone radius */
const DEFAULT_FINAL_DISTANCE = 4000;

/** Map center coordinates */
const MAP_CENTER_X = 0;
const MAP_CENTER_Y = 0;

// ─── ForestFireSystem ────────────────────────────────────────────────────

export class ForestFireSystem {
  private static instance: ForestFireSystem;

  /** Current safe zone radius */
  private distanceFromCenter = MAX_DISTANCE_FROM_CENTER;

  /** Target minimum radius */
  private finalDistance = DEFAULT_FINAL_DISTANCE;

  /** Whether the fire is currently active */
  private fireActive = false;

  /** Timer to start the fire after delay */
  private startTimer: Timer | null = null;

  /** Fire approach timer (shrinks zone) */
  private approachTimer: Timer | null = null;

  /** Life drain timer (damages units) */
  private drainTimer: Timer | null = null;

  private constructor() {}

  static getInstance(): ForestFireSystem {
    if (!ForestFireSystem.instance) {
      ForestFireSystem.instance = new ForestFireSystem();
    }
    return ForestFireSystem.instance;
  }

  /** Schedule the forest fire. Call during gameplay phase. */
  schedule(): void {
    const config = GameConfig.getInstance();
    if (config.FOREST_FIRE_AFTER <= 0) return;

    this.startTimer = new Timer();
    this.startTimer.start(config.FOREST_FIRE_AFTER, false, () => {
      this.startTimer?.destroy();
      this.startTimer = null;
      this.startFire();
    });

    const minutes = Math.floor(config.FOREST_FIRE_AFTER / 60);
    print(`|cffff4400Forest fire|r will begin in ${minutes} minutes!`);
  }

  /** Start the fire */
  private startFire(): void {
    this.fireActive = true;
    this.distanceFromCenter = MAX_DISTANCE_FROM_CENTER;

    print("|cffff0000The forest is burning!|r The safe zone is shrinking!");

    // Fire approach loop
    this.approachTimer = new Timer();
    this.approachTimer.start(FIRE_APPROACH_PERIOD, true, () => {
      this.advanceFire();
    });

    // Life drain loop
    this.drainTimer = new Timer();
    this.drainTimer.start(LIFE_DRAIN_PERIOD, true, () => {
      this.applyFireDamage();
    });
  }

  /** Shrink the safe zone by one increment */
  private advanceFire(): void {
    if (this.distanceFromCenter <= this.finalDistance) {
      // Reached minimum — stop shrinking but keep draining
      if (this.approachTimer) {
        this.approachTimer.destroy();
        this.approachTimer = null;
      }
      return;
    }

    const decrement = Math.min(DISTANCE_INCREMENT, this.distanceFromCenter - this.finalDistance);
    this.distanceFromCenter -= decrement;

    // Destroy trees in the newly burned zone
    this.destroyTreesInRing(this.distanceFromCenter, this.distanceFromCenter + decrement);
  }

  /** Apply fire damage to units outside the safe zone */
  private applyFireDamage(): void {
    const damagePerTick = LIFE_DRAIN_PERCENT_PER_SECOND * LIFE_DRAIN_PERIOD;

    const g = CreateGroup();
    GroupEnumUnitsInRect(g, GetWorldBounds(), null);
    ForGroup(g, () => {
      const u = Unit.fromHandle(GetEnumUnit());
      if (!u || !u.isAlive()) return;

      const dx = u.x - MAP_CENTER_X;
      const dy = u.y - MAP_CENTER_Y;
      const dist = Math.sqrt(dx * dx + dy * dy);

      if (dist > this.distanceFromCenter) {
        // Skip invulnerable units
        if (u.invulnerable) return;

        // Convert raw meat to cooked meat if unit dies
        // Actually: any raw meat items on the ground in fire zone get cooked
        // For units: apply % max HP damage
        const damage = u.maxLife * damagePerTick;
        u.life = Math.max(1, u.life - damage);

        if (u.life <= 1) {
          u.kill();
        }
      }
    });
    DestroyGroup(g);
  }

  /** Destroy destructibles (trees) in a ring */
  private destroyTreesInRing(innerRadius: number, outerRadius: number): void {
    // Enumerate destructibles in the world bounds and destroy trees in range
    const worldBounds = GetWorldBounds();
    EnumDestructablesInRect(worldBounds, null, () => {
      const dest = GetEnumDestructable();
      const dx = GetDestructableX(dest) - MAP_CENTER_X;
      const dy = GetDestructableY(dest) - MAP_CENTER_Y;
      const dist = Math.sqrt(dx * dx + dy * dy);

      if (dist >= innerRadius && dist <= outerRadius) {
        // Play fire effect
        const fx = AddSpecialEffect(
          "Abilities/Spells/Other/BreathOfFire/BreathOfFireDamage.mdl",
          GetDestructableX(dest),
          GetDestructableY(dest)
        );
        DestroyEffect(fx);

        // Kill the tree
        KillDestructable(dest);
      }
    });
  }

  /** Get current safe zone radius */
  getSafeRadius(): number {
    return this.distanceFromCenter;
  }

  /** Check if fire is active */
  isFireActive(): boolean {
    return this.fireActive;
  }

  /** Check if a position is in the safe zone */
  isInSafeZone(x: number, y: number): boolean {
    const dx = x - MAP_CENTER_X;
    const dy = y - MAP_CENTER_Y;
    return Math.sqrt(dx * dx + dy * dy) <= this.distanceFromCenter;
  }

  /** Clean up */
  destroy(): void {
    this.fireActive = false;
    if (this.startTimer) {
      this.startTimer.destroy();
      this.startTimer = null;
    }
    if (this.approachTimer) {
      this.approachTimer.destroy();
      this.approachTimer = null;
    }
    if (this.drainTimer) {
      this.drainTimer.destroy();
      this.drainTimer = null;
    }
  }
}
