
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function IsHydraAndNether takes nothing returns boolean
    return GetSpellTargetUnit() == Hydra and GetSpellAbilityId() == 'A037'
endfunction

function NetherSelf_Karma takes nothing returns nothing
    call UnitRemoveAbility(Hydra, 'BHbn')
    //call UnitRemoveBuffsEx(Hydra, false, true, true, true, true, true, true)
    call masterCastAtTarget(GetSpellAbilityUnit(),GetSpellAbilityUnit(),0,0,'A037',"banish")
endfunction

//===========================================================================
function InitTrig_hydraantinether takes nothing returns nothing
    set gg_trg_hydraantinether = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hydraantinether, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_hydraantinether, Condition( function IsHydraAndNether ) )
    call TriggerAddAction( gg_trg_hydraantinether, function NetherSelf_Karma )
endfunction

//===========================================================================
