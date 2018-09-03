
//
//        call DisplayTextToForce( GetPlayersAll(), I2S(i) )
//===========================================================================
//TESH.scrollpos=174
//TESH.alwaysfold=0
function Trig_Dark_Gate_Conditions takes nothing returns boolean
    if ( not ( 'A076' == GetSpellAbilityId() ) ) then
        return false
    endif
    return true
endfunction

function darkCheck takes nothing returns boolean
     return (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) and IsUnitAliveBJ(GetFilterUnit())) and IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)==false
endfunction

function growGate takes nothing returns nothing
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

    call SaveInteger(udg_GameHash,GetHandleId(t),StringHash("iterations"),i)
endfunction


function darkGateSpell takes nothing returns nothing
    local timer t=GetExpiredTimer()
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(t),StringHash("player"))
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node5"))
    local unit u6=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node6"))
    
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    
    local location center=Location(X,Y)
    local integer i=ModuloInteger(LoadInteger(udg_GameHash,GetHandleId(t),StringHash("iterations")),6)+1
    local integer spellIndex=GetRandomInt(2,14)
    local real r=LoadReal(udg_GameHash,GetHandleId(u),StringHash("radius"))
    local unit Baddy
    set udg_parameterUnit=u
    set Baddy=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(r, center, Condition(function darkCheck)))


    if(Baddy!=null) then
    if(i==1) then
       call masterCastAtCaster(u1,Baddy,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectUnit("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl","origin",u1,1.5)
    elseif(i==2) then
       call masterCastAtCaster(u2,Baddy,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectUnit("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl","origin",u2,1.5)
    elseif(i==3) then
       call masterCastAtCaster(u3,Baddy,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectUnit("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl","origin",u3,1.5)
    elseif(i==4) then
       call masterCastAtCaster(u4,Baddy,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectUnit("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl","origin",u4,1.5)
    elseif(i==5) then
       call masterCastAtCaster(u5,Baddy,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectUnit("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl","origin",u5,1.5)
    elseif(i==6) then
       call masterCastAtCaster(u6,Baddy,0,0,udg_spells[spellIndex],udg_spellStrings[spellIndex])
       call AddTimedEffectUnit("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl","origin",u6,1.5)
    endif
    endif
    call SaveInteger(udg_GameHash,GetHandleId(t),StringHash("iterations"),i)
endfunction

function endDarkGate takes nothing returns nothing
    local timer t=LoadTimerHandle(udg_GameHash,GetHandleId(GetTriggeringTrigger()),StringHash("timer"))
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(t),StringHash("player"))
    local unit check=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune1"))

    call SetUnitUserData(u,0)
    if(check==null) then
       call FlushChildHashtable(udg_GameHash,GetHandleId(u))
    else
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node1"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node2"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node3"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node4"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node5"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node6"))
        call RemoveSavedReal(udg_GameHash,GetHandleId(u),StringHash("X"))
        call RemoveSavedReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    endif
    call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    call DestroyTimer(t)
    call FlushChildHashtable(udg_GameHash,GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function killGate takes nothing returns nothing
    local timer t=LoadTimerHandle(udg_GameHash,GetHandleId(GetTriggeringTrigger()),StringHash("timer"))
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(t),StringHash("player"))
    
    local unit u1=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node1"))
    local unit u2=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node2"))
    local unit u3=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node3"))
    local unit u4=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node4"))
    local unit u5=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node5"))
    local unit u6=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node6"))
    local unit check=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("rune1"))
    local trigger e
    local integer i=LoadInteger(udg_GameHash,GetHandleId(t),StringHash("iterations"))
    local timer t2= CreateTimer()

    if(i<=30) then
       call KillUnit( u1 )
       call KillUnit( u2 )
       call KillUnit( u3 )
       call KillUnit( u4 )
       call KillUnit( u5 )
       call KillUnit( u6 )
       if(check==null) then
           call FlushChildHashtable(udg_GameHash,GetHandleId(u))
       else
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node1"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node2"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node3"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node4"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node5"))
        call RemoveSavedHandle(udg_GameHash,GetHandleId(u), StringHash("node6"))
        call RemoveSavedReal(udg_GameHash,GetHandleId(u),StringHash("X"))
        call RemoveSavedReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
       endif
    else
       call UnitApplyTimedLifeBJ( 2+(i/8), 'BTLF', u1 )
       call UnitApplyTimedLifeBJ( 2.2+(i/8), 'BTLF', u2 )
       call UnitApplyTimedLifeBJ( 2.4+(i/8), 'BTLF', u3 )
       call UnitApplyTimedLifeBJ( 2.6+(i/8), 'BTLF', u4 )
       call UnitApplyTimedLifeBJ( 2.8+(i/8), 'BTLF', u5 )
       call UnitApplyTimedLifeBJ( 3+(i/8), 'BTLF', u6 )
      
        

       //call SetUnitUserData(GetSpellAbilityUnit(),L2I(Location(GetHandleReal( t,"X"),GetHandleReal( t,"Y"))))

       set e=CreateTrigger()

       call SaveTimerHandle(udg_GameHash,GetHandleId(e), StringHash("timer"), t2)
       call SaveInteger(udg_GameHash,GetHandleId(t2),StringHash("iterations"),0)
       call SaveUnitHandle(udg_GameHash,GetHandleId(t2), StringHash("player"), GetSpellAbilityUnit())
       call SaveReal(udg_GameHash,GetHandleId(u),StringHash("radius"),100+5*i)
       call TriggerRegisterUnitEvent( e, u1, EVENT_UNIT_DEATH )
       call TriggerAddAction( e, function endDarkGate )
       call TimerStart(t2, 2.4-(i/300.0), true, function darkGateSpell)

    endif

    call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    call DestroyTimer(t)
    call FlushChildHashtable(udg_GameHash,GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())

endfunction

function Trig_Dark_Gate_Actions takes nothing returns nothing
    local trigger killTrigger= CreateTrigger()
    local timer t= CreateTimer()
    local unit u = GetSpellAbilityUnit()
    local unit u1=CreateUnitAtLoc(GetOwningPlayer(GetSpellAbilityUnit()),UNIT_LOCUST_DARK_NODE,PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 100, 60),60.0)
    local unit u2=CreateUnitAtLoc(GetOwningPlayer(GetSpellAbilityUnit()),UNIT_LOCUST_DARK_NODE,PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 100, 120),120.0)
    local unit u3=CreateUnitAtLoc(GetOwningPlayer(GetSpellAbilityUnit()),UNIT_LOCUST_DARK_NODE,PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 100, 180),180.0)
    local unit u4=CreateUnitAtLoc(GetOwningPlayer(GetSpellAbilityUnit()),UNIT_LOCUST_DARK_NODE,PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 100, 240),240.0)
    local unit u5=CreateUnitAtLoc(GetOwningPlayer(GetSpellAbilityUnit()),UNIT_LOCUST_DARK_NODE,PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 100, 300),300.0)
    local unit u6=CreateUnitAtLoc(GetOwningPlayer(GetSpellAbilityUnit()),UNIT_LOCUST_DARK_NODE,PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 100, 360),360.0)

    call SaveTimerHandle(udg_GameHash,GetHandleId(killTrigger), StringHash("timer"), t)
    call SaveUnitHandle(udg_GameHash,GetHandleId(t), StringHash("player"), u)

    call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("node1"), u1)
    call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("node2"), u2)
    call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("node3"), u3)
    call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("node4"), u4)
    call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("node5"), u5)
    call SaveUnitHandle(udg_GameHash,GetHandleId(u), StringHash("node6"), u6)
    call SaveInteger(udg_GameHash,GetHandleId(t), StringHash("iterations"), 0)
    call SaveReal(udg_GameHash,GetHandleId(u), StringHash("X"), GetUnitX(u))
    call SaveReal(udg_GameHash,GetHandleId(u), StringHash("Y"), GetUnitY(u))



    call TriggerRegisterUnitEvent( killTrigger, GetSpellAbilityUnit(), EVENT_UNIT_SPELL_ENDCAST )
    call TriggerAddCondition( killTrigger, Condition( function Trig_Dark_Gate_Conditions ) )
    call TriggerAddAction( killTrigger, function killGate )

    call TimerStart(t, 0.05, true, function growGate)
    call PolledWait(40)
    call DestroyTimer(t)
    call DestroyTrigger(killTrigger)


endfunction

//===========================================================================
function InitTrig_Dark_Gate takes nothing returns nothing
    set gg_trg_Dark_Gate = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Dark_Gate, Condition( function Trig_Dark_Gate_Conditions ) )
    //call TriggerAddAction( gg_trg_Dark_Gate, function Trig_Dark_Gate_Actions )
endfunction

//===========================================================================
