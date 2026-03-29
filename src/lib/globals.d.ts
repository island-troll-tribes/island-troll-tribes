/**
 * WC3 Global Declarations - Ambient types for WC3 Lua globals
 * that aren't covered by w3ts type definitions.
 *
 * These are JASS native functions available in WC3's Lua environment.
 * WC3 provides them at runtime; we declare them here for type safety.
 */

// ─── Timer ─────────────────────────────────────────────────────────────
declare function GetGameTimer(): timer;
declare function TimerGetElapsed(t: timer): number;

// ─── Random ────────────────────────────────────────────────────────────
declare function GetRandomInt(lowBound: number, highBound: number): number;
declare function GetRandomReal(lowBound: number, highBound: number): number;

// ─── Item ──────────────────────────────────────────────────────────────
declare function CreateItem(itemId: number, x: number, y: number): item;
declare function GetItemTypeId(whichItem: item): number;
declare function RemoveItem(whichItem: item): void;
declare function UnitItemInSlot(whichUnit: unit, itemSlot: number): item;
declare function GetEnumItem(): item;
declare function EnumItemsInRect(r: rect, filter: boolexpr | null, actionFunc: () => void): void;

// ─── Unit creation / queries ───────────────────────────────────────────
declare function CreateUnit(owner: player, unitId: number, x: number, y: number, facing: number): unit;
declare function GetUnitTypeId(whichUnit: unit): number;
declare function GetUnitX(whichUnit: unit): number;
declare function GetUnitY(whichUnit: unit): number;
declare function GetUnitAbilityLevel(whichUnit: unit, abilcode: number): number;
declare function IsUnitType(whichUnit: unit, whichUnitType: unittype): boolean;
declare function IsUnitAlly(whichUnit: unit, whichPlayer: player): boolean;
declare function IsUnitEnemy(whichUnit: unit, whichPlayer: player): boolean;
declare function UnitAlive(whichUnit: unit): boolean;
declare function SetHeroLevel(whichHero: unit, level: number, showEyeCandy: boolean): void;
declare function UnitDamageTarget(whichUnit: unit, target: widget, amount: number, attack: boolean, ranged: boolean, attackType: attacktype, damageType: damagetype, weaponType: weapontype): boolean;
declare function UnitRemoveBuffs(whichUnit: unit, removePositive: boolean, removeNegative: boolean): void;

// ─── Group ─────────────────────────────────────────────────────────────
declare function CreateGroup(): group;
declare function DestroyGroup(whichGroup: group): void;
declare function GroupEnumUnitsInRange(whichGroup: group, x: number, y: number, radius: number, filter: boolexpr | null): void;
declare function GroupEnumUnitsInRect(whichGroup: group, r: rect, filter: boolexpr | null): void;
declare function ForGroup(whichGroup: group, callback: () => void): void;
declare function GetEnumUnit(): unit;

// ─── Player ────────────────────────────────────────────────────────────
declare function Player(index: number): player;
declare function GetLocalPlayer(): player;

// ─── Trigger event getters ─────────────────────────────────────────────
declare function GetSpellAbilityId(): number;
declare function GetSpellAbilityUnit(): unit;
declare function GetDyingUnit(): unit;
declare function GetKillingUnit(): unit;
declare function GetRevivingUnit(): unit;
declare function GetBuyingUnit(): unit;
declare function GetSoldUnit(): unit;
declare function GetEventPlayerChatString(): string;

// ─── Rectangle ─────────────────────────────────────────────────────────
declare function Rect(minX: number, minY: number, maxX: number, maxY: number): rect;
declare function RemoveRect(whichRect: rect): void;
declare function GetRectMinX(r: rect): number;
declare function GetRectMaxX(r: rect): number;
declare function GetRectMinY(r: rect): number;
declare function GetRectMaxY(r: rect): number;
declare function GetWorldBounds(): rect;

// ─── Effect ────────────────────────────────────────────────────────────
declare function AddSpecialEffect(modelName: string, x: number, y: number): effect;
declare function DestroyEffect(whichEffect: effect): void;

// ─── Destructable ──────────────────────────────────────────────────────
declare function EnumDestructablesInRect(r: rect, filter: boolexpr | null, actionFunc: () => void): void;
declare function GetEnumDestructable(): destructable;
declare function GetDestructableX(d: destructable): number;
declare function GetDestructableY(d: destructable): number;
declare function KillDestructable(d: destructable): void;

// ─── Camera ────────────────────────────────────────────────────────────
declare function PanCameraToTimed(x: number, y: number, duration: number): void;

// ─── UI ────────────────────────────────────────────────────────────────
declare function ForceUICancel(): void;

// ─── Time ──────────────────────────────────────────────────────────────
declare function GetTimeOfDay(): number;

// ─── Misc ──────────────────────────────────────────────────────────────
declare function print(msg: string): void;

// ─── WC3 Constants ─────────────────────────────────────────────────────
// These are provided by WC3 at runtime as global Lua variables.

declare const PLAYER_SLOT_STATE_PLAYING: playerslotstate;
declare const PLAYER_SLOT_STATE_EMPTY: playerslotstate;
declare const PLAYER_SLOT_STATE_LEFT: playerslotstate;
declare const MAP_CONTROL_USER: mapcontrol;
declare const MAP_CONTROL_COMPUTER: mapcontrol;

declare const EVENT_PLAYER_UNIT_DEATH: playerunitevent;
declare const EVENT_PLAYER_UNIT_SPELL_EFFECT: playerunitevent;
declare const EVENT_PLAYER_HERO_REVIVE_FINISH: playerunitevent;
declare const EVENT_PLAYER_UNIT_SELL: playerunitevent;
declare const EVENT_PLAYER_UNIT_SELL_ITEM: playerunitevent;

declare const UNIT_TYPE_HERO: unittype;
declare const UNIT_TYPE_STRUCTURE: unittype;
declare const UNIT_TYPE_DEAD: unittype;

declare const ATTACK_TYPE_NORMAL: attacktype;
declare const DAMAGE_TYPE_NORMAL: damagetype;
declare const WEAPON_TYPE_WHOKNOWS: weapontype;

declare const PLAYER_STATE_RESOURCE_GOLD: playerstate;
declare const PLAYER_STATE_RESOURCE_LUMBER: playerstate;

// ─── WC3 Handle types (opaque) ─────────────────────────────────────────
// These are declared by w3ts or TSTL's WC3 type system.
// If not already available, uncomment:
// declare type timer = object;
// declare type unit = object;
// declare type item = object;
// declare type player = object;
// declare type rect = object;
// declare type effect = object;
// declare type destructable = object;
// declare type widget = object;
// declare type group = object;
// declare type boolexpr = object;
// declare type playerslotstate = object;
// declare type mapcontrol = object;
// declare type playerunitevent = object;
// declare type unittype = object;
// declare type attacktype = object;
// declare type damagetype = object;
// declare type weapontype = object;
// declare type playerstate = object;
