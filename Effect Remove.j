
//===========================================================================
function Trig_Effect_Remove_Func001C takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == ITEM_BATTLE_SUIT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Effect_Remove_Actions takes nothing returns nothing
    if ( Trig_Effect_Remove_Func001C() ) then
        call UnitRemoveAbilityBJ( 'A0BG', GetTriggerUnit() )
    else
        call DoNothing(  )
    endif
endfunction

//===========================================================================
function InitTrig_Effect_Remove takes nothing returns nothing
    set gg_trg_Effect_Remove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Effect_Remove, EVENT_PLAYER_UNIT_DROP_ITEM )
    call TriggerAddAction( gg_trg_Effect_Remove, function Trig_Effect_Remove_Actions )
endfunction
