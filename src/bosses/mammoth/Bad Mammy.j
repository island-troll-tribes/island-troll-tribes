
//===========================================================================
function Trig_bad_mammy_Actions takes nothing returns nothing
    call SetUnitOwner( GetAttackedUnitBJ(), Player(PLAYER_NEUTRAL_AGGRESSIVE), true )
endfunction

//===========================================================================
function InitTrig_bad_mammy takes nothing returns nothing
    set gg_trg_bad_mammy = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_bad_mammy, MAMMOTH, EVENT_UNIT_ATTACKED )
    call TriggerAddAction( gg_trg_bad_mammy, function Trig_bad_mammy_Actions )
endfunction

//===========================================================================
