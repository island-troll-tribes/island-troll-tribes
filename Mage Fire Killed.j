
//===========================================================================
function Trig_mage_fire_killed_Func002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetDyingUnit()) == UNIT_MAGE_FIRE )
endfunction

function Trig_mage_fire_killed_Func002002 takes nothing returns boolean
    return ( GetUnitTypeId(GetCancelledStructure()) == UNIT_MAGE_FIRE )
endfunction

function Trig_mage_fire_killed_Conditions takes nothing returns boolean
    if ( not GetBooleanOr( Trig_mage_fire_killed_Func002001(), Trig_mage_fire_killed_Func002002() ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_mage_fire_killed_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_MAGE_FIRE_KIT, GetUnitLoc(GetTriggerUnit()) )
endfunction

//===========================================================================
function InitTrig_mage_fire_killed takes nothing returns nothing
    set gg_trg_mage_fire_killed = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_mage_fire_killed, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_mage_fire_killed, Condition( function Trig_mage_fire_killed_Conditions ) )
    call TriggerAddAction( gg_trg_mage_fire_killed, function Trig_mage_fire_killed_Actions )
endfunction

//===========================================================================
