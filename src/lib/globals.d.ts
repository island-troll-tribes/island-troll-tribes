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
