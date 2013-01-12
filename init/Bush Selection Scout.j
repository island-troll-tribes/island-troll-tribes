
//===========================================================================
//TESH.scrollpos=22
//TESH.alwaysfold=0
function Trig_Bush_Selection_Priest_Actions takes nothing returns nothing

    local unit TrollUnit
    local integer TrollItemCount
    local unit Bush

   if(GetUnitTypeId(GetTriggerUnit()) == UNIT_SCOUTS_BUSH) then
       if(DistanceBetweenPoints(GetUnitLoc(GetTriggerUnit()),GetUnitLoc(getPlayersTroll(GetTriggerPlayer())))<=300) then
   
set TrollItemCount=0
    set TrollUnit=getPlayersTroll(GetTriggerPlayer())
    set Bush=GetTriggerUnit()

    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5

    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( isThereItem(TrollUnit, bj_forLoopAIndex) ) then
            set TrollItemCount = ( TrollItemCount + 1 )
        
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop

    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 6
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        if ( ItemSwapper(Bush,bj_forLoopBIndex,TrollItemCount) ) then
            call UnitAddItemSwapped( UnitItemInSlotBJ(Bush, bj_forLoopBIndex), TrollUnit )
            set TrollItemCount = ( TrollItemCount - 1 )
        else
        endif
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop

endif
endif
endfunction

//===========================================================================
function InitTrig_Bush_Selection_Scout takes nothing returns nothing
    set gg_trg_Bush_Selection_Scout = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Bush_Selection_Scout, function Trig_Bush_Selection_Priest_Actions )
endfunction

//===========================================================================
