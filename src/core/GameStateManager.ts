/**
 * GameStateManager - Linear state machine controlling game flow.
 *
 * Mirrors the original Wurst GameStates.wurst but with a cleaner API.
 * The game progresses through phases linearly:
 *   Initialization → ModesSelection → TribeInitialization → ClassSelection → Gameplay → Postgame
 *
 * Each phase can have enter/exit callbacks registered by any system.
 */

import { Timer } from "w3ts";

export enum GamePhase {
  Initialization = 0,
  ModesSelection = 1,
  TribeInitialization = 2,
  ClassSelection = 3,
  Gameplay = 4,
  Postgame = 5,
}

/** Names for debug logging */
const PHASE_NAMES: Record<GamePhase, string> = {
  [GamePhase.Initialization]: "Initialization",
  [GamePhase.ModesSelection]: "Modes Selection",
  [GamePhase.TribeInitialization]: "Tribe Initialization",
  [GamePhase.ClassSelection]: "Class Selection",
  [GamePhase.Gameplay]: "Gameplay",
  [GamePhase.Postgame]: "Postgame",
};

type PhaseCallback = () => void;

interface PhaseCallbacks {
  onEnter: PhaseCallback[];
  onExit: PhaseCallback[];
}

export class GameStateManager {
  private static instance: GameStateManager;

  private currentPhase: GamePhase = GamePhase.Initialization;
  private phaseCallbacks: Map<GamePhase, PhaseCallbacks> = new Map();
  private started = false;

  private constructor() {
    // Initialize callback arrays for each phase
    for (const phase of Object.values(GamePhase)) {
      if (typeof phase === "number") {
        this.phaseCallbacks.set(phase, { onEnter: [], onExit: [] });
      }
    }
  }

  static getInstance(): GameStateManager {
    if (!GameStateManager.instance) {
      GameStateManager.instance = new GameStateManager();
    }
    return GameStateManager.instance;
  }

  /** Register a callback for when a phase is entered */
  onPhaseEnter(phase: GamePhase, callback: PhaseCallback): void {
    this.phaseCallbacks.get(phase)!.onEnter.push(callback);
  }

  /** Register a callback for when a phase is exited */
  onPhaseExit(phase: GamePhase, callback: PhaseCallback): void {
    this.phaseCallbacks.get(phase)!.onExit.push(callback);
  }

  /** Get the current game phase */
  getCurrentPhase(): GamePhase {
    return this.currentPhase;
  }

  /** Get a human-readable name for the current phase */
  getCurrentPhaseName(): string {
    return PHASE_NAMES[this.currentPhase];
  }

  /** Check if the game is in a specific phase */
  isPhase(phase: GamePhase): boolean {
    return this.currentPhase === phase;
  }

  /** Start the state machine - enters Initialization phase */
  start(): void {
    if (this.started) return;
    this.started = true;
    this.enterPhase(GamePhase.Initialization);

    // Auto-exit initialization on next frame (mirrors nullTimer in Wurst)
    const t = new Timer();
    t.start(0, false, () => {
      t.destroy();
      this.advancePhase();
    });
  }

  /** Advance to the next phase in sequence */
  advancePhase(): void {
    const nextPhase = this.currentPhase + 1;
    if (nextPhase > GamePhase.Postgame) return;

    this.exitPhase(this.currentPhase);
    this.enterPhase(nextPhase as GamePhase);
  }

  /** Jump to a specific phase (use with caution) */
  setPhase(phase: GamePhase): void {
    if (phase === this.currentPhase) return;
    this.exitPhase(this.currentPhase);
    this.enterPhase(phase);
  }

  private enterPhase(phase: GamePhase): void {
    this.currentPhase = phase;
    const callbacks = this.phaseCallbacks.get(phase);
    if (callbacks) {
      for (const cb of callbacks.onEnter) {
        cb();
      }
    }
  }

  private exitPhase(phase: GamePhase): void {
    const callbacks = this.phaseCallbacks.get(phase);
    if (callbacks) {
      for (const cb of callbacks.onExit) {
        cb();
      }
    }
  }
}
