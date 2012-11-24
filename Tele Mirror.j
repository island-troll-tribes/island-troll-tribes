
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_tele_mirror_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A042'
endfunction

globals
    string tmirrorfx = "Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl"
endglobals
function Trig_tele_mirror_Actions takes nothing returns nothing
local unit u = GetSpellAbilityUnit()
local unit t = GetSpellTargetUnit()
local real dx = GetUnitX(t) - GetUnitX(u)
local real dy = GetUnitY(t) - GetUnitY(u)
local real dis1 = SquareRoot(dx * dx + dy * dy)
local real ang1 = bj_RADTODEG * Atan2(GetUnitY(t) - GetUnitY(u), GetUnitX(t) - GetUnitX(u)) + 180
local real ang2 = ModuloReal(ang1,360)
local real nx = GetUnitX(u) + dis1 * Cos(ang2 * bj_DEGTORAD)
local real ny = GetUnitY(u) + dis1 * Sin(ang2 * bj_DEGTORAD)
if RectContainsCoords(gg_rct_Playable_Map, nx, ny) then
    if IsTerrainWalkable(nx, ny) then
        call SetUnitPosition(t, nx, ny)
        call SetUnitFacing(t,ModuloReal(GetUnitFacing(t) + 180, 360))
        call DestroyEffect(AddSpecialEffectTarget(tmirrorfx, t, "chest"))
    elseif IsTerrainShallowWater(nx, ny) then
        call SetUnitPosition(t, nx, ny)
        call SetUnitFacing(t,ModuloReal(GetUnitFacing(t) + 180, 360))
        call DestroyEffect(AddSpecialEffectTarget(tmirrorfx, t, "chest"))
    endif
else
    call DisplayTimedTextToPlayer(GetOwningPlayer(t),0,0,5, RED_COLOR+"ERROR: Destination is out of boundaries.")
endif

set u = null
set t = null
endfunction

//===========================================================================
function InitTrig_tele_mirror takes nothing returns nothing
    set gg_trg_tele_mirror = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_tele_mirror, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_tele_mirror, Condition( function Trig_tele_mirror_Conditions ) )
    call TriggerAddAction( gg_trg_tele_mirror, function Trig_tele_mirror_Actions )
endfunction

//===========================================================================
