
//
// Ok Plox.. Now that I have decided to take my leave from WC... I decided it might be nice to comment on a lot of the triggers. Well.. Alright I got lazy half way through most of them are self explanatory anyway. I can help you if you need it.
// This one is for orb spell dummy units using already existing spells (to reduce the number of spells). This makes their spells have 0 cooldown.
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_flyer_spell_refreshing_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetSpellAbilityUnit(), UNIT_TYPE_FLYING) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_flyer_spell_refreshing_Actions takes nothing returns nothing
    if(checkHawk(GetSpellAbilityUnit())==false) then
       call UnitResetCooldown( GetSpellAbilityUnit() )
    endif
endfunction

//===========================================================================
function InitTrig_flyer_spell_refreshing takes nothing returns nothing
    set gg_trg_flyer_spell_refreshing = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_flyer_spell_refreshing, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_flyer_spell_refreshing, Condition( function Trig_flyer_spell_refreshing_Conditions ) )
    call TriggerAddAction( gg_trg_flyer_spell_refreshing, function Trig_flyer_spell_refreshing_Actions )
endfunction

//===========================================================================
