
library ittEvent requires MMD, PublicLibrary

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
        public static method create takes string eventName, integer TYPE returns ittEvent
            local ittEvent myself = ittEvent.allocate()
	  		local integer  goal   = GOAL_HIGH
	  		if TYPE == TYPE_STRING then
				set goal = GOAL_NONE
			endif
            call DefineValue (eventName, TYPE, goal, SUGGEST_LEADERBOARD)
            set myself.isTracking = eventName
            set myself.itsType = TYPE
            return myself
        endmethod

        public method operator []= takes player pid, string value returns nothing
	  		debug call DisplayTextToPlayer(pid, 0, 0, "Storing ITT MMD event "+.isTracking+" for "+GetPlayerRealName(pid))
            if not((GetPlayerController(pid) == MAP_CONTROL_USER) and (GetPlayerSlotState(pid) == PLAYER_SLOT_STATE_PLAYING or GetPlayerSlotState(pid) == PLAYER_SLOT_STATE_LEFT)) then
                return
            endif
            if .itsType == TYPE_STRING then
	  			debug call DisplayTextToPlayer(pid, 0, 0, "MMD event value: "+value)
                call UpdateValueString(.isTracking, pid, value)
            elseif .itsType == TYPE_INT then
                call UpdateValueInt(.isTracking, pid, OP_SET, S2I(value))
            elseif .itsType == TYPE_REAL then
                call UpdateValueReal(.isTracking, pid, OP_SET, S2R(value))
            endif
        endmethod

        public method addForPlayer takes player pid, real value returns nothing
            debug call BJDebugMsg(COLOR_GRAY+"ADDING "+R2S(value)+" TO "+.isTracking+" FOR PLAYER "+I2S(GetPlayerId(pid))+"|r")
            if .itsType == TYPE_REAL then
                call UpdateValueReal(.isTracking, pid, OP_ADD, value)
            elseif .itsType == TYPE_INT then
                call UpdateValueInt(.isTracking, pid, OP_ADD, R2I(value))
            endif
        endmethod

        // Update int value
        public method updateIntValue takes player pid, integer value returns nothing
            //   UpdateValueInt (string name, player p, integer op, integer value)
            call UpdateValueInt (.isTracking, pid, OP_SET, value)
        endmethod
        
        // update string value
        public method updateStringValue takes player pid, string value returns nothing
            //   UpdateValueString (takes string name, player p, string value)
            call UpdateValueString (.isTracking, pid, value)
        endmethod
        
        // update real value
        public method updateRealValue takes player pid, real value returns nothing
            //   UpdateValueReal (string name, player p, integer op, real value)
            call UpdateValueReal (.isTracking, pid, OP_SET, value)
        endmethod
        
    endstruct
    
endlibrary
//===========================================================================
