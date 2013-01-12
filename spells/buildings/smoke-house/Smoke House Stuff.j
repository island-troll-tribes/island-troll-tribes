
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//! zinc

library SmokeHouse {
    
    private {
        constant real COOKED_TO_SMOKED_EFFICIENCY = 0.75;
        constant real DISEASED_TO_SMOKED_EFFICIENCY = 0.49;
    }
    
    private function SmokeMeat() -> boolean {
        integer j=0;
        integer k=0;
        integer l=0;
        real m=0;
        unit u;
        item i;
        if (GetSpellAbilityId()!=SPELL_SMOKE_MEAT) return false;
        u = GetSpellAbilityUnit();
        for ( 0<= j <= 5 ) {
            i = UnitItemInSlot(u, j);
            l = GetItemTypeId(i);
            if (l==ITEM_COOKED_MEAT || l==ITEM_DISEASED_MEAT) {
                k = GetItemCharges(i);
                RemoveItem(i);
                i = CreateItem(ITEM_SMOKED_MEAT,GetUnitX(u),GetUnitY(u));
                if (l==ITEM_COOKED_MEAT) {
                    m = k*COOKED_TO_SMOKED_EFFICIENCY;
                }
                else {
                    m = k*DISEASED_TO_SMOKED_EFFICIENCY;
                }
                k = R2I(m);
                if (m - I2R(R2I(m)) >= 0.5) {
                    k = k + 1;
                }
                SetItemCharges(i, k);
                UnitAddItem(u, i);
            }
        }
        i = null;
        return false;
    }
    
    function onInit() {
        trigger t = CreateTrigger();
        TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT );
        TriggerAddCondition(t, Condition(function SmokeMeat));
    }
    
}

//! endzinc//===========================================================================
