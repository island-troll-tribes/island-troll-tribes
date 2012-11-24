
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
/*******************************************************
This library is intended for use with trigger Building Creation and Building Death and Cast Defensive Spells
It is not actually private

***/

library DefensiveWard requires PublicLibrary
    
    globals
        // By Force; Team 1 = 0, Team 2 = 1, Team 3 = 2 (arrays start at 0)
        boolean wardCanceled=false
        boolean array teamHasDefensiveWard [3]
        constant integer SPIRIT_SHIELD_DURATION = 30
    endglobals
    
    function isDefensiveWard takes unit whichUnit returns boolean
        return GetUnitTypeId(whichUnit) == UNIT_DEFENSE_WARD
    endfunction
    
    function alreadyHasWard takes integer whichTeam returns boolean
        return teamHasDefensiveWard[whichTeam]
    endfunction
    
    function builtDefensiveWard takes integer whichTeam returns nothing
        set teamHasDefensiveWard[whichTeam] = true
    endfunction
    
    function destroyedDefensiveWard takes integer whichTeam returns nothing
        set teamHasDefensiveWard[whichTeam] = false
    endfunction
    
    // it won't actually kill the ward if the team doesn't already have one
    function destroy2ndWard takes integer whichTeam, unit u returns nothing
        if alreadyHasWard(whichTeam) then
            call AddSpecialEffectLocBJ( GetUnitLoc(u), "Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl" )
            call RemoveUnit(u)
        else
            call builtDefensiveWard(whichTeam)
        endif
    endfunction
    
    // taken from Spells::EMP
    // disables omnis/snares near ward in a 4000 AOE range, even enemies.
    function offensiveBuildings takes nothing returns boolean
        return GetUnitTypeId(GetFilterUnit()) == UNIT_ENSNARE_TRAP or GetUnitTypeId(GetFilterUnit()) == UNIT_OMNITOWER
    endfunction

    function EMP_Actions takes nothing returns nothing
        local unit s = GetSpellAbilityUnit()
        local group g = GetUnitsInRangeMatching(4000, GetUnitX(s), GetUnitY(s), Condition(function offensiveBuildings))
        local group g2 = GetUnitsInRangeMatching(4000, GetUnitX(s), GetUnitY(s), Condition(function offensiveBuildings))
        local unit first
        loop
            set first = FirstOfGroup(g)
            exitwhen first == null
            call PauseUnit(first, true)
            call AddTimedEffectUnit("Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl","overhead", first, SPIRIT_SHIELD_DURATION) // nvm here too ^^
            call GroupRemoveUnit(g, first)
        endloop
        // only changed line, 30 seconds down from 60
        call PolledWait(SPIRIT_SHIELD_DURATION)
        loop
            set first = FirstOfGroup(g2)
            exitwhen first == null
            call PauseUnit(first, false)
            call GroupRemoveUnit(g2, first)
        endloop
        
        set s = null
        set g = null
        set g2 = null
        set first = null
    endfunction
    
    function disableOffensiveBuildings takes nothing returns nothing
        call EMP_Actions()
    endfunction
    
endlibrary

//////////////////////////////////////////////////////////////////////////////
/// Initialization
///

function Trig_PrivateLibrary_Actions takes nothing returns nothing
    set teamHasDefensiveWard[0] = false
    set teamHasDefensiveWard[1] = false
    set teamHasDefensiveWard[2] = false
endfunction

//===========================================================================
function InitTrig_PrivateLibrary takes nothing returns nothing
    set gg_trg_PrivateLibrary = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PrivateLibrary, function Trig_PrivateLibrary_Actions )
endfunction

//===========================================================================
