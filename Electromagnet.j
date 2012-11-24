
//
//     call PolledWait(.01)
//===========================================================================
//TESH.scrollpos=65
//TESH.alwaysfold=0
function Trig_electromagnet_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04N'
endfunction

function elecCheck2 takes nothing returns boolean
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true then
        return false
    elseif GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) <= 0 then
        return false
    elseif IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == true then
        return false
    elseif GetUnitTypeId(GetFilterUnit()) == UNIT_MAMMOTH then
        return false
    elseif GetUnitTypeId(GetFilterUnit()) == UNIT_DISCO_DUCK then
        return false
    endif
    return true
endfunction

function timerMagnetFunctions takes nothing returns nothing
local timer t = GetExpiredTimer()
local unit u = LoadUnitHandle(udg_GameHash,GetHandleId(t), StringHash("magnet"))
local group g = LoadGroupHandle(udg_GameHash,GetHandleId(t), StringHash("magnetgroup"))
local real tick = LoadReal(udg_GameHash,GetHandleId(t), StringHash("ticks"))
local unit a
local integer LIMIT = 0
local player p = GetOwningPlayer(u)

local real uX = GetUnitX(u)
local real uY = GetUnitY(u)

local real dx
local real dy
local real distance
local real angle
local real dist
local real x
local real y
set tick = tick + 1
if u == null or tick > 100 then
    call DestroyGroup(g)
    call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    call ReleaseTimer(t)
else
    call SaveReal(udg_GameHash,GetHandleId(t), StringHash("ticks"), tick)
    call GroupEnumUnitsInRange(g , GetUnitX(u), GetUnitY(u), 700, Condition(function elecCheck2))
    loop
        set a = FirstOfGroup(g)
        exitwhen a == null// or LIMIT > 20
        if IsUnitEnemy(a, p) then
            set dx = GetUnitX(a) - uX
            set dy = GetUnitY(a) - uY
            set distance = SquareRoot(dx * dx + dy * dy)
            set angle = Atan2(GetUnitY(a) - uY, GetUnitX(a) - uX)
            set dist = RMaxBJ(distance-RMinBJ(700/distance,4),80)
            set x = uX + dist * Cos(angle )
            set y = uY + dist * Sin(angle )
            // TerrrainPathable function doesnt work...
            //if IsTerrainPathable(x,y,PATHING_TYPE_WALKABILITY) == true then
                call SetUnitX(a,x)
                call SetUnitY(a,y)
            //endif
            set LIMIT = LIMIT + 1
        endif
        call GroupRemoveUnit(g,a)
    endloop
    set g = null
    set u = null
endif
set t = null
endfunction

function Trig_electromagnet_Actions takes nothing returns nothing
local unit u = GetSpellAbilityUnit()
local timer t = NewTimer()
local group g = CreateGroup()

call SaveUnitHandle(udg_GameHash,GetHandleId(t), StringHash("magnet"), u)
call SaveGroupHandle(udg_GameHash,GetHandleId(t), StringHash("magnetgroup"), g)
call SaveReal(udg_GameHash,GetHandleId(t), StringHash("ticks"), 0)
call TimerStart(t,0.02,true,function timerMagnetFunctions)

set t = null
set g = null
set u = null
endfunction

//===========================================================================
function InitTrig_electromagnet takes nothing returns nothing
    set gg_trg_electromagnet = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_electromagnet, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_electromagnet, Condition( function Trig_electromagnet_Conditions ) )
    call TriggerAddAction( gg_trg_electromagnet, function Trig_electromagnet_Actions )
endfunction

//===========================================================================
