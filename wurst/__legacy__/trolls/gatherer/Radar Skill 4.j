
//===========================================================================
function Trig_radar_skill_4_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02Y' ) ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_4_Func001Func001Func002C takes nothing returns boolean
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_MANA_CRYSTAL ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetEnumItem()) == ITEM_STONE ) ) then
        return true
    endif
    return false
endfunction

function Trig_radar_skill_4_Func001Func001C takes nothing returns boolean
    if ( not Trig_radar_skill_4_Func001Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_4_Func001A takes nothing returns nothing
    if ( Trig_radar_skill_4_Func001Func001C() ) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetItemLoc(GetEnumItem()), 4.00, bj_MINIMAPPINGSTYLE_SIMPLE, 0.00, 0.00, 100.00 )
    else
    endif
endfunction

function Trig_radar_skill_4_Actions takes nothing returns nothing
    local real r=3500.00
    if(UnitHasBuffBJ(GetSpellAbilityUnit(), 'BHbd') == true ) then
        set r=5000.00
    endif
    call EnumItemsInRectBJ( RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), r, r), function Trig_radar_skill_4_Func001A )
endfunction

//===========================================================================
function InitTrig_radar_skill_4 takes nothing returns nothing
    set gg_trg_radar_skill_4 = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_radar_skill_4, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_radar_skill_4, Condition( function Trig_radar_skill_4_Conditions ) )
    call TriggerAddAction( gg_trg_radar_skill_4, function Trig_radar_skill_4_Actions )
endfunction

//===========================================================================
