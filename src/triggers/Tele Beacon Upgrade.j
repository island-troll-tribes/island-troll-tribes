
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_tele_tower_upgrade_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetManipulatingUnit()) == UNIT_TELEPORTATION_BEACON ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == ITEM_MANA_CRYSTAL ) ) then
        return false
    endif
    if ( not ( GetUnitAbilityLevelSwapped('A042', GetManipulatingUnit()) < 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_tele_tower_upgrade_Actions takes nothing returns nothing
    call RemoveItem( GetManipulatedItem() )
    call IncUnitAbilityLevelSwapped( 'A042', GetManipulatingUnit() )
endfunction

//===========================================================================
function InitTrig_tele_tower_upgrade takes nothing returns nothing
    set gg_trg_tele_tower_upgrade = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_tele_tower_upgrade, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_tele_tower_upgrade, Condition( function Trig_tele_tower_upgrade_Conditions ) )
    call TriggerAddAction( gg_trg_tele_tower_upgrade, function Trig_tele_tower_upgrade_Actions )
endfunction

//===========================================================================
