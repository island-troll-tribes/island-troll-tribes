/**
 * MapRects - All map region rectangles extracted from war3map.j.
 *
 * These are created once during initialization and used by SpawnSystem,
 * TradeShipSystem, ForcedDuelSystem, and RespawnSystem.
 *
 * Coordinates are in WC3 world units: Rect(minX, minY, maxX, maxY).
 */

import { Rectangle } from "w3ts";

/** Lazy-initialized rect cache to avoid creating before map init */
let initialized = false;

// ─── Island Spawn Areas ────────────────────────────────────────────────
// Each island has 3 sub-regions with weighted selection

export const spawnArea1_1 = { minX: -9536, minY: 992, maxX: -4224, maxY: 9408, weight: 65 };
export const spawnArea1_2 = { minX: -4224, minY: 2976, maxX: -2336, maxY: 9024, weight: 22 };
export const spawnArea1_3 = { minX: -2368, minY: 3040, maxX: -960, maxY: 8736, weight: 13 };

export const spawnArea2_1 = { minX: 128, minY: 4256, maxX: 9184, maxY: 8832, weight: 66 };
export const spawnArea2_2 = { minX: 1376, minY: 3232, maxX: 8864, maxY: 4416, weight: 16 };
export const spawnArea2_3 = { minX: 5024, minY: 416, maxX: 8864, maxY: 3232, weight: 18 };

export const spawnArea3_1 = { minX: 4928, minY: -9344, maxX: 9088, maxY: -928, weight: 54 };
export const spawnArea3_2 = { minX: 736, minY: -9408, maxX: 2272, maxY: -5248, weight: 13 };
export const spawnArea3_3 = { minX: 2240, minY: -9248, maxX: 4928, maxY: -2944, weight: 33 };

export const spawnArea4_1 = { minX: -9472, minY: -9728, maxX: -352, maxY: 704, weight: 88 };
export const spawnArea4_2 = { minX: -160, minY: 704, maxX: 2880, maxY: 2688, weight: 7 };
export const spawnArea4_3 = { minX: 1632, minY: -1888, maxX: 3200, maxY: 704, weight: 8 };

// ─── Fish / Ocean Spawn Areas ──────────────────────────────────────────

export const fishRects = [
  { minX: -9632, minY: 2368, maxX: -9184, maxY: 4544 },   // fish_new_1
  { minX: -1280, minY: 8128, maxX: -32, maxY: 8928 },     // fish_new_2
  { minX: 8736, minY: -1312, maxX: 9344, maxY: -192 },    // fish_new_3
  { minX: -352, minY: -6368, maxX: 544, maxY: -5952 },    // fish_new_4
  { minX: -8864, minY: 6432, maxX: -8320, maxY: 6816 },   // fish_new_5
  { minX: 7680, minY: 1856, maxX: 8896, maxY: 2592 },     // fish_new_6
  { minX: 8480, minY: -9664, maxX: 9056, maxY: -8672 },   // fish_new_7
  { minX: -6176, minY: -9632, maxX: -5376, maxY: -9056 }, // fish_new_8
];

// Ocean/river rects (out_ prefix)
export const oceanRects = [
  { minX: -7040, minY: 160, maxX: -4160, maxY: 576 },     // out_1_1
  { minX: -3776, minY: 1856, maxX: -1888, maxY: 2208 },   // out_1_2
  { minX: -3648, minY: 1024, maxX: -3040, maxY: 1856 },   // out_2_1
  { minX: -1600, minY: 2016, maxX: -224, maxY: 2944 },    // out_2_2
  { minX: -1216, minY: 5216, maxX: -96, maxY: 6752 },     // out_3_1
  { minX: -416, minY: 3008, maxX: 704, maxY: 4352 },      // out_3_2
  { minX: 3552, minY: 704, maxX: 4384, maxY: 1984 },      // out_4_1
  { minX: 3296, minY: -2336, maxX: 3936, maxY: 96 },      // out_4_2
  { minX: -256, minY: -5664, maxX: 704, maxY: -4512 },    // out_5_2
  { minX: 512, minY: -4320, maxX: 1344, maxY: -3008 },    // our_5_1
];

// ─── Special Areas ─────────────────────────────────────────────────────

export const duelArena = { minX: -5792, minY: -12576, maxX: -2912, maxY: -11360 };
export const discoDuckSpawn = { minX: 224, minY: -288, maxX: 256, maxY: -256 };
export const rainArea = { minX: -1248, minY: -1760, maxX: 1408, maxY: 704 };

// ─── Revive / Tribe Spawn Points ───────────────────────────────────────

export const reviveRects = [
  { minX: -4160, minY: 5728, maxX: -3680, maxY: 6272 },   // revive_1  (NW)
  { minX: 5280, minY: -5376, maxX: 5856, maxY: -4960 },   // revive_2  (SE)
  { minX: 4544, minY: 1920, maxX: 5088, maxY: 2432 },     // revive_3  (NE)
  { minX: -5024, minY: -1120, maxX: -4448, maxY: -736 },  // revive_4  (SW)
  { minX: -992, minY: -2784, maxX: -416, maxY: -2400 },   // revive_5
  { minX: 576, minY: 4448, maxX: 1152, maxY: 4832 },      // revive_6
  { minX: -1888, minY: 896, maxX: -1312, maxY: 1280 },    // revive_7
  { minX: -2144, minY: -5408, maxX: -1568, maxY: -5024 }, // revive_8
  { minX: -5696, minY: -6176, maxX: -5120, maxY: -5792 }, // revive_9
  { minX: 6688, minY: -1952, maxX: 7264, maxY: -1568 },   // revive_10
  { minX: 6752, minY: 5184, maxX: 7328, maxY: 5568 },     // revive_11
  { minX: -7136, minY: 2208, maxX: -6560, maxY: 2592 },   // revive_12
];

// ─── Trade Ship Waypoints ──────────────────────────────────────────────

export const shipWaypoints = {
  // Left (West) route
  L: [
    { minX: -8128, minY: 832, maxX: -8032, maxY: 928 },
    { minX: -6176, minY: 224, maxX: -6048, maxY: 352 },
    { minX: -4160, minY: 288, maxX: -4064, maxY: 384 },
  ],
  LO: { minX: -12672, minY: 736, maxX: -12256, maxY: 1056 },

  // Right (East) route
  R: [
    { minX: 6752, minY: -256, maxX: 6848, maxY: -128 },
    { minX: 3648, minY: -640, maxX: 3776, maxY: -512 },
  ],
  RO: { minX: 11008, minY: -1024, maxX: 11520, maxY: -416 },

  // Top (North) route
  T: [
    { minX: -512, minY: 6368, maxX: -384, maxY: 6496 },
    { minX: -320, minY: 4672, maxX: -224, maxY: 4768 },
    { minX: 32, minY: 3552, maxX: 128, maxY: 3680 },
  ],
  TO: { minX: -1216, minY: 10880, maxX: -480, maxY: 11488 },

  // Bottom (South) route
  B: [{ minX: 192, minY: -5504, maxX: 288, maxY: -5376 }],
  BO: { minX: -448, minY: -12128, maxX: 224, maxY: -11584 },

  // Top-Left route
  TL: [
    { minX: -2656, minY: 1568, maxX: -2496, maxY: 1696 },
    { minX: -1600, minY: 2304, maxX: -1472, maxY: 2432 },
    { minX: -800, minY: 2624, maxX: -704, maxY: 2720 },
    { minX: -224, minY: 2880, maxX: -96, maxY: 3008 },
  ],

  // Top-Right route
  TR: [
    { minX: 1248, minY: 2752, maxX: 1344, maxY: 2848 },
    { minX: 2624, minY: 2528, maxX: 2720, maxY: 2624 },
    { minX: 3712, minY: 1536, maxX: 3840, maxY: 1664 },
  ],

  // Bottom-Left route
  BL: [
    { minX: 32, minY: -4128, maxX: 128, maxY: -4032 },
    { minX: -1696, minY: -3456, maxX: -1600, maxY: -3360 },
    { minX: -1856, minY: -2784, maxX: -1728, maxY: -2656 },
    { minX: -2112, minY: -2272, maxX: -2016, maxY: -2176 },
    { minX: -3104, minY: -1664, maxX: -3008, maxY: -1568 },
    { minX: -4128, minY: 64, maxX: -4032, maxY: 160 },
  ],

  // Bottom-Right route
  BR: [
    { minX: 3200, minY: -2048, maxX: 3360, maxY: -1888 },
    { minX: 960, minY: -3136, maxX: 1088, maxY: -3008 },
    { minX: 1120, minY: -4128, maxX: 1184, maxY: -4064 },
  ],
};

// ─── Helper: Create WC3 Rects ──────────────────────────────────────────

interface RectData {
  minX: number;
  minY: number;
  maxX: number;
  maxY: number;
}

/** Create a W3TS Rectangle from raw coordinates (call only after map init) */
export function createRect(r: RectData): Rectangle {
  return Rectangle.fromHandle(Rect(r.minX, r.minY, r.maxX, r.maxY))!;
}

/** Get center point of a rect */
export function rectCenter(r: RectData): { x: number; y: number } {
  return {
    x: (r.minX + r.maxX) / 2,
    y: (r.minY + r.maxY) / 2,
  };
}
