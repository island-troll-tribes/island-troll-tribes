library EMP initializer onInit requires EnumTypeIsThing, PublicLibrary, ID
    globals
        real EMP_DURATION = 45.0
    endglobals

    function Trig_EMP_Conditions takes nothing returns boolean
        return GetSpellAbilityId() == 'A06N'
    endfunction

    function EMP_Filter takes nothing returns boolean
        return FilterUnitIsEnsnareTrap() or FilterUnitIsOmnitower() and not IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit()))
    endfunction

    function EMP_WardFilter takes nothing returns boolean
        return FilterUnitIsLivingClay() and not IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit()))
    endfunction

    function TriggerWard takes nothing returns nothing
        call DestroyEffect(AddSpecialEffectLoc("Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl", GetUnitLoc(GetEnumUnit())))
        call SetUnitExploded(GetEnumUnit(), true)
        call KillUnit(GetEnumUnit())
    endfunction

    function Trig_EMP_Actions takes nothing returns nothing
        local unit s = GetSpellAbilityUnit()
        local group g = GetUnitsInRangeMatching(4000, GetUnitX(s), GetUnitY(s), Condition(function EMP_Filter))
        local group g2 = GetUnitsInRangeMatching(4000, GetUnitX(s), GetUnitY(s), Condition(function EMP_Filter))
        local group wards = GetUnitsInRangeMatching(1200, GetUnitX(s), GetUnitY(s), Condition(function EMP_WardFilter))
        local unit first
        call ForGroup(wards, function TriggerWard)
        loop
            set first = FirstOfGroup(g)
            exitwhen first == null
            call PauseUnit(first, true)
            call AddTimedEffectUnit("Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl","overhead", first, EMP_DURATION)
            call GroupRemoveUnit(g, first)
        endloop
        call PolledWait(EMP_DURATION)
        loop
            set first = FirstOfGroup(g2)
            exitwhen first == null
            call PauseUnit(first, false)
            call GroupRemoveUnit(g2, first)
        endloop

        call DestroyGroup(g)
        call DestroyGroup(g2)
        call DestroyGroup(wards)

        set s = null
        set g = null
        set g2 = null
        set wards = null
        set first = null
    endfunction

    //===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger(  )
        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerAddCondition( t, Condition( function Trig_EMP_Conditions ) )
        call TriggerAddAction( t, function Trig_EMP_Actions )
    endfunction//===========================================================================
endlibrary
