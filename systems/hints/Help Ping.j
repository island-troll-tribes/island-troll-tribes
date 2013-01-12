
//
// For Help on building, refer to these shops or for some basics, the quest log. Shops on the left are from Classic Ice Trolls while the shops on the right are new stuff
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function BuildingTipPing takes nothing returns nothing
call DisplayTimedTextToPlayer(GetEnumPlayer(),0,0,15,GOLD_COLOR+"Hint: |r"+GENERAL_COLOR+"For help on building, refer to these shops or for some basics, the quest log. Shops on the left are from Classic Ice Trolls while the shops on the right are new stuff.|r")
endfunction

function Trig_help_ping_Actions takes nothing returns nothing
local real x = GetRectCenterX(gg_rct_vision)
local real y = GetRectCenterY(gg_rct_vision)
call ForForce(TIP_FORCE, function BuildingTipPing)
call PingMinimapForForceEx( TIP_FORCE, x, y, 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
call PolledWait( 1.00 )
call PingMinimapForForceEx( TIP_FORCE, x, y, 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
call PolledWait( 1.00 )
call PingMinimapForForceEx( TIP_FORCE, x, y, 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
endfunction

//===========================================================================
function InitTrig_help_ping takes nothing returns nothing
    set gg_trg_help_ping = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_help_ping, 60.00 )
    call TriggerAddAction( gg_trg_help_ping, function Trig_help_ping_Actions )
endfunction

//===========================================================================
