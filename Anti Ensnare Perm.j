
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function IsWebModded takes nothing returns boolean
    return GetSpellAbilityId() == 'Aweb'
endfunction

function Web_Modded_BuffCounterStack takes nothing returns nothing
local unit u
local unit t = GetSpellTargetUnit()
if GetUnitAbilityLevel(t, 'Beng') > 0 and checkTroll(t) then
    set u = GetSpellAbilityUnit()
    call IssueImmediateOrder(u, "stop")
    set u = null
endif
set t = null
endfunction

//===========================================================================
function InitTrig_anti_ensnare_perm takes nothing returns nothing
    set gg_trg_anti_ensnare_perm = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_anti_ensnare_perm, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_anti_ensnare_perm, Condition( function IsWebModded ) )
    call TriggerAddAction( gg_trg_anti_ensnare_perm, function Web_Modded_BuffCounterStack )
endfunction

//===========================================================================
