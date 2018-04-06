
//===========================================================================
function Trig_clay_explosion_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_clay_explosion_Actions takes nothing returns nothing
    local rect area = RectFromCenterSizeBJ(GetUnitLoc(GetSpellAbilityUnit()), 3000.00, 3000.00)
    local real x
    local real y
    local integer i = 0
    local integer numWards = GetRandomInt(8, 12)
    loop
        exitwhen i >= numWards
        set x = GetRandomX(area)
        set y = GetRandomY(area)
        if IsTerrainWalkable(x, y) then
            call CreateUnit(GetOwningPlayer(GetSpellAbilityUnit()), UNIT_LIVING_CLAY, x, y, 0)
            set i = i + 1
        endif
    endloop
    call RemoveRect(area)
    set area = null
endfunction

//===========================================================================
function InitTrig_clay_explosion takes nothing returns nothing
    set gg_trg_clay_explosion = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_clay_explosion, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_clay_explosion, Condition( function Trig_clay_explosion_Conditions ) )
    call TriggerAddAction( gg_trg_clay_explosion, function Trig_clay_explosion_Actions )
endfunction

//===========================================================================
