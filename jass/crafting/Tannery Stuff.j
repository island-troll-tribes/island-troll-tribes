
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_tannery_stuff_Actions takes nothing returns nothing
local integer spid = GetSpellAbilityId()
local item array t
local integer array i  
local integer e = 0
local item added
local unit spellu = GetSpellAbilityUnit()
    loop
        set t[e] = UnitItemInSlot(GetTriggerUnit(), e)
        exitwhen e > 5 or t[e] == null
        set i[e] = GetItemTypeId(t[e])
        set e = e + 1
    endloop
    if spid == 'A00C' then //boots
        if i[0] == ITEM_ELK_HIDE and i[1] == ITEM_ELK_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_ELK_SKIN_BOOTS, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        elseif i[0] == ITEM_JUNGLE_WOLF_HIDE and i[1] == ITEM_JUNGLE_WOLF_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_WOLF_SKIN_BOOTS, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        elseif i[0] == ITEM_JUNGLE_BEAR_HIDE and i[1] == ITEM_JUNGLE_BEAR_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_BEAR_SKIN_BOOTS, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        endif
    elseif spid == 'A00E' then //gloves
        if i[0] == ITEM_ELK_HIDE and i[1] == ITEM_ELK_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_ELK_SKIN_GLOVES, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        elseif i[0] == ITEM_JUNGLE_WOLF_HIDE and i[1] == ITEM_JUNGLE_WOLF_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_WOLF_SKIN_GLOVES, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        elseif i[0] == ITEM_JUNGLE_BEAR_HIDE and i[1] == ITEM_JUNGLE_BEAR_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_BEAR_SKIN_GLOVES, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        endif
    elseif spid == 'A00D' then //coats
        if i[0] == ITEM_ELK_HIDE and i[1] == ITEM_ELK_HIDE and i[2] == ITEM_ELK_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_ELK_SKIN_COAT, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        elseif i[0] == ITEM_JUNGLE_WOLF_HIDE and i[1] == ITEM_JUNGLE_WOLF_HIDE and i[2] == ITEM_JUNGLE_WOLF_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_WOLF_SKIN_COAT, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        elseif i[0] == ITEM_JUNGLE_BEAR_HIDE and i[1] == ITEM_JUNGLE_BEAR_HIDE and i[2] == ITEM_JUNGLE_BEAR_HIDE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_BEAR_SKIN_COAT, GetUnitX(spellu), GetUnitY(spellu))
            call UnitAddItem(spellu, added)
        endif
    endif
    set t[0] = null
    set t[1] = null
    set t[2] = null
    set t[3] = null
    set t[4] = null
    set t[5] = null
    set added = null
    set spellu = null
endfunction

//===========================================================================
function InitTrig_tannery_stuff takes nothing returns nothing
    set gg_trg_tannery_stuff = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_tannery_stuff, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddAction( gg_trg_tannery_stuff, function Trig_tannery_stuff_Actions )
endfunction

//===========================================================================
