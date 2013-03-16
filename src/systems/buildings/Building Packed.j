
scope BuildingPacking initializer onInit
    // requires ID

    function PackBuilding takes nothing returns boolean
        if not (GetSpellAbilityId() == SPELL_PACK_BUILDING) then
            return false
        endif
        if GetUnitTypeId( GetTriggerUnit() ) == UNIT_FIRE then
            call RemoveUnit( GetTriggerUnit() )
            call CreateItem( ITEM_FIRE_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()) )
        elseif GetUnitTypeId( GetTriggerUnit() ) == UNIT_MAGE_FIRE then
            call RemoveUnit( GetTriggerUnit() )
            call CreateItem( UNIT_MAGE_FIRE, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()) )
        elseif GetUnitTypeId( GetTriggerUnit() ) == UNIT_TENT then
            call RemoveUnit( GetTriggerUnit() )
            call CreateItem( UNIT_TENT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()) )
        elseif GetUnitTypeId( GetTriggerUnit() ) == UNIT_MAGE_FIRE_SUMMONED then
            call RemoveUnit( GetTriggerUnit() )
        endif
        return false
    endfunction

    //===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_FINISH )
        call TriggerAddCondition( t, Condition( function PackBuilding ) )
    endfunction

endscope
