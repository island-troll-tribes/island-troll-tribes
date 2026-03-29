/**
 * TrollFamilies - Family groupings for all troll class lines.
 *
 * Each family represents a base class and all its evolution paths.
 */

import { TrollFamily } from "../../entities/trolls/TrollDefinition";

export const TROLL_FAMILIES: TrollFamily[] = [
  {
    baseId: "hunter",
    familyName: "Hunter",
    classIds: ["hunter", "warrior", "tracker", "juggernaut"],
    subClassIds: ["warrior", "tracker"],
    superClassId: "juggernaut",
  },
  {
    baseId: "mage",
    familyName: "Mage",
    classIds: ["mage", "elementalist", "hypnotist", "dementia_master"],
    subClassIds: ["elementalist", "hypnotist"],
    superClassId: "dementia_master",
  },
  {
    baseId: "priest",
    familyName: "Priest",
    classIds: ["priest", "booster", "master_healer", "sage"],
    subClassIds: ["booster", "master_healer"],
    superClassId: "sage",
  },
  {
    baseId: "beastmaster",
    familyName: "Beastmaster",
    classIds: [
      "beastmaster",
      "shapeshifter_wolf",
      "druid",
      "jungle_tyrant",
    ],
    subClassIds: ["shapeshifter_wolf", "druid"],
    superClassId: "jungle_tyrant",
  },
  {
    baseId: "thief",
    familyName: "Thief",
    classIds: ["thief", "escape_artist", "contortionist", "assassin"],
    subClassIds: ["escape_artist", "contortionist"],
    superClassId: "assassin",
  },
  {
    baseId: "scout",
    familyName: "Scout",
    classIds: ["scout", "observer", "trapper", "spy"],
    subClassIds: ["observer", "trapper"],
    superClassId: "spy",
  },
  {
    baseId: "gatherer",
    familyName: "Gatherer",
    classIds: ["gatherer", "radar_gatherer", "herb_master", "omnigatherer"],
    subClassIds: ["radar_gatherer", "herb_master"],
    superClassId: "omnigatherer",
  },
];
