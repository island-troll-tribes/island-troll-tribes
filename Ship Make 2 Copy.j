
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ship_make_2_Copy_Conditions takes nothing returns boolean
    return not udg_shipOn2
endfunction

function Trig_ship_make_2_Copy_Actions takes nothing returns nothing
    call PolledWait( udg_NEXT_SHIP_INTERVAL ) // udg_NEXT_SHIP_INTERVAL is 0
    if AllowTrade then
        call createRandomShip2()
    endif
endfunction

//===========================================================================
function InitTrig_ship_make_2_Copy takes nothing returns nothing
    set gg_trg_ship_make_2_Copy = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ship_make_2_Copy, Condition( function Trig_ship_make_2_Copy_Conditions ) )
    call TriggerAddAction( gg_trg_ship_make_2_Copy, function Trig_ship_make_2_Copy_Actions )
endfunction

//===========================================================================
