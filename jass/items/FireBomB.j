
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function FireBomBConditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AE'
endfunction

function FireBomBActions takes nothing returns nothing
    local unit u = GetSpellAbilityUnit()
    call masterCastAreaTarget(u, GetSpellTargetX(), GetSpellTargetY(), 'A0AC', "flamestrike")
    set u = null
endfunction

//===========================================================================
function InitTrig_FireBomB takes nothing returns nothing
    set gg_trg_FireBomB = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_FireBomB, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_FireBomB, Condition( function FireBomBConditions ) )
    call TriggerAddAction( gg_trg_FireBomB, function FireBomBActions )
endfunction//===========================================================================
