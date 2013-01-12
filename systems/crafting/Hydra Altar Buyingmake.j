
//===========================================================================
//TESH.scrollpos=15
//TESH.alwaysfold=0
// AN EXAMPLE OF CONDITIONAL ACTION (WHICH IS FASTER THAN ACTION ITSELF)

function ReplaceConditon takes nothing returns boolean
local item array t
local integer array i  
local integer e = 0
local item added
    if GetItemTypeId(GetSoldItem()) == ITEM_HYDRA_HINT then
        call RemoveItem(GetSoldItem())
        call AddItemToStockBJ( ITEM_HYDRA_HINT , gg_unit_n019_0145, 1, 1 )
    endif
        loop
            set t[e] = UnitItemInSlot(gg_unit_n019_0145, e)
            exitwhen e > 2
            set i[e] = GetItemTypeId(t[e])
            set e = e + 1
        endloop
        
        if e > 1 then
            if i[0] == ITEM_HYDRA_SCALE and i[1] == ITEM_HYDRA_SCALE and i[2] == ITEM_HYDRA_SCALE then //coat slot 1 2 3 - first cos it cancels out
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                set added = CreateItem(ITEM_HARDEN_SCALES, GetUnitX(gg_unit_n019_0145), GetUnitY(gg_unit_n019_0145))
                call UnitAddItem(gg_unit_n019_0145, added)
            elseif i[0] == ITEM_HYDRA_SCALE and i[1] == ITEM_HYDRA_SCALE then //boots - slot 1 2
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                set added = CreateItem(ITEM_HYDRAAC_FINS, GetUnitX(gg_unit_n019_0145), GetUnitY(gg_unit_n019_0145))
                call UnitAddItem(gg_unit_n019_0145, added)
            elseif i[1] == ITEM_HYDRA_SCALE and i[2] == ITEM_HYDRA_SCALE then //gloves - slot 2 3
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                set added = CreateItem(ITEM_HYDRA_CLAWS, GetUnitX(gg_unit_n019_0145), GetUnitY(gg_unit_n019_0145))
                call UnitAddItem(gg_unit_n019_0145, added)
            endif
        set t[0] = null
        set t[1] = null
        set t[2] = null
        set added = null
        endif
    return false
endfunction

//===========================================================================
function InitTrig_hydra_altar_buyingmake takes nothing returns nothing
    set gg_trg_hydra_altar_buyingmake = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_hydra_altar_buyingmake, gg_unit_n019_0145, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_hydra_altar_buyingmake, function ReplaceConditon )
endfunction
//===========================================================================
