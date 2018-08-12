
//
// GetSpellAbilityUnit()
// GetSpellTargetUnit()
//===========================================================================
function Trig_Stup_Aura_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Stup_Aura_Actions takes nothing returns nothing
    call UnitAddAbilityBJ( 'A05V', GetSpellAbilityUnit() )
endfunction

//===========================================================================
function InitTrig_Stup_Aura takes nothing returns nothing
    set gg_trg_Stup_Aura = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Stup_Aura, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_Stup_Aura, Condition( function Trig_Stup_Aura_Conditions ) )
    //call TriggerAddAction( gg_trg_Stup_Aura, function Trig_Stup_Aura_Actions )
endfunction

//===========================================================================
