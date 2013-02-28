scope EndConstruct initializer Init

function Actions takes nothing returns nothing
    call SetUnitUserData( GetConstructedStructure(), 0 )
endfunction

//===========================================================================
function Init takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    call TriggerAddAction( t, function Actions )
endfunction

endscope
