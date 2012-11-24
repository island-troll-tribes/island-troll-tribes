
//===========================================================================
function Trig_add_items_to_plants_Conditions takes nothing returns boolean
    if ( not ( udg_EXTRA_MODE == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_add_items_to_plants_Func002Func001Func001001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_BLUE_HERB_BUSH )
endfunction

function Trig_add_items_to_plants_Func002Func001Func002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_ORANGE_HERB_BUSH )
endfunction

function Trig_add_items_to_plants_Func002Func001Func003001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_THIEFS_BUSH )
endfunction

function Trig_add_items_to_plants_Func002Func001Func004001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_YELLOW_HERB_BUSH )
endfunction

function Trig_add_items_to_plants_Func002Func001Func005001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_PURPLE_HERB_BUSH )
endfunction

function Trig_add_items_to_plants_Func002Func001Func006001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_HAISETSU_BUSH )
endfunction

function Trig_add_items_to_plants_Func002Func001Func007Func001001 takes nothing returns boolean
    return ( GetRandomInt(1, 3) == 2 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func007C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_WATER_HERB_BUSH ) ) then
        return false
    endif
    return true
endfunction

function Trig_add_items_to_plants_Func002Func001Func008Func002001 takes nothing returns boolean
    return ( udg_integerParameter >= 3 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func008Func003001 takes nothing returns boolean
    return ( udg_integerParameter == 4 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func008Func004001 takes nothing returns boolean
    return ( udg_integerParameter == 5 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func008Func005001 takes nothing returns boolean
    return ( udg_integerParameter == 6 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func008C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_HIDDEN_STASH ) ) then
        return false
    endif
    return true
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func002001 takes nothing returns boolean
    return ( udg_integerParameter == 1 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func003001 takes nothing returns boolean
    return ( udg_integerParameter == 2 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func004001 takes nothing returns boolean
    return ( udg_integerParameter == 3 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func005001 takes nothing returns boolean
    return ( udg_integerParameter == 4 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func006001 takes nothing returns boolean
    return ( udg_integerParameter == 5 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func007001 takes nothing returns boolean
    return ( udg_integerParameter == 6 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func008001 takes nothing returns boolean
    return ( udg_integerParameter == 7 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009Func009001 takes nothing returns boolean
    return ( udg_integerParameter == 8 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func009C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'h01G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_add_items_to_plants_Func002Func001Func010Func002001 takes nothing returns boolean
    return ( udg_integerParameter <= 7 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func010Func003001 takes nothing returns boolean
    return ( udg_integerParameter == 8 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func010C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_SCOUTS_BUSH ) ) then
        return false
    endif
    return true
endfunction

function Trig_add_items_to_plants_Func002Func001Func011Func002001 takes nothing returns boolean
    return ( udg_integerParameter == 2 )
endfunction

function Trig_add_items_to_plants_Func002Func001Func011C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_MUSHROOM_COLONY ) ) then
        return false
    endif
    return true
endfunction

function Trig_add_items_to_plants_Func002Func001C takes nothing returns boolean
    if ( not ( UnitInventoryCount(GetEnumUnit()) < 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_add_items_to_plants_Func002A takes nothing returns nothing
    if ( Trig_add_items_to_plants_Func002Func001C() ) then
        if ( Trig_add_items_to_plants_Func002Func001Func001001() ) then
            call UnitAddItemByIdSwapped( ITEM_BLUE_HERB, GetEnumUnit() )
        else
            call DoNothing(  )
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func002001() ) then
            call UnitAddItemByIdSwapped( ITEM_ORANGE_HERB, GetEnumUnit() )
        else
            call DoNothing(  )
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func003001() ) then
            call UnitAddItemByIdSwapped( ITEM_THISTLES, GetEnumUnit() )
        else
            call DoNothing(  )
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func004001() ) then
            call UnitAddItemByIdSwapped( ITEM_YELLOW_HERB, GetEnumUnit() )
        else
            call DoNothing(  )
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func005001() ) then
            call UnitAddItemByIdSwapped( ITEM_PURPLE_HERB, GetEnumUnit() )
        else
            call DoNothing(  )
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func006001() ) then
            call UnitAddItemByIdSwapped( ITEM_BUTSU, GetEnumUnit() )
        else
            call DoNothing(  )
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func007C() ) then
            if ( Trig_add_items_to_plants_Func002Func001Func007Func001001() ) then
                call UnitAddItemByIdSwapped( ITEM_RIVER_ROOT, GetEnumUnit() )
            else
                call UnitAddItemByIdSwapped( ITEM_RIVER_STEM, GetEnumUnit() )
            endif
        else
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func008C() ) then
            set udg_integerParameter = GetRandomInt(1, 6)
            if ( Trig_add_items_to_plants_Func002Func001Func008Func002001() ) then
                call UnitAddItemByIdSwapped( ITEM_ACORN, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func008Func003001() ) then
                call UnitAddItemByIdSwapped( ITEM_MAGIC_ACORN, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func008Func004001() ) then
                call UnitAddItemByIdSwapped( ITEM_CLAY_BALL, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func008Func005001() ) then
                call UnitAddItemByIdSwapped( ITEM_MUSHROOM, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
        else
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func009C() ) then
            set udg_integerParameter = GetRandomInt(1, 8)
            if ( Trig_add_items_to_plants_Func002Func001Func009Func002001() ) then
                call UnitAddItemByIdSwapped( ITEM_MANA_CRYSTAL, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func009Func003001() ) then
                call UnitAddItemByIdSwapped( ITEM_SMOKE_BOMB, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func009Func004001() ) then
                call UnitAddItemByIdSwapped( ITEM_NETS, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func009Func005001() ) then
                call UnitAddItemByIdSwapped( ITEM_COOKED_MEAT, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func009Func006001() ) then
                call UnitAddItemByIdSwapped( ITEM_STONE, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func009Func007001() ) then
                call UnitAddItemByIdSwapped( ITEM_THIEF_MED, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func009Func008001() ) then
                call UnitAddItemByIdSwapped( ITEM_HEALING_POTION_III, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func009Func009001() ) then
                call UnitAddItemByIdSwapped( ITEM_MANA_POTION_III, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
        else
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func010C() ) then
            set udg_integerParameter = GetRandomInt(1, 8)
            if ( Trig_add_items_to_plants_Func002Func001Func010Func002001() ) then
                call UnitAddItemByIdSwapped( ITEM_LIVING_CLAY, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
            if ( Trig_add_items_to_plants_Func002Func001Func010Func003001() ) then
                call UnitAddItemByIdSwapped( ITEM_CLAY_EXPLOSION, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
        else
        endif
        if ( Trig_add_items_to_plants_Func002Func001Func011C() ) then
            set udg_integerParameter = GetRandomInt(1, 2)
            if ( Trig_add_items_to_plants_Func002Func001Func011Func002001() ) then
                call UnitAddItemByIdSwapped( ITEM_MUSHROOM, GetEnumUnit() )
            else
                call DoNothing(  )
            endif
        else
        endif
    else
    endif
endfunction

function Trig_add_items_to_plants_Actions takes nothing returns nothing
    call ForGroupBJ( udg_plants, function Trig_add_items_to_plants_Func002A )
endfunction

//===========================================================================
function InitTrig_add_items_to_plants takes nothing returns nothing
    set gg_trg_add_items_to_plants = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_add_items_to_plants, Condition( function Trig_add_items_to_plants_Conditions ) )
    call TriggerAddAction( gg_trg_add_items_to_plants, function Trig_add_items_to_plants_Actions )
endfunction

//===========================================================================
