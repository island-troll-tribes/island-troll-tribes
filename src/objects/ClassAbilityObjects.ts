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
  // COMBAT ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  // Bash — based on Bash (Aakb = Bash)
  a("AHbh", "A01I", "Bash", 1);

  // Critical Strike — based on Critical Strike (AOcr)
  a("AOcr", "A01J", "Critical Strike", 3);

  // Rage — based on Endurance Aura
  a("AOae", "A01K", "Rage", 3);
  a("AOae", "A01L", "Anger", 3);
  a("AOae", "A01M", "Legacy Anger", 3);
  a("AOae", "A01N", "Pump Up", 3);
  a("AOae", "A01O", "Legacy Pump Up", 3);

  // Giant Swing — based on Pulverize (War Stomp variant)
  a("AOws", "A01P", "Giant Swing", 3);
  a("AOws", "A01Q", "Giant Swing SS", 3);

  // Ensnare/Traps — based on Ensnare
  a("ACen", "A01R", "Ensnare", 1);
  a("ACen", "A01S", "Ensnare Trap", 1);
  a("ACen", "A01T", "Boss Ensnare", 1);

  // Traps — Channel-based
  a(CH, "A01U", "Spiked Trap", 1);
  a(CH, "A01V", "Bear Trap", 1);
  a(CH, "A01W", "Track Trap", 1);

  // Howl of Terror
  a("AOhw", "A01X", "Howl of Terror", 1);

  // Jump — Channel-based
  a(CH, "A01Y", "Jump", 1);

  // Blur — based on Evasion
  a("AEev", "A01Z", "Blur", 3);

  // Defensive abilities
  a("Assk", "A020", "Hardened Skin", 1);
  a(CH, "A021", "Panic", 1);
  a(CH, "A022", "Exhaust", 1);
  a("Askb", "A023", "Bark Skin", 3);
  a("AHad", "A024", "Spell Shield", 1);
  a("Amim", "A025", "Spell Damage Reduction", 1);
  a("Amim", "A026", "Magic Resist", 1);
  a("AHad", "A027", "Bear Bulwark", 1);
  a("AHad", "A028", "Bear Block", 1);
  a("AOae", "A029", "Bear Endurance", 1);
  a("Assk", "A02A", "Fortitude", 1);
  a("AOae", "A02B", "Endurance", 3);
  a("Assk", "A02C", "Self Preservation", 1);
  a("AOre", "A02D", "Reincarnation", 1);
  a(CH, "A02E", "Supersub Courage", 1);

  // Assassinate / Tiger abilities
  a("AOwk", "A02F", "Assasinate", 1);
  a("AOwk", "A02G", "Assassinate", 4);
  a(CH, "A02H", "Tiger Vicious Strike", 1);
  a("ACcr", "A02I", "Tiger Vicious Strike Cripple", 1);

  // Wolf abilities
  a(CH, "A02J", "Wolf Hunger", 1);
  a("AOvd", "A02K", "Wolf Vampiric Attack", 1);

  // Misc combat
  a(CH, "A02L", "Hurl Boulder", 1);
  a(CH, "A02M", "Null Damage", 1);
  a(CH, "A02N", "Null Damage Sub", 1);

  // ═══════════════════════════════════════════════════════════════════
  // MAGIC ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A030", "Firebolt", 1);
  a(CH, "A031", "Flame Spray", 1);
  a(CH, "A032", "Legacy Flame Spray", 1);
  a(CH, "A033", "Frost Blast", 1);
  a(CH, "A034", "Frost Armor", 1);
  a("AHfs", "A035", "Meteor", 1);
  a(CH, "A036", "Mage Fire", 1);
  a(CH, "A037", "Legacy Mage Fire", 1);
  a(CH, "A038", "Dementia Master Mage Fire", 1);
  a(CH, "A039", "Dementia Master Anger", 1);
  a(CH, "A03A", "Dementia Master Stupefy", 1);
  a(CH, "A03B", "Dementia Summoning", 1);
  a(CH, "A03C", "Depress", 1);
  a(CH, "A03D", "Legacy Depress", 1);
  a("AOae", "A03E", "Depression Aura", 1);
  a(CH, "A03F", "Depression Orb", 1);
  a("AOae", "A03G", "Dementia Depression Aura", 1);
  a("AOae", "A03H", "DD Depress Aura", 1);
  a("ANia", "A03I", "DD Immolation", 1);
  a("AIms", "A03J", "DD Move Speed", 1);
  a(CH, "A03K", "Negative Blast", 1);
  a(CH, "A03M", "Legacy Negative Blast", 1);
  a(CH, "A03N", "Negative Blast Sub", 1);
  a(CH, "A03P", "Stupefy", 1);
  a(CH, "A03Q", "Stupefy Legacy", 1);
  a("AHfs", "A03R", "Doomsday", 1);
  a(CH, "A03S", "Metronome", 1);
  a(CH, "A03T", "Legacy Metronome", 1);
  a("AUfn", "A03U", "Metronome Frost Nova", 1);
  a("AUfn", "A03V", "Metronome Frost Nova Ult", 1);
  a("AUim", "A03W", "Metronome Impale", 1);
  a("ANmb", "A03X", "Metronome Mana Burn", 1);
  a(CH, "A03Y", "Overcharge", 1);
  a("AOls", "A03Z", "Lightning Shield", 1);
  a("ACcy", "A040", "Cyclone", 1);
  a(CH, "A041", "Tsunami", 1);
  a(CH, "A042", "Dark Gate", 1);
  a(CH, "A043", "Light Gate", 1);
  a("ACcl", "A044", "Zap", 1);
  a(CH, "A045", "Angelic Elemental", 1);
  a(CH, "A046", "Sage Angelic Elemental", 1);
  a(CH, "A047", "Skeletal Minion", 1);
  a(CH, "A048", "Earth Guardian", 1);
  a(CH, "A049", "Magic Mist", 1);
  a("AAbm", "A04A", "Anti-Magic", 1);
  a(CH, "A04B", "Anti-Magic AOE", 1);

  // ═══════════════════════════════════════════════════════════════════
  // PRIEST/HEALING ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A050", "Healing Wave", 1);
  a(CH, "A051", "MH Healing Wave", 1);
  a(CH, "A052", "Sage Healing Wave", 1);
  a(CH, "A053", "Healing Potion", 1);
  a(CH, "A054", "Rejuvenation", 1);
  a(CH, "A055", "Rejuv Healing", 1);
  a(CH, "A056", "Rejuv Mana", 1);
  a(CH, "A057", "Ranged Heal", 1);
  a(CH, "A058", "Replenish Energy", 1);
  a(CH, "A059", "Replenish Health", 1);
  a(CH, "A05A", "Sage Replenish Energy", 1);
  a(CH, "A05B", "Breath of Life", 1);
  a("AAbm", "A05C", "Cure All", 1);
  a("AAbm", "A05D", "Cure All Item", 1);
  a("AAbm", "A05E", "Omnicure", 1);
  a("AAbm", "A05F", "Omnicure Item", 1);
  a(CH, "A05G", "Troll Battle Call", 1);
  a(CH, "A05H", "Sage Troll Battle Call", 1);
  a(CH, "A05I", "Increase Metabolism", 1);
  a(CH, "A05J", "Sage Increase Metabolism", 1);
  a(CH, "A05K", "Mix Energy", 1);
  a(CH, "A05L", "Mix Heat", 1);
  a(CH, "A05M", "MH Mix Energy", 1);
  a(CH, "A05N", "MH Mix Heat", 1);
  a(CH, "A05O", "Sage Mix Energy", 1);
  a(CH, "A05P", "Sage Mix Heat", 1);
  a(CH, "A05Q", "Mix Herbs", 1);
  a(CH, "A05R", "Omnigatherer Mix Herbs", 1);
  a(CH, "A05S", "Pot Mix Herbs", 1);
  a(CH, "A05T", "Meditate", 1);
  a(CH, "A05U", "Spirit Link", 1);
  a(CH, "A05V", "Spiritual Guidance", 1);
  a(CH, "A05W", "Anchor Soul", 1);
  a(CH, "A05X", "Spirit Prison", 1);
  a(CH, "A05Y", "Legacy Spirit Prison", 1);
  a(CH, "A05Z", "Spirit Prison Cage", 1);

  // ═══════════════════════════════════════════════════════════════════
  // THIEF ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A060", "Camouflage", 1);
  a(CH, "A061", "AS Camouflage", 1);
  a(CH, "A062", "Smoke Stream", 1);
  a(CH, "A063", "AS Smoke Stream", 1);
  a(CH, "A064", "Tele Thief", 1);
  a(CH, "A065", "AS Tele Thief", 1);
  a("AOwk", "A066", "Cloak", 3);
  a("AOwk", "A067", "Sub Cloak", 3);
  a("AOwk", "A068", "Nether Fade", 1);
  a(CH, "A069", "Jealousy", 1);
  a(CH, "A06A", "Legacy Jealousy", 1);
  a(CH, "A06B", "Seizures", 1);
  a(CH, "A06C", "Dream Eater", 1);
  a(CH, "A06D", "Legacy Dream Eater", 1);
  a(CH, "A06E", "Hypnosis", 1);
  a(CH, "A06F", "Legacy Hypnosis", 1);

  // ═══════════════════════════════════════════════════════════════════
  // SCOUT ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A070", "Reveal", 3);
  a(CH, "A071", "Greater Reveal", 1);
  a(CH, "A072", "Chain Reveal", 3);
  a("Afae", "A073", "Track", 3);
  a("Afae", "A074", "Tracker Track", 3);
  a(CH, "A075", "Sniff", 1);
  a(CH, "A076", "Sniff Track", 1);
  a(CH, "A077", "Ping Enemy", 1);
  a(CH, "A078", "Spy Ping Enemy", 1);
  a(CH, "A079", "Ward Area", 1);
  a(CH, "A07A", "Spy Ward Area", 1);
  a(CH, "A07B", "Observer Ward Area", 1);
  a(CH, "A07C", "Spy Bear Trap", 1);
  a(CH, "A07D", "Sentinel", 1);
  a(CH, "A07E", "Shadow Sight", 1);
  a(CH, "A07F", "Item Radar", 1);

  // ═══════════════════════════════════════════════════════════════════
  // GATHERER ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A080", "Find Tinder", 1);
  a(CH, "A081", "Find Clay Ball", 1);
  a(CH, "A082", "Find Stick", 1);
  a(CH, "A083", "Find Flint", 1);
  a(CH, "A084", "Find Mana Crystal", 1);
  a(CH, "A085", "Find Mushroom", 1);
  a(CH, "A086", "Find Stone", 1);
  a("Acur", "A087", "Tele-Gathering", 3);
  a("Acur", "A088", "Omni Tele-Gathering", 1);
  a("Acur", "A089", "Herb Tele-Gathering", 3);
  a("Acur", "A08A", "Radar Tele-Gathering", 3);
  a(CH, "A08B", "Item Warp", 1);
  a(CH, "A08C", "Reduce Food", 1);
  a(CH, "A08D", "Legacy Reduce Food", 1);
  a(CH, "A08E", "Cook Meat", 1);

  // ═══════════════════════════════════════════════════════════════════
  // BEASTMASTER/PET ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A090", "Pet Tame", 1);
  a(CH, "A091", "Pet Tame Shapeshifter", 1);
  a(CH, "A092", "Pet Release", 1);
  a(CH, "A093", "Pet Release Shapeshifter", 1);
  a(CH, "A094", "Pet Sleep", 1);
  a(CH, "A095", "Pet Sleep Shapeshifter", 1);
  a(CH, "A096", "Pet Revive Info", 1);
  a("AId1", "A097", "Pet Armor", 1);
  a("AItg", "A098", "Pet Damage", 1);
  a("Amim", "A099", "Pet Magic Resist", 1);
  a(CH, "A09A", "Feed Pet", 1);
  a(CH, "A09B", "Grow Pet", 1);
  a(CH, "A09C", "Toggle Pet Control", 1);
  a(CH, "A09D", "Toggle Pet Control Shapeshifter", 1);
  a(CH, "A09E", "Spirit Beast", 1);
  a(CH, "A09F", "Spirit Beast Shapeshifter", 1);
  a(CH, "A09G", "Shapeshifter Form", 1);
  a(CH, "A09H", "Nature's Bond", 1);
  a(CH, "A09I", "Druid Roar", 1);

  // Bear Form transformations (key: ABrf = Bear Form)
  a("Abrf", "A09J", "Transform Bear", 1);
  a("Abrf", "A09K", "Transform Panther", 1);
  a("Abrf", "A09L", "Transform Tiger", 1);
  a("Abrf", "A09M", "Transform Wolf", 1);

  // Form-specific
  a("AOwk", "A09N", "Panther Prowl", 1);
  a("Amds", "A09O", "Panther Shadow Meld", 1);
  a(CH, "A09P", "Snake Poison", 1);
  a("ACen", "A09Q", "Hunter Web", 1);
  a(CH, "A09R", "Elk Critter", 1);
  a("AEev", "A09S", "Cat Grace", 3);

  // ═══════════════════════════════════════════════════════════════════
  // RENDO PET ABILITIES
  // ═══════════════════════════════════════════════════════════════════

  a(CH, "A0A0", "Rendo Hawk Eye", 1);
  a(CH, "A0A1", "Rendo Elk Jump", 1);
  a(CH, "A0A2", "Rendo Wolf Bite", 1);
  a(CH, "A0A3", "Rendo Snake Toxin", 1);
  a(CH, "A0A4", "Rendo Panther Instinct", 1);
  a(CH, "A0A5", "Rendo Devour", 1);

  // ═══════════════════════════════════════════════════════════════════
  // BUILDING/CRAFTING SPELLBOOKS
  // ═══════════════════════════════════════════════════════════════════

  a(SB, "A100", "Building Craft Spellbook");
  a(SB, "A101", "Building Craft Second Spellbook");
  a(SB, "A102", "Forge Spellbook");
  a(SB, "A103", "Mixing Pot Spellbook");
  a(SB, "A104", "Witch Doctor Hut Spellbook");
  a(SB, "A105", "Workshop Spellbook");
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
