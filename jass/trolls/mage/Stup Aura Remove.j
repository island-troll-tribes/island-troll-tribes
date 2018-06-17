
//
// GetSpellAbilityUnit()
// GetSpellTargetUnit()
//===========================================================================
function Trig_Stup_Aura_Remove_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Stup_Aura_Remove_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ( 'A05V', GetSpellAbilityUnit() )
    call UnitRemoveBuffBJ( 'B00L', GetSpellAbilityUnit() )
    call UnitRemoveBuffBJ( 'B00M', GetSpellAbilityUnit() )
endfunction

//===========================================================================
function InitTrig_Stup_Aura_Remove takes nothing returns nothing
    set gg_trg_Stup_Aura_Remove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Stup_Aura_Remove, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Stup_Aura_Remove, Condition( function Trig_Stup_Aura_Remove_Conditions ) )
    //call TriggerAddAction( gg_trg_Stup_Aura_Remove, function Trig_Stup_Aura_Remove_Actions )
endfunction

//===========================================================================
