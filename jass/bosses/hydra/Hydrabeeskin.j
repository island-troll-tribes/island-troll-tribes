
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function HydraBeeConnection takes nothing returns boolean
    return GetTriggerUnit() == Hydra and GetUnitTypeId(GetAttacker()) == UNIT_BEE
endfunction

function TurnBeeHostile takes nothing returns nothing
    call SetUnitOwner(GetAttacker(), Player(12), false)
endfunction

//===========================================================================
function InitTrig_hydrabeeskin takes nothing returns nothing
    set gg_trg_hydrabeeskin = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hydrabeeskin, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_hydrabeeskin, Condition( function HydraBeeConnection ) )
    call TriggerAddAction( gg_trg_hydrabeeskin, function TurnBeeHostile )
endfunction

//===========================================================================
