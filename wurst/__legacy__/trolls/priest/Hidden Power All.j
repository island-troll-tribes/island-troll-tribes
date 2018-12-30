
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
function Trig_Hidden_Power_All_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Hidden_Power_All_Actions takes nothing returns nothing
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
        call masterCastAtTarget(u,t,0,0,'A07I',"innerfire")
        call GroupRemoveUnit(g, t)
    endloop
    endif
endfunction

//===========================================================================
function InitTrig_Hidden_Power_All takes nothing returns nothing
    set gg_trg_Hidden_Power_All = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Hidden_Power_All, Condition( function Trig_Hidden_Power_All_Conditions ) )
    call TriggerAddAction( gg_trg_Hidden_Power_All, function Trig_Hidden_Power_All_Actions )
endfunction

//===========================================================================
