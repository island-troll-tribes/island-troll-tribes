library ShapeshiftLevel initializer onInit requires ID
    private function conditions takes nothing returns boolean
        local integer unitTypeId = GetUnitTypeId(GetTriggerUnit())
        return unitTypeId == UNIT_SHAPESHIFTER_BEAR or unitTypeId == UNIT_SHAPESHIFTER_PANTHER or unitTypeId == UNIT_SHAPESHIFTER_TIGER
    endfunction

    private function actions takes nothing returns nothing
        call SetPlayerAbilityAvailableBJ(true, 'A0EI', GetOwningPlayer(GetTriggerUnit()))
        call SetPlayerAbilityAvailableBJ(true, 'A0EN', GetOwningPlayer(GetTriggerUnit()))
        call SetPlayerAbilityAvailableBJ(true, 'A0EO', GetOwningPlayer(GetTriggerUnit()))
    endfunction

    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_HERO_SKILL)
        call TriggerAddCondition(t, Condition( function conditions))
        call TriggerAddAction(t, function actions)
    endfunction
endlibrary
