

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

    private function tCond takes nothing returns boolean
        local integer id = GetSpellAbilityId()
        return id == SPELL_DARK_SPEAR or id == SPELL_RPOISON_SPEAR or id == SPELL_POISON_SPEAR or id == SPELL_IRON_SPEAR or id == SPELL_UPOISON_SPEAR or id == SPELL_STEEL_SPEAR or id == SPELL_SPEAR
    endfunction

    private function spearResist takes unit u returns nothing
        call SetPlayerAbilityAvailableBJ( false, ABILITY_SPEAR_RESIST, GetOwningPlayer(u) )
        debug call DisplayTextToForce( GetPlayersAll(), GetUnitName(u) )
        if(GetUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u) == 0) then
            call UnitAddAbilityBJ(ABILITY_SPEAR_RESIST, u)
            debug call DisplayTextToForce( GetPlayersAll(), "Spear resistance added " + I2S(GetUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u)))
        elseif(GetUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u) < 6 and GetUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u) != 0) then
            call IncUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u)
            debug call DisplayTextToForce( GetPlayersAll(), "Spear resistance upgraded to " + I2S(GetUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u)))
        endif
        call PolledWait(1.00)
        if(GetUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u) > 1) then
            call DecUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u)
            debug call DisplayTextToForce( GetPlayersAll(), "Spear resistance degraded to " + I2S(GetUnitAbilityLevelSwapped(ABILITY_SPEAR_RESIST, u)) + " for " + GetUnitName(u))
        else
            call UnitRemoveAbilityBJ(ABILITY_SPEAR_RESIST, u)
            debug call DisplayTextToForce( GetPlayersAll(), "Spear resistance removed for " + GetUnitName(u))
        endif
    endfunction

    private function onDamage takes nothing returns nothing
        local item i
        local integer id
        local real x
        local real y
        local SpearData data

        if not SpearCastTable.has_h(GetEventDamageSource()) then
            return
        endif

        set data = SpearData(SpearCastTable.integer_h[GetEventDamageSource()])
        set id = data.abilityId
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
            if GetRandomReal(0, 1) <= 0.4 then
                set i = CreateItem(ITEM_DARK_SPEAR, x, y)
            endif
            call ManaBurn(GetTriggerUnit(), GetRandomReal(40,60))
        elseif id==SPELL_POISON_SPEAR and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_POISON_SPEAR, x, y)
        elseif id==SPELL_RPOISON_SPEAR and GetRandomInt(1,2) == 1 then
            set i = CreateItem(ITEM_REFINED_POISON_SPEAR, x, y)
        elseif id==SPELL_UPOISON_SPEAR and GetRandomInt(1,2) == 1then
            set i = CreateItem(ITEM_ULTRA_POISON_SPEAR, x, y)
        endif

        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true) then
          call spearResist(GetTriggerUnit())
        endif

        call data.destroy()

        set i = null
    endfunction

    private function bindDamageListener takes nothing returns nothing
        local integer id
        local unit dummy
        local SpearData data = GetTimerData(GetExpiredTimer())
        call ReleaseTimer(GetExpiredTimer())
        set dummy = masterCastAtCaster(data.caster, data.target, 0, 0, 'A0EH', "creepthunderbolt")
        set SpearCastTable.integer_h[dummy] = data
        if not dupPreventionTable.has_h(data.target) then
            call TriggerRegisterUnitEvent(theTrigger, data.target, EVENT_UNIT_DAMAGED)
            set dupPreventionTable.boolean_h[data.target] = true
        endif
        set dummy = null
    endfunction

    private function onTimeoutBindDamageListener takes nothing returns nothing
        local SpearData data = SpearData.create(GetSpellAbilityId(), GetSpellTargetUnit(), GetSpellAbilityUnit())
        call TimerStart(NewTimerEx(data), 0.001, false, function bindDamageListener)
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
