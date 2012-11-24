
//===========================================================================
function Trig_Effect_Add_Func001C takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == ITEM_BATTLE_SUIT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Effect_Add_Actions takes nothing returns nothing
    if ( Trig_Effect_Add_Func001C() ) then
        call UnitAddAbilityBJ( 'A0BG', GetTriggerUnit() )
    else
        call DoNothing(  )
    endif
endfunction

//===========================================================================
function InitTrig_Effect_Add takes nothing returns nothing
    set gg_trg_Effect_Add = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Effect_Add, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddAction( gg_trg_Effect_Add, function Trig_Effect_Add_Actions )
endfunction

//===========================================================================
