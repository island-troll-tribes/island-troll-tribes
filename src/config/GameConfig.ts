/**
 * GameConfig - Global game configuration and balance constants.
 *
 * Consolidates GameConstants.wurst, GameConfig.wurst, and mode-configurable
 * values into a single mutable singleton. Game modes modify public fields
 * during the mode selection phase.
 *
 * All balance numbers preserved from the original v3.11c.
 */

export class GameConfig {
  private static instance: GameConfig;

  // ─── Attribute Bonuses (from war3mapMisc.txt, read-only) ────────────
  readonly AGI_ATTACK_SPEED_BONUS = 0.01;
  readonly AGI_DEFENSE_BASE = -1;
  readonly AGI_DEFENSE_BONUS = 0.1;
  readonly AGI_MOVE_BONUS = 7.5;
  readonly STR_ATTACK_BONUS = 0.5;
  readonly STR_HP_BONUS = 8;
  readonly STR_REGEN_BONUS = 0;
  readonly INT_MANA_BONUS = 8;
  readonly INT_REGEN_BONUS = 0;

  // ─── Hero Leveling (read-only) ─────────────────────────────────────
  readonly MAX_HERO_LEVEL = 30;
  readonly MAX_UNIT_LEVEL = 30;
  readonly EXP_RANGE = 1200.0;
  readonly GOK_MULTIPLIER = 1.5;
  readonly EXP_MULTIPLIER_BASE = 4;
  readonly EXP_MULTIPLIER_SUB = 3;
  readonly EXP_MULTIPLIER_SUPER = 2;

  /** Required XP per level: 150*level + 50*level^2 */
  calcRequiredExp(level: number): number {
    return 150 * level + 50 * level * level;
  }

  // ─── Movement / Combat (read-only) ─────────────────────────────────
  readonly MAX_UNIT_SPEED = 522;
  readonly MIN_UNIT_SPEED = 100;
  readonly FROST_MOVE_SPEED_DECREASE = 0.15;
  readonly GUARD_DISTANCE = 500.0;

  // ─── Economy (read-only) ───────────────────────────────────────────
  readonly FOOD_CEILING = 999;
  readonly DROP_ITEM_RANGE = 150;
  readonly PAWN_ITEM_RANGE = 400;
  readonly PAWN_ITEM_RATE = 0.65;

  // ─── Talent System (read-only) ─────────────────────────────────────
  readonly TALENT_POINTS_PER_LEVEL = 1;
  readonly TALENT_POINTS_BONUS_SUB = 2;
  readonly TALENT_POINTS_BONUS_SUPER = 3;

  // ═══════════════════════════════════════════════════════════════════
  // MODE-CONFIGURABLE VALUES (modified by GameModeSystem)
  // ═══════════════════════════════════════════════════════════════════

  // ─── Team Configuration ────────────────────────────────────────────
  NUM_TRIBES = 4;
  PLAYERS_PER_TRIBE = 3;

  // ─── Spawn Rates ───────────────────────────────────────────────────
  MAX_ANIMALS = 60;
  MAX_FISH = 100;
  MAX_ITEMS = 350;
  ITEM_SPAWN_RATE = 1.0;
  FOOD_SPAWN_RATE = 1.0;
  HOSTILE_SPAWN_RATE = 1.0;
  FOOD_PER_KILL_MULTIPLIER = 1.0;
  PET_CHANCE = 0.17;

  // ─── Heat / Survival ──────────────────────────────────────────────
  HEAT_PER_CAST = 15;
  HEAT_MAXIMUM = 100;
  STAT_LOSS_AMOUNT = 1; // base heat/mana/HP lost per tick
  STAT_LOSS_INTERVAL = 3.0; // seconds between stat loss ticks
  STAT_GAIN_INTERVAL = 35.0; // seconds between gear-heat gain ticks
  STAT_LOSS_MULTIPLIER = 1.0;

  // ─── Timing ────────────────────────────────────────────────────────
  GRACE_PERIOD_DURATION = 480;
  FORCED_DUEL_AFTER = 0; // 0 = disabled
  SELECTION_TIME_ALLOWED = 60;
  FOREST_FIRE_AFTER = 0; // 0 = disabled
  FOREST_FIRE_DISTANCE = 4000; // min safe radius when fire active

  // ─── Game Rules ────────────────────────────────────────────────────
  START_WITH_FIRE = false;
  START_WITH_ONE_FIRE = false;
  START_WITH_SPIRIT_WARD = false;
  RANDOMIZE_SPAWNS = false;
  ELIMINATION_MODE = false;
  TRADE_ENABLED = true;
  BOATS_ENABLED = false;
  TEST_MODE = false;
  ALL_TROLL_ENABLED = false;
  ALL_TROLL_CLASS = "";
  OLD_RANDOM_ENABLED = false;
  NO_INVENTORY_LIMIT = false;
  RESPAWN_SYSTEM_ENABLED = false;
  BANNED_CLASS_ID = "";

  private constructor() {}

  static getInstance(): GameConfig {
    if (!GameConfig.instance) {
      GameConfig.instance = new GameConfig();
    }
    return GameConfig.instance;
  }

  /** Load/reset all configurable values to defaults */
  loadDefaults(): void {
    this.NUM_TRIBES = 4;
    this.PLAYERS_PER_TRIBE = 3;
    this.MAX_ANIMALS = 60;
    this.MAX_FISH = 100;
    this.MAX_ITEMS = 350;
    this.ITEM_SPAWN_RATE = 1.0;
    this.FOOD_SPAWN_RATE = 1.0;
    this.HOSTILE_SPAWN_RATE = 1.0;
    this.FOOD_PER_KILL_MULTIPLIER = 1.0;
    this.PET_CHANCE = 0.17;
    this.HEAT_PER_CAST = 15;
    this.HEAT_MAXIMUM = 100;
    this.STAT_LOSS_AMOUNT = 1;
    this.STAT_LOSS_INTERVAL = 3.0;
    this.STAT_GAIN_INTERVAL = 35.0;
    this.STAT_LOSS_MULTIPLIER = 1.0;
    this.GRACE_PERIOD_DURATION = 480;
    this.FORCED_DUEL_AFTER = 0;
    this.SELECTION_TIME_ALLOWED = 60;
    this.FOREST_FIRE_AFTER = 0;
    this.FOREST_FIRE_DISTANCE = 4000;
    this.START_WITH_FIRE = false;
    this.START_WITH_ONE_FIRE = false;
    this.START_WITH_SPIRIT_WARD = false;
    this.RANDOMIZE_SPAWNS = false;
    this.ELIMINATION_MODE = false;
    this.TRADE_ENABLED = true;
    this.BOATS_ENABLED = false;
    this.TEST_MODE = false;
    this.ALL_TROLL_ENABLED = false;
    this.ALL_TROLL_CLASS = "";
    this.OLD_RANDOM_ENABLED = false;
    this.NO_INVENTORY_LIMIT = false;
    this.RESPAWN_SYSTEM_ENABLED = false;
    this.BANNED_CLASS_ID = "";
  }

  // ─── Getters (for systems that need method-style access) ───────────

  getNumTribes(): number {
    return this.NUM_TRIBES;
  }

  getHeatMaximum(): number {
    return this.HEAT_MAXIMUM;
  }

  getHeatPerCast(): number {
    return this.HEAT_PER_CAST;
  }

  getStatLossAmount(): number {
    return this.STAT_LOSS_AMOUNT;
  }

  getStatLossInterval(): number {
    return this.STAT_LOSS_INTERVAL;
  }

  getStatGainInterval(): number {
    return this.STAT_GAIN_INTERVAL;
  }

  getGracePeriodDuration(): number {
    return this.GRACE_PERIOD_DURATION;
  }
}
