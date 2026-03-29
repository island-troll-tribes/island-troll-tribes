/**
 * TalentTreeFrame - WC3 UI frame for the talent tree display.
 *
 * Creates a custom frame hierarchy that shows:
 * - Tab bar at top for switching between talent trees
 * - Grid of talent icons with rank indicators
 * - Prerequisite connection lines between talents
 * - Tooltip on hover with description and rank info
 * - Available talent point counter
 * - Click-to-unlock interaction
 *
 * Uses the WC3 custom Frame API (introduced in Reforged 1.32+).
 * Frames are created from FDF templates for consistent styling.
 *
 * Architecture:
 * - TalentTreeFrame (container) owns all child frames
 * - Each talent node is a TalentNodeFrame with icon + rank overlay
 * - Connection lines drawn as stretched texture frames between nodes
 * - State synced with TalentRegistry for the local player
 */

import { Frame, MapPlayer, Trigger } from "w3ts";
import { TalentRegistry } from "../../talents/TalentRegistry";
import { TalentTreeDefinition, TalentDefinition } from "../../talents/TalentDefinition";

/** Layout constants */
const FRAME_WIDTH = 0.4;
const FRAME_HEIGHT = 0.35;
const NODE_SIZE = 0.035;
const NODE_SPACING_X = 0.08;
const NODE_SPACING_Y = 0.065;
const TREE_OFFSET_X = 0.05;
const TREE_OFFSET_Y = 0.28;
const TAB_HEIGHT = 0.03;

export class TalentTreeFrame {
  private container: Frame | null = null;
  private backdrop: Frame | null = null;
  private titleText: Frame | null = null;
  private pointsText: Frame | null = null;
  private tabFrames: Frame[] = [];
  private nodeFrames: Map<string, Frame> = new Map();
  private currentTreeId: string | null = null;
  private visible = false;

  /** Initialize all frames (call once during gameplay start) */
  initialize(): void {
    this.createContainer();
    this.hide();
  }

  private createContainer(): void {
    // Create the main backdrop frame
    this.container = new Frame("TalentTreeContainer", Frame.fromOrigin(ORIGIN_FRAME_GAME_UI, 0), 0, 0);
    this.container.setAbsPoint(FRAMEPOINT_CENTER, 0.4, 0.38);
    this.container.setSize(FRAME_WIDTH, FRAME_HEIGHT);
    this.container.visible = false;

    // Create backdrop texture
    this.backdrop = new Frame("TalentTreeBackdrop", this.container, 0, 0);
    this.backdrop.setSize(FRAME_WIDTH, FRAME_HEIGHT);
    this.backdrop.setPoint(FRAMEPOINT_CENTER, this.container, FRAMEPOINT_CENTER, 0, 0);

    // Title text
    this.titleText = new Frame("TalentTreeTitle", this.container, 0, 0);
    this.titleText.setPoint(FRAMEPOINT_TOP, this.container, FRAMEPOINT_TOP, 0, -0.01);
    this.titleText.text = "Talent Tree";

    // Available points display
    this.pointsText = new Frame("TalentTreePoints", this.container, 0, 0);
    this.pointsText.setPoint(FRAMEPOINT_BOTTOM, this.container, FRAMEPOINT_BOTTOM, 0, 0.01);
    this.pointsText.text = "Available Points: 0";

    // Close button trigger (ESC key)
    const closeTrigger = new Trigger();
    closeTrigger.registerPlayerKeyEvent(
      MapPlayer.fromLocal(),
      OSKEY_ESCAPE,
      0,
      true
    );
    closeTrigger.addAction(() => {
      if (this.visible) {
        this.hide();
      }
    });
  }

  /** Show the talent tree for a specific tree definition */
  showTree(treeId: string, playerIndex: number): void {
    const tree = TalentRegistry.getTree(treeId);
    if (!tree || !this.container) return;

    this.currentTreeId = treeId;
    this.clearNodes();
    this.createNodes(tree, playerIndex);
    this.updatePointsDisplay(playerIndex);
    this.show();
  }

  private createNodes(tree: TalentTreeDefinition, playerIndex: number): void {
    for (const talentId of tree.talentIds) {
      const talent = TalentRegistry.getDefinition(talentId);
      if (!talent || !talent.treePosition) continue;

      this.createTalentNode(talent, playerIndex);
    }
  }

  private createTalentNode(
    talent: TalentDefinition,
    playerIndex: number
  ): void {
    if (!this.container || !talent.treePosition) return;

    const { row, col } = talent.treePosition;
    const x = TREE_OFFSET_X + col * NODE_SPACING_X;
    const y = TREE_OFFSET_Y - row * NODE_SPACING_Y;

    // Create the icon button
    const node = new Frame("TalentNode_" + talent.id, this.container, 0, 0);
    node.setSize(NODE_SIZE, NODE_SIZE);
    node.setPoint(FRAMEPOINT_CENTER, this.container, FRAMEPOINT_BOTTOMLEFT, x, y);

    // Set icon texture
    // node.setTexture(talent.iconPath, 0, true);

    // Check if talent is unlocked/available
    const progress = TalentRegistry.getPlayerProgress(playerIndex);
    const currentRank = progress?.unlockedTalents.get(talent.id) ?? 0;
    const prereqMet = TalentRegistry.arePrerequisitesMet(playerIndex, talent.id);

    // Visual state: locked (grey), available (glowing), unlocked (bright)
    if (currentRank > 0) {
      // Unlocked - bright with rank display
    } else if (prereqMet) {
      // Available - normal brightness
    } else {
      // Locked - desaturated
    }

    // Click handler for unlocking
    const clickTrigger = new Trigger();
    clickTrigger.addAction(() => {
      // Handle talent unlock/rankup for local player
      // Will call TalentRegistry.unlockTalent()
    });

    this.nodeFrames.set(talent.id, node);
  }

  private clearNodes(): void {
    for (const [, frame] of this.nodeFrames) {
      frame.destroy();
    }
    this.nodeFrames.clear();
  }

  private updatePointsDisplay(playerIndex: number): void {
    const points = TalentRegistry.getAvailablePoints(playerIndex);
    if (this.pointsText) {
      this.pointsText.text = `Available Points: ${points}`;
    }
  }

  /** Toggle visibility for a player */
  toggle(player: MapPlayer): void {
    if (this.visible) {
      this.hide();
    } else {
      const playerIndex = player.id;
      const trees = TalentRegistry.getTreesForClass("hunter"); // TODO: get actual class
      if (trees.length > 0) {
        this.showTree(trees[0].id, playerIndex);
      }
    }
  }

  show(): void {
    if (this.container) {
      this.container.visible = true;
      this.visible = true;
    }
  }

  hide(): void {
    if (this.container) {
      this.container.visible = false;
      this.visible = false;
    }
  }
}
