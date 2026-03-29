/**
 * UnitIds - WC3 unit type ID constants.
 *
 * All FourCC unit IDs used throughout the game.
 * TODO: Generate from base.w3x object data.
 */

export namespace UnitTypeIds {
  // ─── Trolls: Base Classes ──────────────────────────────────────────
  export const HUNTER = FourCC("O001");
  export const BEASTMASTER = FourCC("O002");
  export const MAGE = FourCC("O003");
  export const PRIEST = FourCC("O004");
  export const THIEF = FourCC("O005");
  export const SCOUT = FourCC("O006");
  export const GATHERER = FourCC("O007");

  // ─── Trolls: Hunter Line ───────────────────────────────────────────
  export const WARRIOR = FourCC("O010");
  export const TRACKER = FourCC("O011");
  export const JUGGERNAUT = FourCC("O012");

  // ─── Trolls: Beastmaster Line ──────────────────────────────────────
  export const SHAPESHIFTER_WOLF = FourCC("O020");
  export const SHAPESHIFTER_BEAR = FourCC("O021");
  export const SHAPESHIFTER_PANTHER = FourCC("O022");
  export const SHAPESHIFTER_TIGER = FourCC("O023");
  export const DRUID = FourCC("O024");
  export const JUNGLE_TYRANT = FourCC("O025");

  // ─── Trolls: Mage Line ────────────────────────────────────────────
  export const ELEMENTALIST = FourCC("O030");
  export const HYPNOTIST = FourCC("O031");
  export const DEMENTIA_MASTER = FourCC("O032");

  // ─── Trolls: Priest Line ──────────────────────────────────────────
  export const BOOSTER = FourCC("O040");
  export const MASTER_HEALER = FourCC("O041");
  export const SAGE = FourCC("O042");

  // ─── Trolls: Thief Line ───────────────────────────────────────────
  export const ESCAPE_ARTIST = FourCC("O050");
  export const CONTORTIONIST = FourCC("O051");
  export const ASSASSIN = FourCC("O052");

  // ─── Trolls: Scout Line ───────────────────────────────────────────
  export const OBSERVER = FourCC("O060");
  export const TRAPPER = FourCC("O061");
  export const SPY = FourCC("O062");

  // ─── Trolls: Gatherer Line ────────────────────────────────────────
  export const RADAR_GATHERER = FourCC("O070");
  export const HERB_MASTER = FourCC("O071");
  export const OMNIGATHERER = FourCC("O072");

  // ─── Animals ───────────────────────────────────────────────────────
  export const ELK = FourCC("n001");
  export const SNAKE = FourCC("n002");
  export const JUNGLE_WOLF = FourCC("n003");
  export const JUNGLE_BEAR = FourCC("n004");
  export const PANTHER = FourCC("n005");
  export const FISH = FourCC("n006");
  export const GREEN_FISH = FourCC("n007");
  export const HAWK = FourCC("n008");

  // ─── Bosses ────────────────────────────────────────────────────────
  export const ALLIGATOR_MAN = FourCC("n010");
  export const ANCIENT_HYDRA = FourCC("n011");
  export const LESSER_HYDRA = FourCC("n012");
  export const MAMMOTH = FourCC("n013");
  export const DISCO_DUCK = FourCC("n014");
  export const THE_ONE = FourCC("n015");

  // ─── Buildings ─────────────────────────────────────────────────────
  export const FORGE = FourCC("h001");
  export const ARMORY = FourCC("h002");
  export const TANNERY = FourCC("h003");
  export const MIXING_POT = FourCC("h004");
  export const WORKSHOP = FourCC("h005");
  export const WITCH_DOCTOR_HUT = FourCC("h006");
  export const CRAFT_MASTER = FourCC("h00J");
  export const CAMP_FIRE = FourCC("h007");
  export const TENT = FourCC("h008");
  export const MUD_HUT = FourCC("h009");
  export const TROLL_HUT = FourCC("h00A");
  export const HATCHERY = FourCC("h00B");
  export const TELEPORT_BEACON = FourCC("h00C");
  export const ENSNARE_TRAP = FourCC("h00D");
  export const SPIRIT_WARD = FourCC("h00E");
  export const OMNI_TOWER = FourCC("h00F");
}
