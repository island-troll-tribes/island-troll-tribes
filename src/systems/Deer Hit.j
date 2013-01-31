
//===========================================================================
function Trig_dear_hit_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_ELK ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_dear_hit_Actions takes nothing returns nothing
    call IssuePointOrderLocBJ( GetAttackedUnitBJ(), "move", GetRandomLocInRect(Rect(( GetLocationX(GetUnitLoc(GetAttackedUnitBJ())) - 1400.00 ), ( GetLocationY(GetUnitLoc(GetAttackedUnitBJ())) - 1400.00 ), ( GetLocationX(GetUnitLoc(GetAttackedUnitBJ())) + 1400.00 ), ( GetLocationY(GetUnitLoc(GetAttackedUnitBJ())) + 1400.00 ))) )
endfunction

//===========================================================================
function InitTrig_dear_hit takes nothing returns nothing
    set gg_trg_dear_hit = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_dear_hit, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_dear_hit, Condition( function Trig_dear_hit_Conditions ) )
    call TriggerAddAction( gg_trg_dear_hit, function Trig_dear_hit_Actions )
endfunction

//===========================================================================
