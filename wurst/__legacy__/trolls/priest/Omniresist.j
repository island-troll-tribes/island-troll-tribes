
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Omniresist_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02J' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Omniresist_Actions takes nothing returns nothing
    local unit u=GetSpellAbilityUnit()
    local unit test=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node1"))
    local group g
    local unit t
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    
    if(test!=null and DistanceBetweenPoints(Location(X,Y),GetUnitLoc(u))<=LoadReal(udg_GameHash,GetHandleId(u),StringHash("radius"))) then
      set udg_parameterUnit=u
      set g=GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function presCheck))
loop
    set t = FirstOfGroup(g)
    exitwhen t == null

    call masterCastAtTarget(u,t,0,0,'A02J',"antimagicshell")
    call GroupRemoveUnit(g, t)
endloop
endif
endfunction

//===========================================================================
function InitTrig_Omniresist takes nothing returns nothing
    set gg_trg_Omniresist = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Omniresist, Condition( function Trig_Omniresist_Conditions ) )
    call TriggerAddAction( gg_trg_Omniresist, function Trig_Omniresist_Actions )
endfunction

//===========================================================================
