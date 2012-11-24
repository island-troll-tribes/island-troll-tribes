
//
// GetSpellAbilityUnit()
// Set line 10 of tamed abilities to 5 from 1
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_tamed_abilities_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == SPELL_PET_TAME ) ) then
        return false
    endif
    return true
endfunction

function Trig_tamed_abilities_Actions takes nothing returns nothing
    local unit u=GetSpellAbilityUnit()
    call PolledWait(5)
    set udg_parameterUnit=u
    call TriggerExecute( gg_trg_Baby_Spells )


endfunction

//===========================================================================
function InitTrig_tamed_abilities takes nothing returns nothing
    set gg_trg_tamed_abilities = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_tamed_abilities, Condition( function Trig_tamed_abilities_Conditions ) )
    call TriggerAddAction( gg_trg_tamed_abilities, function Trig_tamed_abilities_Actions )
endfunction

//===========================================================================
