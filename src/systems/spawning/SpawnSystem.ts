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

import { Timer, Rectangle, MapPlayer } from "w3ts";
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

/** Neutral passive player for spawned animals/fish */
const NEUTRAL_PASSIVE = 15;

export class SpawnSystem {
  private static instance: SpawnSystem;

  private itemSpawnInfo: SpawnInfo[] = [];
  private animalSpawnInfo: SpawnInfo[] = [];
  private islands: IslandConfig[] = [];
  private fishRegions: Rectangle[] = [];
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
    // Island configs will be populated with actual map rects via addIslandRegion()
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

  /** Register a spawn region for an island (called during map init) */
  addIslandRegion(islandIndex: number, rect: Rectangle, weight: number): void {
    if (islandIndex >= 0 && islandIndex < this.islands.length) {
      this.islands[islandIndex].spawnRegions.push({ rect, weight });
    }
  }

  /** Register a fish spawning region */
  addFishRegion(rect: Rectangle): void {
    this.fishRegions.push(rect);
  }

  /** Get the time-adjusted spawn weight for a SpawnInfo */
  getAdjustedWeight(info: SpawnInfo): number {
    if (info.weightChangeTime === 0) return info.finalWeight;

    const elapsed = this.getElapsedTime();
    const ratio = Math.min(1, Math.max(0, elapsed / info.weightChangeTime));
    return info.initialWeight + (info.finalWeight - info.initialWeight) * ratio;
  }

  private getElapsedTime(): number {
    return TimerGetElapsed(GetGameTimer()) - this.gameStartTime;
  }

  /** Perform weighted random selection from a pool of SpawnInfos */
  private weightedSelect(pool: SpawnInfo[]): number {
    let totalWeight = 0;
    for (const info of pool) {
      totalWeight += this.getAdjustedWeight(info);
    }

    if (totalWeight <= 0) return 0;

    let roll = GetRandomReal(0, totalWeight);
    for (const info of pool) {
      const w = this.getAdjustedWeight(info);
      roll -= w;
      if (roll <= 0) return info.id;
    }

    // Fallback: return last entry
    return pool[pool.length - 1].id;
  }

  /** Get a random position within a Rectangle */
  private getRandomPosInRect(rect: Rectangle): { x: number; y: number } {
    const r = rect.handle;
    return {
      x: GetRandomReal(GetRectMinX(r), GetRectMaxX(r)),
      y: GetRandomReal(GetRectMinY(r), GetRectMaxY(r)),
    };
  }

  /** Select a random region from an island's spawn regions, weighted */
  private selectRegion(island: IslandConfig): Rectangle | null {
    if (island.spawnRegions.length === 0) return null;

    let totalWeight = 0;
    for (const region of island.spawnRegions) {
      totalWeight += region.weight;
    }

    let roll = GetRandomReal(0, totalWeight);
    for (const region of island.spawnRegions) {
      roll -= region.weight;
      if (roll <= 0) return region.rect;
    }

    return island.spawnRegions[island.spawnRegions.length - 1].rect;
  }

  /** Start the spawn cycles (called when gameplay phase begins) */
  startSpawnCycles(): void {
    this.gameStartTime = TimerGetElapsed(GetGameTimer());

    // Initial spawns (triple burst like original)
    this.handleAnimalSpawning();
    // Staggered: animals at 0/5/10s, items at 15/20s, fish at 25s
    const initTimer1 = new Timer();
    initTimer1.start(5, false, () => {
      this.handleAnimalSpawning();
      initTimer1.destroy();
    });

    const initTimer2 = new Timer();
    initTimer2.start(10, false, () => {
      this.handleAnimalSpawning();
      initTimer2.destroy();
    });

    const initTimer3 = new Timer();
    initTimer3.start(15, false, () => {
      this.handleItemSpawning();
      initTimer3.destroy();
    });

    const initTimer4 = new Timer();
    initTimer4.start(20, false, () => {
      this.handleItemSpawning();
      initTimer4.destroy();
    });

    const initTimer5 = new Timer();
    initTimer5.start(25, false, () => {
      this.spawnFishAndHawks();
      initTimer5.destroy();
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
      const count = Math.ceil(island.itemSpawnCount * config.ITEM_SPAWN_RATE);
      for (let i = 0; i < count; i++) {
        if (this.itemCurrent >= config.MAX_ITEMS) break;
        this.spawnItemForIsland(island);
        this.itemCurrent++;
      }
    }
  }

  private handleAnimalSpawning(): void {
    const config = GameConfig.getInstance();
    for (const island of this.islands) {
      const count = Math.ceil(island.animalSpawnCount * config.FOOD_SPAWN_RATE);
      for (let i = 0; i < count; i++) {
        if (this.animalCurrent >= config.MAX_ANIMALS) break;
        this.spawnAnimalForIsland(island);
        this.animalCurrent++;
      }
    }
  }

  private spawnItemForIsland(island: IslandConfig): void {
    const region = this.selectRegion(island);
    if (!region) return;

    const itemId = this.weightedSelect(this.itemSpawnInfo);
    if (itemId === 0) return;

    const pos = this.getRandomPosInRect(region);
    CreateItem(itemId, pos.x, pos.y);
  }

  private spawnAnimalForIsland(island: IslandConfig): void {
    const region = this.selectRegion(island);
    if (!region) return;

    const unitId = this.weightedSelect(this.animalSpawnInfo);
    if (unitId === 0) return;

    const pos = this.getRandomPosInRect(region);
    const facing = GetRandomReal(0, 360);
    CreateUnit(Player(NEUTRAL_PASSIVE), unitId, pos.x, pos.y, facing);
  }

  private spawnFishAndHawks(): void {
    const config = GameConfig.getInstance();

    // Original uses a 13-sided roll per spawn region:
    // 4/13 = Hawk, 2/13 = Green Fish, 7/13 = Fish
    for (const region of this.fishRegions) {
      if (this.fishCurrent >= config.MAX_ANIMALS) break;

      const roll = GetRandomInt(1, 13);
      let unitId: number;
      if (roll <= 4) {
        unitId = UnitTypeIds.HAWK;
      } else if (roll <= 6) {
        unitId = UnitTypeIds.GREEN_FISH;
      } else {
        unitId = UnitTypeIds.FISH;
      }

      const pos = this.getRandomPosInRect(region);
      const facing = GetRandomReal(0, 360);
      CreateUnit(Player(NEUTRAL_PASSIVE), unitId, pos.x, pos.y, facing);
      this.fishCurrent++;
    }
  }

  /** Decrease spawn rates over time (original: item -0.2, food -0.3 per cycle) */
  private adjustBaseSpawnRates(): void {
    const config = GameConfig.getInstance();
    config.ITEM_SPAWN_RATE = Math.max(0.15, config.ITEM_SPAWN_RATE - 0.2);
    config.FOOD_SPAWN_RATE = Math.max(0.15, config.FOOD_SPAWN_RATE - 0.3);
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
