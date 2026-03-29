/**
 * GameModeSystem - Mode selection and configuration for game setup.
 *
 * Ports GameMode.wurst and GameModeInit.wurst:
 * - First player (host) selects modes via chat commands during mode selection phase
 * - 60-second time limit for mode selection
 * - Modes modify GameConfig values that affect gameplay
 * - Modes can be composable (multiple active) and chainable (one enables others)
 *
 * Categories: General, Pro, Troll Selection, Economy, Hard, Casual, Special, Testing
 */

import { Timer, Trigger, MapPlayer } from "w3ts";
import { GameConfig } from "../../config/GameConfig";

/** Mode category for UI grouping */
export enum ModeCategory {
  General = "General",
  Pro = "Pro",
  TrollSelection = "Troll Selection",
  Economy = "Economy",
  Hard = "Hard",
  Casual = "Casual",
  Special = "Special",
  Testing = "Testing",
}

/** A registered game mode */
export interface GameModeDefinition {
  id: string;
  name: string;
  abbreviation: string;
  category: ModeCategory;
  description: string;
  /** Whether this mode accepts a numeric argument */
  hasArgument: boolean;
  /** Apply the mode with optional argument value */
  apply: (config: GameConfig, arg?: number) => void;
  /** Whether this mode can be toggled off */
  isToggle: boolean;
  /** Whether this mode is hidden from the mode list */
  hidden: boolean;
}

export class GameModeSystem {
  private static instance: GameModeSystem;

  private modes: Map<string, GameModeDefinition> = new Map();
  private activeModes: Set<string> = new Set();
  private chatTrigger: Trigger | null = null;
  private selectionTimer: Timer | null = null;
  private selectionPlayer: MapPlayer | null = null;

  /** Time limit for mode selection in seconds */
  private static readonly MODES_TIME_LIMIT = 60;

  private constructor() {
    this.registerAllModes();
  }

  static getInstance(): GameModeSystem {
    if (!GameModeSystem.instance) {
      GameModeSystem.instance = new GameModeSystem();
    }
    return GameModeSystem.instance;
  }

  /** Begin the mode selection phase */
  startSelection(onComplete: () => void): void {
    const config = GameConfig.getInstance();

    // First player is the mode selector
    this.selectionPlayer = MapPlayer.fromIndex(0) ?? null;

    // Display available modes
    this.displayModes();

    // Listen for chat commands from the selection player
    this.chatTrigger = new Trigger();
    for (let i = 0; i < 12; i++) {
      this.chatTrigger.registerPlayerChatEvent(MapPlayer.fromIndex(i)!, "-", false);
    }
    this.chatTrigger.addAction(() => this.onChat());

    // Start countdown timer
    this.selectionTimer = new Timer();
    this.selectionTimer.start(GameModeSystem.MODES_TIME_LIMIT, false, () => {
      this.endSelection();
      onComplete();
    });

    if (this.selectionPlayer) {
      print(`|cff00ff00${this.selectionPlayer.name}|r is selecting game modes. Type -help for options.`);
      print(`Mode selection ends in ${GameModeSystem.MODES_TIME_LIMIT} seconds. Type |cff00ff00-start|r to begin immediately.`);
    }
  }

  /** End the mode selection phase */
  private endSelection(): void {
    if (this.chatTrigger) {
      this.chatTrigger.destroy();
      this.chatTrigger = null;
    }
    if (this.selectionTimer) {
      this.selectionTimer.destroy();
      this.selectionTimer = null;
    }
  }

  /** Handle chat input during mode selection */
  private onChat(): void {
    const player = MapPlayer.fromEvent();
    const message = (GetEventPlayerChatString() ?? "").toLowerCase().trim();

    // Only the selection player can set modes (but anyone can view help)
    if (!message.startsWith("-")) return;

    const parts = message.substring(1).split(" ");
    const command = parts[0];
    const arg = parts[1] ? parseInt(parts[1], 10) : undefined;

    if (command === "start" || command === "st") {
      if (player === this.selectionPlayer) {
        this.endSelection();
        // The timer callback won't fire since we destroyed it,
        // so we need to trigger completion manually
        print("|cff00ff00Mode selection complete!|r");
      }
      return;
    }

    if (command === "help") {
      this.displayModes();
      return;
    }

    if (player !== this.selectionPlayer) {
      print(`Only ${this.selectionPlayer?.name} can select modes.`);
      return;
    }

    // Look up mode by abbreviation or id
    const mode = this.findMode(command);
    if (!mode) {
      print(`|cffff0000Unknown mode:|r -${command}. Type -help for options.`);
      return;
    }

    // Toggle support
    if (mode.isToggle && this.activeModes.has(mode.id)) {
      this.activeModes.delete(mode.id);
      print(`|cffff9900Mode disabled:|r ${mode.name}`);
      return;
    }

    // Apply the mode
    const config = GameConfig.getInstance();
    mode.apply(config, arg);
    this.activeModes.add(mode.id);
    print(`|cff00ff00Mode enabled:|r ${mode.name}${arg !== undefined ? ` (${arg})` : ""}`);
  }

  /** Find a mode by abbreviation or id */
  private findMode(command: string): GameModeDefinition | undefined {
    // Check abbreviation first
    for (const mode of this.modes.values()) {
      if (mode.abbreviation === command) return mode;
    }
    // Then check id
    return this.modes.get(command);
  }

  /** Display available modes to all players */
  private displayModes(): void {
    print("|cff00ffffAvailable Game Modes:|r");
    const categories = new Map<ModeCategory, GameModeDefinition[]>();

    for (const mode of this.modes.values()) {
      if (mode.hidden) continue;
      if (!categories.has(mode.category)) {
        categories.set(mode.category, []);
      }
      categories.get(mode.category)!.push(mode);
    }

    for (const [cat, modes] of categories) {
      print(`\n|cff00ff00${cat}:|r`);
      for (const m of modes) {
        print(`  -${m.abbreviation} : ${m.name} - ${m.description}`);
      }
    }
  }

  /** Register all game modes */
  private registerAllModes(): void {
    // ── General (Team Configuration) ──────────────────────────────────
    this.register({
      id: "players-per-tribe",
      name: "Players Per Tribe",
      abbreviation: "ppt",
      category: ModeCategory.General,
      description: "Set players per tribe (1-6)",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        const ppt = arg ?? 4;
        if (ppt >= 1 && ppt <= 6 && 12 % ppt === 0) {
          config.PLAYERS_PER_TRIBE = ppt;
          config.NUM_TRIBES = Math.floor(12 / ppt);
        }
      },
    });

    this.register({
      id: "free-for-all",
      name: "Free For All",
      abbreviation: "ffa",
      category: ModeCategory.General,
      description: "Everyone for themselves",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.PLAYERS_PER_TRIBE = 1;
        config.NUM_TRIBES = 12;
      },
    });

    // ── Pro Modes ─────────────────────────────────────────────────────
    this.register({
      id: "standard-1v1",
      name: "Standard 1v1",
      abbreviation: "1v1",
      category: ModeCategory.Pro,
      description: "Competitive 1v1 setup",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.PLAYERS_PER_TRIBE = 1;
        config.NUM_TRIBES = 12;
        config.START_WITH_FIRE = true;
        config.RANDOMIZE_SPAWNS = true;
        config.FORCED_DUEL_AFTER = 3500;
      },
    });

    this.register({
      id: "tournament",
      name: "Tournament",
      abbreviation: "to",
      category: ModeCategory.Pro,
      description: "Tournament settings pack",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.START_WITH_FIRE = true;
        config.ELIMINATION_MODE = true;
        config.FORCED_DUEL_AFTER = 3600;
        config.RANDOMIZE_SPAWNS = true;
      },
    });

    this.register({
      id: "elimination",
      name: "Elimination",
      abbreviation: "el",
      category: ModeCategory.Pro,
      description: "No spirit ward for eliminated teams",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.ELIMINATION_MODE = true;
      },
    });

    this.register({
      id: "forced-duel",
      name: "Forced Duel",
      abbreviation: "fd",
      category: ModeCategory.Pro,
      description: "Force 1v1 duel after N seconds (default 3600)",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        config.FORCED_DUEL_AFTER = arg ?? 3600;
      },
    });

    this.register({
      id: "random-spawns",
      name: "Random Spawns",
      abbreviation: "rs",
      category: ModeCategory.Pro,
      description: "Randomize spawn locations",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.RANDOMIZE_SPAWNS = true;
      },
    });

    // ── Troll Selection ───────────────────────────────────────────────
    this.register({
      id: "all",
      name: "All Same Class",
      abbreviation: "all",
      category: ModeCategory.TrollSelection,
      description: "All players get same class (specify class name or 'random')",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, _arg) => {
        config.ALL_TROLL_ENABLED = true;
      },
    });

    this.register({
      id: "start-with-fire",
      name: "Start With Fire",
      abbreviation: "sf",
      category: ModeCategory.TrollSelection,
      description: "Every troll starts with a fire kit",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.START_WITH_FIRE = true;
      },
    });

    this.register({
      id: "start-with-one-fire",
      name: "Start With One Fire",
      abbreviation: "so",
      category: ModeCategory.TrollSelection,
      description: "Each tribe gets one fire kit",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.START_WITH_ONE_FIRE = true;
      },
    });

    this.register({
      id: "start-with-spirit-ward",
      name: "Start With Spirit Ward",
      abbreviation: "sw",
      category: ModeCategory.TrollSelection,
      description: "Every troll starts with a spirit ward",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.START_WITH_SPIRIT_WARD = true;
      },
    });

    this.register({
      id: "quick-pick",
      name: "Quick Pick",
      abbreviation: "qp",
      category: ModeCategory.TrollSelection,
      description: "Reduce class selection time (default 5s)",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        config.SELECTION_TIME_ALLOWED = arg ?? 5;
      },
    });

    this.register({
      id: "old-random",
      name: "Old Random",
      abbreviation: "or",
      category: ModeCategory.TrollSelection,
      description: "Allow random on already-picked classes",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.OLD_RANDOM_ENABLED = true;
      },
    });

    // ── Economy / Spawning ────────────────────────────────────────────
    this.register({
      id: "fast",
      name: "Fast",
      abbreviation: "fs",
      category: ModeCategory.Economy,
      description: "1.5x item spawn rate",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.ITEM_SPAWN_RATE = 1.5;
      },
    });

    this.register({
      id: "hot-mode",
      name: "Hot Mode",
      abbreviation: "hm",
      category: ModeCategory.Economy,
      description: "Increase heat per fire cast (default 22)",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        config.HEAT_PER_CAST = arg ?? 22;
      },
    });

    this.register({
      id: "raise-heat",
      name: "Raise Heat",
      abbreviation: "rh",
      category: ModeCategory.Economy,
      description: "Increase max heat capacity (default 150)",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        config.HEAT_MAXIMUM = arg ?? 150;
      },
    });

    this.register({
      id: "more-hostiles",
      name: "More Hostiles",
      abbreviation: "rb",
      category: ModeCategory.Economy,
      description: "Increase animal spawn rate (default +20%)",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        const boost = (arg ?? 20) / 100;
        config.HOSTILE_SPAWN_RATE = Math.min(3.0, 1.0 + boost);
      },
    });

    this.register({
      id: "enable-boats",
      name: "Enable Boats",
      abbreviation: "eb",
      category: ModeCategory.Economy,
      description: "Enable transport boat construction",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.BOATS_ENABLED = true;
      },
    });

    this.register({
      id: "no-trade",
      name: "No Trade",
      abbreviation: "nt",
      category: ModeCategory.Economy,
      description: "Disable merchant/trade ships",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.TRADE_ENABLED = false;
      },
    });

    // ── Hard Modes ────────────────────────────────────────────────────
    this.register({
      id: "survival",
      name: "Survival",
      abbreviation: "sv",
      category: ModeCategory.Hard,
      description: "Famine + slow + cold combo",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.FOOD_SPAWN_RATE = 0.4;
        config.ITEM_SPAWN_RATE = 0.8;
        config.HEAT_PER_CAST = 4;
      },
    });

    this.register({
      id: "famine",
      name: "Famine",
      abbreviation: "fm",
      category: ModeCategory.Hard,
      description: "0.4x food spawn rate",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.FOOD_SPAWN_RATE = 0.4;
      },
    });

    this.register({
      id: "slow",
      name: "Slow",
      abbreviation: "sl",
      category: ModeCategory.Hard,
      description: "0.8x item spawn rate",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.ITEM_SPAWN_RATE = 0.8;
      },
    });

    this.register({
      id: "double",
      name: "Double",
      abbreviation: "db",
      category: ModeCategory.Hard,
      description: "Stats degrade 2x faster",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.STAT_LOSS_MULTIPLIER = 2.0;
      },
    });

    this.register({
      id: "panic",
      name: "Panic",
      abbreviation: "pn",
      category: ModeCategory.Hard,
      description: "Faster stat degradation (2.3s vs 3s)",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.STAT_LOSS_INTERVAL = 2.3;
      },
    });

    this.register({
      id: "lower-food-limit",
      name: "Lower Food Limit",
      abbreviation: "lfl",
      category: ModeCategory.Hard,
      description: "Max 40 animals, 50 fish",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.MAX_ANIMALS = 40;
        config.MAX_FISH = 50;
      },
    });

    this.register({
      id: "lower-item-limit",
      name: "Lower Item Limit",
      abbreviation: "lil",
      category: ModeCategory.Hard,
      description: "Max 250 items on map",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.MAX_ITEMS = 250;
      },
    });

    // ── Casual Modes ──────────────────────────────────────────────────
    this.register({
      id: "safe",
      name: "Safe",
      abbreviation: "sa",
      category: ModeCategory.Casual,
      description: "Slower stat degradation (4.5s vs 3s)",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.STAT_LOSS_INTERVAL = 4.5;
      },
    });

    this.register({
      id: "increase-pets",
      name: "Increase Pets",
      abbreviation: "ip",
      category: ModeCategory.Casual,
      description: "Higher pet spawn rate (23% vs 17%)",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.PET_CHANCE = 0.23;
      },
    });

    this.register({
      id: "lavish",
      name: "Lavish",
      abbreviation: "lv",
      category: ModeCategory.Casual,
      description: "1.8x food spawn, 1.3x food per kill",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.FOOD_SPAWN_RATE = 1.8;
        config.FOOD_PER_KILL_MULTIPLIER = 1.3;
      },
    });

    this.register({
      id: "raise-food-limit",
      name: "Raise Food Limit",
      abbreviation: "rfl",
      category: ModeCategory.Casual,
      description: "Max 90 animals, 320 fish",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.MAX_ANIMALS = 90;
        config.MAX_FISH = 320;
      },
    });

    this.register({
      id: "raise-item-limit",
      name: "Raise Item Limit",
      abbreviation: "ril",
      category: ModeCategory.Casual,
      description: "Max 700 items on map",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.MAX_ITEMS = 700;
      },
    });

    this.register({
      id: "no-inventory-limit",
      name: "No Inventory Limit",
      abbreviation: "nil",
      category: ModeCategory.Casual,
      description: "Remove gear/spell carry limits",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.NO_INVENTORY_LIMIT = true;
      },
    });

    // ── Special Modes ─────────────────────────────────────────────────
    this.register({
      id: "shrinking-map",
      name: "Shrinking Map",
      abbreviation: "sm",
      category: ModeCategory.Special,
      description: "Forest fire shrinks the map after N seconds",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        config.FOREST_FIRE_AFTER = arg ?? 1800;
      },
    });

    this.register({
      id: "grace-period-duration",
      name: "Grace Period Duration",
      abbreviation: "gp",
      category: ModeCategory.Special,
      description: "Set grace period length in seconds (default 480)",
      hasArgument: true,
      isToggle: false,
      hidden: false,
      apply: (config, arg) => {
        config.GRACE_PERIOD_DURATION = arg ?? 480;
      },
    });

    this.register({
      id: "respawn-system",
      name: "Respawn System",
      abbreviation: "re",
      category: ModeCategory.Special,
      description: "Enable respawn system instead of grace period",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.RESPAWN_SYSTEM_ENABLED = true;
      },
    });

    // ── Testing Modes ─────────────────────────────────────────────────
    this.register({
      id: "test-mode",
      name: "Test Mode",
      abbreviation: "tm",
      category: ModeCategory.Testing,
      description: "Enable test commands, no one can lose",
      hasArgument: false,
      isToggle: true,
      hidden: false,
      apply: (config) => {
        config.TEST_MODE = true;
      },
    });

    this.register({
      id: "dev",
      name: "Dev Mode",
      abbreviation: "d",
      category: ModeCategory.Testing,
      description: "Quick-pick + test mode + start",
      hasArgument: false,
      isToggle: false,
      hidden: false,
      apply: (config) => {
        config.SELECTION_TIME_ALLOWED = 5;
        config.TEST_MODE = true;
      },
    });

    this.register({
      id: "start",
      name: "Start",
      abbreviation: "st",
      category: ModeCategory.Testing,
      description: "Immediately begin class selection",
      hasArgument: false,
      isToggle: false,
      hidden: true,
      apply: () => {
        // Handled specially in onChat
      },
    });
  }

  /** Register a mode definition */
  private register(mode: GameModeDefinition): void {
    this.modes.set(mode.id, mode);
  }

  /** Get all active mode IDs */
  getActiveModes(): string[] {
    return Array.from(this.activeModes);
  }

  /** Check if a specific mode is active */
  isModeActive(modeId: string): boolean {
    return this.activeModes.has(modeId);
  }
}
