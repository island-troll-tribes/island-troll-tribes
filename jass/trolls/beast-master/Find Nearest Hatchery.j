
//===========================================================================
function Trig_find_nearest_hatchery_Func001001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == UNIT_HATCHERY )
endfunction
function Trig_find_nearest_hatchery_Func001001002002 takes nothing returns boolean
    return ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) == true )
endfunction
function Trig_find_nearest_hatchery_Func001001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_find_nearest_hatchery_Func001001002001(), Trig_find_nearest_hatchery_Func001001002002() )
endfunction
///^ no change


function Trig_find_nearest_hatchery_Func001A takes nothing returns nothing
    set udg_parameterUnit = GetEnumUnit()
endfunction 

/// no changeV
function Trig_find_nearest_hatchery_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_find_nearest_hatchery_Func001001002)), function Trig_find_nearest_hatchery_Func001A )
endfunction

//===========================================================================
function InitTrig_find_nearest_hatchery takes nothing returns nothing
    set gg_trg_find_nearest_hatchery = CreateTrigger(  )
    call TriggerAddAction( gg_trg_find_nearest_hatchery, function Trig_find_nearest_hatchery_Actions )
endfunction
//===========================================================================
