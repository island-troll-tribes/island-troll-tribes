# WC3 Modding Cookbook: Patterns, Techniques, and Anti-Patterns

> The "recipes" experienced modders use repeatedly. Covers movement physics,
> spell systems, damage engines, buff/aura systems, data storage, performance,
> UI, inventory tricks, AI, desync safety, memory management, and Lua-specific patterns.

## Table of Contents
- [Foundational Patterns](#foundational-patterns)
- [Movement and Physics](#movement-and-physics)
- [Spell and Ability Systems](#spell-and-ability-systems)
- [Damage Systems](#damage-systems)
- [Buff, Aura, and Status Effects](#buff-aura-and-status-effects)
- [Data Storage and MUI](#data-storage-and-mui)
- [Timer and Performance](#timer-and-performance)
- [UI Patterns](#ui-patterns)
- [Inventory and Equipment Tricks](#inventory-and-equipment-tricks)
- [AI and Threat Systems](#ai-and-threat-systems)
- [Desync Safety (GetLocalPlayer)](#desync-safety-getlocalplayer)
- [Memory Management](#memory-management)
- [Lua/Reforged-Specific](#luareforged-specific)
- [Anti-Patterns](#anti-patterns)
- [Top 10 Must-Know Patterns](#top-10-must-know-patterns)

---

## Foundational Patterns

### Dummy Caster
Cast any WC3 ability from a trigger at any location/target.

1. Create unit type: Movement=None, Speed=0, Cast Point=0, Model=`none.mdl`, Locust, no attack, Food=0
2. On trigger: create dummy at location, owned by casting player
3. Add desired ability, set level, order to cast on target
4. Add 1-2s expiration timer to clean up

**Critical rule:** A unit cannot have two abilities based on the same root ability type.

**Variations:** Single shared dummy, per-spell-type dummies, recycled dummy pool.

### Bear Form Transformation Trick
Permanently transform hero type while preserving handle ID, items, abilities, stats.

1. Create ability based on Bear Form (`Abrf`)
2. Set "Normal Form Unit" = target type, "Alternate Form Unit" = source type
3. Via trigger: add ability, immediately remove it
4. Hero is now permanently the new unit type

**Caveat:** Transformed units cannot build buildings (engine bug).

### Spellbook Tricks

**Hide passives:** Put passive in Spellbook → add to unit → disable Spellbook for player. Icon gone, effect stays.

**Dynamic spell lists (Order ID collision):** Two spellbooks with same Base Order ID share their spell lists. Create empty spellbook on unit, add disabled single-spell spellbooks — spells appear in the empty one.

---

## Movement and Physics

### Knockback System
Push units along a vector with deceleration.

1. Record: target, angle, initial velocity, friction
2. Start 0.03125s (32 Hz) periodic timer
3. Each tick: `dx = vel * Cos(angle)`, `dy = vel * Sin(angle)`, move via SetUnitX/Y
4. Decelerate: linear `vel -= friction` or exponential `vel *= 0.96`
5. Check bounds, stop when velocity <= threshold

**Key:** Use `SetUnitX/SetUnitY` (fast, no pathcheck, no order interrupt) NOT `SetUnitPosition` (slow, checks pathing, interrupts orders).

### Dash / Leap / Jump

**Dash:** Same as knockback but toward target point.

**Jump (with arc):**
- Move X/Y like a dash
- Adjust flying height: `height = 4 * maxHeight * t * (1 - t)` where t goes 0→1
- Must give unit Crow Form ability once to enable flying height changes

### Missile / Projectile System
1. Create dummy with visible model at source
2. Each tick (0.03s), move along trajectory
3. Straight-line: fixed angle/speed. Homing: recalculate angle, optionally limit turn rate
4. On reaching target (distance < threshold), fire "on hit" callback, destroy dummy

**Performance:** 300+ simultaneous projectiles with single timer + linked list iteration.

---

## Spell and Ability Systems

### Channel-Based Custom Spells
1. Create ability based on Channel (`ANcl`) — has no hardcoded effect
2. Set target type (Unit/Point/No-Target), unique Base Order ID per spell
3. Detect `EVENT_PLAYER_UNIT_SPELL_EFFECT` in triggers
4. Apply custom effect

### Combo / Chain System
1. On base ability cast, add "combo" ability to caster
2. Start expiration timer
3. If combo ability cast in window, add next in chain
4. On timer expiry, remove uncommitted combo ability

**Tip:** Same icon + button position = visual "replacement" on command card.

### Cooldown Reduction
```
NewCooldown = (BaseCooldown - FlatOffset) * Product(1 - source_i) * (1 - FlatCDR)
```
- Register abilities on first cast, save base cooldown
- On cast: calculate new CD, set via `BlzSetAbilityRealLevelField` (1.31+)
- Always calculate from BASE cooldown, never current

---

## Damage Systems

### Damage Detection Engine

**Runed Bracers Trick (pre-1.31):**
1. Give all units modified Runed Bracers with 200% spell damage reduction
2. Spell damage becomes NEGATIVE (100 → -100)
3. In damage trigger: negative = spell, positive = physical

**Modern (1.31+):** Native `EVENT_PLAYER_UNIT_DAMAGED` with `GetTriggerDamage()`, `GetTriggerDamageType()`. Modify via `BlzSetEventDamage()`.

### Shield / Damage Absorption

**Three approaches:**
1. Anti-Magic Shell: built-in "Shield Life" field (spell only)
2. Mana Shield: absorbs using mana (1:1 ratio)
3. **Trigger-based (most flexible):** Damage Engine intercepts damage → subtract from shieldHP variable → reduce `DamageEventAmount` → remove buff when shield breaks

---

## Buff, Aura, and Status Effects

### Damage Over Time (DoT)
1. Record: target, dmg/tick, interval, duration, source
2. Add to linked list, single periodic timer iterates all
3. Stacking: different sources = separate stacks. Same source = refresh duration
4. On expiry: remove from list

### Custom Aura System (Manual Pattern)
1. Track aura carriers in group
2. Periodic timer (0.5-1.0s)
3. Each tick: pick units in radius, add bonus ability if not present
4. Compare with previous tick's affected set — remove ability from units that left

### Applying Buffs Without Visible Ability
**Tornado Slow Aura trick:**
1. Create ability based on `Aasl` (Tornado Slow Aura)
2. Set Targets = Self, all values = 0
3. Assign desired buff
4. Add/remove ability to apply/remove buff — no icon, stacks, no dummy needed

---

## Data Storage and MUI

### Unit Indexer + Arrays
- `SetUnitUserData` assigns unique integer (1-8190) per unit
- Store data: `myData[GetUnitUserData(unit)] = value`
- Faster than hashtables. Recycle indices on unit death.

### Hashtable + Handle ID
- `SaveInteger(ht, GetHandleId(handle), key, value)`
- Works for ANY handle type (timers, triggers, items)
- Max 256 hashtables globally — use one with different keys

### MUI Spell Instance Pattern
1. Global counter `MUI` increments on each cast
2. Store data in arrays at index `MUI`
3. Periodic timer iterates 1 to MUI
4. **De-indexing:** When instance i finishes, copy data from MUI slot into i, decrement MUI

---

## Timer and Performance

### Single Timer vs Multiple Timers
- **Single (T32-style):** One 0.03125s timer drives all systems via linked list. Simple but can spike.
- **Multiple:** Each instance gets own timer. Natural load distribution. Must recycle timers.

### JASS Execution Limit
Code executes max **32 times per second**. Timer intervals below 0.03125s are pointless. This is an engine limit, not a language limit — applies to Lua too.

### Timer Recycling
Pre-create pool at map init. `NewTimer()` pops from stack, `ReleaseTimer()` pushes back. Prevents handle corruption.

---

## UI Patterns

### Multiboard Scoreboard
Create at init, set columns/rows, update periodically. Use `GetLocalPlayer()` for per-player boards.

### Custom Frames (1.31+)
- Coordinates: 0.0/0.0 (bottom-left) to 0.8/0.6 (top-right), resolution-independent
- 4:3 limitation: parent to `ConsoleUIBackdrop` to bypass
- SimpleFrames are NOT bound by 4:3
- All `Blz` frame functions (except `BlzGetFrameByName`) are desync-safe in local blocks

---

## Inventory and Equipment Tricks

### Extended Inventory (Page Swapping)
Reserve 1 slot for "switch page" ability. Drop current 5 items, pick up 5 from other page. Track active page per unit.

### Item Stats via Hidden Abilities
On pickup: add hidden ability (in disabled spellbook) for stat bonus. On drop: remove. More flexible than item's built-in fields.

---

## AI and Threat Systems

### Aggro / Threat System
1. Track `threatTable[hostile][player_unit] = value`
2. On damage dealt: add to threat. On healing: distribute across hostiles in combat
3. Periodically: switch target if another unit exceeds current by threshold (10-20%)
4. Issue "smart" order (not "attack") for smoother AI
5. On 10s no interaction: clear threat, return to spawn, full regen

---

## Desync Safety (GetLocalPlayer)

### SAFE inside GetLocalPlayer block:
- Textures, colors, alpha on frames
- Creating/destroying texttags (floating text)
- Showing/hiding UI elements
- Playing sounds
- Setting camera position
- All `Blz` frame functions except `BlzGetFrameByName`

### CAUSES DESYNCS:
- Creating/destroying synced handles (units, items, destructables, triggers, timers)
- `ForGroup` and `ForForce` in local blocks
- Any action creating a handle with globally-sequenced ID

### Empty-String Trick (safe visual variation):
```lua
local effectPath = ""
if GetLocalPlayer() == targetPlayer then
    effectPath = "Abilities\\Spells\\..."
end
AddSpecialEffect(effectPath, x, y)  -- handle created on ALL clients
```

---

## Memory Management

### Handle Types That Leak
Must destroy: Groups, Locations, Effects, Forces, Timers, Triggers, Lightning, TextTags, TimerDialogs

### Best Practices
1. Store handles in variables before destroying
2. Null local handle variables before returning (JASS)
3. Pause timers before destroying (or recycle)
4. Kill units before removing
5. Focus leak prevention on hot paths (periodic code)

---

## Lua/Reforged-Specific

### Disabled GC (CRITICAL for WC3 1.32+)
Blizzard disabled Lua's GC to prevent desyncs. Replacement GC is inadequate.

**Mitigations:**
- Reuse objects/tables on hot paths
- Avoid closures in tight loops (each = new Lua table)
- Use object pools for frequent create/destroy
- TSTL generates many temp tables — minimize on fast timers

### Post-1.31 Natives That Change Everything
- `BlzSetAbilityRealLevelField` — modify ability fields at runtime
- Frame API — full custom UI
- Damage event natives — native damage detection
- `BlzGetUnitAbility` — check ability presence

---

## Anti-Patterns

| Anti-Pattern | Problem | Solution |
|-------------|---------|----------|
| Terrain Deformation abilities (Thunderclap, War Stomp) | Causes lag even with deformation=0 | Use Channel base + trigger effects |
| `SetUnitPosition` in loops | Slow, checks pathing, interrupts orders | Use `SetUnitX/SetUnitY` |
| Timer intervals < 0.03125s | Pointless, engine limit is 32 Hz | Use 0.03125s or 0.03s |
| Not nulling JASS locals | Handle reference leak | Set to null before return |
| `PolledWait/TriggerSleepAction` for MUI | Unreliable, not MUI-safe | Use timers |
| Too many hashtables | Max 256 global limit | One hashtable, different keys |
| `GetLocationZ` in gameplay logic | Returns different values per client → desync | Only use for cosmetics in local blocks |
| `none` model path for dummies | Wrong; some defaults still have collision | Use `none.mdl` |

---

## Top 10 Must-Know Patterns

1. **Dummy Caster** — Foundation of all triggered spells
2. **Bear Form Trick** — Hero type transformation preserving state
3. **SetUnitX/Y + 0.03s Timer** — All movement physics
4. **Unit Indexer + Arrays** — Fast, scalable data attachment
5. **Damage Engine** — Intercept, identify, modify all damage
6. **Spellbook Order ID Collision** — Dynamic ability management
7. **GetLocalPlayer Safety** — Desync-free per-player visuals
8. **Timer Recycling** — Handle leak prevention
9. **Channel as Base Ability** — Clean custom spells
10. **Disabled Lua GC** — The critical Reforged-era constraint
