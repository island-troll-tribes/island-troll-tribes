
//
//        call DisplayTextToForce( GetPlayersAll(), I2S(i) )
//===========================================================================
//TESH.scrollpos=45
//TESH.alwaysfold=0
function Trig_Invoke_Runes_Func001C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'A06S' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A079' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A07A' ) ) then
        return true
    endif
    return false
endfunction

function Trig_Invoke_Runes_Conditions takes nothing returns boolean
    if ( not Trig_Invoke_Runes_Func001C() ) then
        return false
    endif
    return true
endfunction


function getRuneID takes nothing returns integer
    if ( ( GetSpellAbilityId() == 'A06S' ) ) then
        return UNIT_LOCUST_NEL
    endif
    if ( ( GetSpellAbilityId() == 'A079' ) ) then
        return UNIT_LOCUST_KA
    endif
    if ( ( GetSpellAbilityId() == 'A07A' ) ) then
        return UNIT_LOCUST_LEZ
    endif
    return UNIT_LOCUST_NEL
endfunction



function positionRunes takes nothing returns nothing
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("player"))
    local integer i=ModuloInteger(LoadInteger(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("iterations")),5)+1
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune5"))

    if(u1!=null) then
        call SetUnitPositionLocFacingBJ( u1,PolarProjectionBJ(GetUnitLoc(u), 100, 72.0+i*72), 72.0 )
    endif
    if(u2!=null) then
        call SetUnitPositionLocFacingBJ( u2,PolarProjectionBJ(GetUnitLoc(u), 100, 144+i*72), 144.0 )
    endif
    if(u3!=null) then
        call SetUnitPositionLocFacingBJ( u3,PolarProjectionBJ(GetUnitLoc(u), 100, 216+i*72), 216 )
    endif
    if(u4!=null) then
        call SetUnitPositionLocFacingBJ( u4,PolarProjectionBJ(GetUnitLoc(u), 100, 288+i*72), 288 )
    endif
    if(u5!=null) then
        call SetUnitPositionLocFacingBJ( u5,PolarProjectionBJ(GetUnitLoc(u), 100, 360+i*72), 360 )
    endif
    call SaveInteger(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("iterations"),i)
endfunction

function Trig_Invoke_Runes_Actions takes nothing returns nothing
    local unit u=GetSpellAbilityUnit()
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune5"))
    local timer t
    local trigger deathTrigger

    if(u1==null) then
        set u1=CreateUnitAtLoc(GetOwningPlayer(u),getRuneID(),PolarProjectionBJ(GetUnitLoc(u), 100, 72),72.0)
        //call SetHandleHandle(u, "rune1", u1)
        call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("rune1"), u1)
        set t=CreateTimer()
        call SaveUnitHandle(udg_GameHash,GetHandleId(t),StringHash("player"),u)
        call SaveInteger(udg_GameHash,GetHandleId(t),StringHash("iterations"),0)
        call SaveTimerHandle(udg_GameHash,GetHandleId(u),StringHash("timer"),t)
        set deathTrigger=CreateTrigger()
        call TriggerRegisterUnitEvent( deathTrigger, u, EVENT_UNIT_DEATH )
        call TriggerAddAction( deathTrigger, function Trig_Rune_Release_Actions )
        call TriggerAddAction( deathTrigger, function triggerSelfDestruct )
        call TimerStart(t, 0.8, true, function positionRunes)
    elseif(u2==null) then
        set u2=CreateUnitAtLoc(GetOwningPlayer(u),getRuneID(),PolarProjectionBJ(GetUnitLoc(u), 100, 144),144)
        call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("rune2"), u2)
    elseif(u3==null) then
        set u3=CreateUnitAtLoc(GetOwningPlayer(u),getRuneID(),PolarProjectionBJ(GetUnitLoc(u), 100, 216),216)
        call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("rune3"), u3)
    elseif(u4==null) then
        set u4=CreateUnitAtLoc(GetOwningPlayer(u),getRuneID(),PolarProjectionBJ(GetUnitLoc(u), 100, 288),288)
        call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("rune4"), u4)
    elseif(u5==null) then
        set u5=CreateUnitAtLoc(GetOwningPlayer(u),getRuneID(),PolarProjectionBJ(GetUnitLoc(u), 100, 360),360)
        call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("rune5"), u5)
    endif

endfunction

//===========================================================================
function InitTrig_Invoke_Runes takes nothing returns nothing
    set gg_trg_Invoke_Runes = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Invoke_Runes, Condition( function Trig_Invoke_Runes_Conditions ) )
    call TriggerAddAction( gg_trg_Invoke_Runes, function Trig_Invoke_Runes_Actions )
endfunction

//===========================================================================
