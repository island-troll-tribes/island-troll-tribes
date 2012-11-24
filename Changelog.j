
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//! zinc

library ChangeLog {
    
    public {
        integer numChanges;
        string changes[];
    }

    public function DisplayChangeLog(player p) {
        integer i=0;
        for (0 <= i < numChanges) {
            DisplayTimedTextToPlayer(p,0,0,30,GENERAL_COLOR+changes[i]);
        }
    }
    
    function displayNotice() {
        DisplayTextToPlayer( GetLocalPlayer(), 0, 0, GENERAL_COLOR+"Type "+ENERGY_COLOR+"-changelog"+GENERAL_COLOR+" to view changelog for this version" );
	}
    
    function onInit() {
        timer c=CreateTimer();
		TimerStart( c, 120, false, function displayNotice );
    }
}

//! endzinc//===========================================================================
