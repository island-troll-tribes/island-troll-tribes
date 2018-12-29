
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TeleThief_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetManipulatingUnit(), 'B00K') == true ) ) then
        return false
    endif
    return true
endfunction

function teleThiefCheck1 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function teleThiefCheck2 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) == true )
endfunction

function teleThiefCheck takes nothing returns boolean
    return GetBooleanAnd( teleThiefCheck1(), teleThiefCheck2() )
endfunction

function Trig_TeleThief_Actions takes nothing returns nothing
    local unit a=GetManipulatingUnit()
    local unit b
    local group q
    //if(I2U(GetUnitUserDataEx(a))!=null) then
    if (LoadUnitHandle(udg_GameHash, GetHandleId(a), StringHash("fire")) != null ) then
       //set b=I2U(GetUnitUserDataEx(a))
       set b = LoadUnitHandle(udg_GameHash, GetHandleId(a), StringHash("fire"))
       if(UnitHasBuffBJ(b, 'B00I')==false) then
           call UnitRemoveBuffBJ( 'B00K', a )
           //call SetUnitUserDataEx( a, 0 )
           call RemoveSavedHandle(udg_GameHash, GetHandleId(a), StringHash("fire"))
           //call SaveUnitHandle(udg_GameHash, GetHandleId(a), StringHash("fire"), null)
       else
//start
           set udg_parameterUnit=a
           set q=GetUnitsInRangeOfLocMatching(600, GetUnitLoc(a), Condition(function teleThiefCheck))
            
           if(FirstOfGroup(q)!=null) then
           call SetItemPositionLoc( GetManipulatedItem(), GetUnitLoc(b) )
           endif
//end
       endif
    else
    call UnitRemoveBuffBJ( 'B00K', a )
    //call SetUnitUserDataEx( a, 0 )
    call RemoveSavedHandle(udg_GameHash, GetHandleId(a), StringHash("fire"))
    endif
endfunction

//===========================================================================
function InitTrig_TeleThief takes nothing returns nothing
    set gg_trg_TeleThief = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_TeleThief, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_TeleThief, Condition( function Trig_TeleThief_Conditions ) )
    call TriggerAddAction( gg_trg_TeleThief, function Trig_TeleThief_Actions )
endfunction

//===========================================================================
