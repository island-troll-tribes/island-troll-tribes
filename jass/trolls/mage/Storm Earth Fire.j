
//===========================================================================
//TESH.scrollpos=15
//TESH.alwaysfold=0
function Trig_Storm_Earth_Fire_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02G' ) ) then
        return false
    endif
    return true
endfunction
//
function c1 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true )
endfunction

function c2 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) == true )
endfunction

function PLO takes nothing returns boolean
    return GetBooleanAnd( c1(), c2() )
endfunction
//
function cast1 takes nothing returns nothing
    local unit p=udg_parameterUnit
    local unit m=GetEnumUnit()
       call masterCastAtCaster(p,m,0,0,'ACfl',"forkedlightning")
       call masterCastAtCaster(p,m,0,0,'A017',"entanglingroots")
       call masterCastAtCaster(p,m,0,0,'ACtb',"creepthunderbolt")
endfunction

function Trig_Storm_Earth_Fire_Actions takes nothing returns nothing
set udg_parameterUnit=GetSpellAbilityUnit()
    call masterCastAreaCaster(GetSpellAbilityUnit(),GetUnitX(GetSpellAbilityUnit()),GetUnitY(GetSpellAbilityUnit()),'A01T',"fanofknives",10)
call ForGroup( GetUnitsInRangeOfLocMatching(512, GetUnitLoc(GetSpellAbilityUnit()), Condition(function PLO)), function cast1 )

endfunction

//===========================================================================
function InitTrig_Storm_Earth_Fire takes nothing returns nothing
    set gg_trg_Storm_Earth_Fire = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_Storm_Earth_Fire, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Storm_Earth_Fire, Condition( function Trig_Storm_Earth_Fire_Conditions ) )
    //call TriggerAddAction( gg_trg_Storm_Earth_Fire, function Trig_Storm_Earth_Fire_Actions )
endfunction

//===========================================================================
