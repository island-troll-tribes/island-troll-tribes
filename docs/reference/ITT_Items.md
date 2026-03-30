# Island Troll Tribes - Complete Item System Reference

> Every item, its abilities, stats, and triggered behavior.
> Source: Wurst codebase analysis.

## Table of Contents
- [Weapons: Spears](#weapons-spears)
- [Weapons: Axes](#weapons-axes)
- [Weapons: Blowgun](#weapons-blowgun)
- [Shields](#shields)
- [Cloaks](#cloaks)
- [Coats (Body Armor)](#coats-body-armor)
- [Boots](#boots)
- [Gloves](#gloves)
- [Scrolls](#scrolls)
- [Potions](#potions)
- [Special Items](#special-items)
- [Boss Drop Items](#boss-drop-items)
- [Consumables and Healing](#consumables-and-healing)
- [Stat Bonus System](#stat-bonus-system)
- [Healing Diminishing Returns](#healing-diminishing-returns)
- [Source Files](#source-files)

---

## Weapons: Spears

All spears: 1 charge, range 1000, recovered if they kill the target.

### Standard Spears (ThunderBolt base)

| Item | Damage | Stun (Hero) | Cooldown |
|------|--------|-------------|----------|
| Stone Spear | 40 | 0.10s | 2s |
| Iron Spear | 70 | 0.20s | 5s |
| Steel Spear | 100 | 0.30s | 8s |
| Dark Spear | 40 | 0.50s | 5s |

**Dark Spear** also burns `10 + (40% * target's current mana)` on impact (trolls only).

### Poison Spears (ShadowStrike base, 40s duration, 3s tick)

| Item | Initial Dmg | Decay Dmg | AS Slow | MS Slow | CD |
|------|-------------|-----------|---------|---------|-----|
| Poison Spear | 10 | 6 | 30% | 20% | 2s |
| Refined Poison Spear | 20 | 10 | 40% | 30% | 5s |
| Ultra Poison Spear | 40 | 16 | 50% | 40% | 8s |

### Spear Resistance System
When a spear hits a troll, `ABILITY_SPEAR_RESIST` (Hardened Skin, 6 levels) is added. Each subsequent hit within 1 second increments the level (max 6). After 1 second, levels decrement one at a time. Prevents spear spam from being too effective.

---

## Weapons: Axes

All axes grant `ABILITY_ATTACK_TREE` (allows felling trees).

| Item | Damage | Special |
|------|--------|---------|
| Stone Axe | +6 | -- |
| Iron Axe | +8 | -- |
| Steel Axe | +12 | -- |
| Mage Masher | +7 | Silence (AoE 225, 4s hero, cd 45s). On-hit vs Mage/Priest: burns `max(5% * mana, 7)` mana |
| Battle Axe | +14 | Purge (removes buffs, 5s hero, cd 60s, range 400) |

---

## Weapons: Blowgun

Reusable weapon that loads ammo. Max 15 ammo slots. Cast range 450, cd 9s.

**Ammo loading:** Drag-drop items onto blowgun. Self-target empties back to inventory.
- Bone: 15 slots per charge
- Thistles: 1 slot per charge
- Dark Thistles: 2 slots per charge

| Ammo | Base | Damage | Duration (H/N) | Special |
|------|------|--------|----------------|---------|
| Bone | ThunderBolt | 30 | 0.75s/2s stun | Simple stun |
| Thistles (hero) | ShadowStrike | 10 initial, 1 decay | 5s/16s | AS -15%, MS -30% |
| Thistles (normal) | ShadowStrike | 15 initial, 1 decay | 5s/16s | AS -30%, MS -40% |
| Dark Thistles | ShadowStrike | 20 initial, 1 decay | 12s/16s | AS -20%, MS -20%, burns 12 mana over 6s |

---

## Shields

All shields (except Battle Shield) include 10% magic resistance.

| Shield | Block | Armor | Magic Resist | Special |
|--------|-------|-------|-------------|---------|
| Basic Shield | 3 | 0 | 10% | -- |
| Bone Shield | 5 | +1 | 10% | -- |
| Iron Shield | 7 | +2 | 10% | -- |
| Steel Shield | 10 | +4 | 10% | Shield Bash |
| Battle Shield | 7 | +7 | None | Shield Bash |

**Shield Bash** (Drunken Haze base): Silences + disarms target. 2s duration, cd 15s, range 100, mana 0.

---

## Cloaks

All cloaks: +3 armor, +3 all stats.

| Cloak | Type | Effect | CD |
|-------|------|--------|-----|
| Cloak of Flames | Passive Immolation | 7 dmg/s in 300 AoE | Always on |
| Cloak of Healing | Active AoE Heal | 150 HP to allies in 700 range over 15s | 35s |
| Cloak of Mana | Active AoE Mana | 100 Mana to allies in 700 range over 15s | 35s |
| Cloak of Frost | Active AoE Slow | 5 dmg + 35% AS/MS slow in 500 range, 5 pulses over 5s | 35s |

**Cloak of Healing**: Uses HealingSystem (interacts with ReduceHealing). Multiple casts stack timer but only first heals.
**Cloak of Frost**: 5 waves at 1s intervals. Uses Acid Bomb for slow. Blue vertex color on targets.

---

## Coats (Body Armor)

| Coat | Str | Int | Armor | Special |
|------|-----|-----|-------|---------|
| Elk Skin Coat | +2 | +1 | +1 | -- |
| Wolf Skin Coat | +3 | +2 | +2 | -- |
| Bear Skin Coat | +4 | +3 | +3 | -- |
| Bone Coat | +3 | +2 | +2 | -- |
| Iron Coat | +4 | +3 | +3 | -- |
| Steel Coat | +8 | +6 | +5 | Active: Cure All on self (cd 90s) |
| Battle Armor | +4 all | +4 all | +7 | Active: Anti-Magic on allies in 800 range (cd 75s), 30% spell dmg reduction |
| Hydra Scale Coat | +4 all | +4 all | +10 | Passive: 35% melee damage return (Spiked Carapace) |

---

## Boots

| Boot | Speed | Int | Armor | Special |
|------|-------|-----|-------|---------|
| Elk Skin Boots | +60 | +2 | 0 | -- |
| Wolf Skin Boots | +60 | +4 | +2 | -- |
| Bear Skin Boots | +60 | +5 | +3 | -- |
| Bone Boots | +60 | +3 | +2 | -- |
| Iron Boots | +80 | +6 | +3 | -- |
| Steel Boots | +100 | +10 | +5 | -- |
| Anabolic Boots | +200 | +4 all | +5 | 10% evasion, fire particles |
| Hydra Fins | +100 | +5 all | +5 | Spell Shield (cd 75s) |

---

## Gloves

| Glove | AS | Damage | Armor | Special |
|-------|-----|--------|-------|---------|
| Elk Skin Gloves | +10% | 0 | 0 | -- |
| Wolf Skin Gloves | +15% | +2 | +2 | -- |
| Bear Skin Gloves | +20% | +3 | +3 | -- |
| Bone Gloves | +20% | +1 | +2 | -- |
| Iron Gloves | +25% | +2 | +3 | -- |
| Steel Gloves | +35% | +4 | +5 | -- |
| Battle Gloves | +30% | 0 | +5 | +4 all stats, Custom Crit system |
| Hydra Claws | +35% | 0 | 0 | +5 all stats, Poison on-hit, Tsunami active |

### Battle Gloves Critical Strike System
Fully custom triggered system:
- Hidden spellbook with 100% chance 1.6x Critical Strike
- Spellbook added when internal 6-second cooldown expires
- On next enemy attack: spellbook removed, timer resets to 0
- Each non-crit attack reduces cooldown by 1 second
- Result: guaranteed crit every ~4-6 attacks, faster with rapid attacking

### Hydra Claws Poison
- Passive SlowPoison: 2 dmg/s, 25% MS slow, 15% AS slow, 4.5s hero / 7s normal
- Active: Tsunami (same as Scroll of Tsunami)

---

## Scrolls

| Scroll | Target | Effect | CD | Range |
|--------|--------|--------|-----|-------|
| Entangling Roots | Enemy | Trolls: ensnare 4s; Animals: root + 5 dps 8s | 45s | 450 |
| Fire Ball | Enemy | 40 dmg, 0.5s stun hero / 2.5s normal | 32s | 800 |
| Living Dead | Self | Summons 2 Locust Skeletons (7 magic dmg, 30s) | 60s | 200 AoE |
| Stone Armor | Ally | +9 armor 20s, melee attackers slowed 15% for 2s | 80s | 400 |
| Haste | Self AoE | Max move speed to allies in 600 range for 7s | 35s | 600 AoE |
| Tsunami | Point | 25 dmg wave (600 dist, 200 max), +30 vs buildings, kills fires | 15s | 600 |
| Cyclone | Enemy | Airborne 5s hero / 10s normal, Ghost while up | 35s | 500 |

---

## Potions

| Potion | Effect | Duration | CD | Charges |
|--------|--------|----------|-----|---------|
| Healing Potion | 65 HP to target ally | Instant | 0 | 1 |
| Mana Potion | 60 mana to target ally | Instant | 0 | 1 |
| Cure Potion | Remove debuffs from target | Instant | 0 | 2 |
| Omnicure | AoE cure all allies | Instant | 0 | 1 |
| Anabolic Potion | Max movement speed | 10s | 35s | 1 |
| Anti-Magic Potion | 100 magic damage shield | 25s | 1s | 2 |
| Disease Potion | 3 dps, -30% item healing, 200 AoE | 25s | 0.3s | 1 |
| Drunk's Potion | Silence, 25% MS slow, 10% AS slow, 50% miss | 7s H / 13s N | 25s | 2 |
| Nether Potion | Banish (no phys, +magic dmg) | 15s H / 40s N | 20s | 1 |
| Oracle Potion | True sight 900 range | 20s | 20s | 1 |
| Twin Island Potion | Reveals + pings all enemy trolls, Faerie Fire | 30s | -- | 1 |
| Fervor Potion | Bloodlust + Frost Armor self; ShadowStrike enemies 512 range | varies | 5s | 1 |
| Acid Bomb | -8 armor, small AoE | 50s | 10s | 1 |

**Disease Potion**: Creates `DiseaseInstance` per target with periodic timer. Hooks into `HealingSystem.onUnitHealed()` to reduce ITEM healing by 30%.

---

## Special Items

### Medallion of Courage
Required for super-class evolution (skip sub-class → go directly to super). Cannot be used by Hunter/Beastmaster. Sets `UPGD_MEDALLION_COURAGE` research. Consumed on use.

### Gem of Knowledge
+1 all stats. Increases XP gain by 50% (1.5x multiplier). Does NOT work for BeastMaster or Hunter.

### Building Kits
1-charge perishable items using `BuildTinyCastle` base. 20 types. Build duration 5-30s.

### Bee Hive
Summons hive that spawns 1 bee/second (20s hive, 12s bees, cd 60s). Bees deal 1 magic dmg each.

### Essence of Bees
Uber hive spawns child hives every 10s. Each child spawns bees.

### EMP
cd 180s. Disables all enemy buildings in 3000 range for 45s. Kills Living Clay wards.

### Clay Explosion
Drops 8-12 Living Clay wards randomly in 3000x3000 area.

### Living Clay Ward
3 charges. 700 sight, explodes on enemy approach: 10 dmg in 200 range, 5 dmg in 400 range. "Paranoia" aura alerts enemies. Max 10 wards within 500 range.

### Smoke Bomb
3 charges. Uses `ABILITY_SMOKE_STREAM`. Disables damage within smoke.

### Nets
| Type | Duration (H/N) | CD | Range |
|------|----------------|-----|-------|
| Hunting Net | 2.5s / 13s | 12s | 700 |
| Net | 2.5s / 10s | 15s | 600 |

Hunting Net recovered if netted animal dies while ensnared.

### Stone (Throwable)
25 dmg, 1s stun hero / 7s normal, cd 8s, range 1000, 1 charge.

### Magic Item
Random effect on use (Berserk cast trigger): 10% 30% HP/MP, 10% severe damage, 10% midnight, 10% delevel, 20% meteor, 10% +500 XP, 20% full heal, 10% 2 mana crystals. Can summon Disco Duck or The One.

---

## Boss Drop Items

### Horn of the Mammoth
3-ability spellbook:
- Q: Full HP restore + AoE ThunderClap (10 dmg, 50% slow, 2s hero, 350 AoE, cd 80s)
- W: Full mana restore + AoE War Stomp (10 dmg, 1s stun hero, 300 AoE, cd 80s)
- E: Full heat restore + Howl of Terror (-100% enemy dmg, -10 armor, 5s, 400 AoE, cd 80s)

### Pinion of Fire (Disco Duck)
Immolation 9 dmg/s 400 AoE + Phoenix Fire 4 dmg 500 AoE auto-attack + max movement speed.

### Pinion of Pain (Disco Duck)
Pain Aura: -1 HP regen/s 5000 range + Depress Aura: -1.5 mana regen/s 5000 range.

### Pinion of Shadow (Disco Duck)
+5 all stats, +3 armor, 15% evasion. Active: Wind Walk 6s (cd 45s). Passive: every 5s becomes 1% more transparent + movement speed (up to +100). ~500s to near-invisible.

### Hydra Scale Set
- **Coat**: +4 all, +10 armor, 35% melee return
- **Fins**: +100 speed, +5 all, +5 armor, Spell Shield
- **Claws**: +35% AS, +5 all, Slow Poison on-hit, Tsunami active

---

## Consumables and Healing

### Food Items

| Item | Heal | Charges |
|------|------|---------|
| Cooked Meat | 50 HP | 1 |
| Banana | 38 HP | 1 |
| Honeycomb | 90 HP | 1 |
| Healing Potion | 65 HP (target ally) | 1 |

All use `HealingSystem` (not native WC3 healing) — interacts with ReduceHealing.

### Healing System (HealingSystem.wurst)
Custom event-driven framework:
- Three types: ITEM, ABILITY, OTHER
- `HealingInstance` carries: target, caster, amount, multiplier, type, showTag
- Listeners can modify via `reduceHealAmount()`, `scaleMultiplier()`, `increaseHealAmount()`
- Shows green floating text (+XX)

---

## Healing Diminishing Returns

### ReduceHealing System (the "food cap")

Only applies to `HealingType.ITEM`. Tracks 90-second moving sum.

| Total Healing | Multiplier |
|--------------|------------|
| 0 - 500 (+buffer) | 100% |
| 500 - 1000 (+buffer) | 80% |
| 1000 - 1500 (+buffer) | 60% |
| 1500+ (+buffer) | 40% |
| Over cap | 0% |

Buffer = accounts for natural stat loss decay. Displayed via food supply UI. Reset on death.

---

## Stat Bonus System

### Armor Bonuses (DefenseBonusPlus1 base)
+1, +2, +3, +4, +5, +7, +10

### All Stat Bonuses (AllPlus1 base)
+3, +4, +5

### Single Stat Bonuses
- STR: +2, +3, +4, +8
- INT: +1, +2, +3, +4, +5, +6, +8, +10

### Speed Bonuses (MoveSpeedBonus base)
+60, +70, +80, +100, +200

### Attack Speed Bonuses (AttackSpeedIncrease base)
+10%, +15%, +20%, +25%, +30%, +35%

### Stacking Rules
- Each bonus is a separate WC3 ability on the item
- WC3 stacks identical abilities from different items automatically
- Different tier abilities stack additively

---

## Source Files

| File | Content |
|------|---------|
| `wurst/objects/items/Spears.wurst` | Spear throw system, resistance stacking, dark spear mana burn |
| `wurst/objects/items/Armory/SpearsDefinition.wurst` | All 7 spear definitions |
| `wurst/objects/items/BattleGlovesCritical.wurst` | Custom crit cooldown system |
| `wurst/objects/items/CloaksDefinition.wurst` | All 4 cloaks + healing tick system |
| `wurst/objects/items/Armory/ShieldsDefinition.wurst` | 5 shields + Shield Bash |
| `wurst/objects/items/Armory/AxesDefinition.wurst` | 5 axes + Mage Masher + Purge |
| `wurst/objects/items/ScrollsDefinition.wurst` | 7 scrolls with triggered behaviors |
| `wurst/objects/items/CoatDefinition.wurst` | 8 coats |
| `wurst/objects/items/BootsDefinition.wurst` | 8 boots |
| `wurst/objects/items/GlovesDefinition.wurst` | 8 gloves |
| `wurst/objects/items/ArmorBonusAbility.wurst` | All stat bonus abilities |
| `wurst/objects/items/Pinions.wurst` | 3 Disco Duck pinions |
| `wurst/objects/items/HornOfMammoth.wurst` | Horn 3-ability spellbook |
| `wurst/objects/items/MedallionOfCourage.wurst` | Super class evolution |
| `wurst/objects/items/Workshop/BlowgunDefinition.wurst` | Blowgun ammo system |
| `wurst/objects/items/MixingPot/*.wurst` | All 13 potion definitions |
| `wurst/lib/HealingSystem.wurst` | Custom healing framework |
| `wurst/systems/core/ReduceHealing.wurst` | Healing diminishing returns |
