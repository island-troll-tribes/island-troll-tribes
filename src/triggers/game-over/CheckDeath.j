
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

function killedTroll takes nothing returns boolean
    return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetEnumUnit())) 
endfunction

function addStatDeathXP takes nothing returns nothing
    call AddHeroXPSwapped( ( 150 * GetUnitLevel(udg_parameterUnit) ), GetEnumUnit(), true )
    call RegisterEnergyOrHeatKill( GetEnumUnit() )
endfunction

function checkTrollDeath takes nothing returns nothing
    if udg_STARTED and IsUnitAliveBJ(GetEnumUnit()) and ( GetPlayerState(GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD) < 1 or GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) < 1.00 ) then
        call KillUnit( GetEnumUnit() )
        set udg_parameterUnit = GetEnumUnit()
        call ForGroup( GetUnitsInRangeOfLocMatching(800.00, GetUnitLoc(GetEnumUnit()), Condition(function killedTroll)), function addStatDeathXP )
    endif
endfunction

function Trig_checkDeath_Actions takes nothing returns nothing
    call ForGroup( udg_trolls, function checkTrollDeath )
endfunction

//===========================================================================
function InitTrig_checkDeath takes nothing returns nothing
    set gg_trg_checkDeath = CreateTrigger(  )
    call TriggerAddAction( gg_trg_checkDeath, function Trig_checkDeath_Actions )
endfunction

//===========================================================================
