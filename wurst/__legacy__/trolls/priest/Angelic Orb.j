
//===========================================================================
function AOrb_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_AOrb_Actions takes nothing returns nothing
    local integer DummyUnitRaw=UNIT_LOCUST_INNER_FIRE
    local integer DummyUnitSpell='Ainf'
    local integer SpellBuff='BHds'

    local string OrderString="innerfire"

    local real CastDistanceMinimum=150
    local real DummyLifeDurationSeconds=3
    local real StartingDistanceAwayFromCaster=0
    local real StartingSwirlRadius=0
    local real MovementPerSecond=2.33 //actually 1/100 of a second
    local real SwirlIncreasePerSecond=0 //actually 1/100 of a second
    local real SpinSpeed=0.0 //3.6=1 turn per second

    call SwirlActions(DummyUnitRaw,DummyUnitSpell,SpellBuff,OrderString,CastDistanceMinimum,DummyLifeDurationSeconds,StartingDistanceAwayFromCaster,StartingSwirlRadius,MovementPerSecond,SwirlIncreasePerSecond,SpinSpeed)
endfunction

//===========================================================================
function InitTrig_Angelic_Orb takes nothing returns nothing
    set gg_trg_Angelic_Orb = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_Angelic_Orb, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Angelic_Orb, Condition( function AOrb_Conditions ) )
    call TriggerAddAction( gg_trg_Angelic_Orb, function Trig_AOrb_Actions )
endfunction

//===========================================================================
