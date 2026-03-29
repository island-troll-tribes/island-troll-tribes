/**
 * DiscoDuck - Summoned boss with immolation, depression aura, and movement aura.
 *
 * The Disco Duck is a powerful boss that drops one of three pinion types
 * (fire, pain, shadow) randomly on death. It also drops bones, steel ingots,
 * and a Medallion of Courage. Each pinion type is removed from the pool
 * after being dropped, so subsequent kills yield different pinions.
 */

import { Unit } from "w3ts";
import { Hostile } from "../modules/Hostile";
import { UnitEntity } from "../EntityManager";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";

/** Pinion item pool - each type removed after being dropped */
const pinionPool: number[] = [
  ItemIds.DD_PINION_FIRE,
  ItemIds.DD_PINION_SHADOW,
  ItemIds.DD_PINION_PAIN,
];

export class DiscoDuck extends Hostile {
  private static instance: DiscoDuck | null = null;

  constructor(unit: Unit) {
    super(unit);
  }

  static register(): void {
    UnitEntity.registerFactory(
      UnitTypeIds.DISCO_DUCK,
      (unit) => new DiscoDuck(unit)
    );
  }

  static getInstance(): DiscoDuck | null {
    return DiscoDuck.instance;
  }

  override postCreate(): void {
    super.postCreate();
    if (DiscoDuck.instance === null) {
      DiscoDuck.instance = this;
    }

    // TODO: Play mammoth horn sound
    // TODO: Display "The disco duck has been summoned!" message
    // TODO: Flash teleport effect on the unit
  }

  override getDrops(): number[] {
    return [
      ItemIds.BONE,
      ItemIds.BONE,
      ItemIds.STEEL_INGOT,
      ItemIds.STEEL_INGOT,
      ItemIds.MEDALLION_OF_COURAGE,
    ];
  }

  override getNumCorpses(): number {
    return 13;
  }

  override onDeath(): void {
    // Drop a random pinion from the remaining pool
    if (pinionPool.length > 0) {
      const index = Math.floor(Math.random() * pinionPool.length);
      const pinionId = pinionPool[index];
      const pos = this.getPos();
      CreateItem(pinionId, pos.x, pos.y);

      // Remove this pinion type from future drops
      pinionPool.splice(index, 1);
    }

    super.onDeath();
  }

  override postDeath(): void {
    // Remove the unit from the map after death
    this.getUnit().destroy();
  }
}
