
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0


function Trig_Buying_Actions takes nothing returns nothing
    local integer t=GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit())) - 1
    local integer id=GetItemTypeId(GetSoldItem())
    local integer q=0
    call RemoveItem( GetSoldItem() )
    loop
        exitwhen (udg_DItems[q]==id) or q==12
        set q=q+1
    endloop




    if(IsPlayerEnemy(GetOwningPlayer(GetBuyingUnit()), Player(q)) and not udg_NOOB_TIME) then
       if(udg_DualInProgress==false) then
            call DisplayTextToForce( GetPlayersEnemies(Player(q)), "|c00c93554A Dueling Ticket has been removed" )

            set udg_DAvailable[q] = false
            call getPlayersTroll(Player(q))
            set udg_DualUnit1=udg_parameterUnit
            set udg_DualUnit2=GetBuyingUnit()
            set udg_DualInProgress=true
            call ConditionalTriggerExecute(gg_trg_Start_Dual_CountDown)
       endif
    else
        call AddItemToStockBJ( udg_DItems[q], gg_unit_n00N_0017, 1, 1 )
    endif
endfunction

//===========================================================================
function InitTrig_Buying takes nothing returns nothing
    set gg_trg_Buying = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buying, gg_unit_n00N_0017, EVENT_UNIT_SELL_ITEM )
    call TriggerAddAction( gg_trg_Buying, function Trig_Buying_Actions )
endfunction
//===========================================================================
