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
 * - State machine: Game flows through initialization -> modes -> tribes -> class select -> gameplay -> postgame
 * - Entity system: All game units (trolls, animals, buildings) extend a base UnitEntity
 *
 * W3TS Framework:
 * - Uses cipherxof/w3ts v3.0+ (TypeScript wrappers for WC3 JASS natives)
 * - Transpiled via TypeScript-to-Lua (TSTL) targeting Lua 5.3
 * - All output bundled into single Lua file (WC3 limitation)
 * - Requires Warcraft III 1.31+ (Lua scripting support)
 * - CRITICAL: Must use addScriptHook(W3TS_HOOK.MAIN_AFTER, ...) for initialization
 */

import { addScriptHook, W3TS_HOOK } from "w3ts";
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
import { GameModeSystem } from "./systems/modes/GameModeSystem";
import { ClassSelectionSystem } from "./systems/selection/ClassSelectionSystem";
import { TransformationSystem } from "./systems/evolution/TransformationSystem";
import { ExperienceSystem } from "./systems/combat/ExperienceSystem";
import { TradeShipSystem } from "./systems/trade/TradeShipSystem";
import { RespawnSystem } from "./systems/survival/RespawnSystem";
import { ForcedDuelSystem } from "./systems/modes/ForcedDuelSystem";
import { ForestFireSystem } from "./systems/modes/ForestFireSystem";
import { SurvivalSystem } from "./systems/survival/SurvivalSystem";
import { MixingSystem } from "./systems/crafting/MixingSystem";
import { TanningSystem } from "./systems/crafting/TanningSystem";

// Compiletime object definitions (evaluated at build time by war3-transformer)
import "./objects";

/**
 * Main game initialization.
 *
 * IMPORTANT: This must be called via addScriptHook(W3TS_HOOK.MAIN_AFTER, ...)
 * to ensure the WC3 map is fully loaded before we register triggers and create units.
 * Calling it directly or in MAIN_BEFORE will cause silent failures.
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
  const gameModeSystem = GameModeSystem.getInstance();
  const classSelection = ClassSelectionSystem.getInstance();
  const transformSystem = TransformationSystem.getInstance();
  const experienceSystem = ExperienceSystem.getInstance();
  const tradeShipSystem = TradeShipSystem.getInstance();
  const respawnSystem = RespawnSystem.getInstance();
  const forcedDuelSystem = ForcedDuelSystem.getInstance();
  const forestFireSystem = ForestFireSystem.getInstance();
  const survivalSystem = SurvivalSystem.getInstance();
  const mixingSystem = MixingSystem.getInstance();
  const tanningSystem = TanningSystem.getInstance();

  // Initialize UI
  const uiManager = UIManager.getInstance();

  // ═══════════════════════════════════════════════════════════════════
  // STATE MACHINE TRANSITIONS
  // ═══════════════════════════════════════════════════════════════════

  stateManager.onPhaseEnter(GamePhase.Initialization, () => {
    config.loadDefaults();
    playerManager.initialize();
    entityManager.registerAllFactories();
    transformSystem.initialize();
  });

  stateManager.onPhaseEnter(GamePhase.ModesSelection, () => {
    gameModeSystem.startSelection(() => {
      stateManager.advancePhase();
    });
  });

  stateManager.onPhaseEnter(GamePhase.TribeInitialization, () => {
    tribeManager.formTribes(config.NUM_TRIBES);
    stateManager.advancePhase();
  });

  stateManager.onPhaseEnter(GamePhase.ClassSelection, () => {
    classSelection.start(() => {
      stateManager.advancePhase();
    });
  });

  stateManager.onPhaseEnter(GamePhase.Gameplay, () => {
    spawnSystem.startSpawnCycles();
    craftingEngine.enable();
    mixingSystem.enable();
    tanningSystem.enable();
    experienceSystem.enable();
    survivalSystem.startStatLossCycle();
    tradeShipSystem.start();
    respawnSystem.initialize();
    forcedDuelSystem.schedule();
    forestFireSystem.schedule();
    uiManager.showGameplayHUD();
  });

  stateManager.onPhaseEnter(GamePhase.Postgame, () => {
    uiManager.showPostgameScoreboard();
  });

  // Begin the game state machine
  stateManager.start();
}

// Register with W3TS framework - MUST use MAIN_AFTER hook
addScriptHook(W3TS_HOOK.MAIN_AFTER, main);
