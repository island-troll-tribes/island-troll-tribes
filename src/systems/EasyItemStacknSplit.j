
//===========================================================================
//TESH.scrollpos=64
//TESH.alwaysfold=0
//=====================================================================================
// Easy Item Stack 'n Split v2.7.4
//  by Dangerb0y
//=====================================================================================
library EasyItemStacknSplit initializer onInit requires Stackables, ID
//=====================================================================================
//
// This system adds some much needed item stacking, item splitting, and full inventory
// functionality to Warcraft III.
//
// A couple of useful functions are also included...
//
// - UnitInventoryFull( unit )
//     Returns true if all of a unit's inventory slots are occupied, else false.
//
// - UnitStackItem( unit, item )
//     Works like UnitAddItem(), but will try to stack items even if inventory is full.
//     If excess items from an item stack are dropped, returns the item, else null.
//
//=====================================================================================
// SYSTEM PARAMETERS
//=====================================================================================
globals
    // Allow item splitting with double right-click?
    private boolean SPLIT = true
    
    // Amount to split from stack... (0 = half)
    private integer SPLIT_SIZE = 1
    
    // Allow consecutively split items to stack together?
    private boolean SPLIT_STACK = true
    private real SPLIT_STACK_DELAY = 2.00
    
    // Allow split items to be dropped if no inventory slots are open?
    private boolean SPLIT_DROP = true
    
    // Use item stack array to determine stack limit? (false = unlimited stacks)
    private boolean USE_ITEM_STACK_TABLE = true
    
    // Full inventory error sound filename... (null = disabled)
    private string ERROR_SOUND = null
endglobals
//=====================================================================================
// DO NOT EDIT BELOW THIS LINE
//=====================================================================================

    globals
        private unit array tu
        private unit array su
        private item array ti
        private item array si
        private item array sii
        private real array sc
        private integer tt = 0
        private integer st = 0
        private timer t = CreateTimer()
    endglobals

    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // PUBLIC FUNCTION : GetItemStackCount( unit )
    //  Checks table to see if item stacks
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    function IsItemStackable takes item i returns boolean
        return stackables.has(GetItemTypeId(i))
    endfunction

    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // PUBLIC FUNCTION : GetItemStackCount( unit )
    //  Access a table to find out stackability of item
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    function GetItemStackCount takes item i returns integer i
        if IsItemStackable(i) then
            return stackables[GetItemTypeId(i)]
        endif
        return 1
    endfunction
    
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // PUBLIC FUNCTION : UnitInventoryFull( unit )
    //  Checks if all the inventory slots of a unit are occupied.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    function UnitInventoryFull takes unit u returns boolean
        local integer is = UnitInventorySize( u )
        local integer s = 0
        loop
            exitwhen s >= is
            if UnitItemInSlot(u, s) == null then
                return false
            endif
            set s = s + 1
        endloop
        return true
    endfunction
    
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // PUBLIC FUNCTION : UnitStackItemEx( unit, item, dropExcess )
    //  Works like UnitAddItem() with full inventory functionality.
    //  Returns true if excess items are dropped. Otherwise false.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    function UnitStackItemEx takes unit u, item i, boolean dropExcess returns boolean
        local integer ic = GetItemCharges( i )
        local integer is
        local integer il
        local integer it
        local item ii
        local integer iic
        local integer s = 0
        local real px
        local real py
        local real ua
        local boolean inventoryFull
        // Check if the item is a powerup
        if IsItemPowerup( i ) then
            return false
        endif
        // Make sure the item has charges
        if ic <= 0 or not IsItemStackable( i ) then
            set inventoryFull = UnitInventoryFull( u )
            // If not we just give it to the unit
            if dropExcess or not inventoryFull then
                call DisableTrigger( gg_trg_EasyItemStacknSplit )
                call UnitAddItem( u, i )
                call EnableTrigger( gg_trg_EasyItemStacknSplit )
                return not inventoryFull
            else
                call RemoveItem( i )
                return false
            endif
        else
            // Set vars
            set is = UnitInventorySize( u )
            set il = GetItemStackCount( i )
            set it = GetItemTypeId( i )
			if (UnitHasBuffBJ(u, 'Bapl') == true and it == ITEM_COOKED_MEAT ) then
		        set it = ITEM_DISEASED_MEAT
			endif
            // We can remove the item, we have all the data we need from it
            call RemoveItem( i )
            // Look for items of the same type and try stack onto them
            loop
                set ii = UnitItemInSlot( u, s )
                set iic = GetItemCharges( ii )
                if ii != null and (not USE_ITEM_STACK_TABLE or iic < il) and GetItemTypeId(ii) == it then
                    if USE_ITEM_STACK_TABLE and il > 0 and iic + ic > il then
                        call SetItemCharges( ii, il )
                        set ic = iic + ic - il
                    else
                        call SetItemCharges( ii, iic + ic )
                        set ic = 0
                    endif
                endif
                set s = s + 1
                exitwhen ic <= 0 or s >= is
            endloop
            // If there are any charges left over, look for open slots
            if ic > 0 then
                set px = GetUnitX( u )
                set py = GetUnitY( u )
                set s = 0
                loop
                    set ii = UnitItemInSlot( u, s )
                    if ii == null then
                        set ii = CreateItem( it, px, py )
                        if USE_ITEM_STACK_TABLE and il > 0 and ic > il then
                            call SetItemCharges( ii, il )
                            set ic = ic - il
                        else
                            call SetItemCharges( ii, ic )
                            set ic = 0
                        endif
                        call DisableTrigger( gg_trg_EasyItemStacknSplit )
                        call UnitAddItem( u, ii )
                        call EnableTrigger( gg_trg_EasyItemStacknSplit )
                    endif
                    set s = s + 1
                    exitwhen ic <= 0 or s >= is
                endloop
                // If there are still charges left over, drop them on the ground
                if ic > 0 and dropExcess then
                    set ua = GetUnitFacing( u )
                    set px = GetUnitX( u ) + 100 * Cos( ua * bj_DEGTORAD )
                    set py = GetUnitY( u ) + 100 * Sin( ua * bj_DEGTORAD )
                    loop
                        if ic > il then
                            set iic = il
                            set ic = ic - il
                        else
                            set iic = ic
                            set ic = 0
                        endif
                        set ii = CreateItem( it, px, py )
                        call SetItemCharges( ii, iic )
                        exitwhen ic <= 0
                    endloop
                    return true
                endif
            endif
        endif
        // Nothing dropped
        return false
    endfunction
    
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // PUBLIC FUNCTION : UnitStackItem( unit, item )
    //  Works like UnitAddItem() with full inventory functionality.
    //  Returns true if excess items are dropped. Otherwise false.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    function UnitStackItem takes unit u, item i returns boolean
        return UnitStackItemEx(u, i, true)
    endfunction
    
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // TEXTMACRO : EasyItemStacknSplit_PLAYITEMSOUND( soundname, unitvar )
    //  Plays item sound for player if the triggering unit is nearby.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //! textmacro EasyItemStacknSplit_PLAYITEMSOUND takes FILENAME
        set str = "Sound\\Interface\\$FILENAME$.wav"
        if GetLocalPlayer() != p then
            set str = ""
        endif
        set snd = CreateSound( str, false, true, false, 12700, 12700, "" )
        call AttachSoundToUnit( snd, u )
        call SetSoundVolume( snd, 75 )
        call SetSoundDistances( snd, 600.0, 1024.0 )
        call SetSoundDistanceCutoff( snd, 1536.0 )
        call StartSound( snd )
        call KillSoundWhenDone( snd )
    //! endtextmacro

    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // CONTROLLER : TimerController
    //  EVENTS : Global Timer (t) expires (periodically, 0.05)
    //  Runs through full-stack and split-stack queues, and works its magic.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    private function TimerController takes nothing returns nothing
        local unit u
        local item i
        local item ii
        local integer x = 0
        local integer o
        local real px
        local real py
        local player p
        local string str
        local sound snd
        // Run through full-stack queue
        if tt > 0 then
            loop
                set u = tu[x]
                set i = ti[x]
                if u != null and i != null and not IsItemOwned(i) and GetWidgetLife(i) > 0 and GetWidgetLife(u) > 0 then
                    set o = GetUnitCurrentOrder( u )
                    set px = GetItemX( i ) - GetUnitX( u )
                    set py = GetItemY( i ) - GetUnitY( u )
                    if px * px + py * py <= 22500 or o != 851986 then
                        if o == 851986 then
                            set p = GetOwningPlayer( u )
                            // Play the "Item Get" sound
                            //! runtextmacro EasyItemStacknSplit_PLAYITEMSOUND( "PickUpItem" )
                            call IssueImmediateOrder( u, "stop" )
                            call SetUnitFacing( u, bj_RADTODEG * Atan2(GetItemY(i) - GetUnitY(u), GetItemX(i) - GetUnitX(u)) )
                            if UnitStackItem(u, i) then
                                // Play the "Item Drop" sound
                                //! runtextmacro EasyItemStacknSplit_PLAYITEMSOUND( "HeroDropItem1" )
                            endif
                        endif
                        set tt = tt - 1
                        if tt > 0 then
                            set tu[x] = tu[tt]
                            set ti[x] = ti[tt]
                            set x = x - 1
                        endif
                    endif
                elseif u != null or i != null then
                    call IssueImmediateOrder( u, "stop" )
                    set tt = tt - 1
                    if tt > 0 then
                        set tu[x] = tu[tt]
                        set ti[x] = ti[tt]
                        set x = x - 1
                    endif
                endif
                set x = x + 1
                exitwhen x >= tt
            endloop
        endif
        // Run through split-stack queue
        if SPLIT_STACK and st > 0 then
            set x = 0
            loop
                set u = su[x]
                set i = si[x]
                set ii = sii[x]
                set px = sc[x]
                if u != null and i != null and ii != null and px > 0 and UnitHasItem(u, i) and UnitHasItem(u, ii) then
                    set sc[x] = px - 0.05
                else
                    set st = st - 1
                    if st > 0 then
                        set su[x] = su[st]
                        set si[x] = si[st]
                        set sii[x] = sii[st]
                        set sc[x] = sc[st]
                        set x = x - 1
                    endif
                endif
                set x = x + 1
                exitwhen x >= st
            endloop
        endif
        // Pause timer if not needed
        if tt <= 0 and (not SPLIT_STACK or st <= 0) then
            call PauseTimer( t )
        endif
        set u = null
        set i = null
        set p = null
        set snd = null
    endfunction

    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // CONTROLLER : CancelController
    //  EVENTS : Unit Targets Point
    //  Flushes trigger-unit and target-item from timer queue.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    private function CancelController takes nothing returns boolean
        local integer x = 0
        if tt > 0 then
            loop
                if tu[x] == GetTriggerUnit() and (GetOrderPointX() != GetItemX(ti[x]) or GetOrderPointY() != GetItemY(ti[x])) then
                    set tt = tt - 1
                    if tt > 0 then
                        set tu[x] = tu[tt]
                        set ti[x] = ti[tt]
                        set x = x - 1
                    elseif not SPLIT_STACK or st <= 0 then
                        call PauseTimer( t )
                    endif
                endif
                set x = x + 1
                exitwhen x >= tt
            endloop
        endif
        return false
    endfunction

    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // CONTROLLER : ActionController
    //  EVENTS : Unit Acquires Item, Unit Targets Object
    //  Main system controller. Determines unit order and runs actions accordingly.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    private function ActionController takes nothing returns boolean
        local item i = GetOrderTargetItem()
        local integer o = GetIssuedOrderId()
        local unit u
        local player p
        local item ii
        local integer is
        local integer iis
        local integer s
        local integer ss
        local boolean full
        local real ua
        local string str
        local sound snd
        if i == null then
            set i = GetManipulatedItem()
        endif
        set s = GetItemCharges( i )
        if i != null and (o == 851971 or (s > 0 and (o == 0 or (o > 852001 and o < 852008)))) then
            set u = GetTriggerUnit()
            set is = UnitInventorySize( u )
            if is > 0 then
                if o > 852001 and o < 852008 then
                    // The item is being moved to another inventory slot
                    if UnitHasItem(u, i) then
                        set o = o - 852002
                        set ii = UnitItemInSlot( u, o )
                        if GetItemTypeId(ii) == GetItemTypeId(i) then
                            if ii == i then
                                // Split items
                                if SPLIT and IsItemStackable(i) then
                                    set full = UnitInventoryFull( u )
                                    if s > 1 and (SPLIT_DROP or not full) then
                                        if SPLIT_SIZE > 0 then
                                            if SPLIT_SIZE >= s then
                                                set ss = s - 1
                                            else
                                                set ss = SPLIT_SIZE
                                            endif
                                        else
                                            set ss = s / 2
                                        endif
                                        call SetItemCharges( i, s - ss )
                                        if SPLIT_STACK then
                                            set ii = null
                                            if st > 0 then
                                                set o = 0
                                                loop
                                                    if u == su[o] then
                                                        set ii = sii[o]
                                                        set iis = GetItemCharges( ii )
                                                        set s = GetItemStackCount( ii )
                                                        exitwhen true
                                                    endif
                                                    set o = o + 1
                                                    exitwhen o >= st
                                                endloop
                                            endif
                                        endif
                                        if SPLIT_STACK and ii != null and ii != i and si[o] == i and (not USE_ITEM_STACK_TABLE or s == 0 or iis < s) and UnitHasItem(u, ii) and GetItemTypeId(ii) == GetItemTypeId(i) then
                                            call SetItemCharges( ii, iis + ss )
                                            set sc[o] = SPLIT_STACK_DELAY
                                        else
                                            set ua = GetUnitFacing( u )
                                            set ii = CreateItem( GetItemTypeId(i), GetUnitX(u) + 100 * Cos(ua * bj_DEGTORAD), GetUnitY(u) + 100 * Sin(ua * bj_DEGTORAD) )
                                            call SetItemCharges( ii, ss )
                                            if not full then
                                                call DisableTrigger( gg_trg_EasyItemStacknSplit )
                                                call UnitAddItem( u, ii )
                                                call EnableTrigger( gg_trg_EasyItemStacknSplit )
                                                if SPLIT_STACK then
                                                    set o = 0
                                                    if st > 0 then
                                                        loop
                                                            if su[o] == u then
                                                                set si[o] = i
                                                                set sii[o] = ii
                                                                set sc[o] = SPLIT_STACK_DELAY
                                                                set o = -1
                                                            else
                                                                set o = o + 1
                                                            endif
                                                            exitwhen o >= st or o == -1
                                                        endloop
                                                    endif
                                                    if o >= 0 then
                                                        if st == 0 then
                                                            call TimerStart( t, 0.05, true, function TimerController )
                                                        endif
                                                        set su[st] = u
                                                        set si[st] = i
                                                        set sii[st] = ii
                                                        set sc[st] = SPLIT_STACK_DELAY
                                                        set st = st + 1
                                                    endif
                                                endif
                                            else
                                                // Play the "Item Drop" sound
                                                set p = GetOwningPlayer( u )
                                                //! runtextmacro EasyItemStacknSplit_PLAYITEMSOUND( "HeroDropItem1" )                                          
                                            endif
                                        endif
                                    endif
                                endif
                            else
                                // Stack items
                                set is = GetItemStackCount( i )
                                set iis = GetItemCharges( ii )
                                if USE_ITEM_STACK_TABLE and is > 0 and iis + s > is then
                                    if o < is and iis < GetItemStackCount(ii) then
                                        call SetItemCharges( ii, iis + s - is )
                                        call SetItemCharges( i, is )
                                    endif
                                else
                                    call SetItemCharges( ii, iis + s )
                                    call RemoveItem( i )
                                endif
                            endif
                        endif
                    endif
                elseif o == 851971 then
                    if UnitInventoryFull(u) then
                        // The item is being targeted with a full inventory so we add it to the timer queue
                        set o = GetItemStackCount( i )
                        set iis = GetItemTypeId( i )
                        set s = 0
                        loop
                            set ii = UnitItemInSlot( u, s )
                            if ii != i and ((GetItemTypeId(ii) == iis) or (iis == ITEM_COOKED_MEAT and GetItemTypeId(ii) == ITEM_DISEASED_MEAT and UnitHasBuffBJ( u, 'Bapl'))) and (not USE_ITEM_STACK_TABLE or o == 0 or GetItemCharges(ii) < o) then
                                set s = is + 1
                            else
                                set s = s + 1
                            endif
                            exitwhen s >= is
                        endloop
                        if s > is and GetItemCharges(i) > 0 then
                            set s = 0
                            if tt > 0 then
                                loop
                                    if tu[s] == u then
                                        set ti[s] = i
                                        set s = -1
                                    else
                                        set s = s + 1
                                    endif
                                    exitwhen s >= tt or s == -1
                                endloop
                            endif
                            if s >= 0 then
                                if tt == 0 then
                                    call TimerStart( t, 0.05, true, function TimerController )
                                endif
                                set tu[tt] = u
                                set ti[tt] = i
                                set tt = tt + 1
                            endif
                            call IssuePointOrder( u, "move", GetItemX(i), GetItemY(i) )
                        else
                            // Full inventory error
                            call IssueImmediateOrder( u, "stop" )
                            set p = GetOwningPlayer( u )
                            // Play error sound
                            if ERROR_SOUND != null and ERROR_SOUND != "" then
                                set str = ERROR_SOUND
                                if GetLocalPlayer() != p then
                                    set str = ""
                                endif
                                set snd = CreateSound( str, false, false, false, 12700, 12700, "" )
                                call SetSoundVolume( snd, 127 )
                                call StartSound( snd )
                                call KillSoundWhenDone( snd )
                            endif
                        endif
                    endif
                else
                    // The item is being acquired so we stack it
                    if UnitStackItem(u, i) then
                        // Play the "Item Drop" sound
                        set p = GetOwningPlayer( u )
                        //! runtextmacro EasyItemStacknSplit_PLAYITEMSOUND( "Sound\\Interface\\HeroDropItem1.wav" )
                    endif
                endif
            endif
        endif
        set u = null
        set p = null
        set i = null
        set ii = null
        set snd = null
        return false
    endfunction

    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // CONTROLLER : PreloadController
    //  EVENTS : Game Time Elapsed = 0.00
    //  Preloads sound files so that they play the first time around.
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    private function PreloadController takes nothing returns boolean
        local string array str
        local sound snd
        local integer x = 0
        set str[0] = "Sound\\Interface\\PickUpItem.wav"
        set str[1] = "Sound\\Interface\\HeroDropItem1.wav"
        if ERROR_SOUND != null and ERROR_SOUND != "" then
            set str[2] = ERROR_SOUND
        endif
        loop
            exitwhen str[x] == null
            set snd = CreateSound( str[x], false, false, false, 12700, 12700, "" )
            call SetSoundVolume( snd, 0 )
            call StartSound( snd )
            call KillSoundWhenDone( snd )
            set x = x + 1
        endloop
        set snd = null
        call DestroyTrigger( GetTriggeringTrigger() )
        return false
    endfunction

    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // TRIGGER INITIALIZER
    //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    private function onInit takes nothing returns nothing
        local trigger CancelTrigger = CreateTrigger()
        local trigger PreloadTrigger = CreateTrigger()
        local integer x = 0
        set gg_trg_EasyItemStacknSplit = CreateTrigger()
        loop
            call TriggerRegisterPlayerUnitEvent( gg_trg_EasyItemStacknSplit, Player(x), EVENT_PLAYER_UNIT_PICKUP_ITEM, null )
            call TriggerRegisterPlayerUnitEvent( gg_trg_EasyItemStacknSplit, Player(x), EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER, null )
            call TriggerRegisterPlayerUnitEvent( CancelTrigger, Player(x), EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, null )
            set x = x + 1
            exitwhen x >= bj_MAX_PLAYER_SLOTS
        endloop
        call TriggerRegisterTimerEvent( PreloadTrigger, 0.00, false )
        call TriggerAddCondition( gg_trg_EasyItemStacknSplit, function ActionController )
        call TriggerAddCondition( CancelTrigger, function CancelController )
        call TriggerAddCondition( PreloadTrigger, function PreloadController )
        call TriggerAddCondition( PreloadTrigger, function InitStackables )
    endfunction

endlibrary//===========================================================================
