
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
scope SpearThrowsAndAbilities initializer onInit

    private function tCond takes nothing returns boolean
        local integer i = GetSpellAbilityId()
        return i=='A00V' or i=='A01P' or i=='A01Q' or i=='A05S' or i=='A00Y' or i=='A00Z' or i=='A00X' or i=='A012' or i=='A013' or i=='A014'
    endfunction
    
    private function tActi takes nothing returns nothing
        local item i
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real r = 0
        if GetSpellAbilityId()=='A00V' and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_SPEAR, x, y)
        elseif GetSpellAbilityId()=='A01P' and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_IRON_SPEAR, x, y)
        elseif GetSpellAbilityId()=='A01Q' and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_STEEL_SPEAR, x, y)
        elseif GetSpellAbilityId()=='A05S' then
            if GetRandomInt(1,3) <= 2 then
                set i = CreateItem(ITEM_DARK_SPEAR, x, y)
            endif
            if GetRandomReal(0,100) <= 20 then
                set r = GetRandomReal(20,70)
                call ManaBurn(GetSpellTargetUnit(), r)
            else
                set r = GetRandomReal(20,40)
                call ManaBurn(GetSpellTargetUnit(), r)
            endif
        elseif GetSpellAbilityId()=='A00Y' and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_POISON_SPEAR, x, y)
        elseif GetSpellAbilityId()=='A00Z' and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_REFINED_POISON_SPEAR, x, y)
        elseif GetSpellAbilityId()=='A00X' and GetRandomInt(1,2) == 1then
            set i = CreateItem(ITEM_ULTRA_POISON_SPEAR, x, y)
        elseif GetSpellAbilityId()=='A012' then
            call SetUnitLifePercentBJ(GetSpellAbilityUnit(),100)
        elseif GetSpellAbilityId()=='A013' then
            call SetUnitManaPercentBJ(GetSpellAbilityUnit(),100)
        elseif GetSpellAbilityId()=='A014' then
            call SetPlayerStateBJ(GetOwningPlayer(GetSpellAbilityUnit()),PLAYER_STATE_RESOURCE_GOLD,udg_MAX_HEAT)
        endif
        set i = null
    endfunction

//===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerAddCondition( t, Condition( function tCond ) )
        call TriggerAddAction( t, function tActi )
    endfunction

endscope
//===========================================================================
