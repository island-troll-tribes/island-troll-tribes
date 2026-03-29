/**
 * AbilityObjects - Compiletime definitions for all custom abilities.
 *
 * Creates stat bonus abilities (used by items) and other custom abilities
 * at compile time via war3-transformer.
 *
 * Base ability types:
 *   AIms = ItemMoveSpeedBonus (movementSpeedBonus)
 *   AIs1 = ItemStrengthBonus (strengthBonusundefined, intelligenceBonus, agilityBonus)
 *   AIi1 = ItemIntelligenceBonus (same 3 props)
 *   AIx1 = ItemAllStatsBonus (same 3 props)
 *   AId1 = ItemArmorBonusPlus1 (defenseBonusundefined)
 *   AIs2 = ItemAttackSpeedBonusGreater (attackSpeedIncrease)
 *   AItg = ItemDamageBonusPlus1 (attackBonus)
 */

declare function compiletime<T>(fn: (ctx: CompiletimeContext) => T): T;

compiletime(({ objectData }) => {
  // ── Helper: copy ability and set common fields ──
  function makeAbil(baseId: string, newId: string, name: string) {
    const a = objectData.abilities.copy(baseId, newId);
    if (a) {
      a.name = name;
      a.itemAbility = true;
    }
    return a;
  }

  // ═══════════════════════════════════════════════════════════════════
  // STAT BONUSES: MOVEMENT SPEED (base: AIms)
  // ═══════════════════════════════════════════════════════════════════
  function makeSpeed(newId: string, name: string, bonus: number) {
    const a = makeAbil("AIms", newId, name) as any;
    if (a) a.movementSpeedBonus = bonus;
  }

  makeSpeed("A0E0", "Speed Bonus +60",  60);
  makeSpeed("A0E1", "Speed Bonus +70",  70);
  makeSpeed("A0E2", "Speed Bonus +80",  80);
  makeSpeed("A0E3", "Speed Bonus +100", 100);
  makeSpeed("A0E4", "Speed Bonus +200", 200);

  // ═══════════════════════════════════════════════════════════════════
  // STAT BONUSES: ARMOR (base: AId1)
  // ═══════════════════════════════════════════════════════════════════
  function makeArmor(newId: string, name: string, bonus: number) {
    const a = makeAbil("AId1", newId, name) as any;
    if (a) a.defenseBonusundefined = bonus;
  }

  makeArmor("A0B0", "Armor Bonus +1",  1);
  makeArmor("A0B1", "Armor Bonus +2",  2);
  makeArmor("A0B2", "Armor Bonus +3",  3);
  makeArmor("A0B3", "Armor Bonus +4",  4);
  makeArmor("A0B4", "Armor Bonus +5",  5);
  makeArmor("A0B5", "Armor Bonus +7",  7);
  makeArmor("A0B6", "Armor Bonus +10", 10);

  // ═══════════════════════════════════════════════════════════════════
  // STAT BONUSES: STRENGTH (base: AIs1)
  // ═══════════════════════════════════════════════════════════════════
  function makeStr(newId: string, name: string, bonus: number) {
    const a = makeAbil("AIs1", newId, name) as any;
    if (a) {
      a.strengthBonusundefined = bonus;
      a.intelligenceBonus = 0;
      a.agilityBonus = 0;
    }
  }

  // AIs1 is kept as-is (hardcoded, str+1)
  makeStr("A0C0", "Strength Bonus +2", 2);
  // AIs3, AIs4, AIs6 are hardcoded base game abilities
  makeStr("A0C1", "Strength Bonus +8", 8);

  // ═══════════════════════════════════════════════════════════════════
  // STAT BONUSES: INTELLIGENCE (base: AIi1 — same struct as AIs1)
  // ═══════════════════════════════════════════════════════════════════
  function makeInt(newId: string, name: string, bonus: number) {
    const a = makeAbil("AIs1", newId, name) as any;
    if (a) {
      a.strengthBonusundefined = 0;
      a.intelligenceBonus = bonus;
      a.agilityBonus = 0;
    }
  }

  makeInt("A0D0", "Intelligence Bonus +1",  1);
  makeInt("A0D1", "Intelligence Bonus +2",  2);
  // AIi3, AIi4, AIi6 are hardcoded base game abilities
  makeInt("A0D2", "Intelligence Bonus +5",  5);
  makeInt("A0D3", "Intelligence Bonus +8",  8);
  makeInt("A0D4", "Intelligence Bonus +10", 10);

  // ═══════════════════════════════════════════════════════════════════
  // STAT BONUSES: ALL STATS (base: AIx1 — same struct)
  // ═══════════════════════════════════════════════════════════════════
  function makeAllStats(newId: string, name: string, bonus: number) {
    const a = makeAbil("AIs1", newId, name) as any;
    if (a) {
      a.strengthBonusundefined = bonus;
      a.intelligenceBonus = bonus;
      a.agilityBonus = bonus;
    }
  }

  makeAllStats("A0D5", "All Stats Bonus +3", 3);
  makeAllStats("A0D6", "All Stats Bonus +4", 4);
  // AIx5 is hardcoded (all stats +5)

  // ═══════════════════════════════════════════════════════════════════
  // STAT BONUSES: ATTACK SPEED (base: AIs2 — ItemAttackSpeedBonusGreater)
  // ═══════════════════════════════════════════════════════════════════
  function makeAtkSpeed(newId: string, name: string, pct: number) {
    const a = makeAbil("AIs2", newId, name) as any;
    if (a) a.attackSpeedIncrease = pct;
  }

  makeAtkSpeed("A0F0", "Attack Speed +10%", 0.10);
  makeAtkSpeed("A0F1", "Attack Speed +15%", 0.15);
  makeAtkSpeed("A0F2", "Attack Speed +20%", 0.20);
  makeAtkSpeed("A0F3", "Attack Speed +25%", 0.25);
  makeAtkSpeed("A0F4", "Attack Speed +30%", 0.30);
  makeAtkSpeed("A0F5", "Attack Speed +35%", 0.35);

  // ═══════════════════════════════════════════════════════════════════
  // ATTACK TREE (base: AItg — ItemDamageBonusPlus1)
  // Used by axes and other damage items
  // ═══════════════════════════════════════════════════════════════════
  // Standard WC3 attack bonus abilities (AItg, AIat) are used directly
  // No custom creation needed for +1, +2, +4 attack bonus

  return undefined;
});
