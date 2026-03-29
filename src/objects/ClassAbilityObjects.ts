/**
 * ClassAbilityObjects - Compiletime definitions for all troll class abilities.
 *
 * ~200 custom abilities across all 7 troll classes + shared abilities.
 * Base types from WC3:
 *   ANcl = Channel (ChannelAbilityPreset in Wurst)
 *   Amov = Blade Master Wind Walk (cloak/stealth)
 *   ACL1 = Chain Lightning (creep)
 *   AHfs = Rain of Fire (meteor)
 *   Acur = Curse (tele-gathering)
 *   Aprs = Parasite (dysentery)
 *   FAer = Faerie Fire (track)
 *   Assk = Hardened Skin (endurance)
 *   Apul = Pulverize (giant swing)
 *   AAbm = Abolish Magic (cure all)
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  // Helper: create ability from base
  function a(baseId: string, newId: string, name: string, levels?: number) {
    try {
      const ab = objectData.abilities.copy(baseId, newId);
      if (ab) {
        ab.name = name;
        if (levels) ab.levels = levels;
      }
      return ab;
    } catch (_e) {
      // Base ability not in game data — fall back to Channel
      try {
        const ab = objectData.abilities.copy("ANcl", newId);
        if (ab) {
          ab.name = name;
          if (levels) ab.levels = levels;
        }
        return ab;
      } catch (_e2) {
        return undefined;
      }
    }
  }

  // Channel ability base — used for most custom troll spells
  const CH = "ANcl";

  // Helper: set ability stats (cooldown, manaCost, castRange, areaOfEffect, duration)
  function setStats(ab: any, cd?: number, mana?: number, range?: number, aoe?: number, durN?: number, durH?: number) {
    if (!ab) return ab;
    if (cd !== undefined) ab.cooldown = cd;
    if (mana !== undefined) ab.manaCost = mana;
    if (range !== undefined) ab.castRange = range;
    if (aoe !== undefined) ab.areaOfEffect = aoe;
    if (durN !== undefined) ab.durationNormal = durN;
    if (durH !== undefined) ab.durationHero = durH;
    return ab;
  }

  // ═══════════════════════════════════════════════════════════════════
  // SPELLBOOKS (one per class/subclass)
  // These are container abilities that hold other abilities.
  // spellList is a comma-separated string of ability FourCC IDs.
  // ═══════════════════════════════════════════════════════════════════
  // Base: 'Aspb' = Spell Book
  const SB = "Aspb";

  // Helper: create spellbook with spell list
  function sb(newId: string, name: string, spells?: string, levels?: number) {
    const ab = a(SB, newId, name, levels) as any;
    if (ab && spells) ab.spellList = spells;
    return ab;
  }

  // ── Mage Line Spellbooks ──
  // Mage Spellbook (levels 1-3): Spirit Prison, Flame Spray, Pump Up, Reduce Food, Mage Fire, Depress, Metronome
  sb("A000", "Mage Spellbook", "A05X,A031,A01N,A08C,A036,A03C,A03S", 3);
  sb("A001", "Mage Legacy Spellbook", "A05Y,A032,A01O,A08D,A037,A03D,A03T", 3);
  // Sub Mage Inherited: base mage spells carried into sub-classes
  sb("A002", "Sub Mage Inherited Spellbook", "A05X,A031,A01N,A08C,A036,A03C,A03S");
  sb("A003", "Sub Mage Legacy Inherited Spellbook", "A05Y,A032,A01O,A08D,A037,A03D,A03T");
  // Elementalist selector (hero ability)
  sb("A004", "Elementalist");
  // Elementalist New Spellbook (levels 1-3): Zap, Earth Guardian, Frost Blast, Meteor, Overcharge, Meditate
  sb("A005", "Elementalist New Spellbook", "A044,A048,A033,A035,A03Y,A05T", 3);
  // Dementia Master selector (hero ability)
  sb("A006", "Dementia Master");
  // Dementia Master Spellbook (levels 1-3): Dark Gate, Invoke Rune 1/2/3, Activate Rune, Dementia Summoning
  sb("A007", "Dementia Master Spellbook", "A042,A40H,A40I,A40J,ACTR,A03B", 3);
  // Dementia Master Inherited: all DM spells
  sb("A008", "Dementia Master Inherited Spellbook", "A038,A039,A03A,A03G,A03I,A03J");

  // ── Priest Line Spellbooks ──
  // Priest Spellbook (levels 1-3): Anti-Magic AOE, Cure All, Pump Up, Ranged Heal, Magic Mist, Healing Wave, Mix Energy, Mix Heat
  sb("A009", "Priest Spellbook", "A04B,A05C,A01N,A057,A049,A050,A05K,A05L", 3);
  // Sub Priest Spellbook: inherited base priest spells
  sb("A00A", "Sub Priest Spellbook", "A04B,A05C,A01N,A057,A049,A050,A05K,A05L");
  // Master Healer selector (hero ability)
  sb("A00B", "Master Healer");
  // Master Healer Spellbook (levels 1-3): MH Mix Energy/Heat, MH Healing Wave, Ranged Heal, Magic Mist, Self Preservation, Replenish Energy, Replenish Health, Anchor Soul
  sb("A00C", "Master Healer Spellbook", "A05M,A05N,A051,A057,A049,A02C,A058,A059,A05W", 3);
  // Sage selector (hero ability)
  sb("A00D", "Sage");
  // Sage Spellbook (levels 1-3): Sage Increase Metabolism, Maximum Fervor, Light Gate
  sb("A00E", "Sage Spellbook", "A05J,A30J,A043", 3);
  // Sage Inherited: all sage spells
  sb("A00F", "Sage Inherited Spellbook", "A04B,A05C,A01N,A057,A049,A02C,A052,A05H,A05W,A05A,A046");

  // ── Thief Line Spellbooks ──
  sb("A00G", "Sub Thief Spellbook");
  sb("A00H", "Physical Spellbook Thief");
  // Escape Artist selector (hero ability)
  sb("A00I", "Escape Artist");
  // Escape Artist Spellbook (levels 1-3): Camouflage, Blur, Jump, placeholders, Sub Cloak
  sb("A00J", "Escape Artist Spellbook", "A060,A01Z,A01Y,A01H,A01H,A067", 3);
  // Contortionist selector (hero ability)
  sb("A00K", "Contortionist");
  // Contortionist Spellbook (levels 1-3): Nether Fade, Tele Thief, Smoke Stream, placeholders, Sub Cloak
  sb("A00L", "Contortionist Spellbook", "A068,A064,A062,A01H,A01H,A067", 3);
  // Assassin selector (hero ability)
  sb("A00M", "Assassin");
  // Assassin Spellbook: Nether Fade, Blur, Assassinate, Jump, AS Smoke Stream, AS Tele Thief, AS Camouflage
  sb("A00N", "Assassin Spellbook", "A068,A01Z,A02G,A01Y,A063,A065,A061");

  // ── Scout Line Spellbooks ──
  // Observer selector (hero ability)
  sb("A00O", "Observer");
  // Observer Spellbook: Advanced Radar Spellbook
  sb("A00P", "Observer Spellbook", "A0JN");
  // Spy selector (hero ability)
  sb("A00Q", "Spy");
  // Spy Inherited Spellbook: Track Trap, Spiked Trap, Greater Reveal, Spy Ward Area, Spy Ping Enemy, Spy Bear Trap, Shadow Sight
  sb("A00R", "Spy Inherited Spellbook", "A01W,A01U,A071,A07A,A078,A07C,A07E");
  sb("A00S", "Spy Inherited Skill");

  // ── Tracker Line Spellbooks ──
  // Tracker selector (hero ability)
  sb("A00T", "Tracker");
  // Tracker Spellbook (levels 1-3): Dysentery, Sniff, Hide Beacon, Query Beacon, placeholders, Tracker Track
  sb("A00U", "Tracker Spellbook", "A30L,A075,A408,A409,A01H,A074", 3);

  // ── Gatherer Line Spellbooks ──
  // Radar Gatherer selector (hero ability)
  sb("A00V", "Radar Gatherer");
  // Radar Gatherer Spellbook: all gather spells + Tele-Gather + Mix Herbs
  sb("A00W", "Radar Gatherer Spellbook", "A080,A082,A085,A081,A083,A086,A084,A088,A05Q");
  // Gatherer Spellbook (levels 1-3): Find Tinder/Stick/Mushroom/Clay/Flint/Stone/Mana
  sb("A00X", "Gatherer Spellbook", "A080,A082,A085,A081,A083,A086,A084", 3);
  // Herb Master selector (hero ability)
  sb("A00Y", "Herb Master");
  // Omnigatherer selector (hero ability)
  sb("A00Z", "Omnigatherer");
  // Omnigatherer Inherited Spellbook: all gather + Tele-Gather + Mix Herbs
  sb("A010", "Omnigatherer Inherited Spellbook", "A080,A082,A085,A081,A083,A086,A084,A088,A05Q");

  // ── Hunter Line Spellbooks ──
  // Warrior selector (hero ability)
  sb("A011", "Warrior");
  // Warrior Spellbook: Endurance, Giant Swing
  sb("A012", "Warrior Spellbook", "A02B,A01P");
  // Juggernaut selector (hero ability)
  sb("A013", "Juggernaut");
  // Juggernaut Spellbook: Dysentery, Sniff, Hide Beacon, Query Beacon, Giant Swing SS, Tracker Track
  sb("A014", "Juggernaut Spellbook", "A30L,A075,A408,A409,A01Q,A074");

  // ── Beastmaster Line Spellbooks ──
  // Druid selector (hero ability)
  sb("A015", "Druid");
  // Druid Spellbook (levels 1-3): Sentinel, Druid Roar, Rejuvenation, Bark Skin, Spiritual Guidance, Spirit Beast
  sb("A016", "Druid Spellbook", "A07D,A09I,A054,A023,A05V,A09E", 3);
  // Shapeshifter selector (hero ability) — contains transform abilities
  // Shapeshifter Form (levels 1-4): Transform Wolf/Bear/Panther/Tiger + pet spells + Spirit Beast
  sb("A017", "Shapeshifter", "A09M,A09J,A09K,A09L,A091,A093,A095,A09D,A09F", 4);
  // Hypnotist selector (hero ability)
  sb("A018", "Hypnotist");
  // Hypnotist Spellbook (levels 1-3): Hypnosis, Dream Eater, Anger, Depression Orb, Depression Aura, Seizures, Jealousy, Stupefy
  sb("A019", "Hypnotist Spellbook", "A06E,A06C,A01L,A03F,A03E,A06B,A069,A03P", 3);
  sb("A01A", "Hypnotist Legacy Spellbook", "A06F,A06D,A01M,A03F,A03E,A06B,A06A,A03Q", 3);
  // Booster selector (hero ability)
  sb("A01B", "Booster");
  // Booster Spellbook (levels 1-3): Lightning Shield, Fortitude, Pump Up, Troll Battle Call, Spirit Link, Angelic Elemental, Increase Metabolism
  sb("A01E", "Booster Spellbook", "A03Z,A02A,A01N,A05G,A05U,A045,A05I", 3);
  // Jungle Tyrant selector (hero ability)
  sb("A01F", "Jungle Tyrant");
  // Jungle Tyrant Evolution (levels 1-3): Rendo Hawk Eye, Snake Toxin, Panther Instinct, Elk Jump, Wolf Bite, Spirit Beast
  sb("A01G", "Jungle Tyrant Evolution", "A0A0,A0A3,A0A4,A0A1,A0A2,A09E", 3);
  // Spellbook Placeholder (empty)
  sb("A01H", "Spellbook Placeholder");
  // Trapper selector (hero ability)
  sb("A40Q", "Trapper");
  // Trapper Spellbook (levels 1-3): Track Trap, Spiked Trap, Bear Trap, Shadow Sight
  sb("A40R", "Trapper Spellbook", "A01W,A01U,A01V,A07E", 3);

  // ═══════════════════════════════════════════════════════════════════
  // COMBAT ABILITIES (with stats from Wurst source)
  // setStats(ab, cooldown, manaCost, castRange, aoeRadius, durationNormal, durationHero)
  // ═══════════════════════════════════════════════════════════════════

  // Bash — based on Bash (AHbh)
  a("AHbh", "A01I", "Bash", 1);

  // Critical Strike — based on Critical Strike (AOcr)
  a("AOcr", "A01J", "Critical Strike", 3);

  // Rage — Endurance Aura based
  a("AOae", "A01K", "Rage", 3);
  a("AOae", "A01L", "Anger", 3);
  a("AOae", "A01M", "Legacy Anger", 3);
  a("AOae", "A01N", "Pump Up", 3);
  a("AOae", "A01O", "Legacy Pump Up", 3);

  // Giant Swing — War Stomp based; 19-23% chance, 200-250 full/400-500 half radius
  setStats(a("AOws", "A01P", "Giant Swing", 3), 0, 0, 0, 250);
  setStats(a("AOws", "A01Q", "Giant Swing SS", 3), 0, 0, 0, 250);

  // Ensnare — cd=10, range=700, dur=8 normal / 2.5 hero
  setStats(a("ACen", "A01R", "Ensnare", 1), 10, 0, 700, 0, 8, 2.5);
  setStats(a("ACen", "A01S", "Ensnare Trap", 1), 10, 0, 700, 0, 8, 2.5);
  setStats(a("ACen", "A01T", "Boss Ensnare", 1), 10, 0, 700, 0, 8, 2.5);

  // Traps — Channel-based
  setStats(a(CH, "A01U", "Spiked Trap", 1), 15, 0, 200);
  setStats(a(CH, "A01V", "Bear Trap", 1), 20, 0, 200);
  setStats(a(CH, "A01W", "Track Trap", 1), 10, 0, 200);

  // Howl of Terror
  setStats(a("AOhw", "A01X", "Howl of Terror", 1), 30, 10, 0, 500, 10, 5);

  // Jump — cd=40, mana=30
  setStats(a(CH, "A01Y", "Jump", 1), 40, 30, 600);

  // Blur — Evasion based; 15/25/35% dodge chance
  a("AEev", "A01Z", "Blur", 3);

  // Defensive abilities
  // Hardened Skin — passive, reduces damage by 5
  a("Assk", "A020", "Hardened Skin", 1);
  // Panic — cd=15, mana=20, dur=15, +30% MS, +20% AS, +10% dmg taken
  setStats(a(CH, "A021", "Panic", 1), 15, 20, 0, 0, 15, 15);
  // Exhaust — applied after Anger, dur=4, -50% AS, -25% MS
  setStats(a(CH, "A022", "Exhaust", 1), 0, 0, 0, 0, 4, 4);
  // Bark Skin — cd=45, range=200, dur=10, +4 armor, 0.3 thorns
  setStats(a("Askb", "A023", "Bark Skin", 3), 45, 0, 200, 0, 10, 10);
  // Spell Shield — passive, blocks 1 negative spell every 40s
  a("AHad", "A024", "Spell Shield", 1);
  // Spell Damage Reduction — passive, 15% magic resist
  a("Amim", "A025", "Spell Damage Reduction", 1);
  // Magic Resist — passive, 10% per level
  a("Amim", "A026", "Magic Resist", 1);
  // Bear Bulwark — cd=45, mana=20, aoe=600, dur=10, +4 armor aura
  setStats(a("AHad", "A027", "Bear Bulwark", 1), 45, 20, 0, 600, 10, 10);
  // Bear Block — passive block
  a("AHad", "A028", "Bear Block", 1);
  // Bear Endurance — passive endurance aura
  a("AOae", "A029", "Bear Endurance", 1);
  // Fortitude — passive, +3 armor aura
  a("Assk", "A02A", "Fortitude", 1);
  // Endurance — passive, 35% damage reduction
  a("AOae", "A02B", "Endurance", 3);
  // Self Preservation — cd=60, mana=0, +50 all stats
  setStats(a("Assk", "A02C", "Self Preservation", 1), 60, 0);
  // Reincarnation — cd=240, mana=100
  setStats(a("AOre", "A02D", "Reincarnation", 1), 240, 100);
  a(CH, "A02E", "Supersub Courage", 1);

  // Assassinate — Wind Walk based; cd=65, mana=20, dur=8, 50% ms, backstab dmg 20-80
  setStats(a("AOwk", "A02F", "Assasinate", 1), 65, 0, 0, 0, 8, 8);
  setStats(a("AOwk", "A02G", "Assassinate", 4), 65, 20, 0, 0, 8, 8);
  a(CH, "A02H", "Tiger Vicious Strike", 1);
  // Tiger Vicious Strike Cripple — cd=15, dur=9/6, -35% MS, -10% AS
  setStats(a("ACcr", "A02I", "Tiger Vicious Strike Cripple", 1), 15, 0, 0, 0, 9, 6);

  // Wolf abilities
  a(CH, "A02J", "Wolf Hunger", 1);
  // Wolf Vampiric Attack — passive, 15% lifesteal
  a("AOvd", "A02K", "Wolf Vampiric Attack", 1);

  // Misc combat
  setStats(a(CH, "A02L", "Hurl Boulder", 1), 15, 10, 500);
  a(CH, "A02M", "Null Damage", 1);
  a(CH, "A02N", "Null Damage Sub", 1);

  // ═══════════════════════════════════════════════════════════════════
  // MAGIC ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  // Firebolt
  setStats(a(CH, "A030", "Firebolt", 1), 10, 10, 600);
  // Flame Spray — cd=15, mana=8, range=400
  setStats(a(CH, "A031", "Flame Spray", 1), 15, 8, 400);
  setStats(a(CH, "A032", "Legacy Flame Spray", 1), 15, 8, 400);
  // Frost Blast — cd=35, mana=12, range=1650, aoe=250, slow 2-5s
  setStats(a(CH, "A033", "Frost Blast", 1), 35, 12, 1650, 250, 5, 5);
  // Frost Armor
  setStats(a(CH, "A034", "Frost Armor", 1), 30, 15, 600, 0, 20, 20);
  // Meteor — cd=28, mana=24, range=800, aoe=240, burn 5s
  setStats(a("AHfs", "A035", "Meteor", 1), 28, 24, 800, 240, 5, 5);
  // Mage Fire — cd=20, mana=10, range=400
  setStats(a(CH, "A036", "Mage Fire", 1), 20, 10, 400);
  setStats(a(CH, "A037", "Legacy Mage Fire", 1), 20, 10, 400);
  setStats(a(CH, "A038", "Dementia Master Mage Fire", 1), 20, 10, 400);
  // DM Anger — same as Anger; cd=12, mana=20, dur=10
  setStats(a(CH, "A039", "Dementia Master Anger", 1), 12, 20, 0, 0, 10, 10);
  // DM Stupefy Field — cd=60, mana=10, dur=10
  setStats(a(CH, "A03A", "Dementia Master Stupefy", 1), 60, 10, 0, 0, 10, 10);
  setStats(a(CH, "A03B", "Dementia Summoning", 1), 60, 30, 300);
  // Depress — cd=20, mana=10, range=500
  setStats(a(CH, "A03C", "Depress", 1), 20, 10, 500);
  setStats(a(CH, "A03D", "Legacy Depress", 1), 20, 10, 500);
  a("AOae", "A03E", "Depression Aura", 1);
  setStats(a(CH, "A03F", "Depression Orb", 1), 30, 15, 500);
  a("AOae", "A03G", "Dementia Depression Aura", 1);
  a("AOae", "A03H", "DD Depress Aura", 1);
  a("ANia", "A03I", "DD Immolation", 1);
  a("AIms", "A03J", "DD Move Speed", 1);
  // Negative Blast — cd=5, mana=5, range=300
  setStats(a(CH, "A03K", "Negative Blast", 1), 5, 5, 300);
  setStats(a(CH, "A03M", "Legacy Negative Blast", 1), 5, 5, 300);
  setStats(a(CH, "A03N", "Negative Blast Sub", 1), 5, 5, 300);
  // Stupefy — cd=20, mana=15, range=400
  setStats(a(CH, "A03P", "Stupefy", 1), 20, 15, 400);
  setStats(a(CH, "A03Q", "Stupefy Legacy", 1), 20, 15, 400);
  setStats(a("AHfs", "A03R", "Doomsday", 1), 60, 40, 800, 300, 5, 5);
  // Metronome — cd=12, mana=10
  setStats(a(CH, "A03S", "Metronome", 1), 12, 10, 600);
  setStats(a(CH, "A03T", "Legacy Metronome", 1), 12, 10, 600);
  // Metronome Frost Nova — cd=45, mana=20, dmg=10 area/15 target, dur=0.01
  setStats(a("AUfn", "A03U", "Metronome Frost Nova", 1), 45, 20, 0, 0, 0.01, 0.01);
  // Metronome Frost Nova Ult — cd=45, mana=20, aoe=600, dur=5, dmg=15 area/45 target
  setStats(a("AUfn", "A03V", "Metronome Frost Nova Ult", 1), 45, 20, 0, 600, 5, 5);
  // Metronome Impale — cd=45, mana=20, dur=0.5, dmg=10
  setStats(a("AUim", "A03W", "Metronome Impale", 1), 45, 20, 0, 0, 0.5, 0.5);
  // Metronome Mana Burn — cd=45, mana=20, drain=6
  setStats(a("ANmb", "A03X", "Metronome Mana Burn", 1), 45, 20);
  // Overcharge — cd=30, mana=20
  setStats(a(CH, "A03Y", "Overcharge", 1), 30, 20);
  // Lightning Shield — cd=15, mana=10, range=600
  setStats(a("AOls", "A03Z", "Lightning Shield", 1), 15, 10, 600);
  // Cyclone — cd=30, mana=15, range=500, dur=6/2
  setStats(a("ACcy", "A040", "Cyclone", 1), 30, 15, 500, 0, 6, 2);
  // Tsunami — cd=45, mana=25, range=800, aoe=300
  setStats(a(CH, "A041", "Tsunami", 1), 45, 25, 800, 300);
  // Dark Gate — cd=60, mana=30, range=99999
  setStats(a(CH, "A042", "Dark Gate", 1), 60, 30, 99999);
  // Light Gate — cd=60, mana=30, range=99999
  setStats(a(CH, "A043", "Light Gate", 1), 60, 30, 99999);
  // Zap (Chain Lightning) — cd=15, mana=12, range=700
  setStats(a("ACcl", "A044", "Zap", 1), 15, 12, 700);
  // Angelic Elemental — cd=45, mana=20
  setStats(a(CH, "A045", "Angelic Elemental", 1), 45, 20, 300);
  setStats(a(CH, "A046", "Sage Angelic Elemental", 1), 45, 20, 300);
  setStats(a(CH, "A047", "Skeletal Minion", 1), 45, 20, 300);
  // Earth Guardian — cd=45, mana=20
  setStats(a(CH, "A048", "Earth Guardian", 1), 45, 20, 300);
  // Magic Mist — cd=25, mana=15, range=600, aoe=400
  setStats(a(CH, "A049", "Magic Mist", 1), 25, 15, 600, 400, 10, 10);
  // Anti-Magic — cd=1, mana=5, range=600, dur=10
  setStats(a("AAbm", "A04A", "Anti-Magic", 1), 1, 5, 600, 0, 10, 10);
  // Anti-Magic AOE — cd=20, mana=20, aoe=600, dur=10
  setStats(a(CH, "A04B", "Anti-Magic AOE", 1), 20, 20, 0, 600, 10, 10);

  // ═══════════════════════════════════════════════════════════════════
  // PRIEST/HEALING ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  // Healing Wave — cd=20, mana=10, range=6000, 50hp primary, 7 bounces
  setStats(a(CH, "A050", "Healing Wave", 1), 20, 10, 6000);
  setStats(a(CH, "A051", "MH Healing Wave", 1), 18, 10, 6000);
  setStats(a(CH, "A052", "Sage Healing Wave", 1), 16, 10, 6000);
  setStats(a(CH, "A053", "Healing Potion", 1), 0, 0);
  // Rejuvenation — cd=30, mana=30, range=150, 150hp over 10s
  setStats(a(CH, "A054", "Rejuvenation", 1), 30, 30, 150, 0, 10, 10);
  a(CH, "A055", "Rejuv Healing", 1);
  a(CH, "A056", "Rejuv Mana", 1);
  // Ranged Heal — cd=5, mana=15, range=6000
  setStats(a(CH, "A057", "Ranged Heal", 1), 5, 15, 6000);
  // Replenish Energy — cd=5, mana=20+5/sec, aoe=500
  setStats(a(CH, "A058", "Replenish Energy", 1), 5, 20, 0, 500);
  // Replenish Health — cd=5, mana=20+5/sec, aoe=500
  setStats(a(CH, "A059", "Replenish Health", 1), 5, 20, 0, 500);
  setStats(a(CH, "A05A", "Sage Replenish Energy", 1), 5, 20, 0, 500);
  a(CH, "A05B", "Breath of Life", 1);
  // Cure All — cd=10, mana=5, range=600
  setStats(a("AAbm", "A05C", "Cure All", 1), 10, 5, 600);
  setStats(a("AAbm", "A05D", "Cure All Item", 1), 10, 5, 600);
  setStats(a("AAbm", "A05E", "Omnicure", 1), 8, 5, 600);
  setStats(a("AAbm", "A05F", "Omnicure Item", 1), 8, 5, 600);
  // Troll Battle Call — cd=30, mana=15, aoe=600
  setStats(a(CH, "A05G", "Troll Battle Call", 1), 30, 15, 0, 600);
  setStats(a(CH, "A05H", "Sage Troll Battle Call", 1), 25, 15, 0, 600);
  // Increase Metabolism — cd=40, mana=20, range=600
  setStats(a(CH, "A05I", "Increase Metabolism", 1), 40, 20, 600);
  setStats(a(CH, "A05J", "Sage Increase Metabolism", 1), 35, 20, 600);
  // Mix Energy/Heat — cd=5, range=600
  setStats(a(CH, "A05K", "Mix Energy", 1), 5, 0, 600);
  setStats(a(CH, "A05L", "Mix Heat", 1), 5, 0, 600);
  setStats(a(CH, "A05M", "MH Mix Energy", 1), 4, 0, 600);
  setStats(a(CH, "A05N", "MH Mix Heat", 1), 4, 0, 600);
  setStats(a(CH, "A05O", "Sage Mix Energy", 1), 3, 0, 600);
  setStats(a(CH, "A05P", "Sage Mix Heat", 1), 3, 0, 600);
  setStats(a(CH, "A05Q", "Mix Herbs", 1), 3, 5, 300);
  setStats(a(CH, "A05R", "Omnigatherer Mix Herbs", 1), 3, 5, 300);
  setStats(a(CH, "A05S", "Pot Mix Herbs", 1), 3, 5, 300);
  // Meditate — cd=72, mana=0, channel 7s, 18 mana/sec
  setStats(a(CH, "A05T", "Meditate", 1), 72, 0);
  // Spirit Link — cd=30, mana=20, aoe=4000, dur=20
  setStats(a(CH, "A05U", "Spirit Link", 1), 30, 20, 0, 4000, 20, 20);
  setStats(a(CH, "A05V", "Spiritual Guidance", 1), 30, 15, 0, 500);
  // Anchor Soul — cd=60, mana=30, range=600
  setStats(a(CH, "A05W", "Anchor Soul", 1), 60, 30, 600);
  // Spirit Prison — cd=25, mana=15, range=400
  setStats(a(CH, "A05X", "Spirit Prison", 1), 25, 15, 400);
  setStats(a(CH, "A05Y", "Legacy Spirit Prison", 1), 25, 15, 400);
  a(CH, "A05Z", "Spirit Prison Cage", 1);

  // ═══════════════════════════════════════════════════════════════════
  // THIEF ABILITIES (with stats from Wurst source)
  // ═══════════════════════════════════════════════════════════════════

  // Camouflage — passive stealth (similar to Shadow Meld)
  a(CH, "A060", "Camouflage", 1);
  a(CH, "A061", "AS Camouflage", 1);
  // Smoke Stream — cd=20, mana=15, range=400
  setStats(a(CH, "A062", "Smoke Stream", 1), 20, 15, 400);
  setStats(a(CH, "A063", "AS Smoke Stream", 1), 20, 15, 400);
  // Tele Thief — cd=30, mana=0, range=600
  setStats(a(CH, "A064", "Tele Thief", 1), 30, 0, 600);
  setStats(a(CH, "A065", "AS Tele Thief", 1), 30, 0, 600);
  // Cloak — Wind Walk based; cd=65, dur=8/6/4 by level, 20% ms
  setStats(a("AOwk", "A066", "Cloak", 3), 65, 0, 0, 0, 8, 8);
  setStats(a("AOwk", "A067", "Sub Cloak", 3), 55, 0, 0, 0, 8, 8);
  // Nether Fade — Wind Walk variant; cd=50, dur=10
  setStats(a("AOwk", "A068", "Nether Fade", 1), 50, 0, 0, 0, 10, 10);
  // Jealousy — cd=20, mana=15, range=500
  setStats(a(CH, "A069", "Jealousy", 1), 20, 15, 500);
  setStats(a(CH, "A06A", "Legacy Jealousy", 1), 20, 15, 500);
  // Seizures — cd=25, mana=20, range=400
  setStats(a(CH, "A06B", "Seizures", 1), 25, 20, 400);
  // Dream Eater — cd=20, mana=10, range=300
  setStats(a(CH, "A06C", "Dream Eater", 1), 20, 10, 300);
  setStats(a(CH, "A06D", "Legacy Dream Eater", 1), 20, 10, 300);
  // Hypnosis — cd=20, mana=10, range=300, dur=5, damage=20
  setStats(a(CH, "A06E", "Hypnosis", 1), 20, 10, 300, 0, 5, 5);
  setStats(a(CH, "A06F", "Legacy Hypnosis", 1), 20, 10, 300, 0, 5, 5);

  // ═══════════════════════════════════════════════════════════════════
  // SCOUT ABILITIES (with stats from Wurst source)
  // ═══════════════════════════════════════════════════════════════════

  // Reveal — cd=20, mana=0, aoe=600+600*lvl (600/1200/1800), dur=8
  setStats(a(CH, "A070", "Reveal", 3), 20, 0, 0, 1800, 8, 8);
  // Greater Reveal — cd=20, aoe=2700, dur=10
  setStats(a(CH, "A071", "Greater Reveal", 1), 20, 0, 0, 2700, 10, 10);
  // Chain Reveal — cd=50
  setStats(a(CH, "A072", "Chain Reveal", 3), 50, 0);
  // Track — Faerie Fire based; cd=50-40, range=700, dur=10-20, armor reduction 1-3
  setStats(a("Afae", "A073", "Track", 3), 50, 0, 700, 0, 10, 10);
  setStats(a("Afae", "A074", "Tracker Track", 3), 50, 0, 700, 0, 10, 10);
  // Sniff — cd=3, mana=0, aoe=40, trail=300s
  setStats(a(CH, "A075", "Sniff", 1), 3, 0, 0, 40);
  a(CH, "A076", "Sniff Track", 1);
  // Ping Enemy — cd=30, mana=0
  setStats(a(CH, "A077", "Ping Enemy", 1), 30, 0);
  setStats(a(CH, "A078", "Spy Ping Enemy", 1), 25, 0);
  // Ward Area — cd=70, mana=10, aoe=600, dur=480
  setStats(a(CH, "A079", "Ward Area", 1), 70, 10, 0, 600, 480, 480);
  // Spy Ward Area — cd=40
  setStats(a(CH, "A07A", "Spy Ward Area", 1), 40, 10, 0, 600, 480, 480);
  // Observer Ward Area — cd=60/50/40 by level
  setStats(a(CH, "A07B", "Observer Ward Area", 1), 60, 10, 0, 600, 480, 480);
  setStats(a(CH, "A07C", "Spy Bear Trap", 1), 20, 0, 200);
  // Sentinel — cd=60, mana=15
  setStats(a(CH, "A07D", "Sentinel", 1), 60, 15);
  a(CH, "A07E", "Shadow Sight", 1);
  // Item Radar — cd=50, mana=15, range=3300+200*lvl, dur=10
  setStats(a(CH, "A07F", "Item Radar", 1), 50, 15, 5000, 0, 10, 10);

  // ═══════════════════════════════════════════════════════════════════
  // GATHERER ABILITIES (with stats from Wurst source)
  // ═══════════════════════════════════════════════════════════════════

  // Find abilities — cd=50 (shared), mana=15, range=3300-5000
  setStats(a(CH, "A080", "Find Tinder", 1), 50, 15, 5000, 0, 10, 10);
  setStats(a(CH, "A081", "Find Clay Ball", 1), 50, 15, 5000, 0, 10, 10);
  setStats(a(CH, "A082", "Find Stick", 1), 50, 15, 5000, 0, 10, 10);
  setStats(a(CH, "A083", "Find Flint", 1), 50, 15, 5000, 0, 10, 10);
  setStats(a(CH, "A084", "Find Mana Crystal", 1), 50, 15, 5000, 0, 10, 10);
  setStats(a(CH, "A085", "Find Mushroom", 1), 50, 15, 5000, 0, 10, 10);
  setStats(a(CH, "A086", "Find Stone", 1), 50, 15, 5000, 0, 10, 10);
  // Tele-Gathering — Curse based; dur=30+20*lvl
  setStats(a("Acur", "A087", "Tele-Gathering", 3), 60, 15, 99999, 0, 70, 70);
  // Omni Tele-Gathering — dur=110
  setStats(a("Acur", "A088", "Omni Tele-Gathering", 1), 50, 15, 99999, 0, 110, 110);
  setStats(a("Acur", "A089", "Herb Tele-Gathering", 3), 60, 15, 99999, 0, 70, 70);
  setStats(a("Acur", "A08A", "Radar Tele-Gathering", 3), 60, 15, 99999, 0, 70, 70);
  // Item Warp — cd=30, mana=10, range=99999
  setStats(a(CH, "A08B", "Item Warp", 1), 30, 10, 99999);
  setStats(a(CH, "A08C", "Reduce Food", 1), 10, 5, 300);
  setStats(a(CH, "A08D", "Legacy Reduce Food", 1), 10, 5, 300);
  setStats(a(CH, "A08E", "Cook Meat", 1), 5, 0, 200);

  // ═══════════════════════════════════════════════════════════════════
  // BEASTMASTER/PET ABILITIES (with stats from Wurst source)
  // ═══════════════════════════════════════════════════════════════════

  // Pet Tame — cd=10, mana=0, range=300
  setStats(a(CH, "A090", "Pet Tame", 1), 10, 0, 300);
  setStats(a(CH, "A091", "Pet Tame Shapeshifter", 1), 10, 0, 300);
  setStats(a(CH, "A092", "Pet Release", 1), 5, 0, 300);
  setStats(a(CH, "A093", "Pet Release Shapeshifter", 1), 5, 0, 300);
  setStats(a(CH, "A094", "Pet Sleep", 1), 5, 0, 300);
  setStats(a(CH, "A095", "Pet Sleep Shapeshifter", 1), 5, 0, 300);
  a(CH, "A096", "Pet Revive Info", 1);
  a("AId1", "A097", "Pet Armor", 1);
  a("AItg", "A098", "Pet Damage", 1);
  a("Amim", "A099", "Pet Magic Resist", 1);
  setStats(a(CH, "A09A", "Feed Pet", 1), 5, 0, 300);
  setStats(a(CH, "A09B", "Grow Pet", 1), 30, 0, 300);
  a(CH, "A09C", "Toggle Pet Control", 1);
  a(CH, "A09D", "Toggle Pet Control Shapeshifter", 1);
  // Spirit Beast — passive aura, aoe=400, -40% animal MS
  setStats(a(CH, "A09E", "Spirit Beast", 1), 0, 0, 0, 400);
  setStats(a(CH, "A09F", "Spirit Beast Shapeshifter", 1), 0, 0, 0, 400);
  a(CH, "A09G", "Shapeshifter Form", 1);
  a(CH, "A09H", "Nature's Bond", 1);
  a(CH, "A09I", "Druid Roar", 1);

  // Bear Form transformations (key: ABrf = Bear Form)
  a("Abrf", "A09J", "Transform Bear", 1);
  a("Abrf", "A09K", "Transform Panther", 1);
  a("Abrf", "A09L", "Transform Tiger", 1);
  a("Abrf", "A09M", "Transform Wolf", 1);

  // Form-specific
  // Panther Prowl — cd=60, mana=20, dur=20, -50% MS, 2s fade time
  setStats(a("AOwk", "A09N", "Panther Prowl", 1), 60, 20, 0, 0, 20, 20);
  // Panther Shadow Meld — passive stealth when stationary
  a("Amds", "A09O", "Panther Shadow Meld", 1);
  a(CH, "A09P", "Snake Poison", 1);
  // Hunter Web — ensnare, cd=12, range=600, dur=7/3
  setStats(a("ACen", "A09Q", "Hunter Web", 1), 12, 0, 600, 0, 7, 3);
  a(CH, "A09R", "Elk Critter", 1);
  // Cat Grace — passive evasion, 10/15/20%
  a("AEev", "A09S", "Cat Grace", 3);

  // ═══════════════════════════════════════════════════════════════════
  // RENDO PET ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  // Rendo Hawk Eye — cd=60, mana=10, dur=25
  setStats(a(CH, "A0A0", "Rendo Hawk Eye", 1), 60, 10, 0, 0, 25, 25);
  // Rendo Elk Jump — cd=60, mana=20, range=99999 (550 jump)
  setStats(a(CH, "A0A1", "Rendo Elk Jump", 1), 60, 20, 99999);
  // Rendo Wolf Bite — cd=60, mana=20, range=128, dur=15
  setStats(a(CH, "A0A2", "Rendo Wolf Bite", 1), 60, 20, 128, 0, 15, 15);
  // Rendo Snake Toxin — cd=1, mana=10, dur=15 (poison 5s)
  setStats(a(CH, "A0A3", "Rendo Snake Toxin", 1), 1, 10, 0, 0, 15, 15);
  // Rendo Panther Instinct — cd=1, mana=20, dur=4
  setStats(a(CH, "A0A4", "Rendo Panther Instinct", 1), 1, 20, 0, 0, 4, 4);
  // Rendo Devour — cd=25, mana=0, range=128
  setStats(a(CH, "A0A5", "Rendo Devour", 1), 25, 0, 128);

  // ═══════════════════════════════════════════════════════════════════
  // BUILDING/CRAFTING SPELLBOOKS
  // ═══════════════════════════════════════════════════════════════════

  // Building Craft Spellbook: building kit recipes (primary page)
  sb("A100", "Building Craft Spellbook",
    "A20I,A22R,A211,A21S,A204,A22Y,A21R,A22X,A22P,A21W,A22Q", 1);

  // Building Craft Second Spellbook: overflow building kits
  sb("A101", "Building Craft Second Spellbook",
    "A22T,A22Q,A213", 1);

  // Forge Spellbook: shield recipes (second page of Forge)
  sb("A102", "Forge Spellbook",
    "A228,A20H,A21E,A22L", 1);

  // Mixing Pot Spellbook: overflow mixing pot recipes
  sb("A103", "Mixing Pot Spellbook",
    "A20Q,A200,A20C,A20Y,A212,A21V,A22U,A21T,A20R,A20Z,A20S", 1);

  // Witch Doctor Hut Spellbook: overflow WDH recipes
  sb("A104", "Witch Doctor Hut Spellbook",
    "A223,A222,A226,A21O,A22D", 1);

  // Workshop Spellbook: overflow workshop recipes
  sb("A105", "Workshop Spellbook",
    "A229,A210,A20W,A22S", 1);

  // Armor Spellbook: bone/iron/steel boots, gloves, coats (Forge armor page)
  sb("A0B7", "Armor Spellbook",
    "A20E,A21A,A22H,A20G,A21C,A22J,A20F,A21B,A22I", 1);
  a(CH, "A106", "Building Select Long Range", 1);

  // ═══════════════════════════════════════════════════════════════════
  // QUICKMAKE ABILITIES (crafting recipe buttons)
  // All are Channel-based, 1 level
  // ═══════════════════════════════════════════════════════════════════

  const qmAbilities = [
    ["A200", "QM Acid Bomb"],
    ["A201", "QM Anabolic Boots"],
    ["A202", "QM Anabolic Potion"],
    ["A203", "QM Anti-Magic Potion"],
    ["A204", "QM Armory Kit"],
    ["A205", "QM Basic Boots"],
    ["A206", "QM Basic Coat"],
    ["A207", "QM Basic Gloves"],
    ["A208", "QM Battle Armor"],
    ["A209", "QM Battle Axe"],
    ["A20A", "QM Battle Gloves"],
    ["A20B", "QM Battle Shield"],
    ["A20C", "QM Bee Hive"],
    ["A20D", "QM Blow Gun"],
    ["A20E", "QM Bone Boots"],
    ["A20F", "QM Bone Coat"],
    ["A20G", "QM Bone Gloves"],
    ["A20H", "QM Bone Shield"],
    ["A20I", "QM Camp Fire Kit"],
    ["A20J", "QM Cloak Flames"],
    ["A20K", "QM Cloak Frost"],
    ["A20L", "QM Cloak Healing"],
    ["A20M", "QM Cloak Mana"],
    ["A20N", "QM Cure All"],
    ["A20O", "QM Dark Spear"],
    ["A20P", "QM Dark Thistles"],
    ["A20Q", "QM Disease Potion"],
    ["A20R", "QM Drunks Potion"],
    ["A20S", "QM Elemental Shield Potion"],
    ["A20T", "QM Elk Skin Boots"],
    ["A20U", "QM Elk Skin Coat"],
    ["A20V", "QM Elk Skin Gloves"],
    ["A20W", "QM EMP"],
    ["A20X", "QM Ensnare Trap"],
    ["A20Y", "QM Essence Bees"],
    ["A20Z", "QM Fervor Potion"],
    ["A210", "QM Fire Bomb"],
    ["A211", "QM Forge Kit"],
    ["A212", "QM Gem of Knowledge"],
    ["A213", "QM Hatchery Kit"],
    ["A214", "QM Healing Potion"],
    ["A215", "QM Hunting Net"],
    ["A216", "QM Hydra Scale Boots"],
    ["A217", "QM Hydra Scale Coat"],
    ["A218", "QM Hydra Scale Gloves"],
    ["A219", "QM Iron Axe"],
    ["A21A", "QM Iron Boots"],
    ["A21B", "QM Iron Coat"],
    ["A21C", "QM Iron Gloves"],
    ["A21D", "QM Iron Ingot"],
    ["A21E", "QM Iron Shield"],
    ["A21F", "QM Iron Spear"],
    ["A21G", "QM Jungle Bear Skin Boots"],
    ["A21H", "QM Jungle Bear Skin Coat"],
    ["A21I", "QM Jungle Bear Skin Gloves"],
    ["A21J", "QM Jungle Wolf Skin Boots"],
    ["A21K", "QM Jungle Wolf Skin Coat"],
    ["A21L", "QM Jungle Wolf Skin Gloves"],
    ["A21M", "QM Living Clay"],
    ["A21N", "QM Mage Masher"],
    ["A21O", "QM Magic Seed"],
    ["A21P", "QM Mana Crystal"],
    ["A21Q", "QM Mana Potion"],
    ["A21R", "QM Mixing Pot Kit"],
    ["A21S", "QM Mud Hut Kit"],
    ["A21T", "QM Nether Potion"],
    ["A21U", "QM Nets"],
    ["A21V", "QM Omnicure"],
    ["A21W", "QM Omni Tower Kit"],
    ["A21X", "QM Oracle Potion"],
    ["A21Y", "QM Poison"],
    ["A21Z", "QM Poison Spear"],
    ["A220", "QM Refined Poison Spear"],
    ["A221", "QM Scroll Armor"],
    ["A222", "QM Scroll Cyclone"],
    ["A223", "QM Scroll Fireball"],
    ["A224", "QM Scroll Living Dead"],
    ["A225", "QM Scroll Root"],
    ["A226", "QM Scroll Haste"],
    ["A227", "QM Scroll Tsunami"],
    ["A228", "QM Shield"],
    ["A229", "QM Smoke Bomb"],
    ["A22A", "QM Smoke House Kit"],
    ["A22B", "QM Spear"],
    ["A22C", "QM Spirit Darkness"],
    ["A22D", "QM Spirit Ward"],
    ["A22E", "QM Spirit Water"],
    ["A22F", "QM Spirit Wind"],
    ["A22G", "QM Steel Axe"],
    ["A22H", "QM Steel Boots"],
    ["A22I", "QM Steel Coat"],
    ["A22J", "QM Steel Gloves"],
    ["A22K", "QM Steel Ingot"],
    ["A22L", "QM Steel Shield"],
    ["A22M", "QM Steel Spear"],
    ["A22N", "QM Stone Axe"],
    ["A22O", "QM Storage Hut Kit"],
    ["A22P", "QM Tannery Kit"],
    ["A22Q", "QM Teleport Beacon Kit"],
    ["A22R", "QM Tent Kit"],
    ["A22S", "QM Transport Ship"],
    ["A22T", "QM Troll Hut Kit"],
    ["A22U", "QM Twin Islands"],
    ["A22V", "QM Ultra Poison"],
    ["A22W", "QM Ultra Poison Spear"],
    ["A22X", "QM Witch Doctors Hut Kit"],
    ["A22Y", "QM Workshop Kit"],
  ];

  for (const [id, name] of qmAbilities) {
    a(CH, id, name, 1);
  }

  // ═══════════════════════════════════════════════════════════════════
  // ITEM ABILITIES (active use abilities on items)
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A300", "Banana Healing", 1);
  a("AEev", "A301", "Anabolic Evasion", 1);
  a(CH, "A302", "Bone Thistle", 1);
  a(CH, "A303", "Dark Thistle", 1);
  a(CH, "A304", "Thistle", 1);
  a(CH, "A305", "Spear", 1);
  a(CH, "A306", "Spear Cast", 1);
  a(CH, "A307", "Spear Dark", 1);
  a(CH, "A308", "Spear Iron", 1);
  a(CH, "A309", "Spear Steel", 1);
  a(CH, "A30A", "Spear Poison", 1);
  a(CH, "A30B", "Spear Refined Poison", 1);
  a(CH, "A30C", "Spear Ultra Poison", 1);
  a("Amim", "A30D", "Spear Resist", 1);
  a("ANia", "A30E", "Cloak of Flames", 1);
  a(CH, "A30F", "Ice Veil", 1);
  a(CH, "A30G", "Ice Veil Debuff", 1);
  a(CH, "A30H", "Nether Potion Banish", 1);
  a(CH, "A30I", "Drunk Potion", 1);
  a(CH, "A30J", "Maximum Fervor", 1);
  a(CH, "A30K", "Haste AOE", 1);
  a(CH, "A30L", "Dysentery", 1);
  a(CH, "A30M", "Root Cast", 1);
  a("AEer", "A30N", "Root Troll", 1);
  a("AEer", "A30O", "Root Hostile", 1);
  a(CH, "A30P", "Bramble", 1);
  a("AOae", "A30Q", "Bonfire Aura", 1);
  a("AOae", "A30R", "Pain Aura", 1);
  a(CH, "A30S", "Hydra Claws Poison", 1);
  a(CH, "A30T", "Hydra Breath", 1);
  a(CH, "A30U", "Extreme Heat", 1);

  // ═══════════════════════════════════════════════════════════════════
  // SPECIAL/MISC ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A400", "Attack Tree", 1);
  a(CH, "A401", "Drop Items", 1);
  a(CH, "A402", "Unload Items", 1);
  a(CH, "A403", "Pack Building", 1);
  a(CH, "A404", "Shop Sharing", 1);
  a(CH, "A405", "Sleep Outside", 1);
  a(CH, "A406", "Sleep Inside Tent", 1);
  a(CH, "A407", "Sleep Inside Hut", 1);
  a(CH, "A408", "Hide Beacon", 1);
  a(CH, "A409", "Query Beacon", 1);
  a(CH, "A40A", "Camp Fire Heat Cast", 1);
  a(CH, "A40B", "Mage Fire Heat Cast", 1);
  a(CH, "A40C", "Camp Fire Unsafe Heat", 1);
  a(CH, "A40D", "Mage Fire Unsafe Heat", 1);
  a(CH, "A40E", "Ward Destroy", 1);
  a(CH, "A40F", "Hero Glow", 1);
  a(CH, "A40G", "The Glow", 1);
  a(CH, "A40H", "Invoke Rune 1", 1);
  a(CH, "A40I", "Invoke Rune 2", 1);
  a(CH, "A40J", "Invoke Rune 3", 1);
  a(CH, "A40K", "GUI Druid", 1);

  // Inventory abilities
  a("AInv", "A40L", "Inventory 3 Slot");
  a("AInv", "A40M", "Inventory 4 Slot");
  a("AInv", "A40N", "Inventory 5 Slot");
  a("AInv", "A40O", "Inventory Building 2 Slot");
  a("AInv", "A40P", "Inventory Building 3 Slot");

  // Speed increase
  a("AIms", "A0E5", "Speed Increase", 1);

  return undefined;
});
