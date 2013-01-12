
//===========================================================================
function Trig_Fowl_Play_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07O' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Fowl_Play_Func001001003 takes nothing returns boolean
    return ( IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function Trig_Fowl_Play_Func001A takes nothing returns nothing
if(checkTroll(GetEnumUnit())) then
 call masterCastAtTarget(GetSpellAbilityUnit(),GetEnumUnit(),0,0,'AChx',"hex")
endif
endfunction

function Trig_Fowl_Play_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(450.00, GetUnitLoc(GetSpellAbilityUnit()), Condition(function Trig_Fowl_Play_Func001001003)), function Trig_Fowl_Play_Func001A )
endfunction

//===========================================================================
function InitTrig_Fowl_Play takes nothing returns nothing
    set gg_trg_Fowl_Play = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Fowl_Play, Condition( function Trig_Fowl_Play_Conditions ) )
    call TriggerAddAction( gg_trg_Fowl_Play, function Trig_Fowl_Play_Actions )
endfunction

//===========================================================================
