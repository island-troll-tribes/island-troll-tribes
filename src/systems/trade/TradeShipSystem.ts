/**
 * TradeShipSystem - Trade ship spawning, routing, and merchant inventory.
 *
 * Ports TradeShipCoordinator.wurst, TradeShipSupervisor.wurst,
 * TradeShipStop.wurst, TradeShipInitializer.wurst, TradeShipList.wurst,
 * and Merchants.wurst.
 *
 * Trade ships spawn in pairs, travel predetermined routes across the map
 * with multiple stops, pause for a duration at each stop to allow trading,
 * then continue. When both ships in a pair complete their routes, the next
 * pair spawns.
 *
 * 6 ships total, each with unique merchant inventory, rotating in pairs.
 * Ships are owned by neutral_passive and have pathing disabled to prevent
 * player blocking exploits. A gold mine minimap icon tracks each ship.
 */

import { Unit, Timer, MapPlayer, Trigger, Rectangle } from "w3ts";
import { UnitTypeIds } from "../../data/UnitIds";
import { ItemIds } from "../../data/ItemIds";
import { GameConfig } from "../../config/GameConfig";

// ─── Constants ───────────────────────────────────────────────────────────

/** Time a ship pauses at each trading stop (seconds) */
const TRADE_SHIP_PAUSE_TIME = 10.0;

/** Range to detect that a ship has reached a stop waypoint */
const STOP_RANGE = 600.0;

/** Ship movement speed */
const SHIP_MOVE_SPEED = 120;

/** Position check interval for waypoint detection */
const POSITION_CHECK_INTERVAL = 1.0;

// ─── Types ───────────────────────────────────────────────────────────────

/** A waypoint along a trade route */
interface TradeStop {
  x: number;
  y: number;
  /** Whether to pause at this stop for trading */
  pauseForTrade: boolean;
}

/** A complete trade route (sequence of stops) */
interface TradeRoute {
  /** Display name for debug */
  name: string;
  /** Ordered waypoints */
  stops: TradeStop[];
}

/** Ship movement state */
const enum ShipState {
  Moving,
  Paused,
  Complete,
}

/** Definition of a merchant ship's inventory */
interface MerchantInventory {
  unitTypeId: number;
  items: number[];
}

/** Runtime state for an active ship */
interface ActiveShip {
  unit: Unit;
  route: TradeRoute;
  currentStopIndex: number;
  state: ShipState;
  pauseTimer: Timer | null;
  /** Minimap gold-mine dummy for tracking */
  minimapDummy: Unit | null;
}

// ─── Merchant Inventories ────────────────────────────────────────────────

/**
 * 6 trade ships with unique inventories.
 * Ship 1-2: Basic supplies and building kits
 * Ship 3-4: Intermediate combat scrolls and materials
 * Ship 5-6: Advanced weapons, armor, and scrolls
 */
const MERCHANT_SHIPS: MerchantInventory[] = [
  {
    // Ship 1: Basic supplies
    unitTypeId: UnitTypeIds.TRADE_SHIP_1,
    items: [
      ItemIds.CLAY_BALL, ItemIds.MAGIC, ItemIds.SPEAR,
      ItemIds.TINDER, ItemIds.FLINT, ItemIds.STONE,
      ItemIds.CAMP_FIRE_KIT, ItemIds.TENT_KIT,
    ],
  },
  {
    // Ship 2: Intermediate building/crafting
    unitTypeId: UnitTypeIds.TRADE_SHIP_2,
    items: [
      ItemIds.MUD_HUT_KIT, ItemIds.FLINT, ItemIds.FORGE_KIT,
      ItemIds.WORKSHOP_KIT, ItemIds.TANNERY_KIT, ItemIds.IRON_INGOT,
      ItemIds.MAGIC, ItemIds.STICK,
    ],
  },
  {
    // Ship 3: Combat scrolls and potions
    unitTypeId: UnitTypeIds.TRADE_SHIP_3,
    items: [
      ItemIds.SCROLL_FIREBALL, ItemIds.SCROLL_LIVING_DEAD,
      ItemIds.SCROLL_STONE_ARMOR, ItemIds.SCROLL_HASTE,
      ItemIds.HEALING_POTION, ItemIds.MANA_POTION,
    ],
  },
  {
    // Ship 4: Armory supplies and scrolls
    unitTypeId: UnitTypeIds.TRADE_SHIP_4,
    items: [
      ItemIds.ARMORY_KIT, ItemIds.TANNERY_KIT,
      ItemIds.SCROLL_CYCLONE, ItemIds.SCROLL_ENTANGLING_ROOTS,
      ItemIds.STEEL_INGOT, ItemIds.HEALING_POTION,
    ],
  },
  {
    // Ship 5: Advanced scrolls and poison
    unitTypeId: UnitTypeIds.TRADE_SHIP_5,
    items: [
      ItemIds.SCROLL_LIVING_DEAD, ItemIds.SCROLL_STONE_ARMOR,
      ItemIds.SCROLL_ENTANGLING_ROOTS, ItemIds.SCROLL_CYCLONE,
      ItemIds.POISON, ItemIds.IRON_SPEAR,
    ],
  },
  {
    // Ship 6: Endgame gear
    unitTypeId: UnitTypeIds.TRADE_SHIP_6,
    items: [
      ItemIds.STEEL_SPEAR, ItemIds.STEEL_AXE,
      ItemIds.STEEL_BOOTS, ItemIds.STEEL_GLOVES,
      ItemIds.EMP, ItemIds.ULTRA_POISON,
    ],
  },
];

// ─── Trade Routes ────────────────────────────────────────────────────────

/**
 * Trade routes extracted from base.w3x region data (gg_rct_ship_*).
 * O = origin (spawn), numbered stops along the route.
 */
const TRADE_ROUTES: TradeRoute[] = [
  {
    // Top origin → through TL stops → through center → through BL stops → Bottom origin
    name: "Top-to-Bottom Left",
    stops: [
      { x: -848, y: 11184, pauseForTrade: false },     // ship TO (origin)
      { x: -448, y: 6432, pauseForTrade: true },        // ship T 1
      { x: -272, y: 4720, pauseForTrade: true },        // ship T 2
      { x: 80, y: 3616, pauseForTrade: true },          // ship T 3
      { x: -160, y: 2944, pauseForTrade: true },        // ship TL 4
      { x: -752, y: 2672, pauseForTrade: true },        // ship TL 3
      { x: -1536, y: 2368, pauseForTrade: true },       // ship TL 2
      { x: -2576, y: 1632, pauseForTrade: true },       // ship TL 1
      { x: -4080, y: 112, pauseForTrade: true },        // ship BL 6
      { x: -3056, y: -1616, pauseForTrade: true },      // ship BL 5
      { x: -2064, y: -2224, pauseForTrade: true },      // ship BL 4
      { x: -1792, y: -2720, pauseForTrade: true },      // ship BL 3
      { x: -1648, y: -3408, pauseForTrade: true },      // ship BL 2
      { x: 80, y: -4080, pauseForTrade: true },         // ship BL 1
      { x: 240, y: -5440, pauseForTrade: true },        // ship B 1
      { x: -112, y: -11856, pauseForTrade: false },     // ship BO (exit)
    ],
  },
  {
    // Bottom origin → through BR stops → through center → through TR stops → Top origin
    name: "Bottom-to-Top Right",
    stops: [
      { x: -112, y: -11856, pauseForTrade: false },     // ship BO (origin)
      { x: 240, y: -5440, pauseForTrade: true },        // ship B 1
      { x: 1152, y: -4096, pauseForTrade: true },       // ship BR 3
      { x: 1024, y: -3072, pauseForTrade: true },       // ship BR 2
      { x: 3280, y: -1968, pauseForTrade: true },       // ship BR 1
      { x: 3776, y: 1600, pauseForTrade: true },        // ship TR 3
      { x: 2672, y: 2576, pauseForTrade: true },        // ship TR 2
      { x: 1296, y: 2800, pauseForTrade: true },        // ship TR 1
      { x: 80, y: 3616, pauseForTrade: true },          // ship T 3
      { x: -272, y: 4720, pauseForTrade: true },        // ship T 2
      { x: -448, y: 6432, pauseForTrade: true },        // ship T 1
      { x: -848, y: 11184, pauseForTrade: false },      // ship TO (exit)
    ],
  },
  {
    // Left origin → through L stops → through center → through R stops → Right origin
    name: "Left-to-Right",
    stops: [
      { x: -12464, y: 896, pauseForTrade: false },      // ship LO (origin)
      { x: -8080, y: 880, pauseForTrade: true },        // ship L 1
      { x: -6112, y: 288, pauseForTrade: true },        // ship L 2
      { x: -4112, y: 336, pauseForTrade: true },        // ship L 3
      { x: 3712, y: -576, pauseForTrade: true },        // ship R 2
      { x: 6800, y: -192, pauseForTrade: true },        // ship R 1
      { x: 11264, y: -720, pauseForTrade: false },      // ship RO (exit)
    ],
  },
  {
    // Right origin → through R stops → through center → through L stops → Left origin
    name: "Right-to-Left",
    stops: [
      { x: 11264, y: -720, pauseForTrade: false },      // ship RO (origin)
      { x: 6800, y: -192, pauseForTrade: true },        // ship R 1
      { x: 3712, y: -576, pauseForTrade: true },        // ship R 2
      { x: -4112, y: 336, pauseForTrade: true },        // ship L 3
      { x: -6112, y: 288, pauseForTrade: true },        // ship L 2
      { x: -8080, y: 880, pauseForTrade: true },        // ship L 1
      { x: -12464, y: 896, pauseForTrade: false },      // ship LO (exit)
    ],
  },
];

// ─── TradeShipSystem ─────────────────────────────────────────────────────

export class TradeShipSystem {
  private static instance: TradeShipSystem;

  /** Ships rotate through indices 0-5, two at a time */
  private shipRotation: number[] = [0, 1, 2, 3, 4, 5];
  private rotationIndex = 0;

  /** Currently active ship pair */
  private activeShips: ActiveShip[] = [];

  /** Movement/waypoint check timer */
  private moveTimer: Timer | null = null;

  /** Whether the system is enabled */
  private enabled = false;

  private constructor() {}

  static getInstance(): TradeShipSystem {
    if (!TradeShipSystem.instance) {
      TradeShipSystem.instance = new TradeShipSystem();
    }
    return TradeShipSystem.instance;
  }

  /** Start the trade ship cycle */
  start(): void {
    const config = GameConfig.getInstance();
    if (!config.TRADE_ENABLED) return;

    this.enabled = true;

    // Randomize initial route direction (N/S vs E/W)
    if (Math.random() < 0.5) {
      // Swap first two route pairs
      this.shipRotation = [2, 3, 0, 1, 4, 5];
    }

    // Spawn first pair after a short delay
    const startTimer = new Timer();
    startTimer.start(30.0, false, () => {
      startTimer.destroy();
      this.spawnNextPair();
    });

    // Start position check timer
    this.moveTimer = new Timer();
    this.moveTimer.start(POSITION_CHECK_INTERVAL, true, () => this.updateShips());
  }

  /** Spawn the next pair of trade ships */
  private spawnNextPair(): void {
    if (!this.enabled) return;

    // Get the two merchant ship indices for this rotation
    const idx1 = this.shipRotation[this.rotationIndex % this.shipRotation.length];
    const idx2 = this.shipRotation[(this.rotationIndex + 1) % this.shipRotation.length];
    this.rotationIndex = (this.rotationIndex + 2) % this.shipRotation.length;

    // Get paired routes (0+1 or 2+3, cycling)
    const routeIdx1 = (this.rotationIndex) % TRADE_ROUTES.length;
    const routeIdx2 = (routeIdx1 + 1) % TRADE_ROUTES.length;

    this.spawnShip(MERCHANT_SHIPS[idx1], TRADE_ROUTES[routeIdx1]);
    this.spawnShip(MERCHANT_SHIPS[idx2], TRADE_ROUTES[routeIdx2]);
  }

  /** Spawn a single trade ship on a route */
  private spawnShip(merchant: MerchantInventory, route: TradeRoute): void {
    const startStop = route.stops[0];
    const neutralPassive = MapPlayer.fromIndex(PLAYER_NEUTRAL_PASSIVE)!;

    const ship = Unit.create(
      neutralPassive,
      merchant.unitTypeId,
      startStop.x,
      startStop.y,
      0
    );

    if (!ship) return;

    // Configure ship
    ship.moveSpeed = SHIP_MOVE_SPEED;
    ship.setPathing(false); // Prevent player blocking

    // Add merchant items to ship inventory
    for (const itemId of merchant.items) {
      ship.addItemById(itemId);
    }

    // Create minimap tracking dummy
    // TODO: Create gold mine dummy for minimap visibility
    // const dummy = Unit.create(neutralPassive, UnitTypeIds.DUMMY_GOLD_MINE, startStop.x, startStop.y, 0);

    const activeShip: ActiveShip = {
      unit: ship,
      route,
      currentStopIndex: 0,
      state: ShipState.Moving,
      pauseTimer: null,
      minimapDummy: null,
    };

    this.activeShips.push(activeShip);

    // Issue move order to first waypoint
    this.moveToNextStop(activeShip);
  }

  /** Order a ship to move to its next stop */
  private moveToNextStop(ship: ActiveShip): void {
    ship.currentStopIndex++;

    if (ship.currentStopIndex >= ship.route.stops.length) {
      // Route complete
      ship.state = ShipState.Complete;
      this.onShipComplete(ship);
      return;
    }

    ship.state = ShipState.Moving;
    const nextStop = ship.route.stops[ship.currentStopIndex];
    ship.unit.issueOrderAt("move", nextStop.x, nextStop.y);
  }

  /** Periodic update: check if ships have reached their waypoints */
  private updateShips(): void {
    for (const ship of this.activeShips) {
      if (ship.state !== ShipState.Moving) continue;

      const target = ship.route.stops[ship.currentStopIndex];
      const dx = ship.unit.x - target.x;
      const dy = ship.unit.y - target.y;
      const dist = Math.sqrt(dx * dx + dy * dy);

      if (dist <= STOP_RANGE) {
        if (target.pauseForTrade) {
          // Pause at this stop
          ship.state = ShipState.Paused;
          ship.unit.issueImmediateOrder("stop");

          ship.pauseTimer = new Timer();
          ship.pauseTimer.start(TRADE_SHIP_PAUSE_TIME, false, () => {
            if (ship.pauseTimer) {
              ship.pauseTimer.destroy();
              ship.pauseTimer = null;
            }
            this.moveToNextStop(ship);
          });
        } else {
          // Pass through without stopping
          this.moveToNextStop(ship);
        }
      }

      // Update minimap dummy position
      if (ship.minimapDummy) {
        ship.minimapDummy.x = ship.unit.x;
        ship.minimapDummy.y = ship.unit.y;
      }
    }
  }

  /** Called when a ship completes its route */
  private onShipComplete(ship: ActiveShip): void {
    // Clean up
    if (ship.minimapDummy) {
      ship.minimapDummy.destroy();
      ship.minimapDummy = null;
    }
    ship.unit.destroy();

    // Remove from active list
    const idx = this.activeShips.indexOf(ship);
    if (idx >= 0) {
      this.activeShips.splice(idx, 1);
    }

    // If both ships in the pair are done, spawn the next pair
    const pairDone = this.activeShips.length === 0;
    if (pairDone) {
      // Delay before next pair
      const delayTimer = new Timer();
      delayTimer.start(60.0, false, () => {
        delayTimer.destroy();
        this.spawnNextPair();
      });
    }
  }

  /** Disable the trade ship system */
  stop(): void {
    this.enabled = false;

    if (this.moveTimer) {
      this.moveTimer.destroy();
      this.moveTimer = null;
    }

    for (const ship of this.activeShips) {
      if (ship.pauseTimer) {
        ship.pauseTimer.destroy();
      }
      if (ship.minimapDummy) {
        ship.minimapDummy.destroy();
      }
      ship.unit.destroy();
    }
    this.activeShips = [];
  }
}
