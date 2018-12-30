
//
// ORIGINAL
// function Trig_TeleGather_Cast_Conditions takes nothing returns boolean
//     if ( not ( GetSpellAbilityId() == 'A057' or GetSpellAbilityId() == 'A06V') ) then
//         return false
//     endif
//     return true
// endfunction
// function Trig_TeleGather_Cast_Actions takes nothing returns nothing
// local unit c = GetSpellAbilityUnit()
// local unit t = GetSpellTargetUnit()
// call SaveUnitHandle( udg_GameHash, GetHandleId(c), StringHash("fire"), t)    
// call masterCastAtTarget(c,c,0,0,'A056',"curse")
// if GetSpellAbilityId() == 'A06V' then
//     call PolledWait(120)
// else
//     call PolledWait(30.0 + ( 20.0 * I2R(GetUnitAbilityLevel(c,'A057')) ))
// endif
// call RemoveSavedHandle( udg_GameHash, GetHandleId(c), StringHash("fire"))
// set c = null
// set t = null
// endfunction
// //===========================================================================
// function InitTrig_TeleGather_Cast takes nothing returns nothing
// set gg_trg_TeleGather_Cast = CreateTrigger(  )
// call TriggerAddCondition( gg_trg_TeleGather_Cast, Condition( function Trig_TeleGather_Cast_Conditions ) )
// call TriggerAddAction( gg_trg_TeleGather_Cast, function Trig_TeleGather_Cast_Actions )
// endfunction
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TeleGather_Cast_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A057' or GetSpellAbilityId() == 'A06V'
endfunction

function Trig_TeleGather_Cast_Actions takes nothing returns nothing
	local unit c = GetSpellAbilityUnit()
	local unit t = GetSpellTargetUnit()
	local integer id = GetSpellAbilityId()
	call SaveUnitHandle( udg_GameHash, GetHandleId(c), StringHash("fire"), t)    
	call masterCastAtTarget(c,c,0,0,'A056',"curse")
	if id == 'A06V' then
		call PolledWait(120)
	else
		call PolledWait(30.0 + ( 20.0 * I2R(GetUnitAbilityLevel(c,'A057')) ))
	endif
	call RemoveSavedHandle( udg_GameHash, GetHandleId(c), StringHash("fire"))
	set c = null
	set t = null
endfunction

//===========================================================================
function InitTrig_TeleGather_Cast takes nothing returns nothing
	set gg_trg_TeleGather_Cast = CreateTrigger(  )
	call TriggerAddCondition( gg_trg_TeleGather_Cast, Condition( function Trig_TeleGather_Cast_Conditions ) )
	call TriggerAddAction( gg_trg_TeleGather_Cast, function Trig_TeleGather_Cast_Actions )
endfunction//===========================================================================
