
library InventoryItems initializer init requires PublicLibrary

    function EnforceInventoryItemLimits takes nothing returns nothing
        local integer i = 0
        local integer a = 0
        local integer q = 0
        local item t
        local item m = GetManipulatedItem()
        local unit u = GetManipulatingUnit()
        local boolean bol1 = IsUnitTroll(GetManipulatingUnit())
        local boolean bol2 = false
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
                    set bol1=IsItemSpell(t)
                    set bol2=IsItemSpell(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif

                    // ---- Checks for Boot Type Items
                    set bol1=IsItemBoots(t)
                    set bol2=IsItemBoots(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif

                    // ----
                    set bol1=IsItemCoat(t)
                    set bol2=IsItemCoat(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif

                    // ----
                    set bol1=IsItemGloves(t)
                    set bol2=IsItemGloves(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                    endif

                    // ----
                    set bol1=IsItemAnyShield(t)
                    set bol2=IsItemAnyShield(m)
                    if bol1 and bol2 then
                        call UnitRemoveItem(u, m)
                        exitwhen true
                    endif

                    // ----
                    set bol1=IsItemAxeOrShield(t)
                    set bol2=IsItemAxeOrShield(m)
                    if bol1 and bol2 then
                        set q=0
                        loop
                            exitwhen q > 6
                            if IsItemAxeOrShield(UnitItemInSlot(u, q)) then
                                set a=a + 1
                            endif
                            if GetItemTypeId(UnitItemInSlot(u, q)) == ITEM_BATTLE_SUIT then
                                set a=a + 1
                            endif
                            if GetItemTypeId(UnitItemInSlot(u, q)) == ITEM_BATTLE_AXE then
                                set a=a + 1
                            endif
                            if GetItemTypeId(UnitItemInSlot(u, q)) == ITEM_BATTLE_SPEAR then
                                set a=a + 1
                            endif
                            set q=q + 1
                        endloop
                        if a > 2 then
                            call UnitRemoveItem(u, m)
                        endif
                    endif

                    // ----
                    if (GetItemTypeId(t) == ITEM_BATTLE_SHIELD or GetItemTypeId(t) == ITEM_BATTLE_AXE) and (GetItemTypeId(m) == ITEM_BATTLE_SHIELD or GetItemTypeId(m) == ITEM_BATTLE_AXE) then
                        call UnitRemoveItem(u, m)
                    endif
                    // ----
                    set bol1=IsItemPinion(t)
                    set bol2=IsItemPinion(m)
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
