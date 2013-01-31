
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_spawn_normal_Actions takes nothing returns nothing
    call modStats()
    call spawnItems()
    call spawnAnimals()
    call makeFish()
    call ConditionalTriggerExecute( gg_trg_add_items_to_plants )
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,40,"2#Items")
endfunction

//===========================================================================
function InitTrig_spawn_normal takes nothing returns nothing
    set gg_trg_spawn_normal = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_spawn_normal, 300.00 )
    call TriggerAddAction( gg_trg_spawn_normal, function Trig_spawn_normal_Actions )
endfunction

//===========================================================================
