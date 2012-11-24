
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_release_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == SPELL_PET_RELEASE ) ) then
        return false
    endif
    return true
endfunction

function Trig_release_Actions takes nothing returns nothing
    set udg_parameterUnit = GetSpellAbilityUnit()
    call TriggerExecute( gg_trg_Release_Pets )
endfunction

//===========================================================================
function InitTrig_release takes nothing returns nothing
    set gg_trg_release = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_release, Condition( function Trig_release_Conditions ) )
    call TriggerAddAction( gg_trg_release, function Trig_release_Actions )
endfunction

//===========================================================================
