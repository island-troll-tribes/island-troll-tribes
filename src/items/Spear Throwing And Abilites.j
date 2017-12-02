
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
library SpearThrowsAndAbilities initializer onInit requires PublicLibrary, DUMMYLIB, TimerUtils
    globals
        trigger theTrigger = CreateTrigger()
        Table dupPreventionTable
    endglobals

    struct SpearData
        unit target
        unit caster
        integer abilityId

        public static method create takes integer abilityId, unit target, unit caster returns thistype
            local thistype this = thistype.allocate()
            set this.abilityId = abilityId
            set this.target = target
            set this.caster = caster
            return this
        endmethod

        private method onDestroy takes nothing returns nothing
            set this.target = null
            set this.caster = null
        endmethod
    endstruct

    function mapAbility takes integer id returns integer
        if id == SPELL_DARK_SPEAR_CAST then
            return SPELL_DARK_SPEAR
        elseif id == SPELL_RPOISON_SPEAR_CAST then
            return SPELL_RPOISON_SPEAR
        elseif id == SPELL_POISON_SPEAR_CAST then
            return SPELL_POISON_SPEAR
        elseif id == SPELL_IRON_SPEAR_CAST then
            return SPELL_IRON_SPEAR
        elseif id == SPELL_UPOISON_SPEAR_CAST then
            return SPELL_UPOISON_SPEAR
        elseif id == SPELL_STEEL_SPEAR_CAST then
            return SPELL_STEEL_SPEAR
        elseif id == SPELL_SPEAR_CAST then
            return SPELL_SPEAR
        else
            return 0
        endif
    endfunction

    function mapOrder takes integer id returns string
        if id == SPELL_POISON_SPEAR or id == SPELL_RPOISON_SPEAR or id == SPELL_UPOISON_SPEAR then
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

        if id==SPELL_SPEAR and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_SPEAR, x, y)
        elseif id==SPELL_IRON_SPEAR and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_IRON_SPEAR, x, y)
        elseif id==SPELL_STEEL_SPEAR and GetRandomInt(1,3) <= 2 then
            set i = CreateItem(ITEM_STEEL_SPEAR, x, y)
        elseif id==SPELL_DARK_SPEAR then
            if GetRandomInt(1,3) <= 2 then
                set i = CreateItem(ITEM_DARK_SPEAR, x, y)
            endif
            if GetRandomReal(0,100) <= 20 then
                call ManaBurn(GetTriggerUnit(), GetRandomReal(20,70))
            else
                call ManaBurn(GetTriggerUnit(), GetRandomReal(20,40))
            endif
        elseif id==SPELL_POISON_SPEAR and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_POISON_SPEAR, x, y)
        elseif id==SPELL_RPOISON_SPEAR and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_REFINED_POISON_SPEAR, x, y)
        elseif id==SPELL_UPOISON_SPEAR and GetRandomInt(1,2) == 1then
            set i = CreateItem(ITEM_ULTRA_POISON_SPEAR, x, y)
        endif

        set i = null
    endfunction

    private function bindDamageListener takes nothing returns nothing
        local integer id
        local unit dummy
        local SpearData data = GetTimerData(GetExpiredTimer())
        call ReleaseTimer(GetExpiredTimer())
        // if GetUnitAbilityLevel(data.target, BUFF_SPEAR_INCOMING) == 0 then
        //    // they blocked the spell
        //    return
        // endif
        call UnitRemoveAbility(data.target, BUFF_SPEAR_INCOMING)
        set id = mapAbility(data.abilityId)
        set dummy = masterCastAtCaster(data.caster, data.target, 0, 0, id, mapOrder(id))
        set SpearCastTable.integer_h[dummy] = id
        if not dupPreventionTable.has_h(data.target) then
            call TriggerRegisterUnitEvent(theTrigger, data.target, EVENT_UNIT_DAMAGED)
            set dupPreventionTable.boolean_h[data.target] = true
        endif
        set dummy = null
        call data.destroy()
    endfunction

    private function onTimeoutBindDamageListener takes nothing returns nothing
        local SpearData data = SpearData.create(GetSpellAbilityId(), GetSpellTargetUnit(), GetSpellAbilityUnit())
        call TimerStart(NewTimerEx(data), 0.01, false, function bindDamageListener)
    endfunction

//===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerAddCondition( t, Condition( function tCond ) )
        call TriggerAddAction( t, function onTimeoutBindDamageListener )
        call TriggerAddAction( theTrigger, function onDamage )

        set SpearCastTable = Table.create()
        set dupPreventionTable = Table.create()
    endfunction

endlibrary
//===========================================================================
