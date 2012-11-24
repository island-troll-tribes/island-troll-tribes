
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
/*
    Pick and Drop events are unreliable -- so this completely checks if item is present in the unit's inventory.
*/

function FilteredItems takes nothing returns boolean
    return GetItemTypeId(GetManipulatedItem()) == ITEM_CLOAK_OF_FROST or GetItemTypeId(GetManipulatedItem()) == ITEM_CLOAK_OF_HEALING or GetItemTypeId(GetManipulatedItem()) == ITEM_BATTLE_SHIELD
endfunction

function ItemFilterSpecific takes nothing returns nothing
    local unit u = GetEnumUnit()
    local integer i = 0
    local item it
    local integer pid = GetPlayerId(GetOwningPlayer(u))
    //if checkTroll(GetEnumUnit()) then
        set BATTLE_SHIELD_NUMBER[pid] = 0
        set frostar[pid] = false
        set healar[pid] = false
        loop
            set it = UnitItemInSlot(u,i)
            if it != null then
                if GetItemTypeId(it) == ITEM_CLOAK_OF_FROST then
                    set frostar[pid] = true
                endif
                if GetItemTypeId(it) == ITEM_CLOAK_OF_HEALING then
                    set healar[pid] = true
                    if not IsUnitInGroup(u, healGroup) then
                        call GroupAddUnit(healGroup, u)
                        call TriggerRegisterUnitEvent( trighealhit, u, EVENT_UNIT_DAMAGED )
                    endif
                endif
                if GetItemTypeId(it) == ITEM_BATTLE_SHIELD then
                    set BATTLE_SHIELD_NUMBER[pid] = BATTLE_SHIELD_NUMBER[pid] + 1
                endif
            endif
            exitwhen i >= 5
            set i = i + 1
        endloop
        if BATTLE_SHIELD_NUMBER[pid] > 0 then
            call UnitAddAbility(u,'A09U')
            call SetPlayerAbilityAvailable(GetOwningPlayer(u), 'A09U', false)
        else
            call UnitRemoveAbility(u,'A09U')
        endif
        set u = null
        //return GetItemTypeId(it) == ITEM_CLOAK_OF_FROST or GetItemTypeId(it) == ITEM_BATTLE_SHIELD
    //endif
    //return false
endfunction

function ItemGroupLoop takes nothing returns nothing
    local eventid ev = GetTriggerEventId()
    if ev == EVENT_PLAYER_UNIT_DROP_ITEM then
        call TriggerSleepAction(0)
    endif
    //call GroupEnumUnitsInRect(pick_dropgroup,bj_mapInitialPlayableArea,Condition(function ItemFilterSpecific))
    call ForGroup(udg_trolls, function ItemFilterSpecific)
endfunction

globals
integer array BATTLE_SHIELD_NUMBER
group pick_dropgroup = CreateGroup()
endglobals

//===========================================================================
function InitTrig_pickdrop_2 takes nothing returns nothing
    set gg_trg_pickdrop_2 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_pickdrop_2, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_pickdrop_2, EVENT_PLAYER_UNIT_DROP_ITEM )
    call TriggerAddCondition( gg_trg_pickdrop_2, Condition( function FilteredItems ) )
    call TriggerAddAction( gg_trg_pickdrop_2, function ItemGroupLoop )
endfunction

//===========================================================================
