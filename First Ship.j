
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_first_ship_Actions takes nothing returns nothing
if AllowTrade then
    call createRandomShip()
endif
call PauseUnit(udg_ship,true)
endfunction

//===========================================================================
function InitTrig_first_ship takes nothing returns nothing
    set gg_trg_first_ship = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_first_ship, 2)
    call TriggerAddAction( gg_trg_first_ship, function Trig_first_ship_Actions )
endfunction

//===========================================================================
