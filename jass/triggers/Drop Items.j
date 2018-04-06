scope DropItems initializer Init

private function Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06P'
endfunction

private function Actions takes nothing returns nothing
    local integer i = 0
    local integer s = UnitInventorySize(GetSpellAbilityUnit())
    loop
        exitwhen i > s
        call UnitRemoveItem(GetSpellAbilityUnit(), UnitItemInSlot(GetSpellAbilityUnit(), i))
        set i = i + 1
    endloop
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( t, Condition( function Conditions ) )
    call TriggerAddAction( t, function Actions )
endfunction

endscope
