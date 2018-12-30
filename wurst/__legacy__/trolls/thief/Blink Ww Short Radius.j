
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
function Trig_blink_ww_short_radius_Func003C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'A01W' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A01V' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A04J' ) ) then
        return true
    endif
    return false
endfunction

function Trig_blink_ww_short_radius_Conditions takes nothing returns boolean
    if ( not Trig_blink_ww_short_radius_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_blink_ww_short_radius_Actions takes nothing returns nothing
local unit c = GetSpellAbilityUnit()
call masterCastAreaCaster(c,GetUnitX(c),GetUnitY(c),'A039',"flare",6)
set c = null
endfunction

//===========================================================================
function InitTrig_blink_ww_short_radius takes nothing returns nothing
    set gg_trg_blink_ww_short_radius = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_blink_ww_short_radius, Condition( function Trig_blink_ww_short_radius_Conditions ) )
    call TriggerAddAction( gg_trg_blink_ww_short_radius, function Trig_blink_ww_short_radius_Actions )
endfunction

//===========================================================================
