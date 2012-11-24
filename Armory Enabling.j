
//===========================================================================
function Trig_armory_enabling_Func001Func001A takes nothing returns nothing
    call SetPlayerTechResearchedSwap( 'Roen', 1, GetEnumPlayer() )
endfunction

function Trig_armory_enabling_Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_armory_enabling_Actions takes nothing returns nothing
    if ( Trig_armory_enabling_Func001C() ) then
        call ForForce( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), function Trig_armory_enabling_Func001Func001A )
    else
    endif
endfunction

//===========================================================================
function InitTrig_armory_enabling takes nothing returns nothing
    set gg_trg_armory_enabling = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_armory_enabling, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddAction( gg_trg_armory_enabling, function Trig_armory_enabling_Actions )
endfunction

//===========================================================================
