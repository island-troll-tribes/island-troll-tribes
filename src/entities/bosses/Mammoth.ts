/**
 * Mammoth - Powerful boss that guards the center of the map.
 *
 * The Mammoth is initially invulnerable and must be lured or triggered.
 * It drops the Horn of the Mammoth (required for certain recipes),
 * a Medallion of Courage (required for super-class evolution), and
 * several bones. The Mammoth gate is a destructable that becomes
 * accessible after the Mammoth dies.
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

export class Mammoth extends Hostile {
  private static instance: Mammoth | null = null;

  private dead = false;

  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.MAMMOTH,
      (unit) => new Mammoth(unit)
    );
  }

  static getInstance(): Mammoth | null {
    return Mammoth.instance;
  }

  override postCreate(): void {
    super.postCreate();
    if (Mammoth.instance === null) {
      Mammoth.instance = this;
    }
  }

  override getDrops(): number[] {
    return [
      ItemIds.HORN_MAMMOTH,
      ItemIds.MEDALLION_OF_COURAGE,
      ItemIds.BONE,
      ItemIds.BONE,
      ItemIds.BONE,
      ItemIds.BONE,
      ItemIds.BONE,
    ];
  }

  override getNumCorpses(): number {
    return 16;
  }

  override onDeath(): void {
    this.dead = true;
    super.onDeath();
  }

  override postDeath(): void {
    // Remove the unit from the map after death
    this.getUnit().destroy();
  }

  isDead(): boolean {
    return this.dead;
  }
}
