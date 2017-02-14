
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
scope HornOfMammoth initializer onInit

    private function hornCondition takes nothing returns boolean
        local integer i = GetSpellAbilityId()
        return i=='A012' or i=='A013' or i=='A014'
    endfunction
    
    private function hornAction takes nothing returns nothing
       if GetSpellAbilityId()=='A012' then
            call SetUnitLifePercentBJ(GetSpellAbilityUnit(),100)
        elseif GetSpellAbilityId()=='A013' then
            call SetUnitManaPercentBJ(GetSpellAbilityUnit(),100)
        elseif GetSpellAbilityId()=='A014' then
            call SetPlayerStateBJ(GetOwningPlayer(GetSpellAbilityUnit()),PLAYER_STATE_RESOURCE_GOLD,udg_MAX_HEAT)
        endif
    endfunction

//===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerAddCondition( t, Condition( function hornCondition ) )
        call TriggerAddAction( t, function hornAction )
    endfunction

endscope
//===========================================================================
