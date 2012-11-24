
//===========================================================================
function Trig_omnitower_stuff_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetManipulatingUnit()) == UNIT_OMNITOWER ) ) then
        return false
    endif
    return true
endfunction

function Trig_omnitower_stuff_Func001Func002C takes nothing returns boolean
    if ( ( GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED ) ) then
        return true
    endif
    return false
endfunction

function Trig_omnitower_stuff_Func001C takes nothing returns boolean
    if ( not Trig_omnitower_stuff_Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_omnitower_stuff_Actions takes nothing returns nothing
    if ( Trig_omnitower_stuff_Func001C() ) then
    else
        call UnitRemoveItemSwapped( GetManipulatedItem(), GetManipulatingUnit() )
    endif
endfunction

//===========================================================================
function InitTrig_omnitower_stuff takes nothing returns nothing
    set gg_trg_omnitower_stuff = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_omnitower_stuff, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_omnitower_stuff, Condition( function Trig_omnitower_stuff_Conditions ) )
    call TriggerAddAction( gg_trg_omnitower_stuff, function Trig_omnitower_stuff_Actions )
endfunction

//===========================================================================
