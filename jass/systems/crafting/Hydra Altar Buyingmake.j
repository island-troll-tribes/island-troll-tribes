
scope HydraRecipies initializer onInit

    function ReplaceConditon takes nothing returns boolean
        local item array t
        local boolean array b  
        local integer i = 0

        if GetItemTypeId(GetSoldItem()) == ITEM_HYDRA_HINT then
            call RemoveItem(GetSoldItem())
            call AddItemToStockBJ( ITEM_HYDRA_HINT , gg_unit_n019_0145, 1, 1 )
        
            loop
                exitwhen i > 2
                set t[i] = UnitItemInSlot(gg_unit_n019_0145, i)
                set b[i] = GetItemTypeId( t[i] ) == ITEM_HYDRA_SCALE
                set i = i + 1
            endloop
            
            if b[0] and b[1] and b[2] then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call UnitAddItem(gg_unit_n019_0145, CreateItem(ITEM_HARDEN_SCALES, GetUnitX(gg_unit_n019_0145), GetUnitY(gg_unit_n019_0145)) )
            elseif b[0] and b[1] then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItem(gg_unit_n019_0145, CreateItem(ITEM_HYDRAAC_FINS, GetUnitX(gg_unit_n019_0145), GetUnitY(gg_unit_n019_0145)) )
            elseif b[1] and b[2] then
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call UnitAddItem(gg_unit_n019_0145, CreateItem(ITEM_HYDRA_CLAWS, GetUnitX(gg_unit_n019_0145), GetUnitY(gg_unit_n019_0145)) )
            endif
            set t[0] = null
            set t[1] = null
            set t[2] = null
        endif

        return false
    endfunction

    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterUnitEvent( t, gg_unit_n019_0145, EVENT_UNIT_SELL_ITEM )
        call TriggerAddCondition( t, function ReplaceConditon )
    endfunction

endscope

