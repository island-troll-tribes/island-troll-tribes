
function Trig_Bush_Selection_Thief_Actions takes nothing returns nothing
    local unit trollUnit    = getPlayersTroll(GetTriggerPlayer())
    local unit bush         = GetTriggerUnit()
    local integer itemCount = 0
    local integer i         = 0

    if GetUnitTypeId(bush) == UNIT_THIEFS_BUSH then
        if DistanceBetweenPoints(GetUnitLoc(bush),GetUnitLoc(trollUnit)) <= 300 then

            loop
                exitwhen i > 4
                if UnitItemInSlot(trollUnit, i) != null then
                    set itemCount = itemCount + 1
                endif
                set i = i + 1
            endloop

            set i = 0
            loop
                exitwhen i > 5
                if itemCount < 5 and UnitItemInSlot(bush, i) != null then
                    call UnitAddItem( trollUnit, UnitItemInSlot(bush, i) )
                    set itemCount = itemCount + 1
                endif
                set i = i + 1
            endloop

        endif
    endif
endfunction

function InitTrig_Bush_Selection_Thief takes nothing returns nothing
    set gg_trg_Bush_Selection_Thief = CreateTrigger()
    call TriggerAddAction( gg_trg_Bush_Selection_Thief, function Trig_Bush_Selection_Thief_Actions )
endfunction
