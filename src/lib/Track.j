library Track /* v3.0.1.0
*************************************************************************************
*
*   Manages trackable objects, allowing for easy event registrations, data retrieval,
*   and adds the capability of retrieving which player interacted with the trackable.    
*
*************************************************************************************
*
*   */uses/*
*   
*       */ Table /*       hiveworkshop.com/forums/jass-functions-413/snippet-new-table-188084/
*
************************************************************************************
*
*   SETTINGS
*/
globals
    private constant integer PLATFORM = 'Otip'
endglobals
/*
************************************************************************************
*
*    Functions
*
*        function CreateTrack takes string modelPath, real x, real y, real z, real facing returns Track
*            - Creates a trackable of "modelPath" at the coordinates ( x, y, z ) with 
*            - "facing" in degrees.
*        function CreateTrackForPlayer takes string modelPath, real x, real y, real z, real facing returns Track
*            - Same as the function above, except it will create it for only one player.
*
*        function RegisterAnyClickEvent takes code c returns nothing
*            - The code will be executed every time a trackable is clicked.
*        function RegisterAnyHoverEvent takes code c returns nothing
*            - The code will be executed every time a trackable is hovered.
*        function RegisterClickEvent takes Track obj, code c returns nothing
*            - The code will be executed every time a trackable of the instance
*            - "obj" is clicked.
*        function RegisterHoverEvent takes Track obj, code returns nothing
*            - The code will be executed every time a trackable of the instance
*            - "obj" is hovered.
*
*        function EnableTrackInstance takes Track obj, boolean flag returns nothing
*            - If an instance is enabled, it will enable its events to fire.
*            - All instances are enabled by default.
*        function IsTrackInstanceEnabled takes Track obj returns boolean
*            - Returns whether or not an instance has its events enabled.
*
*    Event Responses
*
*        function GetTriggerTrackInstance takes nothing returns Track
*            - Returns the Track instance that had a player interaction.
*        function GetTriggerTrackable takes nothing returns trackable
*            - Returns the trackable object that had a player interaction.
*        function GetTriggerTrackablePlayer takes nothing returns player
*            - Returns the player that had interacted with the trackable object.
*
*******************************************************************
*
*   struct Track
*
*        static Track instance
*           - The triggering instance of the event.
*        static trackable object
*           - The triggering trackable object of the event.
*        static player tracker
*           - The player who interacted with the trackable object of the event.
*
*        readonly real x
*        readonly real y
*        readonly real z
*           - The coordinates of the trackable object.
*        readonly real facing
*           - The facing angle of the trackable object.
*        readonly string model
*           - The string path of the trackable object.
*
*        method operator enabled takes nothing returns boolean
*        
*        static method create takes string modelPath, real x, real y, real z, real facing returns Track
*        static method createForPlayer takes string modelPath, real x, real y, real z, real facing, player p returns Track
*
*        static method registerAnyClick takes code c returns nothing
*        static method registerAnyHover takes code c returns nothing
*
*        method registerOnClick takes code c returns nothing
*        method registerOnHover takes code c returns nothing
*
*        method enable takes nothing returns nothing
*        method disable takes nothing returns nothing
*
*            - All of the above are the struct interface equivalents of the functions.
*
********************************************************************
*    
*    Credits
*       - Azlier for Trackable2
*       - Arhowk for finding a bug for me
*
********************************************************************/
    
    private module Init
        private static method onInit takes nothing returns nothing
            set thistype.TrackTable     = Table.create()
        endmethod
    endmodule

    struct Track extends array
        private static trigger anyClick = CreateTrigger()
        private static trigger anyHover = CreateTrigger()
        private static Table TrackTable = 0
        
        static thistype  instance = 0
        static trackable object   = null
        static player    tracker  = null
        
        private static integer ic = 0
        private static integer ir = 0
        private thistype rn
        
        readonly real    x
        readonly real    y
        readonly real    z
        readonly real    facing
        readonly string  model
        
        private boolean  flag
        private trigger  reg
        private trigger  onClick
        private trigger  onHover
        
        static method registerAnyClick takes code c returns nothing
            call TriggerAddCondition(.anyClick, Filter(c))
        endmethod
        static method registerAnyHover takes code c returns nothing
            call TriggerAddCondition(.anyHover, Filter(c))
        endmethod
        
        method registerClick takes code c returns nothing
            if .onClick == null then
                set .onClick = CreateTrigger()
            endif
            call TriggerAddCondition(.onClick, Filter(c))
        endmethod
        method registerHover takes code c returns nothing
            if .onHover == null then
                set .onHover = CreateTrigger()
            endif
            call TriggerAddCondition(.onHover, Filter(c))
        endmethod
        
        method destroy takes nothing returns nothing
            call TrackTable.remove(GetHandleId(.reg))
            call TrackTable.remove(GetHandleId(.object))
            call DestroyTrigger(.reg)
            call DestroyTrigger(.onClick)
            call DestroyTrigger(.onHover)
            set .rn = ir
            set ir  = this
        endmethod
        
        method enable takes nothing returns nothing
            set this.flag = true
        endmethod
        method disable takes nothing returns nothing
            set this.flag = false
        endmethod
        method operator enabled takes nothing returns boolean
            return this.flag
        endmethod
        
        private static method onInteract takes nothing returns boolean
            local thistype  temp = instance
            local trackable tr   = object
            local player    p    = tracker
            
            set instance = TrackTable[GetHandleId(GetTriggeringTrigger())]
            set object   = GetTriggeringTrackable()
            set tracker  = Player(TrackTable[GetHandleId(object)])
            
            if instance.flag then
                if GetTriggerEventId() == EVENT_GAME_TRACKABLE_TRACK then
                    call TriggerEvaluate(instance.onHover)
                    call TriggerEvaluate(anyHover)
                else
                    call TriggerEvaluate(instance.onClick)
                    call TriggerEvaluate(anyClick)
                endif
            endif
            
            set instance = temp
            set tracker  = p
            set object   = tr
            set tr = null
            set p  = null
            return false
        endmethod
        
        private static method createTrack takes string modelPath, real x, real y, real z, real facing, player j returns thistype
            local destructable dest = null
            local thistype     this = ir
            local integer      i    = bj_MAX_PLAYERS - 1
            local trackable tr 
            local player p
            local string s
            if this == 0 then
                set ic   = ic + 1
                set this = ic
            else
                set ir   = .rn
            endif
            if z != 0 then
                set dest = CreateDestructableZ(PLATFORM, x, y, z, 0, 1, 0)
            endif
            if j != null then
                set i    = GetPlayerId(j)
            endif
            set .x = x 
            set .y = y
            set .z = z
            set .flag    = true
            set .facing  = facing
            set .model   = modelPath
            set .reg     = CreateTrigger()
            set .onClick = null
            set .onHover = null
            set TrackTable[GetHandleId(.reg)] = this
            call TriggerAddCondition(.reg, Condition(function thistype.onInteract))
            loop
                set p = Player(i)
                if GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER then
                    if GetLocalPlayer() == p then
                        set s = modelPath
                    else
                        set s = ""
                    endif 
                    set tr = CreateTrackable(s, .x, .y, .facing)
                    call TriggerRegisterTrackableHitEvent(.reg, tr)
                    call TriggerRegisterTrackableTrackEvent(.reg, tr)
                    set TrackTable[GetHandleId(tr)] = i
                    if j != null then
                        exitwhen true
                    endif
                endif
                exitwhen i == 0
                set i = i - 1
            endloop
            if dest != null then
                call RemoveDestructable(dest)
                set dest = null
            endif
            set p  = null
            set tr = null
            return this
        endmethod
        
        static method create takes string modelPath, real x, real y, real z, real facing returns thistype
            return thistype.createTrack(modelPath, x, y, z, facing, null)
        endmethod 
        
        static method createForPlayer takes string modelPath, real x, real y, real z, real facing, player p returns thistype
            if not (GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER) then
                return 0
            endif
            return thistype.createTrack(modelPath, x, y, z, facing, p)
        endmethod
        
        implement Init
    endstruct
    
    function CreateTrack takes string modelPath, real x, real y, real z, real facing returns Track
        return Track.create(modelPath, x, y, z, facing)
    endfunction
    
    function CreateTrackForPlayer takes string modelPath, real x, real y, real z, real facing, player who returns Track 
        return Track.createForPlayer(modelPath, x, y, z, facing, who)
    endfunction
    
    function EnableTrackInstance takes Track instance, boolean flag returns nothing
        if flag then
            call instance.enable()
        else
            call instance.disable()
        endif
    endfunction
    
    function IsTrackInstanceEnabled takes Track instance returns boolean
        return instance.enabled
    endfunction
    
    function RegisterAnyClickEvent takes code c returns nothing
        call Track.registerAnyClick(c)
    endfunction
    
    function RegisterAnyHoverEvent takes code c returns nothing
        call Track.registerAnyHover(c)
    endfunction
    
    function RegisterClickEvent takes Track obj, code c returns nothing
        call obj.registerClick(c)
    endfunction
    
    function RegisterHoverEvent takes Track obj, code c returns nothing
        call obj.registerHover(c)
    endfunction
    
    function GetTriggerTrackInstance takes nothing returns Track
        return Track.instance
    endfunction
    
    function GetTriggerTrackable takes nothing returns trackable
        return Track.object
    endfunction
    
    function GetTriggerTrackablePlayer takes nothing returns player
        return Track.tracker
    endfunction
endlibrary