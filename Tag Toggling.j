
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Tag_Toggling_Actions takes nothing returns nothing
    local integer t=GetConvertedPlayerId(GetOwningPlayer(GetAttacker())) - 1
if(t<=11) then
    if ( udg_DAvailable[t] == true ) then
        call RemoveItemFromStockBJ( udg_DItems[t], gg_unit_n00N_0017 )
        set udg_DAvailable[t] = false
        call PingMinimapLocForForceEx( GetPlayersAll(), GetUnitLoc(gg_unit_n00N_0017), 1.50, bj_MINIMAPPINGSTYLE_SIMPLE, 0.00, 100, 0.00 )
        call DisplayTextToForce( GetPlayersAll(), "|c00c93554A Dueling Ticket has been removed" )
    else
        call AddItemToStockBJ( udg_DItems[t], gg_unit_n00N_0017, 1, 1 )
        call DisplayTextToForce( GetPlayersAll(), "|c00c93554A Dueling Ticket has been added" )
        call PingMinimapLocForForceEx( GetPlayersAll(), GetUnitLoc(gg_unit_n00N_0017), 1.50, bj_MINIMAPPINGSTYLE_SIMPLE, 0.00, 100, 0.00 )
        set udg_DAvailable[t] = true
    endif
endif
    call IssueImmediateOrderBJ( GetAttacker(), "stop" )
endfunction

//===========================================================================
function InitTrig_Tag_Toggling takes nothing returns nothing
    set gg_trg_Tag_Toggling = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Tag_Toggling, gg_unit_n00N_0017, EVENT_UNIT_ATTACKED )
    call TriggerAddAction( gg_trg_Tag_Toggling, function Trig_Tag_Toggling_Actions )
endfunction

//===========================================================================
