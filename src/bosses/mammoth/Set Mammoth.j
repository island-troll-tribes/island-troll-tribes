
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_set_mammoth_Actions takes nothing returns nothing
    call SetDestructableInvulnerableBJ( gg_dest_ZTsx_3140, true )
    set Mammoth = MAMMOTH
    call SetUnitOwner( Mammoth, Player(12), true )
endfunction

//===========================================================================
function InitTrig_set_mammoth takes nothing returns nothing
    set gg_trg_set_mammoth = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_set_mammoth, 10.00 )
    call TriggerAddAction( gg_trg_set_mammoth, function Trig_set_mammoth_Actions )
endfunction

//===========================================================================
