
//
// 9-ka
// 8-lez
// A-nel
// Ka lez ka Nel Ka
// Nel Nel Ka Nel Lez
// Lez Nel Lez Lez Ka
//===========================================================================
//TESH.scrollpos=219
//TESH.alwaysfold=0
function Trig_Rune_Release_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07B' ) ) then
        return false
    endif
    return true
endfunction

function runeCheck takes nothing returns boolean
     return (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) and IsUnitAliveBJ(GetFilterUnit())) and IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)==false
endfunction

function antiruneCheck takes nothing returns boolean
     return (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit))==false and IsUnitAliveBJ(GetFilterUnit())) and IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)==false
endfunction

function triggerSelfDestruct takes nothing returns nothing
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function getRuneSpellString takes integer i returns string
if(i=='A064')then
return "soulburn"
endif
if(i=='A02A')then
return "frostnova"
endif
if(i=='A03E')then
return "drunkenhaze"
endif
if(i=='A01Y')then
return "cripple"
endif
if(i=='A07C')then
return "creepthunderbolt"
endif
return "drunkenhaze"
endfunction

function getRuneSpell takes unit u returns integer
    if ( ( GetUnitTypeId(u) == UNIT_LOCUST_KA ) ) then
         return 'A07C'
    endif
    if ( ( GetUnitTypeId(u) == UNIT_LOCUST_LEZ ) ) then
        if(GetRandomInt(1,2)==1) then
           return 'A02A'
        else
            return 'A01Y'
        endif
    endif
    if ( ( GetUnitTypeId(u) == UNIT_LOCUST_NEL ) ) then
        if(GetRandomInt(1,2)==1) then
           return 'A064'
        else
           return 'A03E'
        endif
    endif
    return 'A03E'
endfunction

function countRunes takes unit u returns integer
    local integer answer=0
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune5"))
    
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    
    if(DistanceBetweenPoints(Location(X,Y),GetUnitLoc(u))<=150 and GetUnitAbilityLevelSwapped('A07D', u) > 0) then

        if(GetUnitTypeId(u1) == UNIT_LOCUST_KA and GetUnitTypeId(u2) == UNIT_LOCUST_LEZ and GetUnitTypeId(u3) == UNIT_LOCUST_KA and GetUnitTypeId(u4) == UNIT_LOCUST_NEL and GetUnitTypeId(u5) == UNIT_LOCUST_KA) then
            set answer=1
        endif
        if(GetUnitTypeId(u1) == UNIT_LOCUST_NEL and GetUnitTypeId(u2) == UNIT_LOCUST_NEL and GetUnitTypeId(u3) == UNIT_LOCUST_KA and GetUnitTypeId(u4) == UNIT_LOCUST_NEL and GetUnitTypeId(u5) == UNIT_LOCUST_LEZ) then
            set answer=3
        endif
        if(GetUnitTypeId(u1) == UNIT_LOCUST_LEZ and GetUnitTypeId(u2) == UNIT_LOCUST_NEL and GetUnitTypeId(u3) == UNIT_LOCUST_LEZ and GetUnitTypeId(u4) == UNIT_LOCUST_LEZ and GetUnitTypeId(u5) == UNIT_LOCUST_KA) then
            set answer=2
        endif
    endif
    return answer

endfunction 

function killTheSummon takes nothing returns nothing
   local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(GetTriggeringTrigger()),StringHash("summon"))
   local timer t=LoadTimerHandle(udg_GameHash,GetHandleId(GetTriggeringTrigger()),StringHash("timer"))
   call DestroyTimer(t)
   call KillUnit( u )
   call FlushChildHashtable(udg_GameHash,GetHandleId(GetTriggeringTrigger()))
   call FlushChildHashtable(udg_GameHash,GetHandleId(t))
endfunction

function summonCastTarget takes nothing returns nothing
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("unit"))
    local real r=LoadReal(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("radius"))
    local unit Baddy
    local string order=LoadStr(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("order"))
    set udg_parameterUnit=u
    set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, GetUnitLoc(u), Condition(function runeCheck)))
    if(Baddy==null) then
       set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, GetUnitLoc(u), Condition(function antiruneCheck)))
    endif
    call IssueTargetOrderBJ( u, order, Baddy )
endfunction

function startSummon takes unit u, integer uID, string s, real radius, string order,unit endNode,real cd returns nothing
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    local unit summon = CreateUnit(GetOwningPlayer(u),uID,X,Y,270.0)
    local trigger summonKill = CreateTrigger()
    local timer caster=CreateTimer()
    call DisplayTText(GENERAL_COLOR+"You have summoned "+s+GENERAL_COLOR+"!|r", 7)
    
    call SaveUnitHandle(udg_GameHash,GetHandleId(summonKill),StringHash("summon"),summon)
    
    call TriggerRegisterUnitEvent( summonKill, endNode, EVENT_UNIT_DEATH )
    call TriggerAddAction( summonKill, function killTheSummon )
    call TriggerAddAction( summonKill, function triggerSelfDestruct )
    
    call SaveTimerHandle(udg_GameHash,GetHandleId(summonKill),StringHash("timer"),caster)
    call SaveUnitHandle(udg_GameHash,GetHandleId(caster),StringHash("unit"),summon)
    call SaveReal(udg_GameHash,GetHandleId(caster),StringHash("radius"),radius)
    call SaveStr(udg_GameHash,GetHandleId(caster),StringHash("order"),order)   
    
    call TimerStart(caster, cd, true, function summonCastTarget)

endfunction

function Trig_Rune_Release_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    //local unit u1=H2U(GetHandleHandle(u,"rune1"))
    //local unit u2=H2U(GetHandleHandle(u,"rune2"))
    //local unit u3=H2U(GetHandleHandle(u,"rune3"))
    //local unit u4=H2U(GetHandleHandle(u,"rune4"))
    //local unit u5=H2U(GetHandleHandle(u,"rune5"))
    //local unit test=H2U(GetHandleHandle(u,"node6"))
    //local timer t=H2T(GetHandleHandle(u,"timer"))
    
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune5"))
    local unit test=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node6"))
    local timer t=LoadTimerHandle(udg_GameHash,GetHandleId(u),StringHash("timer"))
    
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    
    local unit Baddy
    local integer skill
    local real r=300
    local location center=GetUnitLoc(u)
    local integer mode=countRunes(u)



    if(mode!=0 or (test!=null and DistanceBetweenPoints(Location(X,Y),GetUnitLoc(u))<=LoadReal(udg_GameHash,GetHandleId(u),StringHash("radius")))) then
        set r=LoadReal(udg_GameHash,GetHandleId(u),StringHash("radius"))
        set center=Location(X,Y)
    endif
if(mode==1) then
    call startSummon(u,UNIT_LOCUST_FIRE_LORD,"|c00ff0000Kalezka Nelka|r",r,"acidbomb",test,1)
elseif(mode==2) then
    call startSummon(u,UNIT_LOCUST_WATER_LORD,"|c00005a95Leznel Lezlezka|r",r,"thunderbolt",test,1)
elseif(mode==3) then
    call startSummon(u,UNIT_LOCUST_GHOST,"|c0075f041Nelnelka Nellez|r",r,"soulburn",test,1.5)
else
    set udg_parameterUnit=u
    if(u1!=null) then
       set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, GetUnitLoc(u), Condition(function runeCheck)))
       call IssuePointOrderLocBJ( u1, "move", GetUnitLoc(Baddy) )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u1 )
       set skill=getRuneSpell(u1)
       call masterCastAtTarget(u1,Baddy,0,0,skill,getRuneSpellString(skill))
    endif

    if(u2!=null) then
       set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, GetUnitLoc(u), Condition(function runeCheck)))
       call IssuePointOrderLocBJ( u2, "move", GetUnitLoc(Baddy) )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u2 )
       set skill=getRuneSpell(u2)
       call masterCastAtTarget(u2,Baddy,0,0,skill,getRuneSpellString(skill))
    endif

    if(u3!=null) then
       set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, GetUnitLoc(u), Condition(function runeCheck)))
       call IssuePointOrderLocBJ( u3, "move", GetUnitLoc(Baddy) )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u3 )
       set skill=getRuneSpell(u3)
       call masterCastAtTarget(u3,Baddy,0,0,skill,getRuneSpellString(skill))
    endif

    if(u4!=null) then
       set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, GetUnitLoc(u), Condition(function runeCheck)))
       call IssuePointOrderLocBJ( u4, "move", GetUnitLoc(Baddy) )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u4 )
       set skill=getRuneSpell(u4)
       call masterCastAtTarget(u4,Baddy,0,0,skill,getRuneSpellString(skill))
    endif

    if(u5!=null) then
       set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, GetUnitLoc(u), Condition(function runeCheck)))
       call IssuePointOrderLocBJ( u5, "move", GetUnitLoc(Baddy) )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u5 )
       set skill=getRuneSpell(u5)
       call masterCastAtTarget(u5,Baddy,0,0,skill,getRuneSpellString(skill))
    endif
endif
if(mode!=0) then
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u1 )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u2 )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u3 )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u4 )
       call UnitApplyTimedLifeBJ( 1, 'BTLF', u5 )
endif
    call DestroyTimer(t)

    if(test!=null) then
       call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("rune1"))
       call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("rune2"))
       call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("rune3"))
       call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("rune4"))
       call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("rune5"))
    else
       call FlushChildHashtable(udg_GameHash,GetHandleId(u))
    endif


endfunction


//===========================================================================
function InitTrig_Rune_Release takes nothing returns nothing
    set gg_trg_Rune_Release = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Rune_Release, Condition( function Trig_Rune_Release_Conditions ) )
    call TriggerAddAction( gg_trg_Rune_Release, function Trig_Rune_Release_Actions )
endfunction

//===========================================================================
