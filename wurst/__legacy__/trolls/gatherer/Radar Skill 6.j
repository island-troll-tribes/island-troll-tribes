
//===========================================================================
function Trig_radar_skill_6_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07S' ) ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_6_Func001Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetEnumItem()) == ITEM_MAGIC ) ) then
        return false
    endif
    return true
endfunction

function Trig_radar_skill_6_Func001A takes nothing returns nothing
    if ( Trig_radar_skill_6_Func001Func001C() ) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetItemLoc(GetEnumItem()), 4.00, bj_MINIMAPPINGSTYLE_SIMPLE, 10.00, 20.00, 70.00 )
    else
    endif
endfunction

function Trig_radar_skill_6_Actions takes nothing returns nothing
    local real r=3500.00
    if(UnitHasBuffBJ(GetSpellAbilityUnit(), 'BHbd') == true ) then
        set r=5000.00
    endif
    call EnumItemsInRectBJ( RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), r, r), function Trig_radar_skill_6_Func001A )
endfunction

//===========================================================================
function InitTrig_radar_skill_6 takes nothing returns nothing
    set gg_trg_radar_skill_6 = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_radar_skill_6, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_radar_skill_6, Condition( function Trig_radar_skill_6_Conditions ) )
    call TriggerAddAction( gg_trg_radar_skill_6, function Trig_radar_skill_6_Actions )
endfunction

//===========================================================================
