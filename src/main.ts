/**
 * Island Troll Tribes - Main Entry Point
 *
 * This is the W3TS rewrite of Island Troll Tribes, originally written in WurstScript.
 * The game is a team survival map for Warcraft III where players control trolls,
 * gather resources, craft items, evolve their class, and compete against other tribes.
 *
 * Architecture:
 * - Data-driven design: Game content defined in TypeScript interfaces/data files
 * - Component/Modifier pattern: Talents attach as modifiers to Troll instances
 * - State machine: Game flows through initialization → modes → tribes → class select → gameplay → postgame
 * - Entity system: All game units (trolls, animals, buildings) extend a base UnitEntity
 */

import { GameStateManager, GamePhase } from "./core/GameStateManager";
import { GameConfig } from "./config/GameConfig";
import { TrollRegistry } from "./entities/trolls/TrollRegistry";
import { TalentRegistry } from "./talents/TalentRegistry";
import { CraftingEngine } from "./systems/crafting/CraftingEngine";
import { SpawnSystem } from "./systems/spawning/SpawnSystem";
import { TribeManager } from "./core/TribeManager";
import { PlayerManager } from "./core/PlayerManager";
import { EntityManager } from "./entities/EntityManager";
import { UIManager } from "./ui/UIManager";

/**
 * Main game initialization.
 * Called by the W3TS framework when the map loads.
 */
function main(): void {
  // Initialize core singletons
  const config = GameConfig.getInstance();
  const stateManager = GameStateManager.getInstance();
  const playerManager = PlayerManager.getInstance();
  const tribeManager = TribeManager.getInstance();
  const entityManager = EntityManager.getInstance();

  // Initialize content registries
  TrollRegistry.initialize();
  TalentRegistry.initialize();

  // Initialize game systems
  const craftingEngine = CraftingEngine.getInstance();
  const spawnSystem = SpawnSystem.getInstance();

  // Initialize UI
  const uiManager = UIManager.getInstance();

  // Wire up the state machine transitions
  stateManager.onPhaseEnter(GamePhase.Initialization, () => {
    config.loadDefaults();
    entityManager.registerAllFactories();
  });

  stateManager.onPhaseEnter(GamePhase.ModesSelection, () => {
    // Mode voting UI shown to players
    uiManager.showModeSelection();
  });

  stateManager.onPhaseEnter(GamePhase.TribeInitialization, () => {
    tribeManager.formTribes(config.getNumTribes());
    // Auto-advance after tribes are formed
    stateManager.advancePhase();
  });

  stateManager.onPhaseEnter(GamePhase.ClassSelection, () => {
    uiManager.showClassSelection();
  });

  stateManager.onPhaseEnter(GamePhase.Gameplay, () => {
    spawnSystem.startSpawnCycles();
    craftingEngine.enable();
    uiManager.showGameplayHUD();
  });

  stateManager.onPhaseEnter(GamePhase.Postgame, () => {
    uiManager.showPostgameScoreboard();
  });

  // Begin the game state machine
  stateManager.start();
}

// Register with W3TS framework
main();
