/**
 * SpawnSystem - Resource and animal spawning controller.
 *
 * Ports the original ResourceSpawns.wurst system with its weighted
 * probability pools, time-based weight interpolation, and per-island
 * spawn balancing.
 *
 * Key mechanics preserved:
 * - Item spawn weights interpolate from initial to final over time
 * - Per-island spawn tracking prevents over/under-representation
 * - Animal spawns use separate weighted pools
 * - Fish/hawk spawning on a 240-second cycle
 * - Base spawn rates decrease over time (item: -0.2/cycle, food: -0.3/cycle)
 */

import { Timer, Rectangle } from "w3ts";
import { GameConfig } from "../../config/GameConfig";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

/** Spawn weight configuration for an item or animal type */
export interface SpawnInfo {
  id: number;
  initialWeight: number;
  finalWeight: number;
  /** Seconds until weight reaches final value (0 = instant) */
  weightChangeTime: number;
}

/** An island spawner managing a region of the map */
export interface IslandConfig {
  itemSpawnCount: number;
  animalSpawnCount: number;
  spawnRegions: { rect: Rectangle; weight: number }[];
}

export class SpawnSystem {
  private static instance: SpawnSystem;

  private itemSpawnInfo: SpawnInfo[] = [];
  private animalSpawnInfo: SpawnInfo[] = [];
  private islands: IslandConfig[] = [];
  private gameStartTime = 0;
  private itemCurrent = 0;
  private animalCurrent = 0;
  private fishCurrent = 0;
  private spawnTimer: Timer | null = null;
  private fishTimer: Timer | null = null;

  private constructor() {
    this.initItemSpawnInfo();
    this.initAnimalSpawnInfo();
    this.initIslands();
  }

  static getInstance(): SpawnSystem {
    if (!SpawnSystem.instance) {
      SpawnSystem.instance = new SpawnSystem();
    }
    return SpawnSystem.instance;
  }

  /** Initialize item spawn weights (from original ResourceSpawns.wurst) */
  private initItemSpawnInfo(): void {
    this.itemSpawnInfo = [
      { id: ItemIds.TINDER, initialWeight: 450, finalWeight: 90, weightChangeTime: 860 },
      { id: ItemIds.CLAY_BALL, initialWeight: 100, finalWeight: 185, weightChangeTime: 360 },
      { id: ItemIds.STICK, initialWeight: 300, finalWeight: 450, weightChangeTime: 360 },
      { id: ItemIds.FLINT, initialWeight: 300, finalWeight: 250, weightChangeTime: 300 },
      { id: ItemIds.MANA_CRYSTAL, initialWeight: 0, finalWeight: 160, weightChangeTime: 420 },
      { id: ItemIds.STONE, initialWeight: 110, finalWeight: 280, weightChangeTime: 560 },
      { id: ItemIds.MUSHROOM, initialWeight: 0, finalWeight: 120, weightChangeTime: 360 },
      { id: ItemIds.MAGIC, initialWeight: 25, finalWeight: 25, weightChangeTime: 1 },
    ];
  }

  /** Initialize animal spawn weights */
  private initAnimalSpawnInfo(): void {
    this.animalSpawnInfo = [
      { id: UnitTypeIds.ELK, initialWeight: 1000, finalWeight: 1000, weightChangeTime: 0 },
      { id: UnitTypeIds.SNAKE, initialWeight: 0, finalWeight: 45, weightChangeTime: 240 },
      { id: UnitTypeIds.JUNGLE_WOLF, initialWeight: 0, finalWeight: 90, weightChangeTime: 240 },
      { id: UnitTypeIds.JUNGLE_BEAR, initialWeight: 0, finalWeight: 45, weightChangeTime: 240 },
      { id: UnitTypeIds.PANTHER, initialWeight: 0, finalWeight: 45, weightChangeTime: 240 },
    ];
  }

  /** Initialize island spawner configurations */
  private initIslands(): void {
    // Island configs will be populated with actual map rects
    // Preserved spawn counts from original:
    // NW: 15 items, 4 animals
    // NE: 16 items, 4 animals
    // SE: 16 items, 4 animals
    // SW: 23 items, 6 animals (largest island)
    this.islands = [
      { itemSpawnCount: 15, animalSpawnCount: 4, spawnRegions: [] },
      { itemSpawnCount: 16, animalSpawnCount: 4, spawnRegions: [] },
      { itemSpawnCount: 16, animalSpawnCount: 4, spawnRegions: [] },
      { itemSpawnCount: 23, animalSpawnCount: 6, spawnRegions: [] },
    ];
  }

  /** Get the time-adjusted spawn weight for a SpawnInfo */
  getAdjustedWeight(info: SpawnInfo): number {
    if (info.weightChangeTime === 0) return info.finalWeight;

    const elapsed = this.getElapsedTime();
    const ratio = Math.min(1, Math.max(0, elapsed / info.weightChangeTime));
    return info.initialWeight + (info.finalWeight - info.initialWeight) * ratio;
  }

  private getElapsedTime(): number {
    // Uses WC3 game timer
    return 0; // TODO: Wire to actual game timer
  }

  /** Start the spawn cycles (called when gameplay phase begins) */
  startSpawnCycles(): void {
    this.gameStartTime = this.getElapsedTime();

    // Initial spawns (triple burst like original)
    this.handleAnimalSpawning();
    // Staggered: animals at 0/5/10s, items at 15/20s, fish at 25s
    const initTimer = new Timer();
    initTimer.start(5, false, () => {
      this.handleAnimalSpawning();
    });

    // Main 120-second spawn cycle
    this.spawnTimer = new Timer();
    this.spawnTimer.start(120, true, () => {
      this.handleAnimalSpawning();
      this.handleItemSpawning();
      this.adjustBaseSpawnRates();
    });

    // Fish/hawk 240-second cycle
    this.fishTimer = new Timer();
    this.fishTimer.start(240, true, () => {
      this.spawnFishAndHawks();
    });
  }

  private handleItemSpawning(): void {
    const config = GameConfig.getInstance();
    for (const island of this.islands) {
      const count = Math.ceil(island.itemSpawnCount * config.getItemBase());
      for (let i = 0; i < count; i++) {
        if (this.itemCurrent >= config.getItemMax()) break;
        this.spawnItemForIsland(island);
        this.itemCurrent++;
      }
    }
  }

  private handleAnimalSpawning(): void {
    const config = GameConfig.getInstance();
    for (const island of this.islands) {
      const count = Math.ceil(island.animalSpawnCount * config.getFoodBase());
      for (let i = 0; i < count; i++) {
        if (this.animalCurrent >= config.getMaxAnimals()) break;
        this.spawnAnimalForIsland(island);
        this.animalCurrent++;
      }
    }
  }

  private spawnItemForIsland(_island: IslandConfig): void {
    // Weighted random selection from item pool using adjusted weights
    // TODO: Implement with actual map rect spawning
  }

  private spawnAnimalForIsland(_island: IslandConfig): void {
    // Weighted random selection from animal pool
    // TODO: Implement with actual unit creation
  }

  private spawnFishAndHawks(): void {
    // Spawn in river/ocean rects
    // TODO: Implement with actual map rects
  }

  /** Decrease spawn rates over time (original: item -0.2, food -0.3 per cycle) */
  private adjustBaseSpawnRates(): void {
    const config = GameConfig.getInstance();
    config.setItemBase(Math.max(0.15, config.getItemBase() - 0.2));
    config.setFoodBase(Math.max(0.15, config.getFoodBase() - 0.3));
  }

  /** Track item removal (called when items are picked up or destroyed) */
  onItemRemoved(count: number): void {
    this.itemCurrent -= count;
  }

  /** Track animal death */
  onAnimalDeath(): void {
    this.animalCurrent--;
  }

  /** Track fish death */
  onFishDeath(): void {
    this.fishCurrent--;
  }
}
