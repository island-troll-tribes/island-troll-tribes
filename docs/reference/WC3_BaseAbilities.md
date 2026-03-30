# Warcraft III Base Abilities Reference

> Complete rawcode catalog for all WC3 hero, unit, and item abilities.
> Naming conventions, categories, and the key base types for modding.

## Rawcode Naming Conventions

| Prefix | Category | Example |
|--------|----------|---------|
| AH | Human hero abilities | `AHhb` Holy Light |
| AO | Orc hero abilities | `AOcr` Critical Strike |
| AU | Undead hero abilities | `AUdc` Death Coil |
| AE | Night Elf hero abilities | `AEer` Entangling Roots |
| AN | Neutral hero abilities | `ANcl` Channel |
| AC | Creep/neutral hostile versions | `ACbz` Blizzard (creep) |
| AI | Item abilities | `AIhw` Healing Ward |
| A (lowercase 2nd) | Unit abilities | `Adef` Defend, `Abrf` Bear Form |
| S | Upgrade/research abilities | `Sbsk` Berserk Upgrade |
| B | Buff IDs | `BHhb` Holy Light buff |
| X | Visual effect buffs | `XHbz` Blizzard effect |

Custom abilities typically use `A000`, `A001`, etc.

---

## Hero Abilities by Race

### Human Alliance

**Paladin** (STR): `AHhb` Holy Light, `AHds` Divine Shield, `AHad` Devotion Aura, `AHre` Resurrection

**Archmage** (INT): `AHbz` Blizzard, `AHwe` Summon Water Elemental, `AHab` Brilliance Aura, `AHmt` Mass Teleport

**Mountain King** (STR): `AHtb` Storm Bolt, `AHtc` Thunder Clap, `AHbh` Bash, `AHav` Avatar

**Blood Mage** (INT): `AHfs` Flame Strike, `AHbn` Banish, `AHdr` Siphon Mana, `AHpx` Phoenix

### Orc Horde

**Blademaster** (AGI): `AOwk` Wind Walk, `AOcr` Critical Strike, `AOmi` Mirror Image, `AOww` Bladestorm

**Far Seer** (INT): `AOcl` Chain Lightning, `AOsf` Feral Spirit, `AOfs` Far Sight, `AOeq` Earthquake

**Tauren Chieftain** (STR): `AOsh` Shockwave, `AOws` War Stomp, `AOae` Endurance Aura, `AOre` Reincarnation

**Shadow Hunter** (AGI): `AOhw` Healing Wave, `AOhx` Hex, `AOsw` Serpent Ward, `AOvd` Big Bad Voodoo

### Undead Scourge

**Death Knight** (STR): `AUdc` Death Coil, `AUdp` Death Pact, `AUau` Unholy Aura, `AUan` Animate Dead

**Lich** (INT): `AUfn` Frost Nova, `AUfa` Frost Armor, `AUdr` Dark Ritual, `AUdd` Death and Decay

**Dreadlord** (STR): `AUcs` Carrion Swarm, `AUsl` Sleep, `AUav` Vampiric Aura, `AUin` Inferno

**Crypt Lord** (STR): `AUim` Impale, `AUts` Spiked Carapace, `AUcb` Carrion Beetles, `AUls` Locust Swarm

### Night Elf Sentinels

**Demon Hunter** (AGI): `AEmb` Mana Burn, `AEim` Immolation, `AEev` Evasion, `AEme` Metamorphosis

**Keeper of the Grove** (INT): `AEer` Entangling Roots, `AEfn` Force of Nature, `AEah` Thorns Aura, `AEtq` Tranquility

**Priestess of the Moon** (AGI): `AEar` Trueshot Aura, `AEst` Scout (Owl), `AHfa` Searing Arrows, `AEsf` Starfall

**Warden** (AGI): `AEfk` Fan of Knives, `AEbl` Blink, `AEsh` Shadow Strike, `AEsv` Spirit of Vengeance

### Neutral Tavern Heroes

**Naga Sea Witch** (INT): `ANfl` Forked Lightning, `ANfa` Frost Arrows, `ANms` Mana Shield, `ANto` Tornado

**Dark Ranger** (AGI): `ANdr` Life Drain, `ANsi` Silence, `ANba` Black Arrow, `ANch` Charm

**Pandaren Brewmaster** (STR): `ANbf` Breath of Fire, `ANdh` Drunken Haze, `ANdb` Drunken Brawler, `ANef` Storm Earth Fire

**Beastmaster** (STR): `ANsg` Summon Bear, `ANsq` Summon Quilbeast, `ANsw` Summon Hawk, `ANst` Stampede

**Pit Lord** (STR): `ANrf` Rain of Fire, `ANht` Howl of Terror, `ANca` Cleaving Attack, `ANdo` Doom

**Goblin Tinker** (INT): `ANcs` Cluster Rockets, `ANeg` Engineering Upgrade, `ANsy` Pocket Factory, `ANrg` Robo-Goblin

**Firelord** (INT): `ANic` Incinerate, `ANlm` Summon Lava Spawn, `ANvc` Volcano, `ANso` Soul Burn

**Goblin Alchemist** (STR): `ANab` Acid Bomb, `ANhs` Healing Spray, `ANtm` Transmute, `ANcr` Chemical Rage

---

## Key Base Ability Types for Modders

### Channel (`ANcl`) — #1 Custom Spell Base
- No built-in effect; fully trigger-driven
- Configurable: target unit, point, AoE, no target, instant
- Key fields: Options (bitmask), Target Type, Base Order ID, Follow Through Time
- **Each Channel on same unit MUST have different Base Order ID**
- Set Follow Through Time to 0 for instant cast
- Set Disable Other Abilities to False for most uses
- Stats - Buffs and Effects do NOT work on Channel

### Spellbook (`Aspb`) — Ability Container
- Holds up to 11 abilities
- Can be disabled to hide while keeping passive effects active
- Two spellbooks with same Base Order ID share spell lists

### Bear Form (`Abrf`) — Transformation
- Toggles between two unit types; preserves hero state
- Variants: `AEme` (Metamorphosis), `Amrf` (Crow Form), `Abur` (Burrow), `ANrg` (Robo-Goblin)

### Defend (`Adef`) — Toggle Without Order Interrupt
- Variants: `Absk` (Berserk), `ANms` (Mana Shield), `AEim` (Immolation)

### Permanent Immolation (`ANpi`) — Passive AoE
- No toggle, always active. Good for drain/damage auras.

### Slow Aura (`Aasl`) — Invisible Buff Applicator
- Set targets to Self, values to 0, assign desired buff
- Add/remove via triggers — no icon, stacks, no dummy needed

---

## Unit Abilities (Key Examples)

### Human
`Adef` Defend, `Ainf` Inner Fire, `Ahea` Heal, `Adis` Dispel Magic, `Aslo` Slow, `Aivs` Invisibility, `Aply` Polymorph, `Acmg` Control Magic, `Afbk` Feedback, `Afla` Flare

### Orc
`Absk` Berserk, `Aven` Envenomed Spears, `Aens` Ensnare, `Aprg` Purge, `Alsh` Lightning Shield, `Ablo` Bloodlust, `Asta` Stasis Trap, `Aeye` Sentry Ward, `Ahwd` Healing Ward, `Aspl` Spirit Link, `Awar` Pulverize, `Adev` Devour

### Undead
`Arai` Raise Dead, `Auhf` Unholy Frenzy, `Acri` Cripple, `Acrs` Curse, `Aams` Anti-magic Shell, `Apos` Possession, `Aweb` Web, `Abur` Burrow, `Acan` Cannibalize, `Afak` Orb of Annihilation

### Night Elf
`Aroa` Roar, `Arej` Rejuvenation, `Abrf` Bear Form, `Afae` Faerie Fire, `Acyc` Cyclone, `Amrf` Storm Crow Form, `Aspo` Slow Poison, `Aadm` Abolish Magic, `Apsh` Phase Shift, `Atau` Taunt, `Agra` War Club, `Assk` Hardened Skin, `Ashm` Shadow Meld, `Aesn` Sentinel

---

## Item Ability Rawcodes

### Stat Bonuses
| Range | Effect |
|-------|--------|
| `AIa1`-`AIa6` | Agility +1 to +6 |
| `AIs1`-`AIs6` | Strength +1 to +6 |
| `AIi1`-`AIi6` | Intelligence +1 to +6 |
| `AIx1`-`AIx5` | All Stats +1 to +5 |
| `AId1`-`AId8` | Defense +1 to +8 |
| `AItg`-`AItn` | Attack Damage +1 to +10 |
| `AIms` | Movement Speed |
| `AIsx` | Attack Speed |

### Combat Items
| Rawcode | Effect |
|---------|--------|
| `AIhe` | Healing (consumable) |
| `AIva` | Life Steal |
| `AIev` | Evasion |
| `AIcs` | Critical Strike |
| `AIsr` | Runed Bracers (spell reduction) |
| `AIob` | Orb of Frost |
| `AIlb` | Orb of Lightning |
| `AIfb` | Orb of Fire |
| `AIcb` | Orb of Corruption |
| `AIpb` | Orb of Venom |

### System Abilities
| Rawcode | Name |
|---------|------|
| `ANcl` | Channel |
| `Aspb` | Spellbook |
| `Avul` | Invulnerable |
| `Aloc` | Locust |
| `AInv` | Inventory |
| `Aatk` | Attack |
| `Amov` | Move |

---

## Ability Type Classification

| Type | Mana | CD | Example |
|------|------|----|---------|
| Active | Yes | Yes | Storm Bolt, Blizzard |
| Passive | No | No | Bash, Evasion, Critical Strike |
| Aura | No | No | Devotion Aura, Endurance Aura |
| Toggle | Sometimes | Sometimes | Defend, Berserk, Immolation |
| Autocast | Yes | Yes | Heal, Slow, Frost Armor |
| Channeled | Yes | Yes | Blizzard, Tranquility, Earthquake |
| Orb/Arrow | No | No | Frost Arrows, Searing Arrows |
| Instant | Yes | Yes | Fan of Knives, Blink |

---

## Critical Modding Rules

1. A unit **cannot have two abilities from the same base type** — only one casts correctly or both fire
2. **Channel-based spells on same unit need unique Base Order IDs** — or they conflict
3. **Spell immunity bypass**: Most offensive ultimates bypass spell immunity
4. **Toggle abilities don't interrupt orders**: Berserk, Defend, Mana Shield, Immolation, Divine Shield
5. **Ability derivatives share internal code** (e.g., Blizzard and Rain of Fire are the same mechanic)

---

## Key Buff Rawcodes

| Rawcode | Buff |
|---------|------|
| `BHav` | Avatar |
| `BHbn` | Banish |
| `BHds` | Divine Shield |
| `BHtc` | Thunder Clap |
| `BOae` | Endurance Aura |
| `BOwk` | Wind Walk |
| `BOhx` | Hex |
| `BUau` | Unholy Aura |
| `BUav` | Vampiric Aura |
| `BUfa` | Frost Armor |
| `BUsl` | Sleep |
| `BEer` | Entangling Roots |
| `BEah` | Thorns Aura |
| `BEme` | Metamorphosis |
| `BNab` | Acid Bomb |
| `BNcr` | Chemical Rage |
| `BNsi` | Silence |
| `BNso` | Soul Burn |
| `Bbsk` | Berserk |
| `Bblo` | Bloodlust |
| `Bcri` | Cripple |
| `Bfae` | Faerie Fire |
| `Binf` | Inner Fire |
| `Blsh` | Lightning Shield |
| `Brej` | Rejuvenation |
| `Broa` | Roar |
| `Bslo` | Slow |
| `Bspo` | Slow Poison |
| `Bspl` | Spirit Link |
| `BSTN` | Stunned |
| `Bweb` | Web |
