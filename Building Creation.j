
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Building_Creation_Actions takes nothing returns nothing
    local unit u = GetTriggerUnit()
    if isDefensiveWard(u) then
        if IsUnitInForce(u, TEAM[1]) then
            call destroy2ndWard(0, u) // NW Tribe
        elseif IsUnitInForce(u, TEAM[2]) then
            call destroy2ndWard(1, u) // NE Tribe
        elseif IsUnitInForce(u, TEAM[3]) then
            call destroy2ndWard(2, u) // SE Tribe
        endif
    endif
endfunction

//===========================================================================
function InitTrig_Building_Creation takes nothing returns nothing
    set gg_trg_Building_Creation = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Building_Creation, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    call TriggerAddAction( gg_trg_Building_Creation, function Trig_Building_Creation_Actions )
endfunction

//===========================================================================
