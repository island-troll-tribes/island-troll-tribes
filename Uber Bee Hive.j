
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_uber_bee_hive_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetEnteringUnit()) == UNIT_UBER_HIVE
endfunction

function Trig_uber_bee_hive_Actions takes nothing returns nothing
local unit u = GetEnteringUnit()
loop
    exitwhen GetUnitState(u, UNIT_STATE_LIFE) <= 0
    if GetUnitState(u, UNIT_STATE_LIFE) > 0 then
        call masterCastAtTarget(u, u, 400, 400, 'A02C', "summonfactory")
        call PolledWait(10.00)
    endif
endloop
set u = null
endfunction

//===========================================================================
function InitTrig_uber_bee_hive takes nothing returns nothing
    set gg_trg_uber_bee_hive = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_uber_bee_hive, bj_mapInitialPlayableArea)
    call TriggerAddCondition( gg_trg_uber_bee_hive, Condition( function Trig_uber_bee_hive_Conditions ) )
    call TriggerAddAction( gg_trg_uber_bee_hive, function Trig_uber_bee_hive_Actions )
endfunction

//===========================================================================
