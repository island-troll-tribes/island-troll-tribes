
//===========================================================================
function Trig_End_Construct_Actions takes nothing returns nothing
    call SetUnitUserData( GetConstructedStructure(), 0 )
endfunction

//===========================================================================
function InitTrig_End_Construct takes nothing returns nothing
    set gg_trg_End_Construct = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_End_Construct, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    call TriggerAddAction( gg_trg_End_Construct, function Trig_End_Construct_Actions )
endfunction

//===========================================================================
