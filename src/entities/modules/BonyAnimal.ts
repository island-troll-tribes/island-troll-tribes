/**
 * BonyAnimal - Hostile that drops bones in addition to other drops.
 *
 * Base class for trolls and bone-dropping animals.
 */

import { Unit } from "w3ts";
import { Hostile } from "./Hostile";
import { ItemIds } from "../../data/ItemIds";

export abstract class BonyAnimal extends Hostile {
  constructor(unit: Unit) {
    super(unit);
  }

  override getDrops(): number[] {
    const drops = super.getDrops();
    drops.push(ItemIds.BONE);
    return drops;
  }
}
