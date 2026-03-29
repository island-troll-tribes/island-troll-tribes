/**
 * ScoreboardFrame - Multiboard-based scoreboard for gameplay stats.
 *
 * Ports ScoreBoard.wurst, TribeBoard.wurst, and Boards.wurst:
 *
 * Two display modes:
 * 1. TribeBoard (default during gameplay): Shows per-player HP, mana, gold, level.
 *    Updates every 1 second. Title bar shows game timers.
 * 2. ScoreBoard (toggled or postgame): Shows kills by beast type, damage dealt,
 *    healing, gold acquired, meat eaten per player.
 *
 * Uses WC3 Multiboard API via w3ts wrappers.
 */

import { Timer, MapPlayer } from "w3ts";
import { GameConfig } from "../../config/GameConfig";

/** Stats tracked per player for the detailed scoreboard */
export interface PlayerStats {
  elkKills: number;
  hawkKills: number;
  snakeKills: number;
  wolfKills: number;
  bearKills: number;
  pantherKills: number;
  damageDealt: number;
  healingSelf: number;
  healingAlly: number;
  goldAcquired: number;
  meatEaten: number;
}

/** Column definition for multiboard layout */
interface BoardColumn {
  label: string;
  width: number;
  iconPath?: string;
}

export class ScoreboardFrame {
  private tribeBoard: multiboard | null = null;
  private scoreBoard: multiboard | null = null;
  private updateTimer: Timer | null = null;
  private playerStats: Map<number, PlayerStats> = new Map();
  private showingDetailed = false;

  // ─── Tribe Board Column Layout ───────────────────────────────────
  private static readonly TRIBE_COLUMNS: BoardColumn[] = [
    { label: "Name", width: 0.13 },
    { label: "Lvl", width: 0.05, iconPath: "ReplaceableTextures/CommandButtons/BTNSelectHeroOn.blp" },
    { label: "HP", width: 0.06, iconPath: "ReplaceableTextures/CommandButtons/BTNHealthStone.blp" },
    { label: "Mana", width: 0.06, iconPath: "ReplaceableTextures/CommandButtons/BTNManaStone.blp" },
    { label: "Heat", width: 0.05, iconPath: "ReplaceableTextures/CommandButtons/BTNFire.blp" },
  ];

  // ─── Score Board Column Layout ───────────────────────────────────
  private static readonly SCORE_COLUMNS: BoardColumn[] = [
    { label: "Name", width: 0.13 },
    { label: "Lvl", width: 0.04 },
    { label: "Elk", width: 0.04 },
    { label: "Hawk", width: 0.04 },
    { label: "Snake", width: 0.04 },
    { label: "Wolf", width: 0.04 },
    { label: "Bear", width: 0.04 },
    { label: "Panther", width: 0.04 },
    { label: "Dmg", width: 0.06 },
    { label: "Heal", width: 0.06 },
    { label: "Gold", width: 0.05 },
    { label: "Meat", width: 0.05 },
  ];

  constructor() {
    // Initialize stats for all player slots
    for (let i = 0; i < 12; i++) {
      this.playerStats.set(i, {
        elkKills: 0,
        hawkKills: 0,
        snakeKills: 0,
        wolfKills: 0,
        bearKills: 0,
        pantherKills: 0,
        damageDealt: 0,
        healingSelf: 0,
        healingAlly: 0,
        goldAcquired: 0,
        meatEaten: 0,
      });
    }
  }

  /** Initialize and show the tribe board for gameplay */
  initialize(): void {
    this.createTribeBoard();
    this.startPeriodicUpdate();
  }

  /** Create the live tribe board (HP/Mana/Heat display) */
  private createTribeBoard(): void {
    const cols = ScoreboardFrame.TRIBE_COLUMNS;
    const rows = this.countActivePlayers() + 1; // +1 for header

    this.tribeBoard = CreateMultiboardBJ(cols.length, rows, "Island Troll Tribes") ?? null;

    // Set column widths and header row
    for (let c = 0; c < cols.length; c++) {
      MultiboardSetItemWidthBJ(this.tribeBoard!, c + 1, 0, cols[c].width * 100);

      // Header row
      MultiboardSetItemValueBJ(this.tribeBoard!, c + 1, 1, cols[c].label);
      MultiboardSetItemStyleBJ(this.tribeBoard!, c + 1, 1, true, false);

      if (cols[c].iconPath) {
        MultiboardSetItemIconBJ(this.tribeBoard!, c + 1, 1, cols[c].iconPath!);
        MultiboardSetItemStyleBJ(this.tribeBoard!, c + 1, 1, true, true);
      }
    }

    MultiboardDisplayBJ(true, this.tribeBoard!);
    MultiboardMinimizeBJ(false, this.tribeBoard!);
  }

  /** Start the 1-second periodic update for the tribe board */
  private startPeriodicUpdate(): void {
    this.updateTimer = new Timer();
    this.updateTimer.start(1.0, true, () => this.updateTribeBoard());
  }

  /** Update tribe board with current player stats */
  private updateTribeBoard(): void {
    if (!this.tribeBoard || this.showingDetailed) return;

    // Update title with game timers
    const elapsed = Math.floor(TimerGetElapsed(GetGameTimer()));
    const minutes = Math.floor(elapsed / 60);
    const seconds = elapsed % 60;
    const timeStr = `${minutes}:${seconds.toString().padStart(2, "0")}`;

    let title = `Island Troll Tribes - ${timeStr}`;
    const config = GameConfig.getInstance();

    if (config.FORCED_DUEL_AFTER > 0) {
      const duelIn = Math.max(0, config.FORCED_DUEL_AFTER - elapsed);
      if (duelIn > 0) {
        const dm = Math.floor(duelIn / 60);
        const ds = duelIn % 60;
        title += ` | Duel: ${dm}:${ds.toString().padStart(2, "0")}`;
      }
    }

    MultiboardSetTitleText(this.tribeBoard!, title);

    // Update each player row
    let row = 2; // Row 1 is header
    for (let i = 0; i < 12; i++) {
      const p = MapPlayer.fromIndex(i);
      if (!p || p.slotState !== PLAYER_SLOT_STATE_PLAYING) continue;

      // Name (column 1)
      MultiboardSetItemValueBJ(this.tribeBoard!, 1, row, p.name);
      MultiboardSetItemColorBJ(this.tribeBoard!, 1, row,
        this.getPlayerColorR(i), this.getPlayerColorG(i), this.getPlayerColorB(i), 255);

      // Level (column 2) - need hero unit reference
      // HP (column 3)
      // Mana (column 4)
      // Heat (column 5) - stored as gold
      const gold = p.getState(PLAYER_STATE_RESOURCE_GOLD);
      MultiboardSetItemValueBJ(this.tribeBoard!, 5, row, gold.toString());

      row++;
    }
  }

  /** Switch to detailed scoreboard view */
  showDetailedScoreboard(): void {
    this.showingDetailed = true;
    if (this.tribeBoard) {
      MultiboardDisplayBJ(false, this.tribeBoard);
    }

    if (!this.scoreBoard) {
      this.createScoreBoard();
    }
    this.updateScoreBoard();
    MultiboardDisplayBJ(true, this.scoreBoard!);
  }

  /** Switch back to tribe board view */
  showTribeBoard(): void {
    this.showingDetailed = false;
    if (this.scoreBoard) {
      MultiboardDisplayBJ(false, this.scoreBoard);
    }
    if (this.tribeBoard) {
      MultiboardDisplayBJ(true, this.tribeBoard);
    }
  }

  /** Create the detailed score board */
  private createScoreBoard(): void {
    const cols = ScoreboardFrame.SCORE_COLUMNS;
    const rows = this.countActivePlayers() + 1;

    this.scoreBoard = CreateMultiboardBJ(cols.length, rows, "Scoreboard") ?? null;

    for (let c = 0; c < cols.length; c++) {
      MultiboardSetItemWidthBJ(this.scoreBoard!, c + 1, 0, cols[c].width * 100);
      MultiboardSetItemValueBJ(this.scoreBoard!, c + 1, 1, cols[c].label);
      MultiboardSetItemStyleBJ(this.scoreBoard!, c + 1, 1, true, false);
    }
  }

  /** Update detailed scoreboard with accumulated stats */
  private updateScoreBoard(): void {
    if (!this.scoreBoard) return;

    let row = 2;
    for (let i = 0; i < 12; i++) {
      const p = MapPlayer.fromIndex(i);
      if (!p || p.slotState !== PLAYER_SLOT_STATE_PLAYING) continue;

      const stats = this.playerStats.get(i)!;

      MultiboardSetItemValueBJ(this.scoreBoard, 1, row, p.name);
      MultiboardSetItemColorBJ(this.scoreBoard, 1, row,
        this.getPlayerColorR(i), this.getPlayerColorG(i), this.getPlayerColorB(i), 255);

      // Kill columns
      MultiboardSetItemValueBJ(this.scoreBoard, 3, row, stats.elkKills.toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 4, row, stats.hawkKills.toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 5, row, stats.snakeKills.toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 6, row, stats.wolfKills.toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 7, row, stats.bearKills.toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 8, row, stats.pantherKills.toString());

      // Stat columns
      MultiboardSetItemValueBJ(this.scoreBoard, 9, row, stats.damageDealt.toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 10, row,
        (stats.healingSelf + stats.healingAlly).toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 11, row, stats.goldAcquired.toString());
      MultiboardSetItemValueBJ(this.scoreBoard, 12, row, stats.meatEaten.toString());

      row++;
    }
  }

  // ─── Stat Recording API ────────────────────────────────────────────

  recordKill(playerId: number, unitType: string): void {
    const stats = this.playerStats.get(playerId);
    if (!stats) return;

    switch (unitType) {
      case "elk": stats.elkKills++; break;
      case "hawk": stats.hawkKills++; break;
      case "snake": stats.snakeKills++; break;
      case "wolf": stats.wolfKills++; break;
      case "bear": stats.bearKills++; break;
      case "panther": stats.pantherKills++; break;
    }
  }

  recordDamage(playerId: number, amount: number): void {
    const stats = this.playerStats.get(playerId);
    if (stats) stats.damageDealt += amount;
  }

  recordHealing(playerId: number, amount: number, isSelf: boolean): void {
    const stats = this.playerStats.get(playerId);
    if (!stats) return;
    if (isSelf) stats.healingSelf += amount;
    else stats.healingAlly += amount;
  }

  recordGold(playerId: number, amount: number): void {
    const stats = this.playerStats.get(playerId);
    if (stats) stats.goldAcquired += amount;
  }

  recordMeatEaten(playerId: number): void {
    const stats = this.playerStats.get(playerId);
    if (stats) stats.meatEaten++;
  }

  /** Get stats for a player */
  getPlayerStats(playerId: number): PlayerStats | undefined {
    return this.playerStats.get(playerId);
  }

  // ─── Helpers ───────────────────────────────────────────────────────

  private countActivePlayers(): number {
    let count = 0;
    for (let i = 0; i < 12; i++) {
      const p = MapPlayer.fromIndex(i);
      if (p && p.slotState === PLAYER_SLOT_STATE_PLAYING) count++;
    }
    return count;
  }

  /** WC3 player colors (R component) */
  private getPlayerColorR(id: number): number {
    const colors = [255, 0, 28, 84, 255, 254, 32, 229, 149, 178, 4, 96];
    return colors[id] ?? 255;
  }

  /** WC3 player colors (G component) */
  private getPlayerColorG(id: number): number {
    const colors = [3, 66, 230, 0, 252, 138, 192, 91, 150, 103, 42, 150];
    return colors[id] ?? 255;
  }

  /** WC3 player colors (B component) */
  private getPlayerColorB(id: number): number {
    const colors = [3, 255, 185, 129, 1, 14, 0, 176, 255, 13, 4, 180];
    return colors[id] ?? 255;
  }

  /** Clean up resources */
  destroy(): void {
    if (this.updateTimer) {
      this.updateTimer.destroy();
      this.updateTimer = null;
    }
    if (this.tribeBoard) {
      DestroyMultiboardBJ(this.tribeBoard);
      this.tribeBoard = null;
    }
    if (this.scoreBoard) {
      DestroyMultiboardBJ(this.scoreBoard);
      this.scoreBoard = null;
    }
  }
}
