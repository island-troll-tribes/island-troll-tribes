
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_first_ship_Actions2 takes nothing returns nothing
if AllowTrade then
    call createRandomShip2()
endif
call PauseUnit(udg_ship2,true)
endfunction

//===========================================================================
function InitTrig_first_ship_Copy takes nothing returns nothing
    set gg_trg_first_ship_Copy = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_first_ship_Copy, 2)
    call TriggerAddAction( gg_trg_first_ship_Copy, function Trig_first_ship_Actions2 )
endfunction

//===========================================================================
