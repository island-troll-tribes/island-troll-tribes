
function Trig_transmute_Conditions takes nothing returns boolean
    return udg_STARTED
endfunction

function Trig_transmute_Actions takes nothing returns nothing
local boolean bol1 = IsUnitTroll(GetTriggerUnit())
local boolean bol2 = false
local item array t
local integer array i  
local integer e = 0
local integer uid = GetUnitTypeId(GetTriggerUnit())
local item added
//Begining of Troll Invetory Item Creation
    if bol1 then
        loop
            exitwhen e > 5
            set t[e] = UnitItemInSlot(GetTriggerUnit(), e)
            set i[e] = GetItemTypeId(t[e])
            set e = e +1
        endloop
        if i[0] == ITEM_TINDER and i[1] == ITEM_FLINT and i[2] == ITEM_STICK then
            call RemoveItem(t[0])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_FIRE_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(2)
        endif
        set bol1=IsItemHide(t[1])
        if i[0] == ITEM_STICK and bol1 and i[2] == ITEM_STICK then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_TENT_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(3)
        endif
        set bol1 = IsItemHide(t[3])
        set bol2 = IsItemHide(t[4])
        if i[0] == ITEM_CLAY_BALL and i[1] == ITEM_STICK and i[2] == ITEM_STICK and bol1 and bol2 then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            set added = CreateItem(ITEM_TROLL_HUT_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(5)
        endif
        if i[0] == ITEM_CLAY_BALL and i[1] == ITEM_CLAY_BALL and i[2] == ITEM_CLAY_BALL and i[3] == ITEM_CLAY_BALL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set added = CreateItem(ITEM_MUD_HUT_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(4)
        endif
        if i[0] == ITEM_FLINT and i[1] == ITEM_STONE and i[2] == ITEM_STONE and i[3] == ITEM_STONE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set added = CreateItem(ITEM_ARMORY_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(4)
        endif
        if i[0] == ITEM_STICK and i[1] == ITEM_STICK and i[2] == ITEM_STONE and i[3] == ITEM_STONE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set added = CreateItem(ITEM_TANNERY_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(4)
        endif
        if i[0] == ITEM_STICK and i[1] == ITEM_MANA_CRYSTAL and i[2] == ITEM_STICK and i[3] == ITEM_MANA_CRYSTAL and i[4] == ITEM_STICK and i[5] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            set added = CreateItem(ITEM_WITCH_DOCTORS_HUT_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(6)
        endif
        if i[0] == ITEM_STICK and IsItemHide( t[1] ) and i[2] == ITEM_CLAY_BALL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_SMOKE_HOUSE_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(3)
        endif
        set bol1 = IsItemHide(t[0])
        if bol1 and i[1] == ITEM_STICK and i[2] == ITEM_TINDER and i[3] == ITEM_CLAY_BALL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set added = CreateItem(ITEM_STORAGE_HUT_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(4)
        endif
        
        if udg_EXTRA_MODE then
            if i[0] == ITEM_STICK and i[1] == ITEM_IRON_INGOT and i[2] == ITEM_IRON_INGOT then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                set added = CreateItem(ITEM_WORKSHOP_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                call UnitAddItem(GetTriggerUnit(), added)
                call itemLower(1)
            endif
            if i[0] == ITEM_STICK and i[1] == ITEM_CLAY_BALL and i[2] == ITEM_CLAY_BALL and i[3] == ITEM_CLAY_BALL then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call RemoveItem(t[3])
                set added = CreateItem(ITEM_POT_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                call UnitAddItem(GetTriggerUnit(), added)
                call itemLower(4)
            endif
            if i[0] == ITEM_STONE and i[1] == ITEM_STONE and i[2] == ITEM_STONE and i[3] == ITEM_STICK and i[4] == ITEM_STICK and i[5] == ITEM_STICK then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call RemoveItem(t[3])
                call RemoveItem(t[4])
                call RemoveItem(t[5])
                set added = CreateItem(ITEM_HATCHERY_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                call UnitAddItem(GetTriggerUnit(), added)
                call itemLower(6)
            endif
            if i[0] == ITEM_STONE and i[1] == ITEM_STONE and i[2] == ITEM_MANA_CRYSTAL and i[3] == ITEM_MANA_CRYSTAL then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call RemoveItem(t[3])
                set added = CreateItem(ITEM_TELEPORT_BEACON_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                call UnitAddItem(GetTriggerUnit(), added)
                call itemLower(4)
            endif
            if i[0] == ITEM_STONE and i[1] == ITEM_STICK and i[2] == ITEM_STICK and i[3] == ITEM_STICK then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call RemoveItem(t[3])
                set added = CreateItem(ITEM_OMNIDEFENDER_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                call UnitAddItem(GetTriggerUnit(), added)
                call itemLower(4)
            endif
        endif
    endif
//End of Troll Inventory Item Creation
//Begging of Armory Item Creation    
    if uid == UNIT_ARMORY and GetUnitUserData(GetTriggerUnit()) == 0 then
        loop
            exitwhen e > 5
            set t[e] = UnitItemInSlot(GetTriggerUnit(), e)
            set i[e] = GetItemTypeId(t[e])
            set e = e +1
        endloop
        set bol1 = IsItemPole(t[1])
        if i[0] == ITEM_TINDER and bol1 and i[2] == ITEM_STICK then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_ENSNARE_TRAP_KIT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(3)
        endif
        set bol1 = IsItemBasicBoots(t[0])
        if bol1 and i[1] == ITEM_BONE and i[2] == ITEM_BONE and i[3] == ITEM_BONE and i[4] == ITEM_BONE and i[5] == ITEM_BONE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            set added = CreateItem(ITEM_BONE_BOOTS, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicGloves(t[0])
        if bol1 and i[1] == ITEM_BONE and i[2] == ITEM_BONE and i[3] == ITEM_BONE and i[4] == ITEM_BONE and i[5] == ITEM_BONE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            set added = CreateItem(ITEM_BONE_GLOVES, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicCoat(t[0])
        if bol1 and i[1] == ITEM_BONE and i[2] == ITEM_BONE and i[3] == ITEM_BONE and i[4] == ITEM_BONE and i[5] == ITEM_BONE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            set added = CreateItem(ITEM_BONE_COAT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicBoots(t[0])
        if bol1 and i[1] == ITEM_IRON_INGOT and i[2] == ITEM_IRON_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_IRON_BOOTS, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicGloves(t[0])
        if bol1 and i[1] == ITEM_IRON_INGOT and i[2] == ITEM_IRON_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_IRON_GLOVES, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicCoat(t[0])
        if bol1 and i[1] == ITEM_IRON_INGOT and i[2] == ITEM_IRON_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_IRON_COAT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicBoots(t[0])
        if bol1 and i[1] == ITEM_STEEL_INGOT and i[2] == ITEM_STEEL_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_STEEL_BOOTS, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicGloves(t[0])
        if bol1 and i[1] == ITEM_STEEL_INGOT and i[2] == ITEM_STEEL_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_STEEL_GLOVES, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemBasicCoat(t[0])
        if bol1 and i[1] == ITEM_STEEL_INGOT and i[2] == ITEM_STEEL_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_STEEL_COAT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        if i[0] == ITEM_STONE and i[1] == ITEM_FLINT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_IRON_INGOT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(2)
        endif
        if i[0] == ITEM_IRON_INGOT and i[1] == ITEM_IRON_INGOT and i[2] == ITEM_FLINT and i[3] == ITEM_FLINT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set added = CreateItem(ITEM_STEEL_INGOT, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(2)
        endif
        set bol1 = IsItemPole(t[1])
        if i[0] == ITEM_STONE and bol1 then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_SPEAR, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(2)
        endif
        set bol1 = IsItemPole(t[0])
        if bol1 and i[1] == ITEM_FLINT and i[2] == ITEM_FLINT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_FLINT_AXE, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(3)
        endif
        set bol1 = IsItemPole(t[0])
        if bol1 and i[1] == ITEM_STONE and i[2] == ITEM_STONE then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_STONE_AXE, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(3)
        endif
        set bol1 = IsItemPole(t[0])
        if bol1 and i[1] == ITEM_IRON_INGOT and i[2] == ITEM_IRON_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_IRON_AXE, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(1)
        endif
        set bol1 = IsItemPole(t[0])
        if bol1 and i[1] == ITEM_STEEL_INGOT and i[2] == ITEM_STEEL_INGOT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            set added = CreateItem(ITEM_STEEL_AXE, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call UnitAddItem(GetTriggerUnit(), added)
            call itemLower(1)
        endif
        if udg_EXTRA_MODE then
            set bol1 = IsItemPole(t[1])
            if i[0] == ITEM_IRON_INGOT and bol1 then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_IRON_SPEAR, GetTriggerUnit() )
                call itemLower(1)
            endif
            set bol1 = IsItemPole(t[1])
            if i[0] == ITEM_STEEL_INGOT and bol1 then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_STEEL_SPEAR, GetTriggerUnit() )
                call itemLower(1)
            endif
            set bol1 = IsItemPole(t[1])
            if i[0] == ITEM_DARK_ROCK and bol1 then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_DARK_SPEAR, GetTriggerUnit() )
                call itemLower(1)
            endif
            set bol1 = IsItemPole(t[0])
            if bol1 and i[1] == ITEM_SPIRIT_WIND and i[2] == ITEM_SPIRIT_WATER and i[3] == ITEM_MANA_CRYSTAL then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call RemoveItem(t[3])
                call UnitAddItemByIdSwapped( ITEM_MAGE_MASHER, GetTriggerUnit() )
                call itemLower(2)
            endif
            //Regular Shield VVVVVVVVVVVVVVVV any hide/stick/stick
            if allow_Shields then
                set bol1 = IsItemHide(t[0])
                if bol1 and i[1] == ITEM_STICK and i[2] == ITEM_STICK then
                    call RemoveItem(t[0])
                    call RemoveItem(t[1])
                    call RemoveItem(t[2])
                    set added = CreateItem(ITEM_SHIELD, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                    call UnitAddItem(GetTriggerUnit(), added)
                    call itemLower(3)
                endif
        
                set bol1 = IsItemBasicShield(t[0])
                if bol1 and i[1] == ITEM_IRON_INGOT and i[2] == ITEM_IRON_INGOT then
                    call RemoveItem(t[0])
                    call RemoveItem(t[1])
                    call RemoveItem(t[2])
                    set added = CreateItem(ITEM_IRON_SHIELD, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                    call UnitAddItem(GetTriggerUnit(), added)
                endif

                set bol1 = IsItemBasicShield(t[0])
                if bol1 and i[1] == ITEM_BONE and i[2] == ITEM_BONE and i[3] == ITEM_BONE and i[4] == ITEM_BONE and i[5] == ITEM_BONE then
                    call RemoveItem(t[0])
                    call RemoveItem(t[1])
                    call RemoveItem(t[2])
                    call RemoveItem(t[3])
                    call RemoveItem(t[4])
                    call RemoveItem(t[5])
                    set added = CreateItem(ITEM_BONE_SHIELD, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                    call UnitAddItem(GetTriggerUnit(), added)
                endif

                set bol1 = IsItemBasicShield(t[0])
                if bol1 and i[1] == ITEM_STEEL_INGOT and i[2] == ITEM_STEEL_INGOT then
                    call RemoveItem(t[0])
                    call RemoveItem(t[1])
                    call RemoveItem(t[2])
                    set added = CreateItem(ITEM_STEEL_SHIELD, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
                    call UnitAddItem(GetTriggerUnit(), added)
                endif
                
            endif
        endif
    endif
//End of Armory Item Creation
//Begging of Witch Doctors Hut Item Creation    
    if uid == UNIT_WITCH_DOCTORS_HIT and GetUnitUserData(GetTriggerUnit()) == 0 then
        loop
            exitwhen e > 5
            set t[e] = UnitItemInSlot(GetTriggerUnit(), e)
            set i[e] = GetItemTypeId(t[e])
            set e = e +1
        endloop
        
        if i[0] == ITEM_SPEAR and i[1] == ITEM_MUSHROOM then
            if GetItemCharges(t[0]) > 1 then
                call SetItemCharges(t[0], GetItemCharges(t[0]) - 1 )
            else
                call RemoveItem(t[0])
            endif
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_POISON_SPEAR, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_CLAY_BALL and i[1] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_LIVING_CLAY, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_STONE and i[1] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_SCROLL_STONE_ARMOR, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_BONE and i[1] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_SCROLL_LIVING_DEAD, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_STICK and i[1] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_MAGIC_SEED, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_TINDER and i[1] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_SCROLL_ENTANGLING_ROOTS, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_FLINT and i[1] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_SCROLL_FIREBALL, GetTriggerUnit() )
            call itemLower(2)
        endif
        if not udg_ELIMINATION and i[0] == ITEM_MANA_CRYSTAL and i[1] == ITEM_STICK and i[2] == ITEM_MANA_CRYSTAL and i[3] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call UnitAddItemByIdSwapped( ITEM_SPIRIT_WARD_KIT, GetTriggerUnit() )
            call itemLower(4)
        endif
        if udg_EXTRA_MODE then
            if i[0] == ITEM_MUSHROOM and i[1] == ITEM_MUSHROOM and i[2] == ITEM_MUSHROOM then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call UnitAddItemByIdSwapped( ITEM_POISON, GetTriggerUnit() )
                call itemLower(3)
            endif
            if i[0] == ITEM_POISON and i[1] == ITEM_POISON then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_ULTRA_POISON, GetTriggerUnit() )
            endif
            if i[0] == ITEM_SPEAR and i[1] == ITEM_POISON then
                if GetItemCharges(t[0]) > 1 then
                    call SetItemCharges(t[0], GetItemCharges(t[0]) - 1 )
                else
                    call RemoveItem(t[0])
                endif
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_REFINED_POISON_SPEAR, GetTriggerUnit() )
            endif
            if i[0] == ITEM_SPEAR and i[1] == ITEM_ULTRA_POISON then
                if GetItemCharges(t[0]) > 1 then
                    call SetItemCharges(t[0], GetItemCharges(t[0]) - 1 )
                else
                    call RemoveItem(t[0])
                endif
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_ULTRA_POISON_SPEAR, GetTriggerUnit() )
            endif
            if i[0] == ITEM_SPIRIT_WATER and i[1] == ITEM_MANA_CRYSTAL then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_SCROLL_TSUNAMI, GetTriggerUnit() )
                call itemLower(1)
            endif
            if i[0] == ITEM_SPIRIT_WIND and i[1] == ITEM_MANA_CRYSTAL then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_SCROLL_CYCLONE, GetTriggerUnit() )
                call itemLower(1)
            endif
            if i[0] == ITEM_FIRE_KIT and i[1] == ITEM_MANA_CRYSTAL then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call UnitAddItemByIdSwapped( ITEM_MAGE_FIRE_KIT, GetTriggerUnit() )
                call itemLower(1)
            endif
            // CLOAK SECTION ** = Sell Rate: .65
            // FIRE - MAGIC + BONE COAT + FLINT = 3 + 37 + 1 = 41
            // FROST - MAGIC + BONE COAT + SPRIT OF WATER = 40 + 3 = 43
            // HEAL - MAGIC + BONE COAT + BUTSU = 40 + 1 = 41
            if i[0] == ITEM_MAGIC and i[1] == ITEM_BONE_COAT and i[2] == ITEM_FLINT then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call UnitAddItemByIdSwapped( ITEM_CLOAK_OF_FLAMES, GetTriggerUnit() )
                call itemLower(2) // decrease in two raw materials
            endif
            if i[0] == ITEM_MAGIC and i[1] == ITEM_BONE_COAT and i[2] == ITEM_SPIRIT_WATER then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call UnitAddItemByIdSwapped( ITEM_CLOAK_OF_FROST, GetTriggerUnit() )
                call itemLower(1)
            endif
            if i[0] == ITEM_MAGIC and i[1] == ITEM_BONE_COAT and i[2] == ITEM_BUTSU then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call UnitAddItemByIdSwapped( ITEM_CLOAK_OF_HEALING, GetTriggerUnit() )
                call itemLower(2)
            endif
            if i[0] == ITEM_MAGIC and i[1] == ITEM_BONE_COAT and i[2] == ITEM_DARK_ROCK then
                call RemoveItem(t[0])
                call RemoveItem(t[1])
                call RemoveItem(t[2])
                call UnitAddItemByIdSwapped( ITEM_CAMOUFLAGE_COAT, GetTriggerUnit() )
                call itemLower(1)
            endif
            // END CLOAK
        endif
    endif
//End of WDH Item Creation
    // workshop
    if uid == 'o00I' and udg_EXTRA_MODE and GetUnitUserData(GetTriggerUnit()) == 0 then 
        loop
            exitwhen e > 5
            set t[e] = UnitItemInSlot(GetTriggerUnit(), e)
            set i[e] = GetItemTypeId(t[e])
            set e = e +1
        endloop
        
        if i[0] == ITEM_STICK and i[1] == ITEM_CLAY_BALL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_BLOW_GUN, GetTriggerUnit() )
            call itemLower(2)
        endif
        //Defense WardVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
        if i[0] == ITEM_STONE and i[1] == ITEM_STONE and i[2] == ITEM_MANA_CRYSTAL and i[3] == ITEM_IRON_INGOT and BETA then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call UnitAddItemByIdSwapped( ITEM_DEFENSIVE_WARD_KIT, GetTriggerUnit() )
            call UnitAddItemByIdSwapped( ITEM_IRON_INGOT, GetTriggerUnit() )
            call itemLower(1)
        endif
        //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        //Battle AxeVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
        if i[0] ==  ITEM_STICK and i[1] == ITEM_STEEL_INGOT and i[2] == ITEM_STEEL_INGOT and i[3] == ITEM_SPIRIT_WIND and i[4] == ITEM_SPIRIT_WATER and i[5] == ITEM_ELK_HIDE and BETA then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            call UnitAddItemByIdSwapped( ITEM_BATTLE_AXE, GetTriggerUnit() )
            call itemLower(1)
        endif
        
        //Battle Suit
        if i[0] == ITEM_BATTLE_AXE and i[1] == ITEM_BATTLE_ARMOR and i[2] == ITEM_BATTLE_GLOVES and i[3] == ITEM_BATTLE_SHIELD and i[4] == ITEM_SPIRIT_WIND and i[5] == ITEM_SPIRIT_WATER and BETA then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            call UnitAddItemByIdSwapped( ITEM_BATTLE_SUIT, GetTriggerUnit() )
            call itemLower(1)
        endif
        //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        //NapalmVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
        if i[0] == ITEM_FIRE_BOMB and i[1] == ITEM_FIRE_BOMB and i[2] == ITEM_FLINT and BETA then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call UnitAddItemByIdSwapped( ITEM_NAPALM, GetTriggerUnit() )
            call itemLower(1)
        endif
        //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        if i[0] == ITEM_IRON_INGOT and i[1] == ITEM_FLINT then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_SONAR_COMPASS, GetTriggerUnit() )
            call itemLower(1)
        endif
        if i[0] == ITEM_TINDER and i[1] == ITEM_TINDER then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_NETS, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_ACORN and i[1] == ITEM_SPIRIT_WIND then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call UnitAddItemByIdSwapped( ITEM_SMOKE_BOMB, GetTriggerUnit() )
        endif
        if i[0] == ITEM_STICK and i[1] == ITEM_STICK and i[2] == ITEM_SPIRIT_WIND then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call UnitAddItemByIdSwapped( ITEM_BEE_HIVE, GetTriggerUnit() )
            call itemLower(2)
        endif
        if i[0] == ITEM_THISTLES and i[1] == ITEM_DARK_ROCK then
            set e = GetItemCharges(t[0])
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            set added = CreateItem(ITEM_DARK_THISTLES, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
            call SetItemCharges(added, e)
            call UnitAddItem(GetTriggerUnit(), added)
        endif
        set bol1 = IsItemHide(t[4])
        set bol2 = IsItemHide(t[5])
        if not udg_DisabledBoats and i[0] == ITEM_STICK and i[1] == ITEM_STICK and i[2] == ITEM_CLAY_BALL and i[3] == ITEM_CLAY_BALL and bol1 and bol2 then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            call UnitAddItemByIdSwapped( ITEM_TRANSPORT_SHIP_KIT, GetTriggerUnit() )
            call itemLower(6)
        endif
        if i[0] == ITEM_BONE_COAT and i[1] == ITEM_MANA_CRYSTAL and i[2] == ITEM_SPIRIT_WIND and i[3] == ITEM_SPIRIT_WATER then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call UnitAddItemByIdSwapped( ITEM_BATTLE_ARMOR, GetTriggerUnit() )
            call itemLower(1)
        endif
        if i[0] == ITEM_BONE_BOOTS and i[1] == ITEM_SPIRIT_WIND and i[2] == ITEM_SPIRIT_WATER and i[3] == ITEM_ANABOLIC_POTION and i[4] == ITEM_ANABOLIC_POTION then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            if GetItemCharges(t[3]) > 1 then
                call SetItemCharges(t[3], GetItemCharges(t[3]) - 1 )
            else
                call RemoveItem(t[3])
            endif
            if GetItemCharges(t[4]) > 1 then
                call SetItemCharges(t[4], GetItemCharges(t[4]) - 1 )
            else
                call RemoveItem(t[4])
            endif
            call UnitAddItemByIdSwapped( ITEM_ANABOLIC_BOOTS, GetTriggerUnit() )
            call itemLower(1)
        endif
        if i[0] == ITEM_BONE_BOOTS and i[1] == ITEM_SPIRIT_WIND and i[2] == ITEM_SPIRIT_WATER and i[3] == ITEM_ANABOLIC_POTION and GetItemCharges(t[3]) > 1 then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            if GetItemCharges(t[3]) > 2 then
                call SetItemCharges(t[3], GetItemCharges(t[3]) - 1 )
            else
                call RemoveItem(t[3])
            endif
            call UnitAddItemByIdSwapped( ITEM_ANABOLIC_BOOTS, GetTriggerUnit() )
            call itemLower(1)
        endif
        if i[0] == ITEM_BONE_GLOVES and i[1] == ITEM_STEEL_INGOT and i[2] == ITEM_IRON_INGOT and i[3] == ITEM_MANA_CRYSTAL and i[4] == ITEM_SPIRIT_WIND and i[5] == ITEM_SPIRIT_WATER then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            call UnitAddItemByIdSwapped( ITEM_BATTLE_GLOVES, GetTriggerUnit() )
            call itemLower(1)
        endif
        if i[0] == ITEM_SPIRIT_WATER and i[1] == ITEM_SPIRIT_WIND and i[2] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call UnitAddItemByIdSwapped( ITEM_EMP, GetTriggerUnit() )
            call itemLower(1)
        endif
        if i[0] == ITEM_BONE_SHIELD and i[1] == ITEM_ELK_HIDE and i[2] == ITEM_STEEL_INGOT and i[3] == ITEM_SPIRIT_WIND and i[4] == ITEM_SPIRIT_WATER and i[5] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            call RemoveItem(t[4])
            call RemoveItem(t[5])
            call UnitAddItemByIdSwapped( ITEM_BATTLE_SHIELD, GetTriggerUnit() )
            call itemLower(1)
        endif
        if i[0] == ITEM_SMOKE_BOMB and i[1] == ITEM_FLINT and i[2] == ITEM_MANA_CRYSTAL then
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call UnitAddItemByIdSwapped( ITEM_FIRE_BOMB, GetTriggerUnit() )
            call itemLower(2)
        endif
    endif
    set t[0] = null
    set t[1] = null
    set t[2] = null
    set t[3] = null
    set t[4] = null
    set t[5] = null
    set added = null
endfunction

function InitTrig_transmute takes nothing returns nothing
    set gg_trg_transmute = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_transmute, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_transmute, Condition( function Trig_transmute_Conditions ) )
    call TriggerAddAction( gg_trg_transmute, function Trig_transmute_Actions )
endfunction
