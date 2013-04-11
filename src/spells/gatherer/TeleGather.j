
function Trig_TeleGather_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetManipulatingUnit(), 'B00H') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_TeleGather_Actions takes nothing returns nothing
local unit a = GetManipulatingUnit()
local unit b = LoadUnitHandle( udg_GameHash, GetHandleId(a), StringHash("fire"))
local item i = GetManipulatedItem()
local real q = 50 // items other than list
local real r
if b != null then
    if (UnitHasBuffBJ(b, 'B00I')==false) then
        call UnitRemoveAbility( a, 'B00H' )
        call RemoveSavedHandle(udg_GameHash, GetHandleId(a), StringHash("fire"))
    else
        if(GetUnitTypeId(a) == UNIT_HERB_MASTER) or (GetUnitTypeId(a) == UNIT_RADAR_GATHERER) then
            set r = GetRandomReal(0, 100)-10*I2R(GetUnitAbilityLevel(a,'A057')) //low: -30
        elseif GetUnitTypeId(a) == UNIT_OMNIGATHERER then
            set r = GetRandomReal(0, 100)-5*4 //low: -20
        endif
        if(IsItemHide(i)) then
            set q=55
        endif
        if(IsItemCoat(i)) then
            set q=30
        endif
        if(IsItemBoots(i)) then
            set q=30
        endif
        if(IsItemGloves(i)) then
            set q=30
        endif
        if(IsItemAxeOrShield(i)) then
            set q=25
        endif
        if(IsItemPole(i)) then
            set q=55
        endif
        if(IsItemSpell(i)) then
            set q=15
        endif
        if(GetItemTypeId(i) == ITEM_MANA_CRYSTAL) then
            set q=45
        endif
        if(GetItemTypeId(i) == ITEM_MUSHROOM) then
            set q=65
        endif
        if(GetItemTypeId(i) == ITEM_TINDER) then //tinder
            set q=75
        endif
        if(GetItemTypeId(i) == ITEM_STONE) then // stone
            set q=60
        endif
        if(GetItemTypeId(i) == ITEM_DISEASED_MEAT) then // 0% for diseased meat
            set q=-100
        endif
        if(GetItemTypeId(i) == ITEM_BUTSU or GetItemTypeId(i) == ITEM_RIVER_ROOT or GetItemTypeId(i) == ITEM_RIVER_STEM or GetItemTypeId(i) == ITEM_BLUE_HERB or GetItemTypeId(i) == ITEM_ORANGE_HERB or GetItemTypeId(i) == ITEM_REFINED_POISON_SPEAR or GetItemTypeId(i) == ITEM_RIVER_ROOT) then
            if(GetUnitTypeId(a) == UNIT_HERB_MASTER or GetUnitTypeId(a) == UNIT_OMNIGATHERER) then
                set q=100
            else
                set q=-70 // 0% for Radar Gatherer
            endif
        endif
        if(GetItemTypeId(i) == ITEM_CLAY_BALL) then
            set q=70
        endif
        if(GetItemTypeId(i) == ITEM_COOKED_MEAT) then
            set q=73
        endif
        if(GetItemTypeId(i) == ITEM_ACORN) then
            set q=50
        endif
        
        if r < q then
            call SetItemPosition( i, GetUnitX(b), GetUnitY(b) )
        endif
    endif
else
    call UnitRemoveAbility( a, 'B00H' )
    call RemoveSavedHandle(udg_GameHash, GetHandleId(a), StringHash("fire"))
endif
set b = null
set a = null
set i = null
endfunction

//===========================================================================
function InitTrig_TeleGather takes nothing returns nothing
    set gg_trg_TeleGather = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_TeleGather, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_TeleGather, Condition( function Trig_TeleGather_Conditions ) )
    call TriggerAddAction( gg_trg_TeleGather, function Trig_TeleGather_Actions )
endfunction

//===========================================================================
