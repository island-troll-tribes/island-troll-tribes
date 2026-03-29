/**
 * EntityManager - Factory-based entity system for all game units.
 *
 * Mirrors the original UnitEntity.wurst pattern:
 * - Units are wrapped in entity classes via a factory registry
 * - When a unit is indexed (created), the factory creates the corresponding entity
 * - When a unit transforms, the old entity is destroyed and a new one created
 * - Death/revive events are forwarded to entity instances
 *
 * Entity hierarchy:
 *   UnitEntity (abstract)
 *   ├── Hostile (drops items on death)
 *   │   ├── BonyAnimal (drops bones)
 *   │   │   └── Troll (abstract - player-controlled)
 *   │   │       ├── Hunter, Mage, Priest, etc.
 *   │   ├── Animal (Elk, Snake, Wolf, Bear, Panther)
 *   │   └── Boss (AlligatorMan, Hydra, Mammoth, etc.)
 *   └── Building (Forge, Armory, MixingPot, etc.)
 */

import { Unit, Trigger } from "w3ts";

export type EntityFactory = (unit: Unit) => UnitEntity;

export abstract class UnitEntity {
  private static unitEntityMap: Map<Unit, UnitEntity> = new Map();
  private static factories: Map<number, EntityFactory> = new Map();

  protected unit: Unit;
  private shouldRemoveUnit = true;

  constructor(unit: Unit) {
    this.unit = unit;
    this.postCreate();
  }

  /** Register a factory for a unit type ID */
  static registerFactory(unitTypeId: number, factory: EntityFactory): void {
    UnitEntity.factories.set(unitTypeId, factory);
  }

  /** Look up the entity for a unit */
  static findForUnit(unit: Unit): UnitEntity | undefined {
    return UnitEntity.unitEntityMap.get(unit);
  }

  /** Handle unit indexing (creation) */
  static onUnitIndexed(unit: Unit): void {
    if (UnitEntity.unitEntityMap.has(unit)) return;

    const factory = UnitEntity.factories.get(unit.typeId);
    if (!factory) return;

    factory(unit);
  }

  /** Handle unit death */
  static onUnitDeath(unit: Unit): void {
    const entity = UnitEntity.findForUnit(unit);
    if (entity) {
      entity.onDeath();
    }
  }

  /** Handle hero revive */
  static onUnitRevive(unit: Unit): void {
    const entity = UnitEntity.findForUnit(unit);
    if (entity) {
      entity.onRevive();
    }
  }

  /** Handle unit transformation (class evolution) */
  static onUnitTransform(unit: Unit): void {
    const entity = UnitEntity.findForUnit(unit);
    if (!entity) return;

    const factory = UnitEntity.factories.get(unit.typeId);
    if (!factory) return;

    // Prevent the old entity from removing the unit handle
    entity.shouldRemoveUnit = false;
    entity.destroy();

    // Create entity for the new type
    factory(unit);
  }

  protected postCreate(): void {
    UnitEntity.unitEntityMap.set(this.unit, this);
  }

  getUnit(): Unit {
    return this.unit;
  }

  getPos(): { x: number; y: number } {
    return { x: this.unit.x, y: this.unit.y };
  }

  onDeath(): void {
    this.postDeath();
  }

  onRevive(): void {
    this.postRevive();
  }

  protected postDeath(): void {
    // Default: destroy entity on death (override in Troll to preserve for revive)
    this.destroy();
  }

  protected postRevive(): void {}

  destroy(): void {
    UnitEntity.unitEntityMap.delete(this.unit);
    if (this.shouldRemoveUnit) {
      this.unit.destroy();
    }
  }
}

export class EntityManager {
  private static instance: EntityManager;
  private deathTrigger: Trigger | null = null;
  private reviveTrigger: Trigger | null = null;

  private constructor() {}

  static getInstance(): EntityManager {
    if (!EntityManager.instance) {
      EntityManager.instance = new EntityManager();
    }
    return EntityManager.instance;
  }

  /** Register all entity factories - called during initialization */
  registerAllFactories(): void {
    // Troll classes are registered by TrollRegistry.initialize()
    // Animals, bosses, buildings registered by their respective modules
    this.setupEventTriggers();
  }

  private setupEventTriggers(): void {
    // Death trigger
    this.deathTrigger = new Trigger();
    this.deathTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH);
    this.deathTrigger.addAction(() => {
      const dying = Unit.fromEvent();
      if (dying) {
        UnitEntity.onUnitDeath(dying);
      }
    });

    // Revive trigger
    this.reviveTrigger = new Trigger();
    this.reviveTrigger.registerAnyUnitEvent(EVENT_PLAYER_HERO_REVIVE_FINISH);
    this.reviveTrigger.addAction(() => {
      const reviving = Unit.fromHandle(GetRevivingUnit());
      if (reviving) {
        UnitEntity.onUnitRevive(reviving);
      }
    });
  }
}
