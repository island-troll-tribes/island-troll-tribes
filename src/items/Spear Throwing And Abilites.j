
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
library SpearThrowsAndAbilities initializer onInit requires PublicLibrary, DUMMYLIB
    globals
        trigger theTrigger = CreateTrigger()
        Table dupPreventionTable
    endglobals

    function mapAbility takes integer id returns integer
        if id == 'A0CZ' then
            return 'A05S'
        elseif id == 'A0CY' then
            return  'A00Z'
        elseif id == 'A0CX' then
            return 'A00Y'
        elseif id == 'A0CW' then
            return 'A01P'
        elseif id == 'A0CV' then
            return 'A00X'
        elseif id == 'A0CU' then
            return 'A01Q'
        elseif id == 'A0CT' then
            return 'A00V'
        else
            return 0
        endif
    endfunction

    function mapOrder takes integer id returns string
        if id == 'A00Y' or id == 'A00Z' or id == 'A00X' then
            return "shadowstrike"
        else
            return "creepthunderbolt"
        endif
    endfunction

    private function tCond takes nothing returns boolean
        return mapAbility(GetSpellAbilityId()) != 0
    endfunction

    private function onDamage takes nothing returns nothing
        local item i
        local integer id
        local real x
        local real y

        if not SpearCastTable.has_h(GetEventDamageSource()) then
            return
        endif

        set id = SpearCastTable.integer_h[GetEventDamageSource()]
        set x = GetUnitX(GetTriggerUnit())
        set y = GetUnitY(GetTriggerUnit())

        call SpearCastTable.remove_h(GetEventDamageSource())

        if id=='A00V' and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_SPEAR, x, y)
        elseif id=='A01P' and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_IRON_SPEAR, x, y)
        elseif id=='A01Q' and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_STEEL_SPEAR, x, y)
        elseif id=='A05S' then
            if GetRandomInt(1,3) <= 2 then
                set i = CreateItem(ITEM_DARK_SPEAR, x, y)
            endif
            if GetRandomReal(0,100) <= 20 then
                call ManaBurn(GetTriggerUnit(), GetRandomReal(20,70))
            else
                call ManaBurn(GetTriggerUnit(), GetRandomReal(20,40))
            endif
        elseif id=='A00Y' and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_POISON_SPEAR, x, y)
        elseif id=='A00Z' and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_REFINED_POISON_SPEAR, x, y)
        elseif id=='A00X' and GetRandomInt(1,2) == 1then
            set i = CreateItem(ITEM_ULTRA_POISON_SPEAR, x, y)
        endif

        set i = null
    endfunction

    private function bindDamageListener takes nothing returns nothing
        local integer id = mapAbility(GetSpellAbilityId())
        local unit dummy = masterCastAtCaster(GetSpellAbilityUnit(), GetSpellTargetUnit(), 0, 0, id, mapOrder(id))
        set SpearCastTable.integer_h[dummy] = id
        if not dupPreventionTable.has_h(GetSpellTargetUnit()) then
            call TriggerRegisterUnitEvent(theTrigger, GetSpellTargetUnit(), EVENT_UNIT_DAMAGED)
            set dupPreventionTable.boolean_h[GetSpellTargetUnit()] = true
        endif
        set dummy = null
    endfunction

//===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerAddCondition( t, Condition( function tCond ) )
        call TriggerAddAction( t, function bindDamageListener )
        call TriggerAddAction( theTrigger, function onDamage )

        set SpearCastTable = Table.create()
        set dupPreventionTable = Table.create()
    endfunction

endlibrary
//===========================================================================
