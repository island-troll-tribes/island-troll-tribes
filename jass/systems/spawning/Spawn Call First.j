
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_spawn_call_first_Actions takes nothing returns nothing
//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,40,"1#Items Start")
call spawnAnimals()
call spawnItems()
call makeFish()
call ConditionalTriggerExecute( gg_trg_add_items_to_plants )
//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,40,"1#Items End")
endfunction

//===========================================================================
function InitTrig_spawn_call_first takes nothing returns nothing
    set gg_trg_spawn_call_first = CreateTrigger(  )
    //call TriggerRegisterTimerEventSingle( gg_trg_spawn_call_first, 36.00 )
    call TriggerAddAction( gg_trg_spawn_call_first, function Trig_spawn_call_first_Actions )
endfunction

//===========================================================================
