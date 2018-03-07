
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_plants_init_Func001001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_ANCIENT) == true )
endfunction

function Trig_plants_init_Func001Func002001 takes nothing returns boolean
    return ( GetOwningPlayer(GetEnumUnit()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) )
endfunction

function Trig_plants_init_Func001A takes nothing returns nothing
    call GroupAddUnitSimple( GetEnumUnit(), udg_plants )
    if ( Trig_plants_init_Func001Func002001() ) then
        call SetUnitOwner( GetEnumUnit(), Player(PLAYER_NEUTRAL_PASSIVE), true )
    endif
endfunction

function Trig_plants_init_Actions takes nothing returns nothing
    call ForGroup( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_plants_init_Func001001002)), function Trig_plants_init_Func001A )
endfunction

//===========================================================================
function InitTrig_plants_init takes nothing returns nothing
    set gg_trg_plants_init = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_plants_init, 5.00 )
    call TriggerAddAction( gg_trg_plants_init, function Trig_plants_init_Actions )
endfunction

//===========================================================================
