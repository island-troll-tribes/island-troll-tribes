
//===========================================================================
function Trig_Begin_Construct_Actions takes nothing returns nothing
    call SetUnitUserData( GetConstructingStructure(), 5 )
endfunction

//===========================================================================
function InitTrig_Begin_Construct takes nothing returns nothing
    set gg_trg_Begin_Construct = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Begin_Construct, EVENT_PLAYER_UNIT_CONSTRUCT_START )
    call TriggerAddAction( gg_trg_Begin_Construct, function Trig_Begin_Construct_Actions )
endfunction

//===========================================================================
