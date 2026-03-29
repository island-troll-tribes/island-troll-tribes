/**
 * GameConfig - Global game configuration and balance constants.
 *
 * Consolidates GameConstants.wurst and GameConfig.wurst into a single
 * configurable singleton. Values can be modified by game modes.
 *
 * All balance numbers are preserved from the original v3.11c.
 */

export class GameConfig {
  private static instance: GameConfig;

  // ─── Attribute Bonuses (from war3mapMisc.txt) ──────────────────────
  readonly AGI_ATTACK_SPEED_BONUS = 0.01;
  readonly AGI_DEFENSE_BASE = -1;
  readonly AGI_DEFENSE_BONUS = 0.1;
  readonly AGI_MOVE_BONUS = 7.5;
  readonly STR_ATTACK_BONUS = 0.5;
  readonly STR_HP_BONUS = 8;
  readonly STR_REGEN_BONUS = 0;
  readonly INT_MANA_BONUS = 8;
  readonly INT_REGEN_BONUS = 0;

  // ─── Hero Leveling ─────────────────────────────────────────────────
  readonly MAX_HERO_LEVEL = 30;
  readonly MAX_UNIT_LEVEL = 30;
  readonly EXP_RANGE = 1200.0;
  readonly GOK_MULTIPLIER = 1.5;

  /** Experience multiplier by class tier: BASE=4, SUB=3, SUPER=2 */
  readonly EXP_MULTIPLIER_BASE = 4;
  readonly EXP_MULTIPLIER_SUB = 3;
  readonly EXP_MULTIPLIER_SUPER = 2;

  /** Required XP per level: 150*level + 50*level^2 */
  calcRequiredExp(level: number): number {
    return 150 * level + 50 * level * level;
  }

  // ─── Movement / Combat ─────────────────────────────────────────────
  readonly MAX_UNIT_SPEED = 522;
  readonly MIN_UNIT_SPEED = 100;
  readonly FROST_MOVE_SPEED_DECREASE = 0.15;
  readonly GUARD_DISTANCE = 500.0;

  // ─── Economy ───────────────────────────────────────────────────────
  readonly FOOD_CEILING = 999;
  readonly DROP_ITEM_RANGE = 150;
  readonly PAWN_ITEM_RANGE = 400;
  readonly PAWN_ITEM_RATE = 0.65;

  // ─── Game Mode Configurable Values ─────────────────────────────────
  private numTribes = 4;
  private maxAnimals = 80;
  private fishMax = 80;
  private itemMax = 300;
  private itemBase = 1.0;
  private foodBase = 1.0;
  private hostileSpawnRate = 1.0;
  private foodForKillProportion = 1.0;

  // ─── Talent System Config ──────────────────────────────────────────
  readonly TALENT_POINTS_PER_LEVEL = 1;
  readonly TALENT_POINTS_BONUS_SUB = 2; // bonus points on sub-class evolution
  readonly TALENT_POINTS_BONUS_SUPER = 3; // bonus on super-class evolution

  private constructor() {}

  static getInstance(): GameConfig {
    if (!GameConfig.instance) {
      GameConfig.instance = new GameConfig();
    }
    return GameConfig.instance;
  }

  /** Load default configuration values */
  loadDefaults(): void {
    this.numTribes = 4;
    this.maxAnimals = 80;
    this.fishMax = 80;
    this.itemMax = 300;
    this.itemBase = 1.0;
    this.foodBase = 1.0;
    this.hostileSpawnRate = 1.0;
    this.foodForKillProportion = 1.0;
  }

  // ─── Getters / Setters ─────────────────────────────────────────────

  getNumTribes(): number {
    return this.numTribes;
  }
  setNumTribes(n: number): void {
    this.numTribes = n;
  }

  getMaxAnimals(): number {
    return this.maxAnimals;
  }
  setMaxAnimals(n: number): void {
    this.maxAnimals = n;
  }

  getFishMax(): number {
    return this.fishMax;
  }
  setFishMax(n: number): void {
    this.fishMax = n;
  }

  getItemMax(): number {
    return this.itemMax;
  }
  setItemMax(n: number): void {
    this.itemMax = n;
  }

  getItemBase(): number {
    return this.itemBase;
  }
  setItemBase(n: number): void {
    this.itemBase = n;
  }

  getFoodBase(): number {
    return this.foodBase;
  }
  setFoodBase(n: number): void {
    this.foodBase = n;
  }

  getHostileSpawnRate(): number {
    return this.hostileSpawnRate;
  }
  setHostileSpawnRate(n: number): void {
    this.hostileSpawnRate = n;
  }

  getFoodForKillProportion(): number {
    return this.foodForKillProportion;
  }
  setFoodForKillProportion(n: number): void {
    this.foodForKillProportion = n;
  }
}
