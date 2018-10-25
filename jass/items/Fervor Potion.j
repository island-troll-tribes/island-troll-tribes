
//===========================================================================
//TESH.scrollpos=27
//TESH.alwaysfold=0
function Trig_fervor_potion_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03Z' or GetSpellAbilityId() == 'A07G') ) then
        return false
    endif
    return true
endfunction

function Trig_fervor_potion_Func006001003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true )
endfunction

function Trig_fervor_potion_Func006001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) == true )
endfunction

function Trig_fervor_potion_Func006001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_fervor_potion_Func006001003001(), Trig_fervor_potion_Func006001003002() )
endfunction

function Trig_fervor_potion_Func006A takes nothing returns nothing
    local unit p=udg_parameterUnit
    local unit m=GetEnumUnit()
    local integer r=GetRandomInt(1,2)
    if(r==1) then
       call masterCastAtCaster(p,m,0,0,'A01K',"shadowstrike")
    endif
endfunction

function Trig_fervor_potion_Actions takes nothing returns nothing
    local unit u
    set udg_parameterUnit = GetSpellAbilityUnit()
    set u=GetSpellAbilityUnit()
    if(GetSpellAbilityId() == 'A03Z') then
       call masterCastAtCaster(u,u,0,0,'A01U',"bloodlust")
       call masterCastAtCaster(u,u,0,0,'A07H',"innerfire")
    else
       call masterCastNoTarget(u,GetUnitX(u),GetUnitY(u),0,0,'A035',"stomp")
       call masterCastAtCaster(u,u,0,0,'A07I',"innerfire")
    endif
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(512, GetUnitLoc(udg_parameterUnit), Condition(function Trig_fervor_potion_Func006001003)), function Trig_fervor_potion_Func006A )
endfunction

//===========================================================================
function InitTrig_fervor_potion takes nothing returns nothing
    set gg_trg_fervor_potion = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_fervor_potion, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_fervor_potion, Condition( function Trig_fervor_potion_Conditions ) )
    call TriggerAddAction( gg_trg_fervor_potion, function Trig_fervor_potion_Actions )
endfunction

//===========================================================================
