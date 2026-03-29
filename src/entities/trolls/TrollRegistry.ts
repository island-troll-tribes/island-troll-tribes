/**
 * TrollRegistry - Central registry for all troll class definitions and factories.
 *
 * Loads troll definitions from data files and registers entity factories
 * with the EntityManager. Also provides lookup utilities for class info.
 *
 * This replaces the scattered Wurst files:
 * - Classes.wurst (class type/base class lookups)
 * - TrollUnitFactory.wurst (hero definition generation)
 * - TrollUnitInitializer.wurst (ability/stat assignment)
 * - TrollUpgrade.wurst (evolution mapping)
 */

import { Unit } from "w3ts";
import { UnitEntity } from "../EntityManager";
import {
  TrollDefinition,
  TrollFamily,
  ClassType,
} from "./TrollDefinition";
import { BaseTroll } from "./BaseTroll";
import { TROLL_DEFINITIONS } from "../../data/trolls/AllTrollDefinitions";
import { TROLL_FAMILIES } from "../../data/trolls/TrollFamilies";

/** Concrete troll class - instantiated from data definitions */
class TrollEntity extends BaseTroll {
  constructor(unit: Unit, definition: TrollDefinition) {
    super(unit, definition);
  }
}

export class TrollRegistry {
  private static definitions: Map<string, TrollDefinition> = new Map();
  private static unitTypeToId: Map<number, string> = new Map();
  private static families: Map<string, TrollFamily> = new Map();

  /** Initialize the registry with all troll definitions */
  static initialize(): void {
    // Load all troll definitions from data
    for (const def of TROLL_DEFINITIONS) {
      TrollRegistry.definitions.set(def.id, def);
      TrollRegistry.unitTypeToId.set(def.unitTypeId, def.id);

      // Register entity factory
      UnitEntity.registerFactory(
        def.unitTypeId,
        (unit: Unit) => new TrollEntity(unit, def)
      );
    }

    // Load family groupings
    for (const family of TROLL_FAMILIES) {
      TrollRegistry.families.set(family.baseId, family);
    }
  }

  /** Look up a definition by string ID */
  static getDefinition(classId: string): TrollDefinition | undefined {
    return TrollRegistry.definitions.get(classId);
  }

  /** Look up a definition by WC3 unit type ID */
  static getDefinitionByUnitType(
    unitTypeId: number
  ): TrollDefinition | undefined {
    const id = TrollRegistry.unitTypeToId.get(unitTypeId);
    return id ? TrollRegistry.definitions.get(id) : undefined;
  }

  /** Get the class type for a unit */
  static getClassType(unit: Unit): ClassType | undefined {
    const def = TrollRegistry.getDefinitionByUnitType(unit.typeId);
    return def?.classType;
  }

  /** Get the base class ID for a unit (what family it belongs to) */
  static getBaseClassId(unit: Unit): string | undefined {
    const def = TrollRegistry.getDefinitionByUnitType(unit.typeId);
    return def?.baseClassId;
  }

  /** Check if a unit is any type of troll */
  static isTroll(unit: Unit): boolean {
    return TrollRegistry.unitTypeToId.has(unit.typeId);
  }

  /** Get all definitions for a specific class type */
  static getDefinitionsByType(classType: ClassType): TrollDefinition[] {
    return [...TrollRegistry.definitions.values()].filter(
      (d) => d.classType === classType
    );
  }

  /** Get the base class definitions (the 7 starter classes) */
  static getBaseClasses(): TrollDefinition[] {
    return TrollRegistry.getDefinitionsByType(ClassType.Base);
  }

  /** Get a family grouping */
  static getFamily(baseId: string): TrollFamily | undefined {
    return TrollRegistry.families.get(baseId);
  }

  /** Get all families */
  static getAllFamilies(): TrollFamily[] {
    return [...TrollRegistry.families.values()];
  }

  /** Get the evolution targets for a given class */
  static getEvolutionTargets(classId: string): TrollDefinition[] {
    const def = TrollRegistry.definitions.get(classId);
    if (!def?.evolutionTargets) return [];

    return def.evolutionTargets
      .map((id) => TrollRegistry.definitions.get(id))
      .filter((d): d is TrollDefinition => d !== undefined);
  }
}

// Wire up the forward declaration from BaseTroll
(globalThis as any).TrollRegistry_getDefinition =
  TrollRegistry.getDefinition.bind(TrollRegistry);
