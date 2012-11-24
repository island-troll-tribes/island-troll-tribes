
//===========================================================================
function Trig_ward_the_area_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A054' or GetSpellAbilityId() == 'A072' ) ) then
        return false
    endif
    return true
endfunction

function Trig_ward_the_area_Actions takes nothing returns nothing
    local integer i=3
    if(GetSpellAbilityId() == 'A054') then
       set i=GetUnitAbilityLevelSwapped('A054', GetSpellAbilityUnit())
    endif
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = ( 1 + i )
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call CreateNUnitsAtLoc( 1, UNIT_LIVING_CLAY, GetOwningPlayer(GetSpellAbilityUnit()), GetRandomLocInRect(RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), 800.00, 800.00)), bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( ( 240.00 + ( 120.00 * I2R(i) ) ), 'Bhwd', GetLastCreatedUnit() )
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_ward_the_area takes nothing returns nothing
    set gg_trg_ward_the_area = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ward_the_area, Condition( function Trig_ward_the_area_Conditions ) )
    call TriggerAddAction( gg_trg_ward_the_area, function Trig_ward_the_area_Actions )
endfunction

//===========================================================================
