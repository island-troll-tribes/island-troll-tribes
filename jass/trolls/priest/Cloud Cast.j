
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_cloud_cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_cloud_cast_Actions takes nothing returns nothing
call masterCastAreaCaster(GetSpellAbilityUnit(),GetSpellTargetX(),GetSpellTargetY(),'A02I',"cloudoffog",12)
endfunction

//===========================================================================
function InitTrig_cloud_cast takes nothing returns nothing
    set gg_trg_cloud_cast = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_cloud_cast, Condition( function Trig_cloud_cast_Conditions ) )
    call TriggerAddAction( gg_trg_cloud_cast, function Trig_cloud_cast_Actions )
endfunction

//===========================================================================
