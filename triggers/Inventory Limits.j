
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
library InventoryItems initializer init requires SmokeHouse, PublicLibrary

    function EnforceInventoryItemLimits takes nothing returns nothing
        local item m= GetManipulatedItem()
        local unit u= GetManipulatingUnit()
        local item t
        local boolean bol1= checkTroll(GetManipulatingUnit())
        local boolean bol2= false
        local integer i= 0
        local integer a= 0
        local integer q= 0
        if not(udg_ITEM_LIMIT_MODE) then 
            return
        elseif bol1 then
            loop
                exitwhen i > 5
                set t=UnitItemInSlot(u, i)
                
                if ( m != t ) then
                
                    // ---- check for double stacking Smoked Meat
                    if (GetItemTypeId(m)==ITEM_SMOKED_MEAT and GetItemTypeId(t)==ITEM_SMOKED_MEAT) then
                        call UnitRemoveItem(u, m)
                    endif
                    
                    // ---- Checks for Spell Type Items ; Returns true if the item is
                    set bol1=checkSpell(t)
                    set bol2=checkSpell(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif
                    
                    // ---- Checks for Boot Type Items
                    set bol1=checkBoots(t)
                    set bol2=checkBoots(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif
                    
                    // ----
                    set bol1=checkCoat(t)
                    set bol2=checkCoat(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif
                    
                    // ----
                    set bol1=checkGloves(t)
                    set bol2=checkGloves(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif
                    
                    // ----
                    set bol1=checkAxeShield(t)
                    set bol2=checkAxeShield(m)
                    if bol1 and bol2 then
                        set q=0
                        loop
                            exitwhen q > 6
                            if checkAxeShield(UnitItemInSlot(u, q)) then
                                set a=a + 1
                            endif
                            if checkBattleSuit(UnitItemInSlot(u, q)) then
                                set a=a + 1
                            endif
                            if checkBattleAxe(UnitItemInSlot(u, q)) then
                                set a=a + 1
                            endif
                            set q=q + 1
                        endloop
                        if a > 2 then
                            call UnitRemoveItem(u, m)
                        endif
                    endif
                    
                    // ----
                    set bol1 = checkBaxeBshield(t)
                    set bol2 = checkBaxeBshield(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif
                    // ----
                    set bol1=checkPinion(t)
                    set bol2=checkPinion(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif
                endif
                set i=i + 1
            endloop
        endif
        
        set m=null
        set u=null
        set t=null
    endfunction
    
    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_PICKUP_ITEM)
        call TriggerAddAction(t, function EnforceInventoryItemLimits)
    endfunction
    
endlibrary
//===========================================================================
