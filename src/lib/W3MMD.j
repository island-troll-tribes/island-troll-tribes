///////////////////////////////////////////////////////////////
/// The Map Meta Data Library
/// Version: v1.00
/// Last Modified: April 24, 2009
/// Author Chain: Strilanc, Quazz
///////////////////////////////////////////////////////////////
/// This library is used to emit standardized meta data which replay parsers and bot hosts can use to record relevant
/// game statistics like "hero kills" which would otherwise be impossible to record automatically.
///
/// In particular, the flag function can be used to indicate if a leaver should be awarded a win or not. Replays
/// don't contain enough information to easily tell winners who leave from losers who leave. (for example: people
/// who leave while end-game stats are being shown)
///////////////////////////////////////////////////////////////
/// Interface:
///   void FlagPlayer(player, flag_constant)
///   void DefineValue(name, type_constant, goal_constant, suggest_constant)
///   void UpdateValueInt(name, player, operation_constant, value)
///   void UpdateValueReal(name, player, operation_constant, value)
///   void UpdateValueString(name, player, value)
///   void DefineEvent0(name, format)
///   void DefineEvent1(name, format, argName1)
///   void DefineEvent2(name, format, argName1, argName2)
///   void DefineEvent3(name, format, argName1, argName2, argName3)
///   void LogEvent0(name)
///   void LogEvent1(name, arg0)
///   void LogEvent2(name, arg0, arg1)
///   void LogEvent3(name, arg0, arg1, arg2)
///   void LogCustom(unique_identifier, data)
///   void RaiseGuard(reason)
///////////////////////////////////////////////////////////////
/// Notes:
/// - Errors are displayed using BJDebugMsg
/// - Don't try to update a value before defining it
/// - Parsers expect a very specific format, don't screw with the library's output.
/// - If you emit a bunch of data per second, you will cause bandwidth problems for dial-up users. Try to avoid
/// emitting lots of data all at once except at the start and end of games or rounds.
/// - An event's format string uses {#} to represent arguments
/// - Calling RaiseGuard will increase the number of senders for each message from 1 to 3. This increases
/// security but uses more network bandwidth. It is done automatically if tampering is detected.
///////////////////////////////////////////////////////////////
library MMD initializer init
    
    globals
        constant integer GOAL_NONE = 101
        constant integer GOAL_HIGH = 102
        constant integer GOAL_LOW = 103
        
        constant integer TYPE_STRING = 101
        constant integer TYPE_REAL = 102
        constant integer TYPE_INT = 103

        constant integer OP_ADD = 101
        constant integer OP_SUB = 102
        constant integer OP_SET = 103

        constant integer SUGGEST_NONE = 101
        constant integer SUGGEST_TRACK = 102
        constant integer SUGGEST_LEADERBOARD = 103

        constant integer FLAG_DRAWER = 101
        constant integer FLAG_LOSER = 102
        constant integer FLAG_WINNER = 103
        constant integer FLAG_LEAVER = 104
        constant integer FLAG_PRACTICING = 105
        
    endglobals

    ///////////////////////////////////////////////////////////////
    /// Private variables and constants
    ///////////////////////////////////////////////////////////////
    globals
        private constant boolean SHOW_DEBUG_MESSAGES = false
        
        private constant string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-+= \\!@#$%^&*()/?>.<,;:'\"{}[]|`~"
        private constant integer num_chars = StringLength(chars)
        private string array flags
        private string array goals
        private string array ops
        private string array types
        private string array suggestions
        private boolean initialized = false
                
        private gamecache gc = null
        private constant string ESCAPED_CHARS = " \\"
        
        private constant integer CURRENT_VERSION = 1
        private constant integer MINIMUM_PARSER_VERSION = 1
        private constant string FILENAME = "MMD.Dat"
        private constant string M_KEY_VAL = "val:"
        private constant string M_KEY_CHK = "chk:"
        private constant integer NUM_SENDERS_NAIVE = 1
        private constant integer NUM_SENDERS_SAFE = 3
        private integer num_senders = NUM_SENDERS_NAIVE
        private integer num_msg = 0        
        
        private timer clock = CreateTimer()
        private string array q_msg
        private real array q_time
        private integer array q_index
        private keyword QueueNode
        private QueueNode q_head = 0
        private QueueNode q_tail = 0
    endglobals
    
    ///////////////////////////////////////////////////////////////
    /// Private functions
    ///////////////////////////////////////////////////////////////
    
    ///Triggered when tampering is detected. Increases the number of safeguards against tampering.
    public function RaiseGuard takes string reason returns nothing
        debug if SHOW_DEBUG_MESSAGES then
        debug     call BJDebugMsg("MMD: Guard Raised! (" + reason + ")")
        debug endif
        set num_senders = NUM_SENDERS_SAFE //increase number of players voting on each message
    endfunction

    ///Returns seconds elapsed in game time
    private function time takes nothing returns real
        return TimerGetElapsed(clock)
    endfunction
    
    ///Initializes the char-to-int conversion
    private function prepC2I takes nothing returns nothing
        local integer i = 0
        local string id
        loop
            exitwhen i >= num_chars
            set id = SubString(chars, i, i+1)
            if id == StringCase(id, true) then
                set id = id + "U"
            endif
            call StoreInteger(gc, "c2i", id, i)
            set i = i + 1
        endloop
    endfunction
    ///Converts a character to an integer
    private function C2I takes string c returns integer
        local integer i
        local string id = c
        if id == StringCase(id, true) then
            set id = id + "U"
        endif
        set i = GetStoredInteger(gc, "c2i", id)
        if (i < 0 or i >= num_chars or SubString(chars, i, i+1) != c) and HaveStoredInteger(gc, "c2i", id) then
            //A cheater sent a fake sync to screw with the cached values
            set i = 0
            loop
                exitwhen i >= num_chars //just a weird character
                if c == SubString(chars, i, i+1) then //cheating!
                    call RaiseGuard("c2i poisoned")
                    call StoreInteger(gc, "c2i", id, i)
                    exitwhen true
                endif
                set i = i + 1
            endloop
        endif
        return i
    endfunction

    ///Computes a weak hash value, hopefully secure enough for our purposes
    private function poor_hash takes string s, integer seed returns integer
        local integer n = StringLength(s)
        local integer m = n + seed
        local integer i = 0
        loop
            exitwhen i >= n
            set m = m * 41 + C2I(SubString(s, i, i+1))
            set i = i + 1
        endloop
        return m
    endfunction

    ///Stores previously sent messages for tamper detection purposes
    private struct QueueNode
        readonly real timeout
        readonly string msg
        readonly integer checksum
        readonly string key
        public QueueNode next = 0
        public static method create takes integer id, string msg returns QueueNode
            local QueueNode this = QueueNode.allocate()
            set .timeout = time() + 7.0 + GetRandomReal(0, 2+0.1*GetPlayerId(GetLocalPlayer()))
            set .msg = msg
            set .checksum = poor_hash(.msg, id)
            set .key = I2S(id)
            return this
        endmethod
        private method onDestroy takes nothing returns nothing
            call FlushStoredInteger(gc, M_KEY_VAL+.key, .msg)
            call FlushStoredInteger(gc, M_KEY_CHK+.key, .key)
            set .msg = null
            set .key = null
            set .next = 0
        endmethod
        public method send takes nothing returns nothing
            call StoreInteger(gc, M_KEY_VAL+.key, .msg, .checksum)
            call StoreInteger(gc, M_KEY_CHK+.key, .key, .checksum)
            call SyncStoredInteger(gc, M_KEY_VAL+.key, .msg)
            call SyncStoredInteger(gc, M_KEY_CHK+.key, .key)
        endmethod
    endstruct
    
    ///Returns true for a fixed size uniform random subset of players in the game
    private function isEmitter takes nothing returns boolean
        local integer i = 0
        local integer n = 0
        local integer r
        local integer array picks
        local boolean array pick_flags
        loop
            exitwhen i >= 12 // TODO bj_MAX_PLAYERS
            if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                if n < num_senders then //initializing picks
                    set picks[n] = i
                    set pick_flags[i] = true
                else //maintain the invariant 'P(being picked) = c/n'
                    set r = GetRandomInt(0, n)
                    if r < num_senders then
                        set pick_flags[picks[r]] = false
                        set picks[r] = i
                        set pick_flags[i] = true
                    endif
                endif
                set n = n + 1
            endif
            set i = i + 1
        endloop
        return pick_flags[GetPlayerId(GetLocalPlayer())]
    endfunction
    
    ///Places meta-data in the replay and in network traffic
    private function emit takes string message returns nothing
        local QueueNode q
        if not initialized then
            call BJDebugMsg("MMD Emit Error: Library not initialized yet.")
            return
        endif
        
        //remember sent messages for tamper check
        set q = QueueNode.create(num_msg, message)
        if q_head == 0 then
            set q_head = q
        else
            set q_tail.next = q
        endif
        set q_tail = q
                
        //send new message
        set num_msg = num_msg + 1
        if isEmitter() then
            call q.send()
        endif
    endfunction

    ///Performs tamper checks
    private function tick takes nothing returns nothing
        local QueueNode q
        local integer i
        
        //check previously sent messages for tampering
        set q = q_head
        loop
            exitwhen q == 0 or q.timeout >= time()
            if not HaveStoredInteger(gc, M_KEY_VAL+q.key, q.msg) then
                call RaiseGuard("message skipping")
                call q.send()
            elseif not HaveStoredInteger(gc, M_KEY_CHK+q.key, q.key) then
                call RaiseGuard("checksum skipping")
                call q.send()
            elseif GetStoredInteger(gc, M_KEY_VAL+q.key, q.msg) != q.checksum then
                call RaiseGuard("message tampering")
                call q.send()
            elseif GetStoredInteger(gc, M_KEY_CHK+q.key, q.key) != q.checksum then
                call RaiseGuard("checksum tampering")
                call q.send()
            endif
            set q_head = q.next
            call q.destroy()
            set q = q_head
        endloop
        if q_head == 0 then
            set q_tail = 0
        endif
        
        //check for future message tampering
        set i = 0
        loop
            exitwhen not HaveStoredInteger(gc, M_KEY_CHK+I2S(num_msg), I2S(num_msg))
            call RaiseGuard("message insertion")
            call emit("Blank")
            set i = i + 1
            exitwhen i >= 10
        endloop
    endfunction
    
    ///Replaces control characters with escape sequences
    private function pack takes string value returns string
        local integer j
        local integer i = 0
        local string result = ""
        local string c
        loop //for each character in argument string
            exitwhen i >= StringLength(value)
            set c = SubString(value, i, i+1)
            set j = 0
            loop //for each character in escaped chars string
                exitwhen j >= StringLength(ESCAPED_CHARS)
                //escape control characters
                if c == SubString(ESCAPED_CHARS, j, j+1) then
                    set c = "\\" + c
                    exitwhen true
                endif
                set j = j + 1
            endloop
            set result = result + c
            set i = i + 1
        endloop
        return result
    endfunction
    
    ///Updates the value of a defined variable for a given player
    private function update_value takes string name, player p, string op, string value, integer val_type returns nothing
        local integer id = GetPlayerId(p)
//        if p == null or id < 0 or id >= 12 then  // TODO bj_MAX_PLAYERS
//            call BJDebugMsg("MMD Set Error: Invalid player. Must be P1 to P12. Line 345 in W3MMD")
        if val_type != GetStoredInteger(gc, "types", name) then
            call BJDebugMsg("MMD Set Error: Updated value of undefined variable or used value of incorrect type.")
        elseif StringLength(op) == 0 then
            call BJDebugMsg("MMD Set Error: Unrecognized operation type.")        
        elseif StringLength(name) > 50 then
            call BJDebugMsg("MMD Set Error: Variable name is too long.")
        elseif StringLength(name) == 0 then
            call BJDebugMsg("MMD Set Error: Variable name is empty.")
        else
            call emit("VarP " + I2S(id) + " " + pack(name) + " " + op + " " + value)
        endif
    endfunction

    ///Defines an event's arguments and format
    private function DefineEvent takes string name, integer num_args, string format, string arg_data returns nothing
        if GetStoredInteger(gc, "events", name) != 0 then
            call BJDebugMsg("MMD DefEvent Error: Event redefined.")
        else
            call StoreInteger(gc, "events", name, num_args+1)
            call emit("DefEvent " + pack(name) + " " + I2S(num_args) + " " + arg_data + pack(format))
        endif
    endfunction
    
    ///Places an event in the meta-data
    private function LogEvent takes string name, integer num_args, string data returns nothing
        if GetStoredInteger(gc, "events", name) != num_args+1 then
            call BJDebugMsg("MMD LogEvent Error: Event not defined or defined with different # of args.")
        else
            call emit("Event " + pack(name) + data)
        endif
    endfunction

    ///////////////////////////////////////////////////////////////
    /// Public functions
    ///////////////////////////////////////////////////////////////

    ///Sets a player flag like "win_on_leave"
    function FlagPlayer takes player p, integer flag_type returns nothing
        local string flag = flags[flag_type]
        local integer id = GetPlayerId(p)
        if p == null or id < 0 or id >= 12 then // TODO bj_MAX_PLAYERS
            call BJDebugMsg("MMD Flag Error: Invalid player. Must be P1 to P12.")
        elseif StringLength(flag) == 0 then
            call BJDebugMsg("MMD Flag Error: Unrecognized flag type.")
        elseif GetPlayerController(Player(id)) == MAP_CONTROL_USER then
            call emit("FlagP " + I2S(id) + " " + flag)
        endif
    endfunction

    ///Defines a variable to store things in
    function DefineValue takes string name, integer value_type, integer goal_type, integer suggestion_type returns nothing
        local string goal = goals[goal_type]
        local string vtype = types[value_type]
        local string stype = suggestions[suggestion_type]
        if goal == null then
            call BJDebugMsg("MMD Def Error: Unrecognized goal type.")
        elseif vtype == null then
            call BJDebugMsg("MMD Def Error: Unrecognized value type.")
        elseif stype == null then
            call BJDebugMsg("Stats Def Error: Unrecognized suggestion type.")
        elseif StringLength(name) > 32 then
            call BJDebugMsg("MMD Def Error: Variable name is too long.")
        elseif StringLength(name) == 0 then
            call BJDebugMsg("MMD Def Error: Variable name is empty.")
        elseif value_type == TYPE_STRING and goal_type != GOAL_NONE then
            call BJDebugMsg("MMD Def Error: Strings must have goal type of none.")
        elseif GetStoredInteger(gc, "types", name) != 0 then
            call BJDebugMsg("MMD Def Error: Value redefined.")
        else
            call StoreInteger(gc, "types", name, value_type)
            call emit("DefVarP " + pack(name) + " " + vtype + " " + goal + " " + stype)
        endif
    endfunction

    ///Updates the value of an integer variable
    function UpdateValueInt takes string name, player p, integer op, integer value returns nothing
        call update_value(name, p, ops[op], I2S(value), TYPE_INT)
    endfunction
    
    ///Updates the value of a real variable
    function UpdateValueReal takes string name, player p, integer op, real value returns nothing
        call update_value(name, p, ops[op], R2S(value), TYPE_REAL)
    endfunction
    
    ///Updates the value of a string variable
    function UpdateValueString takes string name, player p, string value returns nothing
        local string q = "\""
        call update_value(name, p, ops[OP_SET], q + pack(value) + q, TYPE_STRING)
    endfunction    
    
    public function DefineEvent0 takes string name, string format returns nothing
        call DefineEvent(name, 0, format, "")
    endfunction
    public function DefineEvent1 takes string name, string format, string argName0 returns nothing
        call DefineEvent(name, 1, format, pack(argName0) + " ")
    endfunction
    public function DefineEvent2 takes string name, string format, string argName0, string argName1 returns nothing
        call DefineEvent(name, 2, format, pack(argName0) + " " + pack(argName1) + " ")
    endfunction
    public function DefineEvent3 takes string name, string format, string argName0, string argName1, string argName2 returns nothing
        call DefineEvent(name, 3, format, pack(argName0) + " " + pack(argName1) + " " + pack(argName2) + " ")
    endfunction
    
    public function LogEvent0 takes string name returns nothing
        call LogEvent(name, 0, "")
    endfunction
    public function LogEvent1 takes string name, string arg0 returns nothing
        call LogEvent(name, 1, " " + pack(arg0))
    endfunction
    public function LogEvent2 takes string name, string arg0, string arg1 returns nothing
        call LogEvent(name, 2, " " + pack(arg0) + " " + pack(arg1))
    endfunction
    public function LogEvent3 takes string name, string arg0, string arg1, string arg2 returns nothing
        call LogEvent(name, 3, " " + pack(arg0) + " " + pack(arg1) + " " + pack(arg2))
    endfunction

    ///Emits meta-data which parsers will ignore unless they are customized to understand it
    public function LogCustom takes string unique_identifier, string data returns nothing
        call emit("custom " + pack(unique_identifier) + " " + pack(data))
    endfunction

    ///////////////////////////////////////////////////////////////
    /// Initialization
    ///////////////////////////////////////////////////////////////
    
    ///Emits initialization data
    private function init2 takes nothing returns nothing
        local integer i
        local trigger t
        set initialized = true
        
        call emit("init version " + I2S(MINIMUM_PARSER_VERSION) + " " + I2S(CURRENT_VERSION))

        set i = 0
        loop
            exitwhen i >= 12 // TODO bj_MAX_PLAYERS
            if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                call emit("init pid " + I2S(i) + " " + pack(GetPlayerName(Player(i))))
            endif
            set i = i + 1
        endloop
        
        set t = CreateTrigger()
        call TriggerAddAction(t, function tick)
        call TriggerRegisterTimerEvent(t, 0.37, true)
    endfunction        
    
    ///Places init2 on a timer, initializes game cache, and translates constants
    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        local trigger u = CreateTrigger()
        
        call TriggerRegisterTimerEvent(t, 0, false)
        call TriggerAddAction(t, function init2)
        
        set goals[GOAL_NONE] = "none"
        set goals[GOAL_HIGH] = "high"
        set goals[GOAL_LOW] = "low"
        
        set types[TYPE_INT] = "int"
        set types[TYPE_REAL] = "real"
        set types[TYPE_STRING] = "string"

        set suggestions[SUGGEST_NONE] = "none"
        set suggestions[SUGGEST_TRACK] = "track"
        set suggestions[SUGGEST_LEADERBOARD] = "leaderboard"

        set ops[OP_ADD] = "+="
        set ops[OP_SUB] = "-="
        set ops[OP_SET] = "="

        set flags[FLAG_DRAWER] = "drawer"
        set flags[FLAG_LOSER] = "loser"
        set flags[FLAG_WINNER] = "winner"
        set flags[FLAG_LEAVER] = "leaver"
        set flags[FLAG_PRACTICING] = "practicing"

        call FlushGameCache(InitGameCache(FILENAME))
        set gc = InitGameCache(FILENAME)
        call TimerStart(clock, 999999999, false, null)
        call prepC2I()
    endfunction
    
endlibrary//===========================================================================
