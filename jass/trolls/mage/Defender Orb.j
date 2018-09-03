
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Orb_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04P' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Orb_Actions takes nothing returns nothing
    local integer DummyUnitRaw=UNIT_LOCUST_ALT
    local integer DummyUnitSpell='A04O'
    local integer SpellBuff='BPSE'

    local string OrderString="thunderbolt"

    local real CastDistanceMinimum=200
    local real DummyLifeDurationSeconds=10
    local real StartingDistanceAwayFromCaster=0
    local real StartingSwirlRadius=300
    local real MovementPerSecond=0 //actually 1/100 of a second
    local real SwirlIncreasePerSecond=-.13 //actually 1/100 of a second
    local real SpinSpeed=4 //3.6=1 turn per second

    call SwirlActions(DummyUnitRaw,DummyUnitSpell,SpellBuff,OrderString,CastDistanceMinimum,DummyLifeDurationSeconds,StartingDistanceAwayFromCaster,StartingSwirlRadius,MovementPerSecond,SwirlIncreasePerSecond,SpinSpeed)
endfunction

//===========================================================================
function InitTrig_Defender_Orb takes nothing returns nothing
    set gg_trg_Defender_Orb = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_Defender_Orb, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Defender_Orb, Condition( function Trig_Orb_Conditions ) )
    //call TriggerAddAction( gg_trg_Defender_Orb, function Trig_Orb_Actions )
endfunction

//===========================================================================
