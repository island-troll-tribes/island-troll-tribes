
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function HydraDepsawnCOnd takes nothing returns boolean
    return GetUnitTypeId(GetTriggerUnit()) == UNIT_LESSER_HYDRA
endfunction

function ResetDespawnTimer takes nothing returns nothing
    call TimerStart(hydraDespawnTimer, 60, false, function HydraDespawn)
endfunction

//===========================================================================
function InitTrig_hydradespawn takes nothing returns nothing
    set gg_trg_hydradespawn = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hydradespawn, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_hydradespawn, Condition( function HydraDepsawnCOnd ) )
    call TriggerAddAction( gg_trg_hydradespawn, function ResetDespawnTimer )
endfunction

//===========================================================================
