
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_sold_Conditions takes nothing returns boolean
    if GetUnitTypeId(GetSellingUnit()) != UNIT_TROLL_TOTEM then
        return false
    endif
    call GroupAddUnitSimple( GetSoldUnit(), udg_trolls )
    set udg_PUnits[( GetConvertedPlayerId(GetOwningPlayer(GetSoldUnit())) - 1 )] = GetSoldUnit()
    call PauseUnitBJ( true, GetSoldUnit() )
    call ModifyHeroSkillPoints( GetSoldUnit(), bj_MODIFYMETHOD_SET, 0 )
    call SuspendHeroXPBJ( false, GetSoldUnit() )
    call SetPlayerStateBJ( GetOwningPlayer(GetSoldUnit()), PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
    set udg_started[( GetConvertedPlayerId(GetOwningPlayer(GetSoldUnit())) - 1 )] = true
    return false
endfunction

//===========================================================================
function InitTrig_sold takes nothing returns nothing
    set gg_trg_sold = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_sold, EVENT_PLAYER_UNIT_SELL )
    call TriggerAddCondition( gg_trg_sold, Condition( function Trig_sold_Conditions ) )
endfunction

//===========================================================================
