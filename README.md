[![island-troll-tribes](https://circleci.com/gh/island-troll-tribes/island-troll-tribes/tree/master.svg?style=svg)](https://app.circleci.com/pipelines/github/island-troll-tribes/island-troll-tribes)

# Island Troll Tribes

A team survival map for [Warcraft III](http://us.blizzard.com/en-us/games/war3/) where players control trolls, gather resources, craft items, evolve their class, and compete against other tribes.

Visit our [Discord server](https://discord.gg/hYzTRYf) for more information on the game.
See the [Hive Workshop thread](https://www.hiveworkshop.com/threads/island-troll-tribes-v2-99f.297609/) and the [ITT Wiki](https://islandtrolltribes.fandom.com) for gameplay details.

## W3TS Rewrite (v4.0)

This branch contains a **complete rewrite** from WurstScript to TypeScript using the [W3TS framework](https://github.com/cipherxof/w3ts). The original Wurst codebase (518 files, 43K lines) is preserved in `/wurst/` for reference.

### Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| Language | TypeScript | Game logic, strict mode |
| Transpiler | [TSTL](https://typescripttolua.github.io/) | TypeScript → Lua 5.3 |
| Framework | [W3TS v3.0](https://github.com/cipherxof/w3ts) | WC3 API wrappers (Unit, Item, Frame, Timer, Trigger) |
| Plugin | [war3-transformer](https://github.com/aspect-build/war3-transformer) | Compile-time object data generation |
| UI (optional) | [w3ts-jsx](https://github.com/voces/w3ts-jsx) | React-like WC3 frame components |
| Packaging | Ceres / manual | Bundle Lua into .w3x map archive |

### Requirements

- [Node.js](https://nodejs.org/) >= 18
- [Warcraft III Reforged](https://playwarcraft3.com/) 1.32+ (for Frame API and Lua scripting)

### Quick Start

```bash
# Install dependencies
npm install

# Build (TypeScript → Lua bundle)
npm run build

# Type-check without emitting
npm run typecheck

# Watch mode for development
npm run watch

# Run tests
npm test
```

The build produces a single Lua file at `dist/tstl_output.lua` which must be packaged into the `.w3x` map archive.

### Project Structure

```
src/
├── main.ts                     # Entry point (addScriptHook MAIN_AFTER)
├── core/                       # GameStateManager, PlayerManager, TribeManager
├── config/                     # GameConfig (balance constants, mode settings)
├── data/                       # Pure data: ItemIds, UnitIds, troll/talent/recipe definitions
├── entities/                   # Entity system
│   ├── EntityManager.ts        # UnitEntity base class + factory registry
│   ├── trolls/                 # BaseTroll, TrollDefinition, TrollRegistry (28 classes)
│   ├── animals/                # Elk, Wolf, Bear, Panther, Snake, Fish, Hawk (8 types)
│   ├── bosses/                 # Hydra, Mammoth, AlligatorMan, DiscoDuck, TheOne (6 types)
│   └── buildings/              # Forge, Armory, Tannery, MixingPot, etc. (12 types)
├── talents/                    # Component-based talent system
├── systems/                    # Game systems
│   ├── crafting/               # CraftingEngine, MixingSystem, TanningSystem
│   ├── survival/               # SurvivalSystem (heat/cold/energy degradation)
│   ├── combat/                 # ExperienceSystem (custom XP, class multipliers)
│   ├── evolution/              # TransformationSystem (Bear Form trick)
│   ├── selection/              # ClassSelectionSystem (totem-based picking)
│   ├── modes/                  # GameModeSystem (50+ configurable modes)
│   └── spawning/               # SpawnSystem (items, animals, fish)
└── ui/                         # UIManager, TalentTreeFrame, ScoreboardFrame
```

## Game Architecture

### State Machine

The game progresses through linear phases managed by `GameStateManager`:

```
Initialization → ModesSelection → TribeInitialization → ClassSelection → Gameplay → Postgame
```

### Key Systems

**Troll Classes** — 7 base classes (Hunter, Mage, Priest, Beastmaster, Thief, Scout, Gatherer) with 3-tier evolution (Base → Sub → Super), 28+ total variants. Evolution uses the WC3 Bear Form ability trick to swap unit types while preserving stats.

**Survival** — Heat (displayed as gold), energy (mana), and health degrade every 3 seconds. Equipment provides heat bonuses; campfires and mage fires provide warmth in an AoE. Camouflage triples stat loss. Death occurs when heat or mana reaches zero.

**Crafting** — 93 recipes across 7 stations (Forge, Armory, Tannery, MixingPot, Workshop, WitchDoctorHut, CraftMaster). Drop items near a station, cast QuickMake, engine searches ground for matching ingredients.

**Talents** — Component-based system replacing the legacy spellbook level-swapping. Talents attach as modifiers to troll instances, granting abilities, stat bonuses, or custom behavior. Managed via a talent tree UI.

**Spawning** — 4 islands with weighted probability pools for items and animals. 120-second item/animal cycles, 240-second fish/hawk cycles, with diminishing returns over time.

**Game Modes** — 50+ modes selected by the host player via chat commands. Modes modify GameConfig values affecting spawn rates, heat mechanics, team composition, difficulty, and special rules.

### Design Patterns

1. **Data-Driven** — All game content defined as TypeScript interfaces in `/src/data/`. No logic in data files.
2. **Entity Factory** — `UnitEntity` base class with type-keyed factory registry. WC3 unit creation automatically produces the correct entity.
3. **Singleton Services** — Core systems accessed via `getInstance()` pattern.
4. **Component/Modifier** — Talents attach to trolls as composable modifiers.

## Developing

### Adding a New Troll Class

1. Add FourCC to `src/data/UnitIds.ts`
2. Add definition to `src/data/trolls/AllTrollDefinitions.ts`
3. Add evolution pairs to `src/systems/evolution/TransformationSystem.ts`
4. Add to `src/systems/selection/ClassSelectionSystem.ts` if it's a base class

### Adding a New Recipe

1. Add any new item IDs to `src/data/ItemIds.ts`
2. Add recipe entry to `src/data/recipes/AllRecipes.ts`

### Adding a New Entity

1. Create class extending `Hostile`, `BonyAnimal`, or `Building`
2. Implement `static register()` calling `UnitEntity.registerFactory()`
3. Override `getDrops()`, `getNumCorpses()`, `postCreate()` as needed

### WC3-Specific Notes

- **MUST** use `addScriptHook(W3TS_HOOK.MAIN_AFTER, main)` — direct calls fail silently
- **ALL** Lua must bundle into ONE file (WC3 limitation, configured via `tsconfig.json`)
- **Lua GC is disabled** in WC3 1.32+ — minimize allocations on hot paths, reuse objects, avoid closures in tight loops
- FourCC IDs are compile-time generated by war3-transformer (matching Wurst's `compiletime()`)
- Bear Form ability trick swaps unit types for class evolution
- Heat is stored as the player's gold resource (WC3 UI displays it automatically)

## Contributing

All contributions must be made via pull requests.

When creating a PR, include a description of gameplay changes prefaced with `[$changelog: ]`, as demonstrated in [#406](https://github.com/island-troll-tribes/island-troll-tribes/pull/406).

## Legacy Wurst Code

The original WurstScript source is preserved in `/wurst/` (518 files). Key file mappings between Wurst and W3TS are documented in `CLAUDE.md`.
