# Game Systems Reference

Detailed documentation for each major system in the Island Troll Tribes W3TS rewrite.

## Table of Contents

- [Survival System](#survival-system)
- [Crafting System](#crafting-system)
- [Transformation System](#transformation-system)
- [Talent System](#talent-system)
- [Spawn System](#spawn-system)
- [Game Mode System](#game-mode-system)
- [Experience System](#experience-system)
- [Entity System](#entity-system)

---

## Survival System

**File:** `src/systems/survival/SurvivalSystem.ts`
**Ported from:** `wurst/systems/core/StatLoss.wurst`, `wurst/objects/abilities/Heat.wurst`

### Overview

Three stats degrade over time for each living troll:

| Stat | Storage | Death Condition | Display |
|------|---------|-----------------|---------|
| Heat | Player gold resource | Reaches 0 | Gold UI |
| Energy | Unit mana | Reaches 0 | Mana bar |
| Health | Unit HP | N/A (standard death) | HP bar |

### Timers

**Stat Loss Timer** (default 3.0s, configurable via `-pn` and `-sa` modes):
- Subtracts `STAT_LOSS_AMOUNT` from heat, mana, and HP
- Modifiers:
  - Camouflage: 3x all losses
  - Bonfire aura: -2 heat loss
  - Frozen debuff: +1-5 random extra heat loss
  - Depression stacks: extra mana loss (escalating with stack count)

**Stat Gain Timer** (default 35.0s):
- Adds heat from equipped gear:
  - Coat: +5
  - Boots: +2
  - Gloves: +2
  - Fire Pinion: +8
- Daytime bonus (6:00-18:00): +3 heat
- The Glow buff: +2 heat

**Death Check Timer** (0.03s):
- Fast poll for stat-death (heat=0 or mana=0)
- Kill attributed to nearest enemy troll within 1200 range
- Anchor Soul buff prevents stat-death

### Configuration

All values are in `GameConfig`:
- `HEAT_MAXIMUM` (default 100) — max heat capacity
- `HEAT_PER_CAST` (default 15) — heat added per fire cast
- `STAT_LOSS_INTERVAL` (default 3.0s) — time between stat loss ticks
- `STAT_LOSS_AMOUNT` (default 1) — base stat loss per tick
- `STAT_GAIN_INTERVAL` (default 35.0s) — time between gear heat gain ticks
- `STAT_LOSS_MULTIPLIER` (default 1.0) — global multiplier (doubled by `-db` mode)

---

## Crafting System

**Files:** `src/systems/crafting/CraftingEngine.ts`, `RecipeDefinition.ts`, `MixingSystem.ts`, `TanningSystem.ts`
**Data:** `src/data/recipes/AllRecipes.ts`
**Ported from:** `wurst/systems/crafting/QuickMake*.wurst`

### How Crafting Works

1. Player drops items on the ground near a crafting station (building)
2. Player casts a QuickMake ability on the station
3. CraftingEngine searches for items on the ground within range
4. Engine matches found items against the recipe's ingredient slots
5. If all slots filled, consumed items are removed and output item is created

### Search Ranges

| Source | Range |
|--------|-------|
| Troll (personal craft) | 100 |
| CraftMaster | 300 |
| Buildings (Forge, Armory, etc.) | 700 |

### Crafting Stations

| Station | Recipes | Examples |
|---------|---------|----------|
| Forge | ~24 | Iron/steel ingots, spears, axes |
| Armory | ~5 | Battle armor, battle gloves, battle shield |
| Tannery | ~9 | Hide boots/gloves/coats (elk, wolf, bear) |
| MixingPot | ~21 | Potions, scrolls, cloaks |
| Workshop | ~10 | Building kits, smoke bomb, fire bomb |
| WitchDoctorHut | ~12 | Scrolls, spirit items, magic items |
| CraftMaster | ~12 | Building kits (camp fire, tent, forge, etc.) |

### Special Systems

**MixingSystem** — Herb combination with priority ordering. Given a set of herbs, evaluates 19 rules top-to-bottom; first match wins. Herbs: river root, river stem, athelas seed, blue, yellow, orange, purple.

**TanningSystem** — Converts hides to armor at the Tannery. Each recipe requires 2-3 hides of the same type to produce boots (2), gloves (2), or coat (3).

### Recipe Data Format

```typescript
interface RecipeDefinition {
  id: string;                    // Unique identifier
  abilityId: number;             // QuickMake ability FourCC
  name: string;                  // Display name
  description: string;           // Tooltip text
  station: CraftingStation;      // Which building
  ingredients: RecipeSlot[];     // Ordered ingredient list
  outputItemId: number;          // Result item FourCC
  iconPath?: string;             // Button icon path
}

interface RecipeSlot {
  acceptedItemIds: number[];     // One or more valid item types
  displayName?: string;          // "Bone or Stick"
}
```

---

## Transformation System

**File:** `src/systems/evolution/TransformationSystem.ts`
**Ported from:** `wurst/lib/Transformation.wurst`, `wurst/objects/abilities/TrollUpgrade.wurst`

### WC3 Bear Form Trick

WC3 has no native "change unit type" function. Instead, the game uses the **Bear Form** ability:

1. At compile time, create a Bear Form ability that maps `originUnitType ↔ targetUnitType`
2. At runtime, add the ability to the unit → unit automatically morphs
3. Remove the ability → transformation is permanent

### Evolution Paths

35 registered transformation pairs across 7 class families:

```
Hunter → Warrior → Juggernaut
       → Tracker → Juggernaut

Mage → Elementalist → Dementia Master
     → Hypnotist   → Dementia Master

Priest → Booster      → Sage
       → Master Healer → Sage

Beastmaster → Shapeshifter → Jungle Tyrant
            → Druid        → Jungle Tyrant

Thief → Escape Artist → Assassin
      → Contortionist → Assassin

Scout → Observer → Spy
      → Trapper  → Spy

Gatherer → Radar Gatherer → Omnigatherer
         → Herb Master    → Omnigatherer
```

### Stat Preservation

During transformation:
1. Save STR/AGI/INT, HP, mana
2. Add Bear Form ability (unit morphs)
3. Remove ability
4. Restore all stats
5. Run after-callbacks (color correction, proper name update)

---

## Talent System

**Files:** `src/talents/TalentDefinition.ts`, `TalentInstance.ts`, `TalentRegistry.ts`
**UI:** `src/ui/frames/TalentTreeFrame.ts`

### Overview

Replaces the legacy WurstScript spellbook level-swapping system with a component-based approach. Talents are modifiers that attach to troll instances.

### Architecture

```
TalentDefinition (data)     → What a talent does
TalentInstance (runtime)    → A talent attached to a specific troll
TalentRegistry (singleton)  → Central management + player progress tracking
TalentTreeFrame (UI)        → Visual talent tree with click-to-unlock
```

### Talent Effects

| Effect Type | Description |
|-------------|-------------|
| GrantAbility | Adds a WC3 ability to the troll |
| StatModifier | Modifies STR/AGI/INT/HP/mana/armor/damage |
| AbilityModifier | Changes properties of an existing ability |
| Custom | Arbitrary callback function |

### Point Economy

- 1 talent point per level-up
- 2 bonus points on sub-class evolution
- 3 bonus points on super-class evolution
- Points are tracked per-player by TalentRegistry

---

## Spawn System

**File:** `src/systems/spawning/SpawnSystem.ts`
**Ported from:** `wurst/systems/spawns/ResourceSpawns.wurst`

### Islands

| Island | Items | Animals | Location |
|--------|-------|---------|----------|
| NW | 15 spawns | 4 spawns | Northwest |
| NE | 16 spawns | 4 spawns | Northeast |
| SE | 16 spawns | 4 spawns | Southeast |
| SW | 23 spawns | 6 spawns | Southwest |

### Spawn Cycles

| Cycle | Interval | Content |
|-------|----------|---------|
| Item/Animal | 120s | Resources + hostile animals |
| Fish/Hawk | 240s | Fish in water + hawks |

### Weighted Pools

Items spawn with time-interpolated weights — early game favors basic resources (sticks, flint), late game shifts toward higher-tier materials.

Animal types have separate weighted pools: Elk (common), Wolf, Bear, Panther, Snake (rare).

### Diminishing Returns

Spawn rates decrease by 0.2 (items) / 0.3 (animals) per cycle to prevent resource flooding in long games.

### Limits (configurable via game modes)

| Resource | Default | Low Mode | High Mode |
|----------|---------|----------|-----------|
| Animals | 60 | 40 (`-lfl`) | 90 (`-rfl`) |
| Fish | 100 | 50 (`-lfl`) | 320 (`-rfl`) |
| Items | 350 | 250 (`-lil`) | 700 (`-ril`) |

---

## Game Mode System

**File:** `src/systems/modes/GameModeSystem.ts`
**Ported from:** `wurst/systems/modes/GameMode.wurst`, `GameModeInit.wurst`

### Selection Process

1. First player (host) enters mode commands via chat during a 60-second window
2. Commands prefixed with `-` (e.g., `-sf`, `-ffa`, `-1v1`)
3. Modes modify `GameConfig` fields
4. Type `-start` to skip remaining time

### Mode Categories

| Category | Key Modes |
|----------|-----------|
| General | `-ppt N` (players per tribe), `-ffa` (free for all) |
| Pro | `-1v1`, `-to` (tournament), `-el` (elimination), `-fd` (forced duel) |
| Troll Selection | `-sf` (start with fire), `-qp` (quick pick), `-all` (same class) |
| Economy | `-fs` (fast spawns), `-hm` (hot mode), `-eb` (enable boats) |
| Hard | `-sv` (survival combo), `-fm` (famine), `-db` (double degradation) |
| Casual | `-sa` (safe/slow degradation), `-lv` (lavish food), `-nil` (no inventory limit) |
| Special | `-sm` (shrinking map), `-gp N` (grace period), `-re` (respawn system) |
| Testing | `-tm` (test mode), `-d` (dev mode) |

---

## Experience System

**File:** `src/systems/combat/ExperienceSystem.ts`
**Ported from:** `wurst/systems/core/Experience.wurst`

### XP Formula

Required XP per level: `150 * level + 50 * level²`

### Class Multipliers

| Tier | Multiplier | When |
|------|-----------|------|
| Base | 4x | Starting class |
| Sub | 3x | After first evolution |
| Super | 2x | After final evolution |

Higher tier = less bonus XP to balance the power increase.

### Shared XP

When a unit dies, XP is split among all allied heroes within 1200 range of the killer. Gem of Knowledge provides a 1.5x bonus to the holder.

---

## Entity System

**File:** `src/entities/EntityManager.ts`
**Ported from:** `wurst/systems/entities/UnitEntity.wurst`

### Hierarchy

```
UnitEntity (abstract base)
├── Hostile (drops items on death, creates corpses)
│   ├── BonyAnimal (adds bone to drops)
│   │   ├── Elk
│   │   ├── Hawk
│   │   └── TheOne
│   ├── Wolf, Bear, Panther, Snake
│   ├── Fish, GreenFish
│   └── AncientHydra, LesserHydra, Mammoth, AlligatorMan, DiscoDuck
├── Building
│   ├── Forge, Armory, Tannery, MixingPot
│   ├── Workshop, WitchDoctorHut
│   ├── CampFire, Tent, MudHut, TrollHut
│   └── Hatchery, TeleportBeacon
└── BaseTroll (abstract)
    └── [28 troll class variants via TrollRegistry]
```

### Factory Pattern

Each entity class registers itself with `UnitEntity.registerFactory(unitTypeId, factoryFn)`. When WC3 creates a unit, `EntityManager` automatically wraps it in the correct entity class based on its type ID.

```typescript
// In Elk.ts
static register(): void {
  UnitEntity.registerFactory(UnitTypeIds.ELK, (unit) => new Elk(unit));
}
```
