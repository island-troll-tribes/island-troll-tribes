
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_no_herbs_Conditions takes nothing returns boolean
    return not udg_STARTED and mode_enter
endfunction

function Trig_no_herbs_Func001001002001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_no_herbs_Func001001002002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_TOWNHALL) == false )
endfunction

function Trig_no_herbs_Func001001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_no_herbs_Func001001002001(), Trig_no_herbs_Func001001002002() )
endfunction

function Trig_no_herbs_Func001002 takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_no_herbs_Func002001002001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_no_herbs_Func002001002002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_TOWNHALL) == false )
endfunction

function Trig_no_herbs_Func002001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_no_herbs_Func002001002001(), Trig_no_herbs_Func002001002002() )
endfunction

function Trig_no_herbs_Func002002 takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_no_herbs_Actions takes nothing returns nothing
    call ForGroup( GetUnitsOfPlayerMatching(Player(PLAYER_NEUTRAL_PASSIVE), Condition(function Trig_no_herbs_Func001001002)), function Trig_no_herbs_Func001002 )
    call ForGroup( GetUnitsOfPlayerMatching(Player(PLAYER_NEUTRAL_AGGRESSIVE), Condition(function Trig_no_herbs_Func002001002)), function Trig_no_herbs_Func002002 )
    set udg_Herbs = true
    call DisplayTimedTextToForce( GetPlayersAll(), 7.00, "The Herb bushes near the center have been removed." )
endfunction

//===========================================================================
function InitTrig_no_herbs takes nothing returns nothing
    //call TriggerRegisterPlayerChatEvent( gg_trg_no_herbs, Player(0), "-no herbs", true )
    call TriggerAddCondition( gg_trg_no_herbs, Condition( function Trig_no_herbs_Conditions ) )
    call TriggerAddAction( gg_trg_no_herbs, function Trig_no_herbs_Actions )
endfunction//===========================================================================
