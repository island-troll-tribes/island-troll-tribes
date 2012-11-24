
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
// For the multi cast upon defensive spells cast

//===========================================================================
function stopDefensiveSpells takes unit u returns nothing
    call UnitRemoveAbilityBJ( 'A0AN', u )
    call UnitAddAbilityBJ( 'A0AM', u )
endfunction

//===========================================================================
//             Above: Stops casting, Below: Begins Casting
//===========================================================================

function defensiveSpellsActions takes nothing returns nothing
    if isDefensiveWard(GetTriggerUnit()) and GetSpellAbilityId() == 'A0AP' then
        call UnitRemoveAbilityBJ( 'A0AM', GetTriggerUnit() )
        call UnitAddAbilityBJ( 'A0AN', GetTriggerUnit() )
        call disableOffensiveBuildings()
        call stopDefensiveSpells( GetTriggerUnit() )
    endif
endfunction

//===========================================================================
function InitTrig_Cast_Defensive_Spells takes nothing returns nothing
    set gg_trg_Cast_Defensive_Spells = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Cast_Defensive_Spells, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddAction( gg_trg_Cast_Defensive_Spells, function defensiveSpellsActions )
endfunction


//===========================================================================
