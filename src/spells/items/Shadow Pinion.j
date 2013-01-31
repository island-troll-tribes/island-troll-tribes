
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Shadow_Pinion_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == ITEM_DD_PINION_SHADOW ) ) then
        return false
    endif
    return true
endfunction

function darkPinTrigFunc takes nothing returns nothing
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(GetTriggeringTrigger()),StringHash("unit"))
    local timer t=LoadTimerHandle(udg_GameHash,GetHandleId(u),StringHash("darkPin"))
    call FlushChildHashtable(udg_GameHash,GetHandleId(t))
    call FlushChildHashtable(udg_GameHash,GetHandleId(GetTriggeringTrigger()))
    call DestroyTimer(t)
    call SetUnitVertexColorBJ( u, 100, 100, 100, 0 )
    call SetUnitMoveSpeed( u, GetUnitDefaultMoveSpeed(u) )
    call RemoveSavedHandle(udg_GameHash,GetHandleId(u),StringHash("darkPin"))
    set t=null
    set u=null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function darkPinionTimerFunc takes nothing returns nothing
    local real r=LoadReal(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("fade"))
    local unit u=LoadUnitHandle(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("unit"))
    
    call SetUnitVertexColorBJ( u, RMaxBJ(5,2*r-100), RMaxBJ(5,2*r-100), RMaxBJ(5,2*r-100), 100-r )
    
    if (GetUnitMoveSpeed(u)<=GetUnitDefaultMoveSpeed(u)) then
        call SetUnitMoveSpeed( u, GetUnitDefaultMoveSpeed(u)+10 )
    endif
    
    if(r<=75 and r>=50) then
        if (GetUnitMoveSpeed(u)<=500) then
            call SetUnitMoveSpeed( u, 1+GetUnitMoveSpeed(u) )
        endif
    elseif(r<50 and r>=30) then
        call AddHeroXPSwapped( 30, u, true )
    elseif(r<30 and r>=15) then
        call AddHeroXPSwapped( 60, u, true )
    elseif(r<15) then
        call AddHeroXPSwapped( 90, u, true )
    endif
    call SaveReal(udg_GameHash,GetHandleId(GetExpiredTimer()),StringHash("fade"),RMaxBJ(1,r-1))
    set u=null
endfunction

function Trig_Shadow_Pinion_Actions takes nothing returns nothing
    local timer t
    local trigger q
    local item i=GetManipulatedItem()
    local unit u=GetManipulatingUnit()
    if(checkTroll(u)==false) then
        set u=null
        return
    endif
    
    if(LoadTriggerHandle(udg_GameHash,GetHandleId(u),StringHash("darkPin"))==null) then
        call PolledWait( 1.00 )
        if(UnitHasItem(u, i)) then
            set q=CreateTrigger()
            set t=CreateTimer()
            call TriggerRegisterUnitEvent( q, u, EVENT_UNIT_DROP_ITEM )
            call TriggerAddCondition( q, Condition( function Trig_Shadow_Pinion_Conditions ) )
            call TriggerAddAction( q, function darkPinTrigFunc )
            call TimerStart(t, 45.0, true, function darkPinionTimerFunc)
            
            call SaveUnitHandle(udg_GameHash,GetHandleId(q),StringHash("unit"),u)
            call SaveTimerHandle(udg_GameHash,GetHandleId(u),StringHash("darkPin"),t)
            call SaveUnitHandle(udg_GameHash,GetHandleId(t),StringHash("unit"),u)
            call SaveReal(udg_GameHash,GetHandleId(t),StringHash("fade"),100)
        endif
    endif
    set q=null
    set t=null
    set i=null
    set u=null
    
endfunction

//===========================================================================
function InitTrig_Shadow_Pinion takes nothing returns nothing
    set gg_trg_Shadow_Pinion = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Shadow_Pinion, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_Shadow_Pinion, Condition( function Trig_Shadow_Pinion_Conditions ) )
    call TriggerAddAction( gg_trg_Shadow_Pinion, function Trig_Shadow_Pinion_Actions )
endfunction

//===========================================================================
