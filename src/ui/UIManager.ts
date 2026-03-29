/**
 * UIManager - Coordinates all UI elements across game phases.
 *
 * Manages:
 * - Mode selection dialog
 * - Class selection interface
 * - Talent tree frames
 * - Scoreboards (tribe and observer)
 * - Gameplay HUD
 *
 * Uses W3TS Frame wrappers for all UI elements.
 */

import { Frame, MapPlayer } from "w3ts";
import { TalentTreeFrame } from "./frames/TalentTreeFrame";

export class UIManager {
  private static instance: UIManager;
  private talentTreeFrame: TalentTreeFrame | null = null;

  private constructor() {}

  static getInstance(): UIManager {
    if (!UIManager.instance) {
      UIManager.instance = new UIManager();
    }
    return UIManager.instance;
  }

  /** Show mode selection dialog */
  showModeSelection(): void {
    // TODO: Implement mode voting UI using W3TS Dialog/Frame
  }

  /** Show class selection interface (tribal totem) */
  showClassSelection(): void {
    // TODO: Implement class selection UI
    // Original uses a shop-style interface on a totem unit
  }

  /** Show the gameplay HUD (heat bar, scoreboard, etc.) */
  showGameplayHUD(): void {
    // Initialize talent tree frame
    this.talentTreeFrame = new TalentTreeFrame();
    this.talentTreeFrame.initialize();
  }

  /** Show postgame scoreboard */
  showPostgameScoreboard(): void {
    // TODO: Implement final scoreboard
  }

  /** Toggle talent tree visibility for a player */
  toggleTalentTree(player: MapPlayer): void {
    if (this.talentTreeFrame) {
      this.talentTreeFrame.toggle(player);
    }
  }
}
