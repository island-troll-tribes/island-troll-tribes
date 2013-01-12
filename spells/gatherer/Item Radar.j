
//===========================================================================
//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_item_radar_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02U' ) ) then
        return false
    endif
    return true
endfunction


function Trig_item_radar_Func001Func001C takes nothing returns boolean
    if ( not ( DistanceBetweenPoints(GetItemLoc(GetEnumItem()), GetUnitLoc(GetSpellAbilityUnit())) <= 1700.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_item_radar_Func001A takes nothing returns nothing
    local real r=0
    local real g=0
    local real b=100
    if ( Trig_item_radar_Func001Func001C() ) then
        if ( GetItemTypeId(GetEnumItem()) == ITEM_STONE ) then//stone
            set r=80
            set g=80
            set b=80
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_CLAY_BALL ) then//clay
            set r=100
            set g=50
            set b=0
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_BONE ) then//bone
            set r=30
            set g=30
            set b=30
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_STICK ) then//stick
            set r=0
            set g=50
            set b=25
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_COOKED_MEAT ) then//meat
            set r=100
            set g=80
            set b=40
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_TINDER ) then//tinder
            set r=40
            set g=100
            set b=40
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_MANA_CRYSTAL ) then//mana crystal
            set r=40
            set g=100
            set b=100
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_MUSHROOM ) then//shrrom
            set r=0
            set g=100
            set b=0
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_ELK_HIDE ) then//elk hide
            set r=100
            set g=100
            set b=40
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_JUNGLE_WOLF_HIDE ) then//wolf hide
            set r=100
            set g=40
            set b=40
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_JUNGLE_BEAR_HIDE ) then//bear hide
            set r=40
            set g=40
            set b=100
        elseif ( GetItemTypeId(GetEnumItem()) == ITEM_FLINT ) then//flint
            set r=100
            set g=0
            set b=0
        endif
    endif
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetItemLoc(GetEnumItem()), 4.00, bj_MINIMAPPINGSTYLE_FLASHY, r, g, b )

endfunction

function Trig_item_radar_Actions takes nothing returns nothing
    local real r=3500.00
    if(UnitHasBuffBJ(GetSpellAbilityUnit(), 'BHbd') == true ) then
        set r=5000.00
    endif
    call EnumItemsInRectBJ( RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), r, r), function Trig_item_radar_Func001A )
endfunction

//===========================================================================
function InitTrig_item_radar takes nothing returns nothing
    set gg_trg_item_radar = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_item_radar, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_item_radar, Condition( function Trig_item_radar_Conditions ) )
    call TriggerAddAction( gg_trg_item_radar, function Trig_item_radar_Actions )
endfunction

//===========================================================================
