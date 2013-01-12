
//===========================================================================
function Trig_clay_explosion_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_clay_explosion_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = GetRandomInt(6, 15)
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call CreateNUnitsAtLoc( 1, UNIT_LIVING_CLAY, GetOwningPlayer(GetSpellAbilityUnit()), GetRandomLocInRect(RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), 5000.00, 5000.00)), bj_UNIT_FACING )
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_clay_explosion takes nothing returns nothing
    set gg_trg_clay_explosion = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_clay_explosion, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_clay_explosion, Condition( function Trig_clay_explosion_Conditions ) )
    call TriggerAddAction( gg_trg_clay_explosion, function Trig_clay_explosion_Actions )
endfunction

//===========================================================================
