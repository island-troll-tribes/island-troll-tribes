
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Shield_Bash_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09S'
endfunction

function Shield_Bash_Actions takes nothing returns nothing
    local unit u = GetSpellAbilityUnit()
    local unit t = GetSpellTargetUnit()
    call masterCastAtCaster(u,t,0,0,'A064',"soulburn")
    call UnitDamageTarget(u, t, 20, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS)
    set u = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ShieldBash takes nothing returns nothing
    set gg_trg_ShieldBash = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ShieldBash, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_ShieldBash, Condition( function Shield_Bash_Conditions ) )
    call TriggerAddAction( gg_trg_ShieldBash, function Shield_Bash_Actions )
endfunction//===========================================================================
