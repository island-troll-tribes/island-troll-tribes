
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//! zinc

library CureAllCast requires DUMMYLIB {
    
    public {
        constant integer SPELL_DISEASE = 'A05K';
    }
    
    // Casting Twice Removes AM + DIS
    function CureAllItemCast() {
        trigger t = CreateTrigger();
        TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_CAST );
        TriggerAddCondition( t, Condition( function() -> boolean {
            if ( GetSpellAbilityId() == SPELL_DISEASE ) {
                masterCastAtTarget(GetSpellTargetUnit(),GetSpellTargetUnit(),0,0,'A02H',"autodispel");
                masterCastAtTarget(GetSpellTargetUnit(),GetSpellTargetUnit(),0,0,'A02H',"autodispel");
            }
            return false;
        }));
        t = null;
    }
    
    function onInit() {
        CureAllItemCast();
    }
}

//! endzinc//===========================================================================
