
//===========================================================================
//TESH.scrollpos=22
//TESH.alwaysfold=0
function Trig_radar_skill_3_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_3_Func001Func001Func002C takes nothing returns boolean
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_COOKED_MEAT ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_BONE ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_CLAY_BALL ) ) then
        return true
    endif
    return false
endfunction

function Trig_radar_skill_3_Func001Func001C takes nothing returns boolean
    if ( not Trig_radar_skill_3_Func001Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_3_Func001A takes nothing returns nothing
    if ( Trig_radar_skill_3_Func001Func001C() ) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetItemLoc(GetEnumItem()), 4.00, bj_MINIMAPPINGSTYLE_FLASHY, 100.00, 65.00, 15.00 )
    else
    endif
endfunction

function Trig_radar_skill_3_Actions takes nothing returns nothing
    local real r=3500.00
    if(UnitHasBuffBJ(GetSpellAbilityUnit(), 'BHbd') == true ) then
        set r=5000.00
    endif
    call EnumItemsInRectBJ( RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), r, r), function Trig_radar_skill_3_Func001A )
endfunction

//===========================================================================
function InitTrig_radar_skill_3 takes nothing returns nothing
    set gg_trg_radar_skill_3 = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_radar_skill_3, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_radar_skill_3, Condition( function Trig_radar_skill_3_Conditions ) )
    call TriggerAddAction( gg_trg_radar_skill_3, function Trig_radar_skill_3_Actions )
endfunction

//===========================================================================
