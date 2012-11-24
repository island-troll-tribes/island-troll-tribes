
//
// o01J
//===========================================================================
//TESH.scrollpos=17
//TESH.alwaysfold=0
function Trig_EMP_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06N'
endfunction

function EMP_Filter takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ENSNARE_TRAP or GetUnitTypeId(GetFilterUnit()) == UNIT_OMNITOWER or GetUnitTypeId(GetFilterUnit()) == UNIT_OMNITOWER
endfunction

function Trig_EMP_Actions takes nothing returns nothing
    local unit s = GetSpellAbilityUnit()
    local group g = GetUnitsInRangeMatching(4000, GetUnitX(s), GetUnitY(s), Condition(function EMP_Filter))
    local group g2 = GetUnitsInRangeMatching(4000, GetUnitX(s), GetUnitY(s), Condition(function EMP_Filter))
    local unit first
    loop
        set first = FirstOfGroup(g)
        exitwhen first == null
        call PauseUnit(first, true)
        call AddTimedEffectUnit("Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl","overhead", first, 60)
        call GroupRemoveUnit(g, first)
    endloop
    call PolledWait(60)
    loop
        set first = FirstOfGroup(g2)
        exitwhen first == null
        call PauseUnit(first, false)
        call GroupRemoveUnit(g2, first)
    endloop
    
    set s = null
    set g = null
    set g2 = null
    set first = null
endfunction

//===========================================================================
function InitTrig_EMP takes nothing returns nothing
    set gg_trg_EMP = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_EMP, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_EMP, Condition( function Trig_EMP_Conditions ) )
    call TriggerAddAction( gg_trg_EMP, function Trig_EMP_Actions )
endfunction//===========================================================================
