
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Homing_Beacon_Cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Homing_Beacon_Cast_Actions takes nothing returns nothing
local unit SPELL_CASTER = GetSpellAbilityUnit()
local unit TARGET = GetSpellTargetUnit()
  //call SetUnitUserData(GetSpellAbilityUnit(),GetHandleId(GetSpellTargetUnit()))
call SaveUnitHandle(udg_GameHash,GetHandleId(SPELL_CASTER),StringHash("beacon"),TARGET)
set SPELL_CASTER = null
set TARGET = null
endfunction

//===========================================================================
function InitTrig_Homing_Beacon_Cast takes nothing returns nothing
    set gg_trg_Homing_Beacon_Cast = CreateTrigger(  )
 //   call TriggerRegisterAnyUnitEventBJ( gg_trg_Homing_Beacon_Cast, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Homing_Beacon_Cast, Condition( function Trig_Homing_Beacon_Cast_Conditions ) )
    call TriggerAddAction( gg_trg_Homing_Beacon_Cast, function Trig_Homing_Beacon_Cast_Actions )
endfunction

//===========================================================================
