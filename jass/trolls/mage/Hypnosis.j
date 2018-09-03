
//===========================================================================
function Trig_sleeping_2_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04Y' ) ) then
        return false
    endif
    return true
endfunction

function Trig_sleeping_2_Actions takes nothing returns nothing
    call SetUnitLifeBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit()) - 20.00 ) )
    call SetUnitManaBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) + 75.00 ) )
endfunction

//===========================================================================
function InitTrig_hypnosis takes nothing returns nothing
    set gg_trg_hypnosis = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hypnosis, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_hypnosis, Condition( function Trig_sleeping_2_Conditions ) )
    //call TriggerAddAction( gg_trg_hypnosis, function Trig_sleeping_2_Actions )
endfunction

//===========================================================================
