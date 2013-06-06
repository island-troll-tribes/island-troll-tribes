
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_spirit_ward_cancelled_Copy_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == UNIT_SPIRIT_WARD ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_spirit_ward_cancelled_Copy_Actions takes nothing returns nothing
local player PLAYER = GetOwningPlayer(GetDyingUnit())
if IsPlayerInForce(PLAYER,TEAM[1]) then
    set udg_revivingForce1 = false
elseif IsPlayerInForce(PLAYER,TEAM[2]) then
    set udg_revivingForce2 = false
elseif IsPlayerInForce(PLAYER,TEAM[3]) then
    set udg_revivingForce3 = false
endif
endfunction

//===========================================================================
function InitTrig_spirit_ward_killed takes nothing returns nothing
    set gg_trg_spirit_ward_killed = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_spirit_ward_killed, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_spirit_ward_killed, Condition( function Trig_spirit_ward_cancelled_Copy_Conditions ) )
    call TriggerAddAction( gg_trg_spirit_ward_killed, function Trig_spirit_ward_cancelled_Copy_Actions )
endfunction

//===========================================================================
