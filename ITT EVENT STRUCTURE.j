
//===========================================================================
//TESH.scrollpos=-1
//TESH.alwaysfold=0
library ittEvent

    ////////////////////////////////////////////////////////////////
    /// ittEvent Structure
    ////////////////////////////////////////////////////////////////
    
    struct ittEvent
        string  isTracking=""
        integer itsType=0
        
        /////////////////////////////////////////////
        /// public methods
        /////////////////////////////////////////////
        
        // Constructor
        public static method create takes string eventName, integer TYPE  returns ittEvent
            local ittEvent myself = ittEvent.allocate()
            // UpdateValueInt (string name, player p, integer op, integer value)
            call DefineValue (eventName, TYPE, GOAL_HIGH, SUGGEST_LEADERBOARD)
            set myself.isTracking = eventName
            set myself.itsType = TYPE
            return myself
        endmethod
        
        // Update int value
        public method updateIntValue takes player pid, integer value returns nothing
            //   UpdateValueInt (string name, player p, integer op, integer value)
            call UpdateValueInt (.isTracking, pid, OP_ADD, value)
        endmethod
        
        // update string value
        public method updateStringValue takes player pid, string value returns nothing
            //   UpdateValueString (takes string name, player p, string value)
            call UpdateValueString (.isTracking, pid, value)
        endmethod
        
        // update real value
        public method updateRealValue takes player pid, real value returns nothing
            //   UpdateValueReal (string name, player p, integer op, real value)
            call UpdateValueReal (.isTracking, pid, OP_ADD, value)
        endmethod
        
    endstruct
    
endlibrary//===========================================================================
