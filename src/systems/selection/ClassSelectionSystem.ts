/**
 * ClassSelectionSystem - Handles troll class picking during the class selection phase.
 *
 * Ports the class selection mechanism from the original ITT:
 * - Each tribe has a selection totem (shop-style unit)
 * - Players buy/click a hero from the totem to pick their class
 * - Time-limited selection with auto-random on timeout
 * - Only base classes are available for initial selection
 * - Validates no duplicate classes within a tribe (unless -or mode)
 *
 * WC3 Mechanic: Uses a neutral shop building that sells hero units.
 * When a player purchases, a hero of that type is created for them.
 */

import { Unit, Trigger, Timer, MapPlayer } from "w3ts";
import { UnitTypeIds } from "../../data/UnitIds";
import { GameConfig } from "../../config/GameConfig";
import { PlayerManager } from "../../core/PlayerManager";
import { TribeManager } from "../../core/TribeManager";

/** The 7 base troll classes available for selection */
const BASE_CLASSES = [
  { id: "hunter", unitTypeId: UnitTypeIds.HUNTER, name: "Hunter" },
  { id: "mage", unitTypeId: UnitTypeIds.MAGE, name: "Mage" },
  { id: "priest", unitTypeId: UnitTypeIds.PRIEST, name: "Priest" },
  { id: "beastmaster", unitTypeId: UnitTypeIds.BEASTMASTER, name: "Beastmaster" },
  { id: "thief", unitTypeId: UnitTypeIds.THIEF, name: "Thief" },
  { id: "scout", unitTypeId: UnitTypeIds.SCOUT, name: "Scout" },
  { id: "gatherer", unitTypeId: UnitTypeIds.GATHERER, name: "Gatherer" },
];

export class ClassSelectionSystem {
  private static instance: ClassSelectionSystem;

  /** Per-player selected class ID */
  private selections: Map<number, string> = new Map();

  /** Per-tribe set of already-picked classes */
  private tribeSelections: Map<number, Set<string>> = new Map();

  /** Totem units per tribe */
  private totems: Unit[] = [];

  /** Selection triggers */
  private purchaseTrigger: Trigger | null = null;
  private selectionTimer: Timer | null = null;

  /** Callback when all selections complete */
  private onComplete: (() => void) | null = null;

  /** Number of players who have selected */
  private selectCount = 0;
  private totalPlayers = 0;

  private constructor() {}

  static getInstance(): ClassSelectionSystem {
    if (!ClassSelectionSystem.instance) {
      ClassSelectionSystem.instance = new ClassSelectionSystem();
    }
    return ClassSelectionSystem.instance;
  }

  /**
   * Start the class selection phase.
   * Creates totems and listens for player picks.
   */
  start(onComplete: () => void): void {
    this.onComplete = onComplete;
    const config = GameConfig.getInstance();
    const playerManager = PlayerManager.getInstance();
    const tribeManager = TribeManager.getInstance();

    // Count active players
    this.totalPlayers = 0;
    for (let i = 0; i < 12; i++) {
      const p = MapPlayer.fromIndex(i);
      if (p && p.slotState === PLAYER_SLOT_STATE_PLAYING && p.controller === MAP_CONTROL_USER) {
        this.totalPlayers++;
      }
    }

    // Initialize tribe selection tracking
    for (let t = 0; t < config.NUM_TRIBES; t++) {
      this.tribeSelections.set(t, new Set());
    }

    // Create totems for each tribe (at spawn locations)
    // In actual game, totems are placed at predefined map positions
    // For now, the totem creation is handled by the map's preplaced units
    // and we just listen for purchase events

    // Listen for hero purchase (class selection)
    this.purchaseTrigger = new Trigger();
    this.purchaseTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SELL);
    this.purchaseTrigger.addAction(() => this.onHeroPurchased());

    // Start countdown timer
    this.selectionTimer = new Timer();
    this.selectionTimer.start(config.SELECTION_TIME_ALLOWED, false, () => {
      this.autoRandomRemaining();
      this.finishSelection();
    });

    print(`|cff00ffffClass selection has begun!|r Pick your troll within ${config.SELECTION_TIME_ALLOWED} seconds.`);
  }

  /** Handle a player purchasing/selecting a hero class */
  private onHeroPurchased(): void {
    const sold = Unit.fromHandle(GetSoldUnit());
    const buyer = Unit.fromHandle(GetBuyingUnit());

    if (!sold || !buyer) return;

    const player = sold.owner;
    const playerId = player.id;

    // Check if player already picked
    if (this.selections.has(playerId)) {
      print(`|cffff0000${player.name} has already selected a class.|r`);
      sold.destroy();
      return;
    }

    // Find matching class
    const classInfo = BASE_CLASSES.find(c => c.unitTypeId === sold.typeId);
    if (!classInfo) {
      sold.destroy();
      return;
    }

    const config = GameConfig.getInstance();
    const tribeManager = TribeManager.getInstance();
    const tribeId = tribeManager.getTribeForPlayer(player)?.id;

    // Check for banned class
    if (config.BANNED_CLASS_ID === classInfo.id) {
      print(`|cffff0000${classInfo.name} is banned this game!|r`);
      sold.destroy();
      return;
    }

    // Check for duplicate within tribe (unless old random mode)
    if (!config.OLD_RANDOM_ENABLED && tribeId !== undefined) {
      const tribeSet = this.tribeSelections.get(tribeId);
      if (tribeSet && tribeSet.has(classInfo.id)) {
        print(`|cffff0000${classInfo.name} is already taken in your tribe! Pick another class.|r`);
        sold.destroy();
        return;
      }
    }

    // Record selection
    this.selections.set(playerId, classInfo.id);
    if (tribeId !== undefined) {
      this.tribeSelections.get(tribeId)?.add(classInfo.id);
    }

    this.selectCount++;
    print(`|cff00ff00${player.name}|r has chosen |cff00ffff${classInfo.name}|r!`);

    // Check if all players have selected
    if (this.selectCount >= this.totalPlayers) {
      this.finishSelection();
    }
  }

  /** Auto-assign random classes to players who didn't pick in time */
  private autoRandomRemaining(): void {
    for (let i = 0; i < 12; i++) {
      const p = MapPlayer.fromIndex(i);
      if (!p || p.slotState !== PLAYER_SLOT_STATE_PLAYING) continue;
      if (this.selections.has(i)) continue;

      // Pick a random available class
      const config = GameConfig.getInstance();
      const tribeManager = TribeManager.getInstance();
      const tribeId = tribeManager.getTribeForPlayer(p)?.id;
      const tribeSet = tribeId !== undefined ? this.tribeSelections.get(tribeId) : undefined;

      const available = BASE_CLASSES.filter(c => {
        if (config.BANNED_CLASS_ID === c.id) return false;
        if (!config.OLD_RANDOM_ENABLED && tribeSet?.has(c.id)) return false;
        return true;
      });

      if (available.length > 0) {
        const pick = available[Math.floor(Math.random() * available.length)];
        this.selections.set(i, pick.id);
        if (tribeSet) tribeSet.add(pick.id);
        this.selectCount++;
        print(`|cff00ff00${p.name}|r was randomly assigned |cff00ffff${pick.name}|r!`);
      }
    }
  }

  /** Finish the selection phase */
  private finishSelection(): void {
    if (this.purchaseTrigger) {
      this.purchaseTrigger.destroy();
      this.purchaseTrigger = null;
    }
    if (this.selectionTimer) {
      this.selectionTimer.destroy();
      this.selectionTimer = null;
    }

    // Destroy totems
    for (const totem of this.totems) {
      totem.destroy();
    }
    this.totems = [];

    print("|cff00ffffClass selection complete!|r");

    if (this.onComplete) {
      this.onComplete();
    }
  }

  /** Get the selected class ID for a player */
  getSelection(playerId: number): string | undefined {
    return this.selections.get(playerId);
  }

  /** Get the unit type ID for a player's selected class */
  getSelectedUnitTypeId(playerId: number): number | undefined {
    const classId = this.selections.get(playerId);
    if (!classId) return undefined;
    return BASE_CLASSES.find(c => c.id === classId)?.unitTypeId;
  }
}
