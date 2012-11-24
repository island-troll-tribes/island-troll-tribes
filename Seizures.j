
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function Trig_seizures_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05T' ) ) then
        return false
    endif
    return true
endfunction

function sTimer takes nothing returns nothing
    local unit caster = LoadUnitHandle(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("s_unit2"))
    local unit targ = LoadUnitHandle(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("s_unit"))
    
    if(GetRandomInt(1,100))<=LoadInteger(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("i")) then
        call masterCastAtTarget(caster,targ,0,0,'A05U',"thunderbolt")
    endif
endfunction

function seizureFunc takes nothing returns nothing
    local timer t=CreateTimer()
    local timer t2=CreateTimer()
    local timer t3=CreateTimer()
    local unit u1=GetSpellTargetUnit()
    local unit u2=GetSpellAbilityUnit()

    call SaveUnitHandle(udg_GameHash,GetHandleId(t),StringHash("s_unit"),u1)
    call SaveUnitHandle(udg_GameHash,GetHandleId(t),StringHash("s_unit2"),u2)
    call SaveInteger(udg_GameHash,GetHandleId(t),StringHash("i"),18)
    call TimerStart(t,.1,true,function sTimer)
    call PolledWait(3)
    call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    call DestroyTimer(t)

    call SaveUnitHandle(udg_GameHash,GetHandleId(t2),StringHash("s_unit"),u1)
    call SaveUnitHandle(udg_GameHash,GetHandleId(t2),StringHash("s_unit2"),u2)
     call SaveInteger(udg_GameHash,GetHandleId(t2),StringHash("i"),15)
    call TimerStart(t2,.1,true,function sTimer)
    call PolledWait(3)
    call FlushChildHashtable(udg_GameHash,GetHandleId(t2))
    call DestroyTimer(t2)
    
    call SaveUnitHandle(udg_GameHash,GetHandleId(t3),StringHash("s_unit"),u1)
    call SaveUnitHandle(udg_GameHash,GetHandleId(t3),StringHash("s_unit2"),u2)
     call SaveInteger(udg_GameHash,GetHandleId(t3),StringHash("i"),8)
    call TimerStart(t3,.1,true,function sTimer)
    call PolledWait(2)
    call FlushChildHashtable(udg_GameHash,GetHandleId(t3))
    call DestroyTimer(t3)
endfunction

//===========================================================================
function InitTrig_seizures takes nothing returns nothing
    set gg_trg_seizures = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_seizures, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_seizures, Condition( function Trig_seizures_Conditions ) )
    call TriggerAddAction( gg_trg_seizures, function seizureFunc )
endfunction

//===========================================================================
