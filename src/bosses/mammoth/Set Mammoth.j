
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_set_mammoth_Actions takes nothing returns nothing
    call SetDestructableInvulnerableBJ( mammothGate, true )
    set Mammoth = MAMMOTH
    call SetUnitOwner( Mammoth, Player(PLAYER_NEUTRAL_AGGRESSIVE), true )
endfunction

//===========================================================================
function InitTrig_set_mammoth takes nothing returns nothing
    set gg_trg_set_mammoth = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_set_mammoth, 10.00 )
    call TriggerAddAction( gg_trg_set_mammoth, function Trig_set_mammoth_Actions )
endfunction

//===========================================================================
