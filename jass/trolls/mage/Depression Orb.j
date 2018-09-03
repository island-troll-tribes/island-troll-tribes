
//===========================================================================
//TESH.scrollpos=1
//TESH.alwaysfold=0
function Trig_DOrb_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04R' ) ) then
        return false
    endif
    return true
endfunction

function Trig_DOrb_Actions takes nothing returns nothing
    local integer DummyUnitRaw=UNIT_LOCUST
    local integer DummyUnitSpell='A025'
    local integer SpellBuff=DEST_SUPER_TREE

    local string OrderString="acidbomb"

    local real CastDistanceMinimum=400
    local real DummyLifeDurationSeconds=3
    local real StartingDistanceAwayFromCaster=50
    local real StartingSwirlRadius=150
    local real MovementPerSecond=2.75 //actually 1/100 of a second
    local real SwirlIncreasePerSecond=0 //actually 1/100 of a second
    local real SpinSpeed=3.6 //3.6=1 turn per second

    call SwirlActions(DummyUnitRaw,DummyUnitSpell,SpellBuff,OrderString,CastDistanceMinimum,DummyLifeDurationSeconds,StartingDistanceAwayFromCaster,StartingSwirlRadius,MovementPerSecond,SwirlIncreasePerSecond,SpinSpeed)
endfunction

//===========================================================================
function InitTrig_Depression_Orb takes nothing returns nothing
    set gg_trg_Depression_Orb = CreateTrigger(  )
 //   call TriggerRegisterAnyUnitEventBJ( gg_trg_Depression_Orb, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Depression_Orb, Condition( function Trig_DOrb_Conditions ) )
    //call TriggerAddAction( gg_trg_Depression_Orb, function Trig_DOrb_Actions )
endfunction

//===========================================================================
