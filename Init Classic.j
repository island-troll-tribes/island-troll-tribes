
//
// runs when -classic  or -all #### is typed in
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_init_classic_Func001Func001Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_TOTEM ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_HERO_PICKER ) ) then
        return true
    endif
    return false
endfunction

function Trig_init_classic_Func001Func001C takes nothing returns boolean
    if ( not Trig_init_classic_Func001Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_init_classic_Func001A takes nothing returns nothing
    if ( Trig_init_classic_Func001Func001C() ) then
        call RemoveUnit( GetEnumUnit() )
    else
    endif
endfunction

function Trig_init_classic_Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
    set udg_started[( GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit())) - 1 )] = false
endfunction

function Trig_init_classic_Actions takes nothing returns nothing
    call ForGroup( GetUnitsInRectAll(GetPlayableMapRect()), function Trig_init_classic_Func001A )
    call ForGroup( udg_trolls, function Trig_init_classic_Func002A )
    call GroupClear( udg_trolls )
endfunction

//===========================================================================
function InitTrig_init_classic takes nothing returns nothing
    set gg_trg_init_classic = CreateTrigger(  )
    call TriggerAddAction( gg_trg_init_classic, function Trig_init_classic_Actions )
endfunction

//===========================================================================
