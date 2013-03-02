
//===========================================================================
//TESH.scrollpos=54
//TESH.alwaysfold=0
function Trig_ship_stop_generic_Conditions_II_Electric_Boogaloo takes nothing returns boolean
return GetEnteringUnit() == udg_ship2
endfunction

function FilterShip2 takes nothing returns boolean
    return GetFilterUnit() == udg_ship2
endfunction


function Trig_ship_stop_generic_Actions_II_Electric_Boogaloo takes nothing returns nothing
local real X = 0
local real Y = 0
local integer i = 0
local unit u = udg_ship2


loop
if (IsWidgetInRect(gg_rct_ship_stop_1, u)) then
    set X = GetRectCenterX(gg_rct_ship_make)
    set Y = GetRectCenterY(gg_rct_ship_make)
elseif (IsWidgetInRect(gg_rct_ship_stop_3_1,u)) then
    set X = GetRectCenterX(gg_rct_ship_fork_2)
    set Y = GetRectCenterY(gg_rct_ship_fork_2)
elseif (IsWidgetInRect(gg_rct_ship_stop_3_2,u)) then
    set X = GetRectCenterX(gg_rct_ship_stop_3_1)
    set Y = GetRectCenterY(gg_rct_ship_stop_3_1)
elseif (IsWidgetInRect(gg_rct_ship_stop_3_3,u)) then
    set X = GetRectCenterX(gg_rct_ship_stop_3_2)
    set Y = GetRectCenterY(gg_rct_ship_stop_3_2)
elseif (IsWidgetInRect(gg_rct_ship_stop_2,u)) then
    set X = GetRectCenterX(gg_rct_ship_stop_1)
    set Y = GetRectCenterY(gg_rct_ship_stop_1)
elseif (IsWidgetInRect(gg_rct_ship_stop_3,u)) then
    set X = GetRectCenterX(gg_rct_ship_stop_2)
    set Y = GetRectCenterY(gg_rct_ship_stop_2)
elseif (IsWidgetInRect(gg_rct_ship_fork_1,u)) then
    set i = GetRandomInt(1,2)
    if i == 1 then
        set X = GetRectCenterX(gg_rct_fork_1_stop)
        set Y = GetRectCenterY(gg_rct_fork_1_stop)
    else
        set X = GetRectCenterX(gg_rct_ship_stop_3)
        set Y = GetRectCenterY(gg_rct_ship_stop_3)
    endif
elseif (IsWidgetInRect(gg_rct_ship_fork_2,u)) then
    set i = GetRandomInt(1,2)
    if i == 1 then
        set X = GetRectCenterX(gg_rct_fork_2_stop)
        set Y = GetRectCenterY(gg_rct_fork_2_stop)
    else
        set X = GetRectCenterX(gg_rct_ship_stop_1_2)
        set Y = GetRectCenterY(gg_rct_ship_stop_1_2)
    endif
elseif (IsWidgetInRect(gg_rct_fork_1_stop,u)) then
    set X = GetRectCenterX(gg_rct_fork_1_gone)
    set Y = GetRectCenterY(gg_rct_fork_1_gone)
elseif (IsWidgetInRect(gg_rct_fork_2_stop,u)) then
    set X = GetRectCenterX(gg_rct_fork_2_gone)
    set Y = GetRectCenterY(gg_rct_fork_2_gone)
elseif (IsWidgetInRect(gg_rct_ship_stop_1_1,u)) then
    set X = GetRectCenterX(gg_rct_ship_fork_1)
    set Y = GetRectCenterY(gg_rct_ship_fork_1)
elseif (IsWidgetInRect(gg_rct_ship_stop_1_2,u)) then
    set X = GetRectCenterX(gg_rct_ship_stop_1_1)
    set Y = GetRectCenterY(gg_rct_ship_stop_1_1)
elseif (IsWidgetInRect(gg_rct_ship_make,u) or IsWidgetInRect(gg_rct_fork_1_gone,u) or IsWidgetInRect(gg_rct_fork_2_gone,u)) then
    set X = 1
    set Y = 1
elseif not (IsWidgetInRect(gg_rct_ship_make,u) or IsWidgetInRect(gg_rct_fork_1_gone,u) or IsWidgetInRect(gg_rct_fork_2_gone,u)) then
    debug call DisplayText(RED_COLOR+"ERROR:|r 1002")
endif
    exitwhen X != 0 and Y != 0
    call PolledWait(1)
endloop

if IsWidgetInRect(gg_rct_ship_make,u) or IsWidgetInRect(gg_rct_fork_1_gone,u) or IsWidgetInRect(gg_rct_fork_2_gone,u) then
    call PolledWait( 1.00 )
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,40,"S2: Done")
    call RemoveUnit( udg_ship2 )
    set udg_shipOn2 = false
    call ConditionalTriggerExecute( gg_trg_ship_make_2_Copy )
else
    //call DisplayText("stepped")
    call SaveReal(udg_GameHash, StringHash("ship2"), StringHash("X"), X)
    call SaveReal(udg_GameHash, StringHash("ship2"), StringHash("Y"), Y)
    set SHIP2_STOPPED = true
    call IssueImmediateOrder( udg_ship2, "stop")
    call TimerStart(t__boat2, 15, false, function ShipTimerStart2)
endif

set u = null
endfunction

globals
boolean SHIP2_STOPPED = false
endglobals

//
//===========================================================================
function InitTrig_ship_stop_generic_II_Electric_Boogaloo takes nothing returns nothing
local region REGION1 = CreateRegion()

    call RegionAddRect( REGION1, gg_rct_ship_stop_1 )
    call RegionAddRect( REGION1, gg_rct_ship_stop_3_1 )
    call RegionAddRect( REGION1, gg_rct_ship_stop_3_2 )
    call RegionAddRect( REGION1, gg_rct_ship_stop_3_3 )
    call RegionAddRect( REGION1, gg_rct_ship_stop_2 )
    call RegionAddRect( REGION1, gg_rct_ship_stop_3 )
    call RegionAddRect( REGION1, gg_rct_ship_fork_1 )
    //7
    call RegionAddRect( REGION1, gg_rct_ship_fork_2 )
    call RegionAddRect( REGION1, gg_rct_fork_1_stop )
    call RegionAddRect( REGION1, gg_rct_fork_2_stop )
    call RegionAddRect( REGION1, gg_rct_ship_stop_1_1 )
    call RegionAddRect( REGION1, gg_rct_ship_stop_1_2 )
    call RegionAddRect( REGION1, gg_rct_fork_1_gone )
    call RegionAddRect( REGION1, gg_rct_fork_2_gone )
    call RegionAddRect( REGION1, gg_rct_ship_make )
    //8
    
    set gg_trg_ship_stop_generic_II_Electric_Boogaloo = CreateTrigger(  )
    call TriggerRegisterEnterRegion(gg_trg_ship_stop_generic_II_Electric_Boogaloo, REGION1, Condition(function FilterShip2))
    //call TriggerAddCondition( gg_trg_ship_stop_generic_II_Electric_Boogaloo, Condition( function Trig_ship_stop_generic_Conditions_II_Electric_Boogaloo ) )
    call TriggerAddAction( gg_trg_ship_stop_generic_II_Electric_Boogaloo, function Trig_ship_stop_generic_Actions_II_Electric_Boogaloo )
endfunction

//===========================================================================
