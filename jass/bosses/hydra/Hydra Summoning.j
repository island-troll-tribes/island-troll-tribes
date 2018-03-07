
//===========================================================================
//TESH.scrollpos=71
//TESH.alwaysfold=0
function SummonConditions takes nothing returns boolean
    return GetManipulatingUnit() == gg_unit_n019_0145
endfunction

globals
    integer corpse_amt = 0
    boolean corpse_check = false
    group tGroup = CreateGroup()
endglobals

function CountCorpse takes nothing returns nothing
if not corpse_check then
if corpse_amt >= 3 then
    set corpse_check = true
else
    set corpse_amt = corpse_amt + 1
endif
endif
endfunction

function SummonHydraActions takes nothing returns nothing
local integer e = 0
local integer array i
local item array t
local integer s
if not hydraStarted and Mammoth_Dead then
    loop
        set t[e] = UnitItemInSlot(gg_unit_n019_0145, e)
        exitwhen t[e] == null or e > 5
        set i[e] = GetItemTypeId(t[e])
        set e = e + 1
    endloop

    // Hawk Egg
    // Jungle Bear Hide x2
    // Wolf Skin
    // 1 of 4 Island Herbs
    
    // new:
    // Herb, mushroom, root, elk hide, 3 corpse near altar
    /*
    A flesh offering scattered amongst the vicinity, thrice, however, more.. then retrieve the leaf of the island... the presence of the Fungi... the origin of water from below... finally, the bare skin of a Cervidae... all served within the altar...
    */
    set corpse_amt = 0
    call GroupEnumUnitsInRange(tGroup, GetUnitX(gg_unit_n019_0145) , GetUnitY(gg_unit_n019_0145) , 600, Condition(function FilterUnitIsCorpse))
    call ForGroup(tGroup, function CountCorpse)
    if i[1] == ITEM_MUSHROOM and i[2] == ITEM_RIVER_ROOT and i[3] == ITEM_ELK_HIDE then
        if corpse_check then
        set corpse_check = false
        call ForGroup(tGroup, function ConvertEnumCorpseToCookedMeat)
        if i[0] == ITEM_BLUE_HERB then //BLUE - NORTHWEST
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set s = 0
            call SpawnHydra(hydraB_X[s],hydraB_Y[s])
            call SaveInteger(udg_GameHash, StringHash("hyd"), StringHash("step"), s)
            call DestroyEffect(AddSpecialEffectTarget(hydraAltarSfx, GetTriggerUnit(), "chest"))
        elseif i[0] == ITEM_ORANGE_HERB then //ORANGE - NORTHEAST
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set s = 2
            call SpawnHydra(hydraB_X[s],hydraB_Y[s])
            call SaveInteger(udg_GameHash, StringHash("hyd"), StringHash("step"), s)
            call DestroyEffect(AddSpecialEffectTarget(hydraAltarSfx, GetTriggerUnit(), "chest"))
        elseif i[0] == ITEM_PURPLE_HERB then //PURPLE - SOUTHWEST
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set s = 7
            call SpawnHydra(hydraB_X[s],hydraB_Y[s])
            call SaveInteger(udg_GameHash, StringHash("hyd"), StringHash("step"), s)
            call DestroyEffect(AddSpecialEffectTarget(hydraAltarSfx, GetTriggerUnit(), "chest"))
        elseif i[0] == ITEM_YELLOW_HERB then //YELLOW - SOUTHEAST
            call RemoveItem(t[0])
            call RemoveItem(t[1])
            call RemoveItem(t[2])
            call RemoveItem(t[3])
            set s = 5
            call SpawnHydra(hydraB_X[s],hydraB_Y[s])
            call SaveInteger(udg_GameHash, StringHash("hyd"), StringHash("step"), s)
            call DestroyEffect(AddSpecialEffectTarget(hydraAltarSfx, GetTriggerUnit(), "chest"))
        endif
        endif
    endif
    set e = 0
    loop
        exitwhen t[e] == null or e > 5
        set t[e] = null
        set e = e + 1
    endloop
endif
endfunction

//===========================================================================
function InitTrig_hydra_summoning takes nothing returns nothing
    set gg_trg_hydra_summoning = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hydra_summoning, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_hydra_summoning, Condition( function SummonConditions ) )
    call TriggerAddAction( gg_trg_hydra_summoning, function SummonHydraActions )
endfunction

//===========================================================================
