
//===========================================================================
//TESH.scrollpos=51
//TESH.alwaysfold=0
function Trig_ship_stop_generic_Conditions takes nothing returns boolean
    return GetEnteringUnit() == udg_ship
endfunction

function FilterShip1 takes nothing returns boolean
    return GetFilterUnit() == udg_ship
endfunction

function Trig_ship_stop_generic_Actions takes nothing returns nothing
    local real X = 0
    local real Y = 0
    local integer i = 0
    local unit u = udg_ship
    
loop
    if (IsWidgetInRect(gg_rct_ship_stop_1, u)) then
        set X = GetRectCenterX(gg_rct_ship_stop_2)
        set Y = GetRectCenterY(gg_rct_ship_stop_2)
    elseif (IsWidgetInRect(gg_rct_ship_stop_3_1, u)) then
        set X = GetRectCenterX(gg_rct_ship_stop_3_2)
        set Y = GetRectCenterY(gg_rct_ship_stop_3_2)
    elseif (IsWidgetInRect(gg_rct_ship_stop_3_2, u)) then
        set X = GetRectCenterX(gg_rct_ship_stop_3_3)
        set Y = GetRectCenterY(gg_rct_ship_stop_3_3)
    elseif (IsWidgetInRect(gg_rct_ship_stop_3_3, u)) then
        set X = GetRectCenterX(gg_rct_ship_gone)
        set Y = GetRectCenterY(gg_rct_ship_gone)
    elseif (IsWidgetInRect(gg_rct_ship_stop_2, u)) then
        set X = GetRectCenterX(gg_rct_ship_stop_3)
        set Y = GetRectCenterY(gg_rct_ship_stop_3)
    elseif (IsWidgetInRect(gg_rct_ship_stop_3, u)) then
        set X = GetRectCenterX(gg_rct_ship_fork_1)
        set Y = GetRectCenterY(gg_rct_ship_fork_1)
    elseif (IsWidgetInRect(gg_rct_ship_fork_1,u)) then
        set i = GetRandomInt(1,2)
        if (i == 1) then
            set X = GetRectCenterX(gg_rct_fork_1_stop)
            set Y = GetRectCenterY(gg_rct_fork_1_stop)
        else
            set X = GetRectCenterX(gg_rct_ship_stop_1_1)
            set Y = GetRectCenterY(gg_rct_ship_stop_1_1)
        endif
    elseif (IsWidgetInRect(gg_rct_ship_fork_2,u)) then
        set i = GetRandomInt(1,2)
        if (i == 1) then
            set X = GetRectCenterX(gg_rct_fork_2_stop)
            set Y = GetRectCenterY(gg_rct_fork_2_stop)
        else
            set X = GetRectCenterX(gg_rct_ship_stop_3_1)
            set Y = GetRectCenterY(gg_rct_ship_stop_3_1)
        endif
    elseif (IsWidgetInRect(gg_rct_fork_1_stop,u)) then
        set X = GetRectCenterX(gg_rct_fork_1_gone)
        set Y = GetRectCenterY(gg_rct_fork_1_gone)
    elseif (IsWidgetInRect(gg_rct_fork_2_stop,u)) then        
        set X = GetRectCenterX(gg_rct_fork_2_gone)
        set Y = GetRectCenterY(gg_rct_fork_2_gone)
    elseif (IsWidgetInRect(gg_rct_ship_stop_1_1,u)) then
        set X = GetRectCenterX(gg_rct_ship_stop_1_2)
        set Y = GetRectCenterY(gg_rct_ship_stop_1_2)
    elseif (IsWidgetInRect(gg_rct_ship_stop_1_2,u)) then
        set X = GetRectCenterX(gg_rct_ship_fork_2)
        set Y = GetRectCenterY(gg_rct_ship_fork_2)
    elseif (IsWidgetInRect(gg_rct_ship_gone,u) or IsWidgetInRect(gg_rct_fork_1_gone,u) or IsWidgetInRect(gg_rct_fork_2_gone,u)) then
    set X = 1
    set Y = 1
    elseif not (IsWidgetInRect(gg_rct_ship_gone,u) or IsWidgetInRect(gg_rct_fork_1_gone,u) or IsWidgetInRect(gg_rct_fork_2_gone,u)) then
        debug call DisplayText(RED_COLOR+"ERROR:|r 1001")
    endif
    
    exitwhen X != 0 and Y != 0
    call PolledWait(1)
endloop
    
    //Need to Save X and Y as it's next X/Y
    //Ship hits its spot, XY is our next spot, so we wait SHIP_WAIT_TIME then go
    //can probably reuse previous trigger
    
if IsWidgetInRect(gg_rct_ship_gone,u) or IsWidgetInRect(gg_rct_fork_1_gone,u) or IsWidgetInRect(gg_rct_fork_2_gone,u) then
    call PolledWait( 1.00 )
    call RemoveUnit( udg_ship )
    set udg_shipOn = false
    call ConditionalTriggerExecute( gg_trg_ship_make_2 )
else
    call SaveReal(udg_GameHash, StringHash("ship"), StringHash("X"), X)
    call SaveReal(udg_GameHash, StringHash("ship"), StringHash("Y"), Y)
    set SHIP_STOPPED = true
    call IssueImmediateOrder( udg_ship, "stop")
    call TimerStart(t__boat1, 15, false, function shipTimerStart)
endif
set u = null
endfunction

globals
boolean SHIP_STOPPED = false
endglobals
//===========================================================================
function InitTrig_ship_stop_generic takes nothing returns nothing    
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
    call RegionAddRect( REGION1, gg_rct_ship_gone )
    //8
    
    set gg_trg_ship_stop_generic = CreateTrigger(  )
    call TriggerRegisterEnterRegion(gg_trg_ship_stop_generic, REGION1, Condition(function FilterShip1))
    //call TriggerAddCondition( gg_trg_ship_stop_generic, Condition( function Trig_ship_stop_generic_Conditions ) )
    call TriggerAddAction( gg_trg_ship_stop_generic, function Trig_ship_stop_generic_Actions )
endfunction

//===========================================================================
