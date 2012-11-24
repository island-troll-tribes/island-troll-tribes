
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Building_Death_Actions takes nothing returns nothing
    local unit u = GetTriggerUnit()
    call PolledWait(0.01)
    if isDefensiveWard(u) and wardCanceled==false then
        if IsUnitInForce(u, TEAM[1]) then
            call destroyedDefensiveWard(0) // NW Tribe
        elseif IsUnitInForce(u, TEAM[2]) then
            call destroyedDefensiveWard(1) // NE Tribe
        elseif IsUnitInForce(u, TEAM[3]) then
            call destroyedDefensiveWard(2) // SE Tribe
        endif
    elseif wardCanceled==true then
        set wardCanceled=false
    endif
endfunction

function defensiveWardCancel takes nothing returns nothing
    set wardCanceled=true
endfunction

//===========================================================================
function InitTrig_Building_Death takes nothing returns nothing
    local trigger t=CreateTrigger()
    set gg_trg_Building_Death = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Building_Death,EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction( gg_trg_Building_Death, function Trig_Building_Death_Actions )
    call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
    call TriggerAddAction( t, function defensiveWardCancel )
endfunction

//===========================================================================
