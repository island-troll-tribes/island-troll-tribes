scope BeginConstruct initializer Init

private function Actions takes nothing returns nothing
    call SetUnitUserData( GetConstructingStructure(), 5 )
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_CONSTRUCT_START )
    call TriggerAddAction( t, function Actions )
endfunction

endscope
