function Trig_no_trees_Conditions takes nothing returns boolean
	return not udg_STARTED and mode_enter and udg_TREES==true
endfunction

function Trig_no_trees_Func001Func001001 takes nothing returns boolean
    return ( GetDestructableTypeId(GetEnumDestructable()) == DEST_RUINS_TREE )
endfunction

function Trig_no_trees_Func001Func002001 takes nothing returns boolean
    return ( GetDestructableTypeId(GetEnumDestructable()) == DEST_SUPER_TREE )
endfunction

function Trig_no_trees_Func001Func003001 takes nothing returns boolean
    return ( GetDestructableTypeId(GetEnumDestructable()) == DEST_RUINS_TREE_CANOPY )
endfunction

function Trig_no_trees_Func001Func004001 takes nothing returns boolean
    return ( GetDestructableTypeId(GetEnumDestructable()) == DEST_SUPER_TREE_CANOPY )
endfunction

function Trig_no_trees_Func001Func005001 takes nothing returns boolean
    return ( GetDestructableTypeId(GetEnumDestructable()) == DEST_FALSE_TREE )
endfunction

function Trig_no_trees_Func001A takes nothing returns nothing
    if ( Trig_no_trees_Func001Func001001() ) then
        call RemoveDestructable( GetEnumDestructable() )
    else
        call DoNothing(  )
    endif
    if ( Trig_no_trees_Func001Func002001() ) then
        call RemoveDestructable( GetEnumDestructable() )
    else
        call DoNothing(  )
    endif
    if ( Trig_no_trees_Func001Func003001() ) then
        call RemoveDestructable( GetEnumDestructable() )
    else
        call DoNothing(  )
    endif
    if ( Trig_no_trees_Func001Func004001() ) then
        call RemoveDestructable( GetEnumDestructable() )
    else
        call DoNothing(  )
    endif
    if ( Trig_no_trees_Func001Func005001() ) then
        call RemoveDestructable( GetEnumDestructable() )
    else
        call DoNothing(  )
    endif
endfunction

function Trig_no_trees_Func003001002001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_no_trees_Func003001002002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_TOWNHALL) == false )
endfunction

function Trig_no_trees_Func003001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_no_trees_Func003001002001(), Trig_no_trees_Func003001002002() )
endfunction

function Trig_no_trees_Func003A takes nothing returns nothing
    call SetUnitPositionLoc( GetEnumUnit(), GetRandomLocInRect(gg_rct_play_area) )
endfunction

function Trig_no_trees_Func004001002001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_no_trees_Func004001002002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_TOWNHALL) == false )
endfunction

function Trig_no_trees_Func004001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_no_trees_Func004001002001(), Trig_no_trees_Func004001002002() )
endfunction

function Trig_no_trees_Func004A takes nothing returns nothing
    call SetUnitPositionLoc( GetEnumUnit(), GetRandomLocInRect(gg_rct_play_area) )
endfunction

function Trig_no_trees_Actions takes nothing returns nothing
    call EnumDestructablesInRectAll( GetPlayableMapRect(), function Trig_no_trees_Func001A )
    set udg_TREES = false
    call ForGroupBJ( GetUnitsOfPlayerMatching(Player(PLAYER_NEUTRAL_PASSIVE), Condition(function Trig_no_trees_Func003001002)), function Trig_no_trees_Func003A )
    call ForGroupBJ( GetUnitsOfPlayerMatching(Player(PLAYER_NEUTRAL_AGGRESSIVE), Condition(function Trig_no_trees_Func004001002)), function Trig_no_trees_Func004A )
    call DisplayTimedTextToForce( GetPlayersAll(), 7.00, "TRIGSTR_2915" )
endfunction

//===========================================================================
function InitTrig_no_trees takes nothing returns nothing
    set gg_trg_no_trees = CreateTrigger(  )
    //call TriggerRegisterPlayerChatEvent( gg_trg_no_trees, Player(0), "-no trees", true )
    call TriggerAddCondition( gg_trg_no_trees, Condition( function Trig_no_trees_Conditions ) )
    call TriggerAddAction( gg_trg_no_trees, function Trig_no_trees_Actions )
endfunction
