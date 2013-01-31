
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function BowReturn_ID takes nothing returns boolean
    return GetSpellAbilityId() == 'A0A6' or GetSpellAbilityId() == 'A0A7' or GetSpellAbilityId() == 'A0A8' or GetSpellAbilityId() == 'A0A9'
endfunction

function Boat_Actions__Fire takes nothing returns nothing
    local unit u
    local unit t
    local integer chr = GetItemCharges(leg_bow)
    local integer iid = 0
    if GetItemTypeId(leg_bow) != 0 then
        set u = GetSpellAbilityUnit()
        if GetItemTypeId(leg_bow) == ITEM_DUSTY_OLD_BOW and chr == 1 then
            set iid = ITEM_ANCIENT_BOW
        elseif GetItemTypeId(leg_bow) == ITEM_ANCIENT_BOW and chr == 3 then
            set iid = ITEM_GLOWING_ANCIENT_BOW
        elseif GetItemTypeId(leg_bow) == ITEM_GLOWING_ANCIENT_BOW and chr == 1 then
            set iid = ITEM_BOW_BLOOD_GOD
        endif
        if iid != 0 then
            call RemoveItem(leg_bow)
            set leg_bow = CreateItem(iid, GetUnitX(u), GetUnitY(u))
            call UnitAddItem(u, leg_bow)
        endif
        if GetSpellAbilityId() == 'A0A9' then
            set t = GetSpellTargetUnit()
            if GetUnitState(t, UNIT_STATE_LIFE) < 86 and checkTroll(t) then
                call masterCastAtCaster(u,u,0,0,'A01U',"bloodlust")
            endif
        endif
        set u = null
    endif
endfunction

globals
    item leg_bow
endglobals

//===========================================================================
function InitTrig_bow_stagest takes nothing returns nothing
    set gg_trg_bow_stagest = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_bow_stagest, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_bow_stagest, Condition( function BowReturn_ID ) )
    call TriggerAddAction( gg_trg_bow_stagest, function Boat_Actions__Fire )
endfunction

//===========================================================================
