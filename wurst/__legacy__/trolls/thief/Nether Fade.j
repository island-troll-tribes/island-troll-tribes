
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Nether_Fade_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Nether_Fade_Actions takes nothing returns nothing
    call masterCastAtTarget(GetSpellAbilityUnit(),GetSpellAbilityUnit(),0,0,'A037',"banish")
endfunction

//===========================================================================
function InitTrig_Nether_Fade takes nothing returns nothing
    set gg_trg_Nether_Fade = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Nether_Fade, Condition( function Trig_Nether_Fade_Conditions ) )
    call TriggerAddAction( gg_trg_Nether_Fade, function Trig_Nether_Fade_Actions )
endfunction

//===========================================================================
