
//===========================================================================
//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_Light_Gate_Conditions takes nothing returns boolean
return GetSpellAbilityId() == 'A01H'
endfunction

function lightCheck takes nothing returns boolean
     return (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit))==false and IsUnitAliveBJ(GetFilterUnit()) and IsUnitTroll(GetFilterUnit()))
endfunction

function growLightGate takes nothing returns nothing
    local timer t=GetExpiredTimer()
    local integer i=LoadInteger(udg_GameHash,GetHandleId(t),StringHash("iterations"))
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(t),StringHash("player"))
    
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node5"))
    local unit u6=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node6"))
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    set i=i+1

    call SetUnitPositionLocFacingBJ( u1, PolarProjectionBJ(Location(X,Y), 100+5*i, 60+4*i), 60 )
    call SetUnitPositionLocFacingBJ( u2, PolarProjectionBJ(Location(X,Y), 100+5*i, 120+4*i), 120 )
    call SetUnitPositionLocFacingBJ( u3, PolarProjectionBJ(Location(X,Y), 100+5*i, 180+4*i), 180 )
    call SetUnitPositionLocFacingBJ( u4, PolarProjectionBJ(Location(X,Y), 100+5*i, 240+4*i), 240 )
    call SetUnitPositionLocFacingBJ( u5, PolarProjectionBJ(Location(X,Y), 100+5*i, 300+4*i), 300 )
    call SetUnitPositionLocFacingBJ( u6, PolarProjectionBJ(Location(X,Y), 100+5*i, 360+4*i), 360 )

    call SaveInteger(udg_GameHash, GetHandleId(t), StringHash("iterations"), i)
endfunction


function lightGateSpell takes nothing returns nothing
    local timer t=GetExpiredTimer()
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(t),StringHash("player"))
    
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node5"))
    local unit u6=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node6"))

    //local location center=I2L(GetUnitUserDataEx(u))
    //
    
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    
    local location center=Location(X,Y)
    local integer i=ModuloInteger(LoadInteger(udg_GameHash,GetHandleId(t),StringHash("iterations")),6)+1
    local integer spellIndex=GetRandomInt(15,22)
    local real r=LoadReal(udg_GameHash, GetHandleId(u),StringHash("radius"))
    local unit Friend
    set udg_parameterUnit=u
    set Friend=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, center, Condition(function lightCheck)))

    if(Friend!=null) then
    if(i==1) then
       call masterCastAtCaster(u1,Friend,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectLoc("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",GetUnitLoc(u1),2.5)
    elseif(i==2) then
       call masterCastAtCaster(u2,Friend,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectLoc("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",GetUnitLoc(u2),2.5)
    elseif(i==3) then
       call masterCastAtCaster(u3,Friend,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectLoc("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",GetUnitLoc(u3),2.5)
    elseif(i==4) then
       call masterCastAtCaster(u4,Friend,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectLoc("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",GetUnitLoc(u4),2.5)
    elseif(i==5) then
       call masterCastAtCaster(u5,Friend,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectLoc("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",GetUnitLoc(u5),2.5)
    elseif(i==6) then
       call masterCastAtCaster(u6,Friend,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectLoc("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",GetUnitLoc(u6),2.5)
    endif
    endif
    call SaveInteger(udg_GameHash, GetHandleId(t), StringHash("iterations"), i)
endfunction

function endLightGate takes nothing returns nothing
    local timer t=LoadTimerHandle(udg_GameHash, GetHandleId(GetTriggeringTrigger()), StringHash("timer"))
    local unit u=LoadUnitHandle(udg_GameHash, GetHandleId(t), StringHash("player"))

    call SetUnitUserDataEx(u,0)
    
    call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    call FlushChildHashtable(udg_GameHash,GetHandleId(GetTriggeringTrigger()))
    
    call DestroyTimer(t)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function killLightGate takes nothing returns nothing
//    local timer t=H2T(GetHandleHandle(GetTriggeringTrigger(),"timer"))
  //  local unit u=H2U(GetHandleHandle(t,"player"))
    //local unit u1=H2U(GetHandleHandle(u,"node1"))
//    local unit u2=H2U(GetHandleHandle(u,"node2"))
  //  local unit u3=H2U(GetHandleHandle(u,"node3"))
    //local unit u4=H2U(GetHandleHandle(u,"node4"))
//    local unit u5=H2U(GetHandleHandle(u,"node5"))
  //  local unit u6=H2U(GetHandleHandle(u,"node6"))
    //local trigger e
//    local integer i=GetHandleInt(t,"iterations")
  //  local timer t2= CreateTimer()
    local timer t = LoadTimerHandle(udg_GameHash, GetHandleId(GetTriggeringTrigger()), StringHash("timer"))
    local integer i = LoadInteger(udg_GameHash, GetHandleId(t), StringHash("iterations"))
    local unit u = LoadUnitHandle(udg_GameHash, GetHandleId(t), StringHash("player"))
    
    local unit u1 = LoadUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node1"))
    local unit u2 = LoadUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node2"))
    local unit u3 = LoadUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node3"))
    local unit u4 = LoadUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node4"))
    local unit u5 = LoadUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node5"))
    local unit u6 = LoadUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node6"))
    local trigger e
    local timer t2 = CreateTimer()

    if(i<=30) then
       call KillUnit( u1 )
       call KillUnit( u2 )
       call KillUnit( u3 )
       call KillUnit( u4 )
       call KillUnit( u5 )
       call KillUnit( u6 )
       //call FlushHandleLocals(u)
       //call FlushChildHashtable(udg_GameHash,GetHandleId(u))
       call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    else
       call UnitApplyTimedLifeBJ( 2+(i/8), 'BTLF', u1 )
       call UnitApplyTimedLifeBJ( 2.2+(i/8), 'BTLF', u2 )
       call UnitApplyTimedLifeBJ( 2.4+(i/8), 'BTLF', u3 )
       call UnitApplyTimedLifeBJ( 2.6+(i/8), 'BTLF', u4 )
       call UnitApplyTimedLifeBJ( 2.8+(i/8), 'BTLF', u5 )
       call UnitApplyTimedLifeBJ( 3+(i/8), 'BTLF', u6 )

       //call SetUnitUserDataEx(GetSpellAbilityUnit(),SaveLocationHandle(Location(LoadReal(udg_GameHash, GetHandleId(t), StringHash("X")),LoadReal(udg_GameHash, GetHandleId(t), StringHash("Y")))))
        //instead: use real x / y directly..
       // LoadReal(udg_GameHash, GetHandleId(t), StringHash("X"))
       // LoadReal(udg_GameHash, GetHandleId(t), StringHash("Y"))
        
       set e=CreateTrigger()

//       call SetHandleHandle(e, "timer", t2)
  //     call SetHandleInt(t2,"iterations",0)
    //   call SetHandleReal(u,"radius",100+5*i)
      // call SetHandleHandle(t2, "player", GetSpellAbilityUnit())
       
       call SaveTimerHandle(udg_GameHash, GetHandleId(e), StringHash("timer"), t2)
       call SaveInteger(udg_GameHash, GetHandleId(t2), StringHash("iterations"), 0)
       call SaveReal(udg_GameHash, GetHandleId(u), StringHash("radius"), 100+5*i)
       call SaveUnitHandle(udg_GameHash,GetHandleId(t2), StringHash("player"), GetSpellAbilityUnit())
       
       call TriggerRegisterUnitEvent( e, u1, EVENT_UNIT_DEATH )
       call TriggerAddAction( e, function endLightGate )
       call TimerStart(t2, 1.75-(i/280.0), true, function lightGateSpell)
    endif

    //call FlushHandleLocals(t)
    call FlushChildHashtable(udg_GameHash, GetHandleId(t))
    call DestroyTimer(t)
    //call FlushHandleLocals(GetTriggeringTrigger())
    call FlushChildHashtable(udg_GameHash, GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())

endfunction

function Trig_Light_Gate_Actions takes nothing returns nothing
    local trigger killTrigger= CreateTrigger()
    local timer t= CreateTimer()
    local unit u = GetSpellAbilityUnit()
    local unit u1=CreateUnitAtLoc(GetOwningPlayer(u),UNIT_LOCUST_LIGHT_NODE,PolarProjectionBJ(GetUnitLoc(u), 100, 60),60.0)
    local unit u2=CreateUnitAtLoc(GetOwningPlayer(u),UNIT_LOCUST_LIGHT_NODE,PolarProjectionBJ(GetUnitLoc(u), 100, 120),120.0)
    local unit u3=CreateUnitAtLoc(GetOwningPlayer(u),UNIT_LOCUST_LIGHT_NODE,PolarProjectionBJ(GetUnitLoc(u), 100, 180),180.0)
    local unit u4=CreateUnitAtLoc(GetOwningPlayer(u),UNIT_LOCUST_LIGHT_NODE,PolarProjectionBJ(GetUnitLoc(u), 100, 240),240.0)
    local unit u5=CreateUnitAtLoc(GetOwningPlayer(u),UNIT_LOCUST_LIGHT_NODE,PolarProjectionBJ(GetUnitLoc(u), 100, 300),300.0)
    local unit u6=CreateUnitAtLoc(GetOwningPlayer(u),UNIT_LOCUST_LIGHT_NODE,PolarProjectionBJ(GetUnitLoc(u), 100, 360),360.0)
    
    call SaveTimerHandle(udg_GameHash, GetHandleId(killTrigger), StringHash("timer"), t)
    
    call SaveUnitHandle(udg_GameHash, GetHandleId(t), StringHash("player"), u)    
    call SaveInteger(udg_GameHash, GetHandleId(t), StringHash("iterations"), 0)
    
    call SaveReal(udg_GameHash, GetHandleId(u), StringHash("X"),GetUnitX(u))
    call SaveReal(udg_GameHash, GetHandleId(u), StringHash("Y"),GetUnitY(u))
    
    call SaveUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node1"), u1)
    call SaveUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node2"), u2)    
    call SaveUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node3"), u3)    
    call SaveUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node4"), u4)    
    call SaveUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node5"), u5)
    call SaveUnitHandle(udg_GameHash, GetHandleId(u), StringHash("node6"), u6)

    
    //call SetHandleHandle(killTrigger, "timer", t)
    //call SetHandleHandle(t, "player", GetSpellAbilityUnit())
    //call SetHandleHandle(GetSpellAbilityUnit(), "node1", u1)
    //call SetHandleHandle(GetSpellAbilityUnit(), "node2", u2)
    //call SetHandleHandle(GetSpellAbilityUnit(), "node3", u3)
    //call SetHandleHandle(GetSpellAbilityUnit(), "node4", u4)
    //call SetHandleHandle(GetSpellAbilityUnit(), "node5", u5)
    //call SetHandleHandle(GetSpellAbilityUnit(), "node6", u6)
    //call SetHandleInt(t, "iterations", 0)
    //call SetHandleReal(t, "X", GetLocationX(GetUnitLoc(GetSpellAbilityUnit())))
    //call SetHandleReal(t, "Y", GetLocationY(GetUnitLoc(GetSpellAbilityUnit())))



    call TriggerRegisterUnitEvent( killTrigger, GetSpellAbilityUnit(), EVENT_UNIT_SPELL_ENDCAST )
    call TriggerAddCondition( killTrigger, Condition( function Trig_Light_Gate_Conditions ) )
    call TriggerAddAction( killTrigger, function killLightGate )

    call TimerStart(t, 0.05, true, function growLightGate)
    call PolledWait(40)
    call DestroyTimer(t)
    call DestroyTrigger(killTrigger)


endfunction

//===========================================================================
function InitTrig_Light_Gate takes nothing returns nothing
    set gg_trg_Light_Gate = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Light_Gate, Condition( function Trig_Light_Gate_Conditions ) )
    call TriggerAddAction( gg_trg_Light_Gate, function Trig_Light_Gate_Actions )
endfunction

//===========================================================================
