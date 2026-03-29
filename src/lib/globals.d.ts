/**
 * WC3 Global Declarations - Ambient types for WC3 Lua globals
 * that aren't covered by w3ts type definitions.
 */

/** WC3 Lua print function (displays text to all players) */
declare function print(msg: string): void;

/** Get the main game timer elapsed time in seconds */
declare function GetGameTimer(): timer;

/** Timer elapsed time */
declare function TimerGetElapsed(t: timer): number;

/** Random number generators */
declare function GetRandomInt(lowBound: number, highBound: number): number;
declare function GetRandomReal(lowBound: number, highBound: number): number;

/** Item creation */
declare function CreateItem(itemId: number, x: number, y: number): item;

/** Unit creation */
declare function CreateUnit(owner: player, unitId: number, x: number, y: number, facing: number): unit;

/** Player references */
declare function Player(index: number): player;

/** Rectangle bounds */
declare function GetRectMinX(r: rect): number;
declare function GetRectMaxX(r: rect): number;
declare function GetRectMinY(r: rect): number;
declare function GetRectMaxY(r: rect): number;
