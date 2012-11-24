
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ship_make_2_Conditions takes nothing returns boolean
    return not udg_shipOn
endfunction

function Trig_ship_make_2_Actions takes nothing returns nothing
    call PolledWait( udg_NEXT_SHIP_INTERVAL )
    if AllowTrade then
        call createRandomShip()
    endif
endfunction

//===========================================================================
function InitTrig_ship_make_2 takes nothing returns nothing
    set gg_trg_ship_make_2 = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ship_make_2, Condition( function Trig_ship_make_2_Conditions ) )
    call TriggerAddAction( gg_trg_ship_make_2, function Trig_ship_make_2_Actions )
endfunction

//===========================================================================
