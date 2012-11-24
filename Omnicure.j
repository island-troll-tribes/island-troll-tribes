
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_omnicure_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A061'
endfunction

function Trig_omnicure_cond takes nothing returns boolean
    return (GetUnitTypeId(GetFilterUnit()) != UNIT_MASTER_CASTER)and(IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true)and(IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())))
endfunction

function Trig_omnicure_actionsv2 takes nothing returns nothing
    //call DisplayText("cast per unit")
    call masterCastAtTarget(GetEnumUnit(),GetEnumUnit(),0,0,'A02H',"autodispel")
endfunction

function Trig_omnicure_Actions takes nothing returns nothing
    //call DisplayText("cast --")
    call ForGroup(GetUnitsInRectMatching(bj_mapInitialPlayableArea, Condition(function Trig_omnicure_cond)), function Trig_omnicure_actionsv2  )
endfunction

//===========================================================================
function InitTrig_omnicure takes nothing returns nothing
    set gg_trg_omnicure = CreateTrigger(  )
 //   call TriggerRegisterAnyUnitEventBJ( gg_trg_omnicure, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_omnicure, Condition( function Trig_omnicure_Conditions ) )
    call TriggerAddAction( gg_trg_omnicure, function Trig_omnicure_Actions )
endfunction//===========================================================================
