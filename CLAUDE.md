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
│   ├── animals/               # Elk, Wolf, Bear, Snake, Panther, Fish, Hawk
│   ├── bosses/                # Hydra, Mammoth, AlligatorMan, DiscoDuck, TheOne
│   └── buildings/             # Forge, Armory, MixingPot, Workshop, etc.
├── talents/                   # NEW: Component-based talent system
│   ├── TalentDefinition.ts    # Data interfaces for talent definitions
│   ├── TalentInstance.ts      # Runtime talent attached to a troll
│   └── TalentRegistry.ts     # Central talent management + player tracking
├── systems/                   # Game systems
│   ├── crafting/              # CraftingEngine, RecipeDefinition
│   ├── spawning/              # SpawnSystem (items, animals, fish)
│   ├── trade/                 # TradeShip coordinator
│   ├── survival/              # Heat/cold mechanics
│   ├── combat/                # Experience, damage
│   └── modes/                 # GameMode voting, ForcedDuel, Respawn
├── data/                      # Pure data definitions (NO logic)
│   ├── trolls/                # All 28 troll class definitions
│   ├── talents/               # All talent + tree definitions
│   ├── recipes/               # All 93 crafting recipes
│   ├── ItemIds.ts             # FourCC item constants
│   └── UnitIds.ts             # FourCC unit constants
├── ui/                        # UI system
│   ├── UIManager.ts           # UI coordinator across game phases
│   ├── frames/                # Custom WC3 frames (TalentTree, etc.)
│   └── boards/                # Scoreboards (Tribe, Observer)
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

### Crafting System
- **7 crafting stations**: Forge, Armory, Tannery, MixingPot, Workshop, WitchDoctorHut, CraftMaster
- **~93 recipes** total across all stations
- **Recipe format**: Ordered slot list, each slot accepts 1+ item type IDs
- **Search ranges**: Troll=100, CraftMaster=300, Buildings=700
- **Special handlers**: Mixing (herb threshold), Tanning (hide→armor)

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
- FourCC IDs in `/src/data/` are placeholders - must be mapped to actual IDs
- Transformation uses BearForm ability to swap unit types (WC3 engine trick)

### WC3 Limitations
- No true classes at runtime - JASS is procedural, Lua via TSTL
- Max 6 inventory slots per unit
- Max 12 player slots + 4 neutral players
- Frame API requires Reforged 1.32+
- Item visibility trick for recipe matching (setVisible false → search → restore)

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

### Legacy Wurst Code Reference
The original Wurst code is in `/wurst/` (518 files). Key mappings:
- `wurst/systems/core/Classes.wurst` → `src/entities/trolls/TrollRegistry.ts`
- `wurst/systems/core/GameStates.wurst` → `src/core/GameStateManager.ts`
- `wurst/systems/core/Tribe.wurst` → `src/core/TribeManager.ts`
- `wurst/systems/crafting/QuickMake.wurst` → `src/systems/crafting/CraftingEngine.ts`
- `wurst/systems/entities/UnitEntity.wurst` → `src/entities/EntityManager.ts`
- `wurst/systems/spawns/ResourceSpawns.wurst` → `src/systems/spawning/SpawnSystem.ts`
- `wurst/objects/abilities/SpellBookHashMap.wurst` → `src/data/talents/AllTalentDefinitions.ts`
- `wurst/objects/abilities/TrollUpgrade.wurst` → `src/entities/trolls/TrollRegistry.ts`
- `wurst/config/GameConstants.wurst` → `src/config/GameConfig.ts`

## Current Status
- [x] Project structure scaffolded
- [x] Core infrastructure (GameState, PlayerManager, TribeManager)
- [x] Entity system (UnitEntity, Hostile, BonyAnimal hierarchy)
- [x] Troll class system (BaseTroll, TrollDefinition, TrollRegistry)
- [x] All 28 troll definitions as data
- [x] Talent system architecture (TalentDefinition, TalentInstance, TalentRegistry)
- [x] Crafting engine (CraftingEngine, RecipeDefinition)
- [x] Spawn system framework
- [x] UI framework (UIManager, TalentTreeFrame)
- [ ] Port all 93 crafting recipes from Wurst
- [ ] Port all troll abilities as talent definitions
- [ ] Extract actual FourCC IDs from base.w3x
- [ ] Implement Mixing.ts (herb combination logic)
- [ ] Implement Tanning.ts (hide→armor logic)
- [ ] Implement Experience system
- [ ] Implement Trade ship system
- [ ] Implement Heat/cold survival mechanics
- [ ] Implement Game mode voting
- [ ] Implement Class selector UI
- [ ] Implement Scoreboard UI
- [ ] Implement all 7+ boss entities
- [ ] Implement all 8+ animal entities
- [ ] Implement all 10+ building entities
- [ ] Wire actual WC3 object IDs
- [ ] Map compilation pipeline
- [ ] Testing in WC3 Reforged
