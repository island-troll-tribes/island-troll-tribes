/**
 * TribeManager - Manages tribal teams, alliances, and victory conditions.
 *
 * Mirrors the original Tribe.wurst. Players are grouped into tribes of 1-4 players.
 * Tribes share vision, control, and resources. Last tribe standing wins.
 *
 * Original tribe names preserved from legacy code.
 */

import { MapPlayer, Force, Rectangle } from "w3ts";
import { PlayerManager } from "./PlayerManager";

const TRIBE_NAMES = [
  "Darkspear",
  "Windfury",
  "Zanku",
  "Ganja",
  "Snaketongue",
  "Zaldeer",
  "Kuzu",
  "Juan'ji",
  "Bloodtusk",
  "Bonecoat",
  "Hydra",
  "Puma",
  "Firewater",
  "Woodland",
];

export interface Tribe {
  id: number;
  name: string;
  members: MapPlayer[];
  force: Force;
  spawn: Rectangle | null;
  isDefeated: boolean;
  /** Non-member shared player (players[12+id]) used for tribe buildings */
  sharedPlayer: MapPlayer;
}

export class TribeManager {
  private static instance: TribeManager;
  private tribes: Tribe[] = [];
  private playerTribeMap: Map<MapPlayer, Tribe> = new Map();

  private constructor() {}

  static getInstance(): TribeManager {
    if (!TribeManager.instance) {
      TribeManager.instance = new TribeManager();
    }
    return TribeManager.instance;
  }

  /** Form tribes from active players. Shuffles tribe names for variety. */
  formTribes(numTribes: number): void {
    this.resetAlliances();
    const shuffledNames = this.shuffleArray([...TRIBE_NAMES]);

    for (let tribeId = 0; tribeId < numTribes; tribeId++) {
      const tribe = this.createTribe(tribeId, shuffledNames[tribeId] + " Tribe");
      if (tribe.members.length > 0) {
        this.tribes.push(tribe);
        this.setupAlliances(tribe);
      }
    }
  }

  private createTribe(id: number, name: string): Tribe {
    const force = new Force();
    const members: MapPlayer[] = [];
    const range = this.getPlayerIdRangeForTribe(id);
    const sharedPlayer = MapPlayer.fromIndex(12 + id)!;

    for (let pid = range.min; pid <= range.max; pid++) {
      const player = MapPlayer.fromIndex(pid);
      if (player && player.slotState === PLAYER_SLOT_STATE_PLAYING) {
        members.push(player);
        force.addPlayer(player);
      }
    }

    const tribe: Tribe = {
      id,
      name,
      members,
      force,
      spawn: null,
      isDefeated: members.length === 0,
      sharedPlayer,
    };

    for (const member of members) {
      this.playerTribeMap.set(member, tribe);
    }

    sharedPlayer.name = name;

    return tribe;
  }

  private setupAlliances(tribe: Tribe): void {
    for (const a of tribe.members) {
      // Share vision and control with tribe's shared player
      a.setAlliance(tribe.sharedPlayer, ALLIANCE_SHARED_VISION, true);
      a.setAlliance(tribe.sharedPlayer, ALLIANCE_SHARED_CONTROL, true);
      tribe.sharedPlayer.setAlliance(a, ALLIANCE_SHARED_CONTROL, true);

      for (const b of tribe.members) {
        if (a !== b) {
          a.setAlliance(b, ALLIANCE_SHARED_VISION, true);
          a.setAlliance(b, ALLIANCE_SHARED_CONTROL, true);
        }
      }
    }
  }

  private resetAlliances(): void {
    for (let i = 0; i < 12; i++) {
      for (let j = 0; j < 12; j++) {
        if (i !== j) {
          const pi = MapPlayer.fromIndex(i);
          const pj = MapPlayer.fromIndex(j);
          if (pi && pj) {
            pi.setAlliance(pj, ALLIANCE_PASSIVE, false);
            pi.setAlliance(pj, ALLIANCE_SHARED_VISION, false);
          }
        }
      }
    }
  }

  /** Get tribe for a player */
  getTribeForPlayer(player: MapPlayer): Tribe | undefined {
    return this.playerTribeMap.get(player);
  }

  /** Get all active (non-defeated) tribes */
  getActiveTribes(): Tribe[] {
    return this.tribes.filter((t) => !t.isDefeated);
  }

  /** Get all tribes */
  getAllTribes(): Tribe[] {
    return this.tribes;
  }

  /** Mark a tribe as defeated */
  defeatTribe(tribe: Tribe): void {
    tribe.isDefeated = true;
  }

  /** Check if only one tribe remains (victory condition) */
  checkVictory(): Tribe | null {
    const active = this.getActiveTribes();
    if (active.length === 1) {
      return active[0];
    }
    return null;
  }

  /** Get the player ID range assigned to a tribe */
  private getPlayerIdRangeForTribe(
    tribeId: number
  ): { min: number; max: number } {
    // Original: 3 players per tribe, tribes 0-3 map to players 0-2, 3-5, 6-8, 9-11
    const playersPerTribe = 3;
    return {
      min: tribeId * playersPerTribe,
      max: tribeId * playersPerTribe + playersPerTribe - 1,
    };
  }

  private shuffleArray<T>(array: T[]): T[] {
    for (let i = array.length - 1; i > 0; i--) {
      const j = math.random(0, i);
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }
}
