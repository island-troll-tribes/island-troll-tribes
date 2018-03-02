library Experience initializer onInit requires ID, Constants, PublicLibrary

  globals
  integer array xpCreep
  integer array xpHero
  endglobals

function takesXP takes nothing returns boolean
    return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true and IsPlayerAlly(GetOwningPlayer(GetFilterUnit()), GetOwningPlayer(GetKillingUnit()) )
endfunction

function ownedNeutral takes nothing returns boolean
    return ( GetOwningPlayer(GetDyingUnit()) == Player(PLAYER_NEUTRAL_PASSIVE) or GetOwningPlayer(GetDyingUnit()) == Player(PLAYER_NEUTRAL_AGGRESSIVE))
endfunction

function Trig_experience_Actions takes nothing returns nothing
    local group heroes
    local unit u
    local integer xpGain
    local integer split
    local integer xpMult = 4
    local integer dyingLevel = GetUnitLevel(GetDyingUnit())
    local real xpReduction = 1.0
    local boolean reduceXP = ownedNeutral()
    local boolean isDyingHero = (IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true)
    set heroes = GetUnitsInRangeMatching(1200, GetUnitX(GetDyingUnit()), GetUnitY(GetDyingUnit()), Condition(function takesXP) )
    set split = CountUnitsInGroup(heroes)

    loop
      set u = FirstOfGroup(heroes)
      exitwhen u == null
      if (UNIT_TROLL_ALL[GetUnitTypeId(u)] == TROLL_SUB_CLASS) then
        set xpMult = 3
      elseif (UNIT_TROLL_ALL[GetUnitTypeId(u)] == TROLL_SUPER_CLASS) then
        set xpMult = 2
      endif

      if (reduceXP) then
        if (GetHeroLevel(u) < 5) then
          set xpReduction = 0.9 - (0.1 * GetHeroLevel(u))
        else
          set xpReduction = 0.4
        endif
      endif

      if (isDyingHero) then
        set xpGain = R2I(xpHero[dyingLevel] * xpMult * xpReduction / split)
        call AddHeroXPSwapped( xpGain, u, TRUE )
      else
        set xpGain = R2I(xpCreep[dyingLevel] * xpMult * xpReduction / split)
        call AddHeroXPSwapped( xpGain, u, TRUE )
      endif
      call GroupRemoveUnit(heroes, u)
    endloop

    set heroes = null
    set u = null
endfunction

//===========================================================================
private function onInit takes nothing returns nothing
    local integer i = 2

    local trigger t = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction( t, function Trig_experience_Actions )

    set xpCreep[1] = 25
    loop
      exitwhen i > 30
      set xpCreep[i] = xpCreep[i-1] + (1 + i) * 5
      set i = i + 1
    endloop

    set xpHero[1] = 100
    set xpHero[2] = 120
    set xpHero[3] = 160
    set xpHero[4] = 220
    set xpHero[5] = 300
    set i = 6
    loop
      exitwhen i > 30
      set xpHero[i] = xpHero[i-1] + 100
      set i = i + 1
    endloop

    set i = 0
    loop
      exitwhen i > PLAYER_NEUTRAL_PASSIVE
      call SetPlayerHandicapXP( Player(i), 0.00 )
      set i = i + 1
    endloop

endfunction
endlibrary
