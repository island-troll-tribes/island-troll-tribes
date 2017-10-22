library Jump requires CTL, TerrainPathability optional GetUnitCollision, Table
    /*      
     *      Jumping v. 1.0.1.6 by Maker
     *          -Does not pause units
     *          -Allows jumping in place
     *          -Real life physics equation for the jump arc
     *          -Supports collision with destructables and units
     *
     *      function IsPointJumpable takes real x, real y returns boolean
     *          -Tells if the point is walkable
     *
     *      static method start takes unit un, real x1, real y1, real maxZ, real time, real gravity returns thistype
     *          - un        = unit that jumps
     *          - x1, y1    = coordinates to jump to
     *          - maxZ      = height of the arc
     *          - time      = duration of the jump
     *          - gravity   = well, duh
     *  
     *      method setUnitCollisionHeight takes real h returns nothing
     *          - Overrides the global U_COL_Z variable for the jump instance
     *            If set to 0, the jumping unit won't collide with units
     *            while being in air
     *
     *      method setDestructableCollisionDistance takes real d returns nothing
     *          - Overrides the global D_COL_D variable for the jump instance
     *            If set to 0, the jumping unit won't collide with destructables
     *            while being in air
     *
     *      You can catch the ending of the jump and register it for a trigger like this:
     *          call TriggerRegisterVariableEvent(trigger, "EVENT_JUMP_FINISH", EQUAL, 1)
     *
     *      Import this library and required CTL and IsTerrainWalkable libraries from resources folder.
     *      I recommend also importing GetUnitCollision and Table libraries from resources folder.
     *
     *      Credits
     *      CTL, GetUniCollision    :   Nestharus
     *      IsTerrainWalkable       :   anitarf and Vexorian
     *      Table                   :   Bribe
     */
    globals
        // Tolerance distance for pathability
        private constant    real        TOL                 = 1    
        // Minimum flying heigh for colliding with units. If set to 0 then won't collide with units.
        private constant    real        U_COL_Z             = 96 
        // Collision distance with units. Uses this if GetUnitCollision library is not used
        private constant    real        U_COL_D             = 96   
        // Collision distance with destructables. If set to 0 then won't collide with destructables.
        private constant    real        D_COL_D             = 96  
        // Maximum collision radius of units in the map. 196 for tier 3 Town Halls etc.
        private constant    real        MAX_RAD             = 196
        // Moves the unit to nearest pathable point when landing
        private constant    boolean     PATHING_LAND        = true 
        // Is the turn speed locked when jumping
        private constant    boolean     LOCK_FACING         = false
        
        private             rect        rct                 = Rect(0,0,0,0)
        private             group       enu                 = CreateGroup()
        private             location    loc                 = Location(0,0)
                            real        EVENT_JUMP_FINISH   = 0
                            unit        EVENT_JUMP_UNIT     = null
        private             real        flh                 = 0
        private             boolean     b                   = false
    endglobals
    
    private function GetLocZ takes real x, real y returns real
        call MoveLocation(loc, x, y)
        return GetLocationZ(loc)
    endfunction
    
    private function DestructableFilter takes nothing returns boolean
        if GetDestructableLife(GetFilterDestructable()) > 0 and GetDestructableOccluderHeight(GetFilterDestructable()) > flh then
            set b = true
        endif
        return false
    endfunction
    
    function IsPointJumpable takes real x, real y returns boolean
        if not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
            return IsTerrainWalkable(x, y)
        endif
        return false
    endfunction
    
    struct Jump extends array
        private static unit array u         // Jumping unit  
        private static real array z0        // Location Z at jump origin point
        private static real array sx        // The x component of speed
        private static real array sy        // The y  component of speed
        private static real array t         // Elapsed jump time
        private static real array dt        // How much "time" is passed during each loop
        private static real array g         // Gravity
        private static real array sinZ      // Z angle
        private static real array endX      // Targeted x
        private static real array endY      // Targeted y  
        private static real array tEnd      // Jump end time
        private static real array dfh       // Default flying height
        private static real array col       // Collision size of the unit
        private static real array colUZ     // Minimum height to collide with other units
        private static real array colDD     // Minimum distance to collide with destructables
        private static real array pw        // Propulsion window of the unit
        private static real array ts        // Turn speed of the unit
    
        method setUnitCollisionHeight takes real h returns nothing
            set colUZ[this] = h
        endmethod
    
        method setDestructableCollisionDistance takes real d returns nothing
            set colDD[this] = d
        endmethod
        
        implement CTL
            local real x
            local real y
            local real z
            local real fh
            local unit un
        implement CTLExpire
            set x = GetUnitX(u[this]) + sx[this]
            set y = GetUnitY(u[this]) + sy[this]
            set z = GetLocZ(x, y) - z0[this]
            set t[this] = t[this] + dt[this]
            set fh = sinZ[this] * t[this] - g[this] * t[this] * t[this] / 2. - z + dfh[this]
            if t[this] < tEnd[this] then
                set b = false
                if colDD[this] > 0 then
                    call SetRect(rct, x-colDD[this], y-colDD[this], x+colDD[this], y+colDD[this])
                    call EnumDestructablesInRect(rct, function DestructableFilter, null)
                endif
                if fh < colUZ[this] and not b then
                    set flh = fh
                    call GroupEnumUnitsInRange(enu, x, y, MAX_RAD, null)
                    call GroupRemoveUnit(enu, u[this])
                    loop
                        set un = FirstOfGroup(enu)
                        exitwhen un == null or b
                        if IsUnitInRange(un, u[this], col[this]+1) and not IsUnitType(un, UNIT_TYPE_DEAD) and not IsUnitType(un, UNIT_TYPE_FLYING) then
                            set b = true
                            set un = null
                            set sx[this] = 0
                            set sy[this] = 0
                            set endX[this] = GetUnitX(u[this])
                            set endY[this] = GetUnitY(u[this])
                            call GroupClear(enu)
                        else
                            call GroupRemoveUnit(enu, un)
                        endif
                    endloop
                    if not b then
                        call SetUnitX(u[this], x)
                        call SetUnitY(u[this], y)
                    endif
                elseif not b then
                    call SetUnitX(u[this], x)
                    call SetUnitY(u[this], y)
                else
                    set sx[this] = 0
                    set sy[this] = 0
                    set endX[this] = GetUnitX(u[this])
                    set endY[this] = GetUnitY(u[this])
                endif
                call SetUnitFlyHeight(u[this], fh, 0)
            else
                static if PATHING_LAND then
                    call SetUnitPosition(u[this], endX[this], endY[this])
                else
                    call SetUnitX(u[this], endX[this])
                    call SetUnitY(u[this], endY[this])
                endif
                static if LOCK_FACING then
                    call SetUnitTurnSpeed(u[this], ts[this])
                endif
                call SetUnitPropWindow(u[this], pw[this])
                call SetUnitFlyHeight(u[this], dfh[this], 0)
                set EVENT_JUMP_UNIT = u[this]
                set EVENT_JUMP_FINISH = 0
                set EVENT_JUMP_FINISH = 1
                set EVENT_JUMP_UNIT = null
                set u[this] = null
                call destroy()
            endif
        implement CTLNull
        implement CTLEnd
    
        static method start takes unit un, real x1, real y1, real maxZ, real time, real gravity returns thistype
            local thistype this = create()
            local real x0 = GetUnitX(un)
            local real y0 = GetUnitY(un)
            local real angle = Atan2(y1-y0, x1-x0)
            local real dist = SquareRoot((x1-x0)*(x1-x0) + (y1-y0)*(y1-y0))
            local real speed = dist/time  * 0.031250000
            local real z1 = GetLocZ(x1, y1)
            
            set u[this] = un
            set t[this] = 0
            set endX[this] = x1
            set endY[this] = y1
            set g[this] = gravity
            set z0[this] = GetLocZ(x0, y0)
            set sx[this] = Cos(angle) * speed
            set sy[this] = Sin(angle) * speed
            set dfh[this] = GetUnitDefaultFlyHeight(un)
            
            static if LIBRARY_GetUnitCollision then
                set col[this] = GetUnitCollision(un)
            else
                set col[this] = U_COL_D
            endif
            set colDD[this] = D_COL_D
            set colUZ[this] = U_COL_Z
            
            if z0[this] < z1 then
                set maxZ = maxZ + z1 - z0[this]
            endif
            
            set sinZ[this] = SquareRoot(maxZ*2*gravity)
            set tEnd[this] = (sinZ[this]+SquareRoot(sinZ[this]*sinZ[this]-2*gravity*(z1-z0[this]))) / gravity
            set dt[this] = 0.03125000*(tEnd[this]-t[this]) / time
            static if LOCK_FACING then
                set ts[this] = GetUnitTurnSpeed(un)
                call SetUnitTurnSpeed(un, 0)
            endif
            set pw[this] = GetUnitPropWindow(un)
            call SetUnitPropWindow(un, 0)
            if UnitAddAbility(un, 'Arav') and UnitRemoveAbility(un, 'Arav') then
            endif
            
            return this
        endmethod
    endstruct
endlibrary