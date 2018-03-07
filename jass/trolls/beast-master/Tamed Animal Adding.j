
//
// GetSpellAbilityUnit()
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_tamed_animal_adding_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == SPELL_PET_TAME ) ) then
        return false
    endif
    return true
endfunction

function Trig_tamed_animal_adding_Actions takes nothing returns nothing
    call GroupAddUnitSimple( GetSpellTargetUnit(), udg_babyPets )
endfunction

//===========================================================================
function InitTrig_tamed_animal_adding takes nothing returns nothing
    set gg_trg_tamed_animal_adding = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_tamed_animal_adding, Condition( function Trig_tamed_animal_adding_Conditions ) )
    call TriggerAddAction( gg_trg_tamed_animal_adding, function Trig_tamed_animal_adding_Actions )
endfunction//===========================================================================
