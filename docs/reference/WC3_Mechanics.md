# Warcraft III Engine Mechanics Reference

> Comprehensive reference for WC3 engine-level mechanics relevant to modding.
> Covers damage, combat, stats, buffs, auras, and system interactions.

## Table of Contents
- [Damage System](#damage-system)
- [Hero Attributes](#hero-attributes)
- [Attack Speed](#attack-speed)
- [Movement Speed](#movement-speed)
- [Evasion and Miss](#evasion-and-miss)
- [Critical Strike, Bash, and Orb Effects](#critical-strike-bash-and-orb-effects)
- [Buff System](#buff-system)
- [Aura Mechanics](#aura-mechanics)
- [Regeneration](#regeneration)
- [Experience System](#experience-system)
- [Order IDs](#order-ids)
- [Engine Limitations](#engine-limitations)

---

## Damage System

### Core Formula (Two-Stage)

```
Final Damage = Base_Damage * AT_vs_DT_Multiplier * (1 - Armor_Reduction)
Armor_Reduction = (0.06 * armor) / (1 + 0.06 * |armor|)
```

Each point of armor increases effective HP by 6% of base HP.

**Stage 1**: Attack Type vs Defense Type multiplier (applied before armor value).
**Stage 2**: Armor value reduction (only for Normal damage type).

### Attack Type vs Defense Type Table

| Attack \ Armor | Light | Medium | Heavy | Unarmored | Fortified | Hero | Divine |
|---------------|-------|--------|-------|-----------|-----------|------|--------|
| Normal        | 100%  | 150%   | 100%  | 100%      | 70%       | 100% | 5%     |
| Piercing      | 200%  | 75%    | 100%  | 150%      | 35%       | 50%  | 5%     |
| Magic         | 125%  | 75%    | 200%  | 100%      | 35%       | 50%  | 5%     |
| Siege         | 100%  | 50%    | 100%  | 150%      | 150%      | 50%  | 5%     |
| Hero          | 100%  | 100%   | 100%  | 100%      | 50%       | 100% | 5%     |
| Chaos         | 100%  | 100%   | 100%  | 100%      | 100%      | 100% | 100%   |
| Spells        | 100%  | 100%   | 100%  | 100%      | 100%      | 75%  | 5%     |

### Damage Types (determines if armor VALUE reduces damage)

| Damage Type | Reduced by Armor? | Affects Spell Immune? | Notes |
|-------------|-------------------|----------------------|-------|
| Normal (Physical) | Yes | Yes | Standard auto-attack damage |
| Enhanced Physical | No | Yes | Ignores armor value |
| Magic | No | No | Blocked by spell immunity |
| Universal | No | Yes | Ignores armor AND spell immunity |

### Ethereal Units
- Take no damage from Normal, Pierce, Siege, Hero, Chaos attack types
- Take 66% extra magic damage (1.66x multiplier)

### Spell Damage Reduction
- Heroes take **30% less** spell damage by default
- Runed Bracers item adds additional spell damage reduction
- Spell immunity blocks most non-ultimate spells

### UnitDamageTarget Native
```
UnitDamageTarget(source, target, amount, attack, ranged, attackType, damageType, weaponType)
```
- `attack`: counts as an attack (triggers attack events)
- `ranged`: if true, prevents Thorns Aura reflection
- `weaponType`: only affects impact sound; `WEAPON_TYPE_WHOKNOWS` is safe

### Trigger Constants
- Attack types: `ATTACK_TYPE_MELEE` (Normal), `ATTACK_TYPE_PIERCE`, `ATTACK_TYPE_SIEGE`, `ATTACK_TYPE_HERO`, `ATTACK_TYPE_CHAOS`, `ATTACK_TYPE_MAGIC` (Spells)
- Damage types: `DAMAGE_TYPE_NORMAL`, `DAMAGE_TYPE_MAGIC`, `DAMAGE_TYPE_UNIVERSAL`, `DAMAGE_TYPE_FIRE`, `DAMAGE_TYPE_COLD`, etc.

---

## Hero Attributes

### Standard WC3 Values

| Attribute | HP | HP Regen/s | Mana | Mana Regen/s | Armor | Attack Speed | Primary Attr |
|-----------|-----|-----------|------|-------------|-------|-------------|-------------|
| Strength | +25 | +0.05 | -- | -- | -- | -- | +1 damage |
| Agility | -- | -- | -- | -- | +0.3 | +2% | +1 damage |
| Intelligence | -- | -- | +15 | +0.05 | -- | -- | +1 damage |

### ITT Overrides (from GameConstants.wurst / GameConfig.ts)

| Constant | ITT Value | Standard WC3 | Impact |
|----------|-----------|-------------|--------|
| STR_HP_BONUS | **8** | 25 | Much less HP per STR |
| STR_ATTACK_BONUS | **0.5** | 1.0 (primary) | Half damage per STR |
| STR_REGEN_BONUS | **0** | 0.05 | No HP regen from STR |
| AGI_DEFENSE_BONUS | **0.1** | 0.3 | Much less armor per AGI |
| AGI_DEFENSE_BASE | **-1** | 0 | Start with -1 armor |
| AGI_ATTACK_SPEED_BONUS | **0.01** (1%) | 0.02 (2%) | Half attack speed per AGI |
| AGI_MOVE_BONUS | **7.5** | 0 | Custom: AGI grants movement speed |
| INT_MANA_BONUS | **8** | 15 | Much less mana per INT |
| INT_REGEN_BONUS | **0** | 0.05 | No mana regen from INT |

---

## Attack Speed

### Formula
```
Attack Cooldown = Base_Cooldown / (1 + Total_IAS / 100)
```
Where: `Total_IAS = (agility * agi_attack_speed_bonus * 100) + item_bonuses + ability_bonuses`

### Caps
- Maximum total IAS: **400%** (minimum cooldown = base/5)
- Minimum total IAS: **-80%**
- Absolute minimum attack period: 1/32 second (0.03125s)

### Animation Constraint
The damage point animation acts as a floor for attack timing:
```
effectiveAttackSpeed = max(attackSpeed, animBackSwingPoint)
```

---

## Movement Speed

- **Maximum**: 522 (ITT confirms `MAX_UNIT_SPEED = 522`)
- **Minimum**: 100 (ITT confirms `MIN_UNIT_SPEED = 100`)
- Modified additively by items/abilities
- Frost slow: 15% reduction (`FROST_MOVE_SPEED_DECREASE = 0.15`)
- **ITT custom**: Agility grants +7.5 movement speed per point

---

## Evasion and Miss

### Three Independent Miss Sources
1. **Evasion** on the defender (Evasion, Drunken Brawler, Talisman of Evasion)
2. **Blind/miss debuff** on the attacker (Drunken Haze, Curse)
3. **High ground** (25% miss for ranged attacks uphill)

### Stacking Rules
- **Same type**: Only the highest value applies
- **Cross-type**: Multiplicative: `Total_miss = 1 - (1-evasion) * (1-blind) * (1-highground)`

### Notes
- Evasion does NOT use Pseudo Random Distribution
- High ground only applies to normal ranged attacks

---

## Critical Strike, Bash, and Orb Effects

### Critical Strike
- Each crit source rolls independently
- Multiple procs on same attack: only one applies
- Combined chance: `1 - (1-p1) * (1-p2) * ... * (1-pN)`
- Uses **Pseudo Random Distribution** (PRD)

### Bash
- Also uses PRD
- Melee: damage stacks, stun duration does NOT
- Ranged: only one bash per attack

### Orb Effects (CRITICAL)
- **Only one orb active per unit at a time**
- Priority: Arrow abilities > Mask of Death > Items > Passive abilities
- Multiple orbs in inventory: higher slot = higher priority
- Orbs do NOT stack with arrow abilities (Searing/Frost/Black Arrow)
- Orbs DO stack with passives (Bash, Critical Strike, Evasion)

### Pseudo Random Distribution (PRD)
- Used by: Critical Strike, Bash, Drunken Brawler
- NOT used by: Evasion
- Chance starts low after a proc, increases with each non-proc hit
- Example: 25% nominal bash has ~8.5% chance on first hit, +8.5% per miss

---

## Buff System

### Core Rules
- Buffs are **part of abilities** -- no native `UnitAddBuff` function
- Buffs can only be applied through abilities
- Each buff has a FourCC rawcode defined in .w3h files

### Stacking
- **Same buff ID = no stacking** (stronger effect wins)
- **Different buff IDs = stacking** (even if same underlying effect)
- To make two instances stack, assign different buff IDs

### Polarity
- Positive buffs: removed from enemies by Spell Steal
- Negative buffs: removed from allies by Spell Steal
- Dispel Magic removes all buffs (both positive and negative)

### Checking/Removing via Triggers
- `GetUnitAbilityLevel(unit, buffCode)` -- returns > 0 if unit has buff
- `UnitRemoveAbility(unit, buffCode)` -- removes a buff

### Applying Buffs Without Visible Ability (Tornado Slow Aura Trick)
1. Create ability based on Tornado Slow Aura (`Aasl`)
2. Set Targets Allowed to **Self**
3. Set all effect values to **0**
4. Assign desired buff
5. Add/remove ability via triggers to apply/remove buff
- Advantage: no icon, stacks, no dummy needed

---

## Aura Mechanics

### Core Rules
1. **Same buff = no stacking**: Two Command Auras with same buff → strongest wins
2. **Different buff IDs = stacking**: Change buff to make them stack
3. **No buff assigned = free stacking**: Auras without buffs stack freely

### Known Bugs
- Hero with transformation (Metamorphosis, Avatar, Chemical Rage) + aura = bugs
- Multi-stat auras compare only one parameter for priority
- Trueshot Aura flat vs percentage mixing causes misinterpretation

---

## Regeneration

### Standard WC3
- Heroes: +0.05 HP/s per STR, +0.05 mana/s per INT
- **ITT overrides both to 0** -- no attribute-based regen
- Base regen set per unit in Object Editor
- Percentage-based auras (Unholy Aura) scale off max HP

---

## Experience System

### Standard WC3
- Formula: `XP_to_next(level) = 100 + 100 * level`
- Max level: 10

### ITT Custom XP System
- **Completely overrides** standard WC3 XP (handicapXP set to 0)
- Max level: **30**
- Formula: `calcRequiredExp(level) = 150 * level + 50 * level^2`
- XP sharing: all allied heroes within 1200 range split equally

### Class-Based Multiplier
| Tier | Multiplier |
|------|-----------|
| Base class | 4x |
| Sub class | 3x |
| Super class | 2x |

### Special Rules
- Gem of Knowledge: 1.5x multiplier (not for BeastMaster/Hunter)
- Neutral hostile XP reduction: `max(0.4, 0.9 - 0.1 * level)`
- Hero kill XP: `[0, 100, 120, 160, 220, 300]` then +100/level from 6-30

---

## Order IDs

| ID | String | Description |
|----|--------|-------------|
| 851971 | smart | Right-click (move/attack/interact) |
| 851986 | move | Move to point |
| 851988 | aimove | Attack-move |
| 851976 | cancel | Cancel current action |
| 852000 | skillmenu | Open hero skill menu |
| 851994 | buildmenu | Open build menu |
| 852002-852007 | moveslot | Move item to slot 1-6 |
| 852008-852013 | useslot | Use item in slot 1-6 |

---

## Engine Limitations

1. **No native damage modification**: No way to modify damage in-flight. Use damage event detection + HP manipulation.
2. **Fake damage workaround**: Dealing real damage wakes sleeping/stunned units. Deal 0 damage for events, subtract HP directly.
3. **Thorns Aura reflection**: Set `ranged=true` in UnitDamageTarget to prevent infinite damage loops.
4. **Two abilities from same base type on one unit**: Only one casts correctly, or both fire simultaneously.
5. **Attack speed animation floor**: Backswing point acts as minimum attack time.
6. **Lua GC disabled in 1.32+**: Must minimize allocations on fast timers. Reuse objects, use pools.
7. **Max 6 inventory slots per unit**
8. **Max 12 player slots + 4 neutral**
9. **Frame API requires Reforged 1.32+**

---

## ITT-Specific Systems

### Damage Event System (DamageListeners.wurst)
Priority-based listener chain:
1. `CONVERT_FAKE_DAMAGE` -- normalize fake damage events
2. `PANIC` -- +10% damage while Berserk active
3. `MEDITATE` -- cancel Meditate on real damage
4. `ANCHOR_SOUL` -- cap damage to prevent death (HP >= 1)
5. `PANTHER_INSTINCT` -- negate all damage during buff
6. `TAGS` -- floating damage text
7. `SCORE` -- record on scoreboard
8. `APPLY_FAKE_DAMAGE` -- convert to HP subtraction

### Fake Damage System
For stat loss deaths (heat/cold): deals 0 damage via `UnitDamageTarget` with `DAMAGE_TYPE_UNKNOWN`, then applies real HP loss via `SetUnitState` in final listener. Avoids waking sleeping units.

### Healing System (HealingSystem.wurst)
- Three types: ITEM, ABILITY, OTHER
- Multiplier chain (can be reduced/scaled by listeners)
- Green text tags for healing amounts
- **Diminishing returns** (ReduceHealing.wurst):
  - 0-500 healing: 100% effective
  - 500-1000: 80%
  - 1000-1500: 60%
  - 1500+: 40%
  - 90-second decay window

### Survival / Stat Loss (StatLoss.wurst)
Every 3 seconds:
- Base: -1 heat, -1 energy (mana), -1 HP
- Camouflage: **triples** all losses
- Bonfire aura: -2 heat loss
- Frozen debuff: +1-5 random extra heat loss
- Depression stacks: random extra energy loss

Every 35 seconds (stat gain):
- Daytime (6:00-18:00): +3 heat
- The Glow buff: +2 heat
- Coat: +5 heat | Boots/Gloves: +2 each | Fire Pinion: +8

Death: if mana < 1 OR heat < 1 → kill unit, credit nearest enemy troll.
