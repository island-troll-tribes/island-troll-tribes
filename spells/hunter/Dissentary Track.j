
//
// IsUnitAliveBJ
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Dissentary_Track_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05L' ) ) then
        return false
    endif
    return true
endfunction

function disTrack takes nothing returns nothing
    local unit u
    local unit TRACKED = LoadUnitHandle(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("tracked"))
    local unit TRACKER = LoadUnitHandle(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("tracker"))
    
    if(IsUnitAliveBJ(TRACKED)) then
        set u=CreateUnit(GetOwningPlayer(TRACKER),UNIT_LOCUST_POOP,GetUnitX(TRACKED),GetUnitY(TRACKED), bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 30.00, 'BTLF', u )
    endif
endfunction

function Trig_Dissentary_Track_Actions takes nothing returns nothing
    local timer t=CreateTimer()
    call SaveUnitHandle(udg_GameHash,GetHandleId(t),StringHash("tracked"),GetSpellTargetUnit())
    call SaveUnitHandle(udg_GameHash,GetHandleId(t),StringHash("tracker"),GetSpellAbilityUnit())
    call TimerStart(t,1,true,function disTrack)
    call PolledWait(70)
    call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    call DestroyTimer(t)
endfunction

//===========================================================================
function InitTrig_Dissentary_Track takes nothing returns nothing
    set gg_trg_Dissentary_Track = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_Dissentary_Track, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Dissentary_Track, Condition( function Trig_Dissentary_Track_Conditions ) )
    call TriggerAddAction( gg_trg_Dissentary_Track, function Trig_Dissentary_Track_Actions )
endfunction

//===========================================================================
