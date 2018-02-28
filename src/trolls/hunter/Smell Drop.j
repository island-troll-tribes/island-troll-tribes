
//
// This sets up tracker sniff. A reference to the troll is stored in the items custom data slot
//===========================================================================
//TESH.scrollpos=18
//TESH.alwaysfold=0
function Smell_Condition takes nothing returns boolean
    return IsUnitTroll(GetManipulatingUnit()) and TRACKER_PRESENT
endfunction

function clearSmell takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local item i = LoadItemHandle(udg_GameHash,GetHandleId(t),StringHash("sniff"))
    
    if (LoadInteger(udg_GameHash,GetHandleId(i),StringHash("count")) > 1 ) then
        call SaveInteger(udg_GameHash, GetHandleId(i), StringHash("count"), LoadInteger(udg_GameHash,GetHandleId(i),StringHash("count"))-1)
    else
        call SaveInteger(udg_GameHash, GetHandleId(GetManipulatedItem()), StringHash("count"), 0 )
        call RemoveSavedHandle(udg_GameHash, GetHandleId(i), StringHash("sniff"))
    endif
    
    call RemoveSavedHandle(udg_GameHash, GetHandleId(t), StringHash("sniff"))
    call ReleaseTimer(t)
    set i = null
    set t = null
endfunction

function Trig_Smell_Drop_Actions takes nothing returns nothing
    local timer t = NewTimer()
    local item i = GetManipulatedItem()
    
    if (HaveSavedHandle(udg_GameHash,GetHandleId(i),StringHash("sniff"))) then
        call SaveUnitHandle(udg_GameHash, GetHandleId(i), StringHash("sniff"),GetManipulatingUnit())
        call SaveInteger(udg_GameHash, GetHandleId(i), StringHash("count"), LoadInteger(udg_GameHash,GetHandleId(i),StringHash("count"))+1)
    else
        call SaveUnitHandle(udg_GameHash, GetHandleId(i), StringHash("sniff"),GetManipulatingUnit())
    endif
    
    call SaveItemHandle(udg_GameHash, GetHandleId(t), StringHash("sniff"), i)
    call TimerStart(t,300,false, function clearSmell)
    
    set i = null
    set t = null
endfunction

globals
    boolean TRACKER_PRESENT = false
endglobals
//===========================================================================
function InitTrig_Smell_Drop takes nothing returns nothing
    local integer i = 0
    set gg_trg_Smell_Drop = CreateTrigger(  )
    loop
        exitwhen i >= bj_MAX_PLAYERS
        call TriggerRegisterPlayerUnitEvent(gg_trg_Smell_Drop, Player(i), EVENT_PLAYER_UNIT_PICKUP_ITEM, null)
        call TriggerRegisterPlayerUnitEvent(gg_trg_Smell_Drop, Player(i), EVENT_PLAYER_UNIT_DROP_ITEM, null)
        call TriggerAddCondition(gg_trg_Smell_Drop, function Smell_Condition)
        set i = i + 1
    endloop
    call TriggerAddAction( gg_trg_Smell_Drop, function Trig_Smell_Drop_Actions )
endfunction//===========================================================================
