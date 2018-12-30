
//===========================================================================
function Trig_radar_skill_2_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02X' ) ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_2_Func001Func001Func002C takes nothing returns boolean
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_JUNGLE_BEAR_HIDE ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_JUNGLE_WOLF_HIDE ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_ELK_HIDE ) ) then
        return true
    endif
    return false
endfunction

function Trig_radar_skill_2_Func001Func001C takes nothing returns boolean
    if ( not Trig_radar_skill_2_Func001Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_2_Func001A takes nothing returns nothing
    if ( Trig_radar_skill_2_Func001Func001C() ) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetItemLoc(GetEnumItem()), 4.00, bj_MINIMAPPINGSTYLE_SIMPLE, 100.00, 74.00, 52.00 )
    else
    endif
endfunction

function Trig_radar_skill_2_Actions takes nothing returns nothing
    local real r=3500.00
    if(UnitHasBuffBJ(GetSpellAbilityUnit(), 'BHbd') == true ) then
        set r=5000.00
    endif
    call EnumItemsInRectBJ( RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), r, r), function Trig_radar_skill_2_Func001A )
endfunction

//===========================================================================
function InitTrig_radar_skill_2 takes nothing returns nothing
    set gg_trg_radar_skill_2 = CreateTrigger(  )
   // call TriggerRegisterAnyUnitEventBJ( gg_trg_radar_skill_2, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_radar_skill_2, Condition( function Trig_radar_skill_2_Conditions ) )
    call TriggerAddAction( gg_trg_radar_skill_2, function Trig_radar_skill_2_Actions )
endfunction

//===========================================================================
