/**
 * PlayerManager - Tracks player state, settings, and troll assignments.
 *
 * Wraps WC3 player handles with higher-level functionality.
 * Handles observer detection, player leaving, and per-player state.
 */

import { MapPlayer, Unit } from "w3ts";

export interface PlayerState {
  player: MapPlayer;
  troll: Unit | null;
  isObserver: boolean;
  isLeaver: boolean;
  settings: Map<string, string>;
}

export class PlayerManager {
  private static instance: PlayerManager;
  private players: Map<number, PlayerState> = new Map();

  private constructor() {}

  static getInstance(): PlayerManager {
    if (!PlayerManager.instance) {
      PlayerManager.instance = new PlayerManager();
    }
    return PlayerManager.instance;
  }

  /** Initialize player tracking for all player slots */
  initialize(): void {
    for (let i = 0; i < 12; i++) {
      const p = MapPlayer.fromIndex(i);
      if (p && p.slotState === PLAYER_SLOT_STATE_PLAYING) {
        this.players.set(i, {
          player: p,
          troll: null,
          isObserver: p.controller === MAP_CONTROL_COMPUTER,
          isLeaver: false,
          settings: new Map(),
        });
      }
    }
  }

  /** Get a player's state by index */
  getPlayerState(index: number): PlayerState | undefined {
    return this.players.get(index);
  }

  /** Assign a troll unit to a player */
  assignTroll(playerIndex: number, troll: Unit): void {
    const state = this.players.get(playerIndex);
    if (state) {
      state.troll = troll;
    }
  }

  /** Get a player's troll unit */
  getTroll(playerIndex: number): Unit | null {
    return this.players.get(playerIndex)?.troll ?? null;
  }

  /** Mark a player as having left the game */
  markAsLeaver(playerIndex: number): void {
    const state = this.players.get(playerIndex);
    if (state) {
      state.isLeaver = true;
    }
  }

  /** Mark a player as an observer (post-defeat) */
  makeObserver(playerIndex: number): void {
    const state = this.players.get(playerIndex);
    if (state) {
      state.isObserver = true;
    }
  }

  /** Get all active (non-observer, non-leaver) players */
  getActivePlayers(): PlayerState[] {
    return [...this.players.values()].filter(
      (p) => !p.isObserver && !p.isLeaver
    );
  }

  /** Get all ingame players (including observers) */
  getAllPlayers(): PlayerState[] {
    return [...this.players.values()];
  }

  /** Get the count of active players */
  getActivePlayerCount(): number {
    return this.getActivePlayers().length;
  }

  /** Save a player setting */
  setSetting(playerIndex: number, key: string, value: string): void {
    const state = this.players.get(playerIndex);
    if (state) {
      state.settings.set(key, value);
    }
  }

  /** Read a player setting */
  getSetting(playerIndex: number, key: string): string | undefined {
    return this.players.get(playerIndex)?.settings.get(key);
  }
}
