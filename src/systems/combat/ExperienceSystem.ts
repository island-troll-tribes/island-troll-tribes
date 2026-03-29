/**
 * ExperienceSystem - Custom XP distribution and leveling.
 *
 * Ports the original Experience.wurst system:
 * - Custom XP formula: 150*level + 50*level^2
 * - Class-based XP multiplier (Base=4x, Sub=3x, Super=2x)
 * - Shared XP in 1200-unit range
 * - GOK (Gem of Knowledge) 1.5x bonus
 * - Level-based upgrade research tracking
 * - Max level 30
 */

import { Unit, Trigger, MapPlayer } from "w3ts";
import { GameConfig } from "../../config/GameConfig";
import { TrollRegistry } from "../../entities/trolls/TrollRegistry";
import { TalentRegistry } from "../../talents/TalentRegistry";
import { ClassType } from "../../entities/trolls/TrollDefinition";
import { ItemIds } from "../../data/ItemIds";

/** Creep XP table indexed by unit level */
const CREEP_EXP: number[] = [3, 25];

/** Hero XP table indexed by level */
const HERO_EXP: number[] = [0, 100, 120, 160, 220, 300];

/** Per-level XP requirements */
const EXP_PER_LEVEL: number[] = [0, 200];

export class ExperienceSystem {
  private static instance: ExperienceSystem;
  private deathTrigger: Trigger | null = null;
  private levelTrigger: Trigger | null = null;

  private constructor() {
    this.initTables();
  }

  static getInstance(): ExperienceSystem {
    if (!ExperienceSystem.instance) {
      ExperienceSystem.instance = new ExperienceSystem();
    }
    return ExperienceSystem.instance;
  }

  /** Build the XP tables (mirrors the init block in Experience.wurst) */
  private initTables(): void {
    for (let i = 2; i <= 30; i++) {
      CREEP_EXP[i] = CREEP_EXP[i - 1] + (i + 1) * 5;
      EXP_PER_LEVEL[i] = EXP_PER_LEVEL[i - 1] * 2 - EXP_PER_LEVEL[i - 2] + 100;
    }
    for (let i = 6; i <= 30; i++) {
      HERO_EXP[i] = HERO_EXP[i - 1] + 100;
    }
  }

  /** Get the XP multiplier for a troll's class type */
  getMultiplier(troll: Unit): number {
    const classType = TrollRegistry.getClassType(troll);
    switch (classType) {
      case ClassType.Base:
        return 4;
      case ClassType.Sub:
        return 3;
      case ClassType.Super:
        return 2;
      default:
        return 1;
    }
  }

  /** Enable the experience system */
  enable(): void {
    // Disable default WC3 XP for all players
    for (let i = 0; i < 12; i++) {
      const p = MapPlayer.fromIndex(i);
      if (p) {
        p.setHandicapXP(0);
      }
    }

    // Death trigger for XP distribution
    this.deathTrigger = new Trigger();
    this.deathTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH);
    this.deathTrigger.addAction(() => this.onUnitDeath());

    // Level-up trigger for talent point awards and research tracking
    this.levelTrigger = new Trigger();
    this.levelTrigger.registerAnyUnitEvent(EVENT_PLAYER_HERO_LEVEL);
    this.levelTrigger.addAction(() => this.onHeroLevelUp());
  }

  private onUnitDeath(): void {
    const dead = Unit.fromHandle(GetDyingUnit());
    const killer = Unit.fromHandle(GetKillingUnit());

    if (!dead || !killer) return;
    if (killer.isAlly(dead.owner)) return;

    const config = GameConfig.getInstance();
    const killPos = { x: killer.x, y: killer.y };

    // Enumerate allied heroes in XP range
    const heroes: Unit[] = [];
    const g = CreateGroup();
    GroupEnumUnitsInRange(g, killPos.x, killPos.y, config.EXP_RANGE, null);
    ForGroup(g, () => {
      const u = Unit.fromHandle(GetEnumUnit());
      if (u && u.isHero() && u.isAlly(killer.owner) && u.isAlive()) {
        heroes.push(u);
      }
    });
    DestroyGroup(g);

    // Ensure the killer's hero is included
    if (killer.isHero() && !heroes.includes(killer)) {
      heroes.push(killer);
    }

    const deadLevel = dead.level;
    const baseExp = dead.isHero()
      ? (HERO_EXP[deadLevel] ?? 0)
      : (CREEP_EXP[deadLevel] ?? 0);

    for (const hero of heroes) {
      const multiplier = this.getMultiplier(hero);
      let experience = Math.floor((baseExp * multiplier) / heroes.length);

      // GOK bonus
      if (this.hasItem(hero, ItemIds.GEM_OF_KNOWLEDGE)) {
        experience = Math.floor(experience * config.GOK_MULTIPLIER);
      }

      hero.setXp(hero.getXp() + experience, true);
    }
  }

  private onHeroLevelUp(): void {
    const unit = Unit.fromEvent();
    if (!unit || !TrollRegistry.isTroll(unit)) return;

    // Award talent points
    const config = GameConfig.getInstance();
    TalentRegistry.awardPoints(
      unit.owner.id,
      config.TALENT_POINTS_PER_LEVEL
    );
  }

  private hasItem(unit: Unit, itemTypeId: number): boolean {
    for (let i = 0; i < 6; i++) {
      const item = UnitItemInSlot(unit.handle, i);
      if (item && GetItemTypeId(item) === itemTypeId) {
        return true;
      }
    }
    return false;
  }
}
