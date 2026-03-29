# Island Troll Tribes - W3TS Rewrite

## Project Overview
Island Troll Tribes is a Warcraft III team survival map where players control trolls, gather resources, craft items, evolve their class, and compete against other tribes. This is a complete rewrite from WurstScript (518 files, 43K lines) to TypeScript (W3TS).

## Architecture

### Build Pipeline
- **Language**: TypeScript → Lua via TypeScript-to-Lua (TSTL) targeting Lua 5.3
- **Framework**: W3TS v3.0+ by cipherxof/TriggerHappy (github.com/cipherxof/w3ts)
- **Build**: `npm run build` → TSTL transpilation → single bundled Lua file → packaged into .w3x
- **Plugins**: war3-transformer (compile-time object gen), war3-objectdata (WC3 object files)
- **UI Option**: w3ts-jsx (github.com/voces/w3ts-jsx) for React-like WC3 frame components
- **Map Tool**: Ceres (github.com/ceres-wc3/ceres) for .w3x archive packaging
- **Source**: `/src/` directory, organized by domain
- **CRITICAL**: Entry point uses `addScriptHook(W3TS_HOOK.MAIN_AFTER, main)` - NOT direct call
- **CRITICAL**: WC3 requires ALL Lua bundled into ONE file (configured via tsconfig tstl.luaBundle)

### Directory Structure
```
src/
├── main.ts                    # Entry point, state machine wiring
├── core/                      # Singletons: GameStateManager, PlayerManager, TribeManager
├── config/                    # GameConfig (balance constants, mode settings)
├── entities/                  # Entity system (UnitEntity base, factories)
│   ├── EntityManager.ts       # Factory registry, event routing
│   ├── modules/               # Hostile, BonyAnimal (entity hierarchy base)
│   ├── trolls/                # BaseTroll, TrollDefinition, TrollRegistry
│   ├── animals/               # Elk, Wolf, Bear, Snake, Panther, Fish, GreenFish, Hawk
│   ├── bosses/                # AncientHydra, LesserHydra, Mammoth, AlligatorMan, DiscoDuck, TheOne
│   └── buildings/             # Forge, Armory, Tannery, MixingPot, Workshop, WitchDoctorHut, CampFire, Tent, MudHut, TrollHut, Hatchery, TeleportBeacon
├── talents/                   # Component-based talent system (replaces legacy spellbook)
│   ├── TalentDefinition.ts    # Data interfaces for talent definitions
│   ├── TalentInstance.ts      # Runtime talent attached to a troll
│   └── TalentRegistry.ts     # Central talent management + player tracking
├── systems/                   # Game systems
│   ├── crafting/              # CraftingEngine, RecipeDefinition, MixingSystem, TanningSystem
│   ├── spawning/              # SpawnSystem (items, animals, fish, time-interpolated weights)
│   ├── survival/              # SurvivalSystem (heat/cold/energy stat degradation)
│   ├── combat/                # ExperienceSystem (custom XP, class multipliers, shared XP)
│   ├── evolution/             # TransformationSystem (Bear Form trick, stat preservation)
│   ├── selection/             # ClassSelectionSystem (totem-based class picking)
│   ├── modes/                 # GameModeSystem (50+ modes, chat command selection)
│   ├── trade/                 # TradeShip coordinator (TODO)
│   └── [future]               # ForcedDuel, ForestFire, GracePeriod
├── data/                      # Pure data definitions (NO logic)
│   ├── trolls/                # All 28 troll class definitions + 7 family groupings
│   ├── talents/               # All talent + tree definitions
│   ├── recipes/               # All 93 crafting recipes
│   ├── ItemIds.ts             # 157 FourCC item constants
│   ├── UnitIds.ts             # 135 FourCC unit constants
│   └── AbilityIds.ts          # 486+ ability + 20 buff FourCC constants (TODO)
├── ui/                        # UI system
│   ├── UIManager.ts           # UI coordinator across game phases
│   └── frames/                # TalentTreeFrame, ScoreboardFrame
├── lib/                       # Shared utilities
└── utils/                     # Helper functions
```

### Key Design Patterns

1. **Data-Driven**: All game content (trolls, talents, recipes, items) defined as TypeScript interfaces in `/src/data/`. No game logic in data files.

2. **Entity Factory Pattern**: `UnitEntity` base class with factory registry. When WC3 creates a unit, the factory produces the corresponding entity class.

3. **Component/Modifier Pattern (Talents)**: Talents are modifiers that attach to Troll instances. They can grant abilities, modify stats, or trigger custom behavior. Replaces the legacy spellbook level-swapping system.

4. **State Machine**: `GameStateManager` drives the game through linear phases: Initialization → ModesSelection → TribeInitialization → ClassSelection → Gameplay → Postgame.

5. **Singleton Services**: Core systems (GameConfig, PlayerManager, TribeManager, CraftingEngine, SpawnSystem) are singletons accessed via `getInstance()`.

### Troll Class System
- **7 base classes**: Hunter, Mage, Priest, Beastmaster, Thief, Scout, Gatherer
- **3-tier evolution**: Base → Sub (level 6) → Super (level 9 + Medallion)
- **28+ total class variants** across all evolution paths
- **Stats**: All start at 1/1/1 (str/agi/int), Sub at 6/6/6, Super at 9/9/9
- **Inventory slots**: Gatherer=6, Thief/Scout=5, Priest/BM=4, Hunter/Mage=3
- **XP multiplier**: Base=4x, Sub=3x, Super=2x (higher tier = less bonus XP)
- **Transformation**: Uses WC3 Bear Form ability trick for unit type swapping

### Crafting System
- **7 crafting stations**: Forge, Armory, Tannery, MixingPot, Workshop, WitchDoctorHut, CraftMaster
- **~93 recipes** total across all stations
- **Recipe format**: Ordered slot list, each slot accepts 1+ item type IDs
- **Search ranges**: Troll=100, CraftMaster=300, Buildings=700
- **Special handlers**: MixingSystem (herb combination priority), TanningSystem (hide→armor)

### Survival System (Heat/Cold)
- Heat stored as player's **gold resource** (0 to heatMaximum, default 100)
- Stat loss every **3 seconds**: heat, mana, HP degrade by statLossAmount (default 1)
- Camouflage **triples** all stat losses
- Bonfire aura reduces heat loss by 2
- Frozen debuff adds 1-5 random extra heat loss
- Death triggers when mana < 1 OR heat < 1
- Daytime (6:00-18:00 game time) grants +3 heat passively
- Equipment bonuses: coat +5, boots/gloves +2 each, fire pinion +8
- Stat gain timer (35s): adds heat from gear
- Grace period default: 480 seconds (8 minutes)

### Game Mode System
- 50+ configurable modes in 8 categories (General, Pro, Troll Selection, Economy, Hard, Casual, Special, Testing)
- First player selects modes via chat commands during 60-second selection phase
- Modes modify `GameConfig` fields that affect gameplay
- Composable (multiple active), chainable (one enables others), toggle-able
- Key modes: -ffa, -1v1, -sf (start with fire), -el (elimination), -fd (forced duel), -sv (survival), -tm (test)

### Spawn System
- **4 islands**: NW(15/4), NE(16/4), SE(16/4), SW(23/6) (items/animals)
- **8 resource types** with time-interpolated spawn weights
- **5 animal types** with separate weighted pools
- **120s item/animal cycle**, **240s fish/hawk cycle**
- **Diminishing returns**: spawn rates decrease by 0.2/0.3 per cycle

## WC3 Modding Notes

### W3TS Framework (cipherxof/w3ts v3.0.2)
- **GitHub**: github.com/cipherxof/w3ts (77 stars, MIT license)
- **Template**: github.com/cipherxof/wc3-ts-template (61 stars)
- **Docs**: cipherxof.github.io/w3ts/
- 29 wrapper classes: Unit, Item, Frame, Timer, Trigger, MapPlayer, Force, Rect, Point, Effect, Sound, Group, Dialog, Quest, Destructable, Camera, Region, TextTag, Leaderboard, Multiboard, FogModifier, Image, WeatherEffect, etc.
- Use W3TS wrappers exclusively; avoid raw JASS natives
- `FourCC("xxxx")` converts 4-char strings to integer IDs
- Events: `Trigger.registerAnyUnitEvent()` + `Trigger.addAction()`
- Static factories: `Unit.create(owner, unitId, x, y, facing)`
- **MUST** use `addScriptHook(W3TS_HOOK.MAIN_AFTER, ...)` for init (triggers fail if registered too early)
- w3ts-jsx available for React-like UI: `<backdrop>`, `<text>`, `<button>` components with hooks

### Object Editor Data
- Unit types, abilities, items, buffs defined in .w3u/.w3a/.w3t/.w3h files inside base.w3x
- FourCC IDs in `/src/data/` are placeholders - must be mapped to actual IDs at build time
- war3-transformer plugin handles compile-time object generation (same as Wurst's compiletime())
- Transformation uses BearForm ability to swap unit types (WC3 engine trick)
- Most IDs in original Wurst are `compiletime(XXX_ID_GEN.next())` - assigned sequentially at build time
- Some IDs are hardcoded FourCC values (e.g., `'Avul'`, `'Aloc'`, `'I057'`) - preserved in our code

### WC3 Limitations
- No true classes at runtime - JASS is procedural, Lua via TSTL
- Max 6 inventory slots per unit
- Max 12 player slots + 4 neutral players
- Frame API requires Reforged 1.32+
- Item visibility trick for recipe matching (setVisible false → search → restore)
- **CRITICAL: Lua GC is disabled in WC3 1.32+** (Blizzard disabled it to prevent desync).
  The replacement GC is inadequate - if allocation rate exceeds marking rate, garbage is never collected.
  TSTL generates many temporary tables, so we MUST:
  - Reuse objects/tables on hot paths (timers, per-frame logic)
  - Avoid allocations on fast timers (< 1s intervals)
  - Use object pools / handle recyclers for frequently created/destroyed objects
  - Minimize closures in tight loops (each closure = a new Lua table)
  - Pre-allocate arrays where possible

### Community Resources
- **HiveWorkshop**: hiveworkshop.com (main WC3 modding community)
- **ITT Discord**: discord.gg/hYzTRYf
- **ITT Wiki**: islandtrolltribes.fandom.com
- **ITT on Hive**: hiveworkshop.com/threads/island-troll-tribes.297609/
- **WC3MapTranslator**: github.com/ChiefOfGxBxL/WC3MapTranslator (binary↔JSON for map files)
- **UI Frame Tutorial**: hiveworkshop.com/threads/the-big-ui-frame-tutorial.335296/
- **JASS Reference**: lep.nrw/jassbot/ (searchable API browser)

## Development Conventions

### Code Style
- Strict TypeScript with explicit types
- Interfaces for all data definitions
- Use enums for fixed categories (ClassType, CraftingStation, TalentCategory)
- PascalCase for classes/interfaces, camelCase for functions/variables
- Namespace pattern for ID constants (e.g., `ItemIds.BONE`)

### Adding Content
- **New troll class**: Add entry to `src/data/trolls/AllTrollDefinitions.ts`
- **New talent**: Add entry to `src/data/talents/AllTalentDefinitions.ts`
- **New recipe**: Add entry to `src/data/recipes/AllRecipes.ts`
- **New item type**: Add FourCC to `src/data/ItemIds.ts`
- **New unit type**: Add FourCC to `src/data/UnitIds.ts`
- **New ability**: Add FourCC to `src/data/AbilityIds.ts`

### Legacy Wurst Code Reference
The original Wurst code is in `/wurst/` (518 files). Key mappings:
- `wurst/systems/core/Classes.wurst` → `src/entities/trolls/TrollRegistry.ts`
- `wurst/systems/core/GameStates.wurst` → `src/core/GameStateManager.ts`
- `wurst/systems/core/Tribe.wurst` → `src/core/TribeManager.ts`
- `wurst/systems/core/StatLoss.wurst` → `src/systems/survival/SurvivalSystem.ts`
- `wurst/systems/crafting/QuickMake.wurst` → `src/systems/crafting/CraftingEngine.ts`
- `wurst/systems/crafting/Mixing.wurst` → `src/systems/crafting/MixingSystem.ts`
- `wurst/systems/crafting/Tanning.wurst` → `src/systems/crafting/TanningSystem.ts`
- `wurst/systems/entities/UnitEntity.wurst` → `src/entities/EntityManager.ts`
- `wurst/systems/spawns/ResourceSpawns.wurst` → `src/systems/spawning/SpawnSystem.ts`
- `wurst/systems/modes/GameMode.wurst` → `src/systems/modes/GameModeSystem.ts`
- `wurst/systems/boards/*.wurst` → `src/ui/frames/ScoreboardFrame.ts`
- `wurst/objects/abilities/TrollUpgrade.wurst` → `src/systems/evolution/TransformationSystem.ts`
- `wurst/objects/abilities/SpellBookHashMap.wurst` → `src/data/talents/AllTalentDefinitions.ts`
- `wurst/lib/Transformation.wurst` → `src/systems/evolution/TransformationSystem.ts`
- `wurst/config/GameConstants.wurst` → `src/config/GameConfig.ts`
- `wurst/assets/LocalObjectIDs.wurst` → `src/data/ItemIds.ts`, `UnitIds.ts`, `AbilityIds.ts`
- `wurst/systems/modes/ForcedDuel.wurst` → `src/systems/modes/ForcedDuelSystem.ts`
- `wurst/systems/modes/ShrinkingMap.wurst` → `src/systems/modes/ForestFireSystem.ts`
- `wurst/systems/trade/TradeShip*.wurst` → `src/systems/trade/TradeShipSystem.ts`
- `wurst/systems/core/Respawn.wurst` → `src/systems/survival/RespawnSystem.ts`

## Current Status (65+ TypeScript files implemented)

### Completed
- [x] Project structure scaffolded
- [x] Core infrastructure (GameState, PlayerManager, TribeManager)
- [x] Entity system (UnitEntity, Hostile, BonyAnimal hierarchy)
- [x] Troll class system (BaseTroll, TrollDefinition, TrollRegistry, 28 definitions)
- [x] Talent system architecture (TalentDefinition, TalentInstance, TalentRegistry)
- [x] Crafting engine (CraftingEngine, RecipeDefinition)
- [x] Mixing system (herb combination priority logic)
- [x] Tanning system (hide-to-armor conversion)
- [x] Spawn system (items, animals, fish, time-interpolated weights)
- [x] Survival system (heat/cold/energy stat degradation with gear bonuses)
- [x] Respawn system (grace period auto-revive, quadratic post-grace delay)
- [x] Experience system (custom XP, class multipliers, shared range XP)
- [x] Transformation system (Bear Form trick, 35 evolution pairs, stat preservation)
- [x] Game mode system (50+ modes, chat selection, category organization)
- [x] Class selection system (totem-based, auto-random, tribe duplicate prevention)
- [x] Trade ship system (6 ships, paired rotation, merchant inventories, route waypoints)
- [x] Forced duel system (arena teleport, stat reset, pre-duel pause)
- [x] Forest fire system (shrinking map, expanding fire ring, tree destruction, % HP drain)
- [x] All 8 animal entities (Elk, Wolf, Bear, Panther, Snake, Fish, GreenFish, Hawk)
- [x] All 6 boss entities (AncientHydra, LesserHydra, Mammoth, AlligatorMan, DiscoDuck, TheOne)
- [x] All 12 building entities (Forge, Armory, Tannery, MixingPot, Workshop, WDH, CampFire, Tent, MudHut, TrollHut, Hatchery, TeleportBeacon)
- [x] Scoreboard UI (TribeBoard live stats + ScoreBoard detailed stats)
- [x] Talent tree frame UI
- [x] GameConfig with all mode-configurable fields
- [x] ItemIds (157 items), UnitIds (135 units), AbilityIds (486+ abilities, 20 buffs)
- [x] Main.ts wired with all systems
- [x] Documentation (README.md, docs/SYSTEMS.md)

### Remaining
- [ ] Port all 93 crafting recipes to AllRecipes.ts (currently 10 representative)
- [ ] Port all troll abilities as talent definitions with real ability IDs
- [ ] Wire actual FourCC IDs from base.w3x (most are compile-time generated)
- [ ] Map compilation pipeline (TSTL → Lua → .w3x packaging)
- [ ] Testing in WC3 Reforged
