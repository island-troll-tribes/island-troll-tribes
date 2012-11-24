
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_self_pres_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05Q' ) ) then
        return false
    endif
    return true
endfunction

function presCheck takes nothing returns boolean
   return IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) and checkTroll(GetFilterUnit()) and GetFilterUnit()!=udg_parameterUnit
endfunction

function Trig_self_pres_Actions takes nothing returns nothing
    local unit u=GetSpellAbilityUnit()
    //local unit test=H2U(GetHandleHandle(u,"node1"))
    local unit test=LoadUnitHandle(udg_GameHash,GetHandleId(u),StringHash("node1"))
    local group g
    local unit t
    local real X=LoadReal(udg_GameHash,GetHandleId(u),StringHash("X"))
    local real Y=LoadReal(udg_GameHash,GetHandleId(u),StringHash("Y"))
    
    if(test!=null and DistanceBetweenPoints(Location(X,Y),GetUnitLoc(u))<=LoadReal(udg_GameHash,GetHandleId(u),StringHash("radius"))) then
      set udg_parameterUnit=u
      set g=GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function presCheck))
      call AddTimedEffectUnit("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl","origin",u,2.5)
loop
    set t = FirstOfGroup(g)
    exitwhen t == null

    call SetUnitLifeBJ( t, ( GetUnitStateSwap(UNIT_STATE_LIFE, t) + 50.00 ) )
    call SetUnitManaBJ( t, ( GetUnitStateSwap(UNIT_STATE_MANA, t) + 50.00 ) )
    call SetPlayerStateBJ( GetOwningPlayer(t), PLAYER_STATE_RESOURCE_GOLD, IMinBJ(udg_MAX_HEAT, ( GetPlayerState(GetOwningPlayer(t), PLAYER_STATE_RESOURCE_GOLD) + 50 )) )
    call AddTimedEffectUnit("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl","origin",t,2.5)
    call GroupRemoveUnit(g, t)
endloop

    else
    call SetUnitLifeBJ( u, ( GetUnitStateSwap(UNIT_STATE_LIFE, u) + 50.00 ) )
    call SetUnitManaBJ( u, ( GetUnitStateSwap(UNIT_STATE_MANA, u) + 50.00 ) )
    call SetPlayerStateBJ( GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD, IMinBJ(udg_MAX_HEAT, ( GetPlayerState(GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD) + 50 )) )
    endif
endfunction

//===========================================================================
function InitTrig_self_pres takes nothing returns nothing
    set gg_trg_self_pres = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_self_pres, Condition( function Trig_self_pres_Conditions ) )
    call TriggerAddAction( gg_trg_self_pres, function Trig_self_pres_Actions )
endfunction

//===========================================================================
