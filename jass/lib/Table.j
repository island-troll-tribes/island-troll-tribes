library Table /* made by Bribe, special thanks to Vexorian & Nestharus, version 3.1.0.1
    
    One map, one hashtable. Welcome to NewTable 3.1
    
    This library was originally called NewTable so it didn't conflict with
    the API of Table by Vexorian. However, the damage is done and it's too
    late to change the library name now. To help with damage control, I
    have provided an extension library called TableBC, which bridges all
    the functionality of Vexorian's Table except for 2-D string arrays &
    the ".flush(integer)" method. I use ".flush()" to flush a child hash-
    table, because I wanted the API in NewTable to reflect the API of real
    hashtables (I thought this would be more intuitive).
    
    API
    
    ------------
    struct Table
    | static method create takes nothing returns Table
    |     create a new Table
    |    
    | method destroy takes nothing returns nothing
    |     destroy it
    |    
    | method flush takes nothing returns nothing
    |     flush all stored values inside of it
    |    
    | method remove takes integer key returns nothing
    |     remove the value at index "key"
    |    
    | method operator []= takes integer key, $TYPE$ value returns nothing
    |     assign "value" to index "key"
    |    
    | method operator [] takes integer key returns $TYPE$
    |     load the value at index "key"
    |    
    | method has takes integer key returns boolean
    |     whether or not the key was assigned
    | 
    ----------------
    struct TableArray
    | static method operator [] takes integer array_size returns TableArray
    |     create a new array of Tables of size "array_size"
    |
    | method destroy takes nothing returns nothing
    |     destroy it
    |
    | method flush takes nothing returns nothing
    |     flush and destroy it
    |
    | method operator size takes nothing returns integer
    |     returns the size of the TableArray
    |
    | method operator [] takes integer key returns Table
    |     returns a Table accessible exclusively to index "key"
*/
    
globals
    private integer less = 0    //Index generation for TableArrays (below 0).
    private integer more = 8190 //Index generation for Tables.
    //Configure it if you use more than 8190 "key" variables in your map (this will never happen though).
    
    private hashtable ht = InitHashtable()
    private key sizeK
    private key listK
endglobals
    
private struct dex extends array
    static method operator size takes nothing returns Table
        return sizeK
    endmethod
    static method operator list takes nothing returns Table
        return listK
    endmethod
endstruct
    
private struct handles extends array
    method has takes integer key returns boolean
        return HaveSavedHandle(ht, this, key)
    endmethod
    method remove takes integer key returns nothing
        call RemoveSavedHandle(ht, this, key)
    endmethod
endstruct
    
private struct agents extends array
    method operator []= takes integer key, agent value returns nothing
        call SaveAgentHandle(ht, this, key, value)
    endmethod
endstruct
    
//! textmacro NEW_ARRAY_BASIC takes SUPER, FUNC, TYPE
private struct $TYPE$s extends array
    method operator [] takes integer key returns $TYPE$
        return Load$FUNC$(ht, this, key)
    endmethod
    method operator []= takes integer key, $TYPE$ value returns nothing
        call Save$FUNC$(ht, this, key, value)
    endmethod
    method has takes integer key returns boolean
        return HaveSaved$SUPER$(ht, this, key)
    endmethod
    method remove takes integer key returns nothing
        call RemoveSaved$SUPER$(ht, this, key)
    endmethod
endstruct
private module $TYPE$m
    method operator $TYPE$ takes nothing returns $TYPE$s
        return this
    endmethod
endmodule
//! endtextmacro
    
//! textmacro NEW_ARRAY takes FUNC, TYPE
private struct $TYPE$s extends array
    method operator [] takes integer key returns $TYPE$
        return Load$FUNC$Handle(ht, this, key)
    endmethod
    method operator []= takes integer key, $TYPE$ value returns nothing
        call Save$FUNC$Handle(ht, this, key, value)
    endmethod
endstruct
private module $TYPE$m
    method operator $TYPE$ takes nothing returns $TYPE$s
        return this
    endmethod
endmodule
//! endtextmacro
    
//! textmacro NEW_ARRAY_BASIC_STRING_KEY takes SUPER, FUNC, TYPE
private struct $TYPE$ss extends array
    method operator [] takes string key returns $TYPE$
        return Load$FUNC$(ht, this, StringHash(key))
    endmethod
    method operator []= takes string key, $TYPE$ value returns nothing
        call Save$FUNC$(ht, this, StringHash(key), value)
    endmethod
    method has takes string key returns boolean
        return HaveSaved$SUPER$(ht, this, StringHash(key))
    endmethod
    method remove takes string key returns nothing
        call RemoveSaved$SUPER$(ht, this, StringHash(key))
    endmethod
endstruct
private module $TYPE$ms
    method operator $TYPE$_s takes nothing returns $TYPE$ss
        return this
    endmethod
endmodule
//! endtextmacro
    
//! textmacro NEW_ARRAY_BASIC_HANDLE_KEY takes SUPER, FUNC, TYPE
private struct $TYPE$sh extends array
    method operator [] takes handle key returns $TYPE$
        return Load$FUNC$(ht, this, GetHandleId(key))
    endmethod
    method operator []= takes handle key, $TYPE$ value returns nothing
        call Save$FUNC$(ht, this, GetHandleId(key), value)
    endmethod
    method has takes handle key returns boolean
        return HaveSaved$SUPER$(ht, this, GetHandleId(key))
    endmethod
    method remove takes handle key returns nothing
        call RemoveSaved$SUPER$(ht, this, GetHandleId(key))
    endmethod
endstruct
private module $TYPE$mh
    method operator $TYPE$_h takes nothing returns $TYPE$sh
        return this
    endmethod
endmodule
//! endtextmacro
    
//! textmacro NEW_ARRAY_STRING_KEY takes FUNC, TYPE
private struct $TYPE$ss extends array
    method operator [] takes string key returns $TYPE$
        return Load$FUNC$Handle(ht, this, StringHash(key))
    endmethod
    method operator []= takes string key, $TYPE$ value returns nothing
        call Save$FUNC$Handle(ht, this, StringHash(key), value)
    endmethod
endstruct
private module $TYPE$ms
    method operator $TYPE$_s takes nothing returns $TYPE$ss
        return this
    endmethod
endmodule
//! endtextmacro
    
//! textmacro NEW_ARRAY_HANDLE_KEY takes FUNC, TYPE
private struct $TYPE$sh extends array
    method operator [] takes handle key returns $TYPE$
        return Load$FUNC$Handle(ht, this, GetHandleId(key))
    endmethod
    method operator []= takes handle key, $TYPE$ value returns nothing
        call Save$FUNC$Handle(ht, this, GetHandleId(key), value)
    endmethod
endstruct
private module $TYPE$mh
    method operator $TYPE$_h takes nothing returns $TYPE$sh
        return this
    endmethod
endmodule
//! endtextmacro
    
//Run these textmacros to include the entire hashtable API as wrappers.
//Don't be intimidated by the number of macros - Vexorian's map optimizer is
//supposed to kill functions which inline (all of these functions inline).
//! runtextmacro NEW_ARRAY_BASIC("Real", "Real", "real")
//! runtextmacro NEW_ARRAY_BASIC("Boolean", "Boolean", "boolean")
//! runtextmacro NEW_ARRAY_BASIC("String", "Str", "string")
    
//! runtextmacro NEW_ARRAY("Player", "player")
//! runtextmacro NEW_ARRAY("Widget", "widget")
//! runtextmacro NEW_ARRAY("Destructable", "destructable")
//! runtextmacro NEW_ARRAY("Item", "item")
//! runtextmacro NEW_ARRAY("Unit", "unit")
//! runtextmacro NEW_ARRAY("Ability", "ability")
//! runtextmacro NEW_ARRAY("Timer", "timer")
//! runtextmacro NEW_ARRAY("Trigger", "trigger")
//! runtextmacro NEW_ARRAY("TriggerCondition", "triggercondition")
//! runtextmacro NEW_ARRAY("TriggerAction", "triggeraction")
//! runtextmacro NEW_ARRAY("TriggerEvent", "event")
//! runtextmacro NEW_ARRAY("Force", "force")
//! runtextmacro NEW_ARRAY("Group", "group")
//! runtextmacro NEW_ARRAY("Location", "location")
//! runtextmacro NEW_ARRAY("Rect", "rect")
//! runtextmacro NEW_ARRAY("BooleanExpr", "boolexpr")
//! runtextmacro NEW_ARRAY("Sound", "sound")
//! runtextmacro NEW_ARRAY("Effect", "effect")
//! runtextmacro NEW_ARRAY("UnitPool", "unitpool")
//! runtextmacro NEW_ARRAY("ItemPool", "itempool")
//! runtextmacro NEW_ARRAY("Quest", "quest")
//! runtextmacro NEW_ARRAY("QuestItem", "questitem")
//! runtextmacro NEW_ARRAY("DefeatCondition", "defeatcondition")
//! runtextmacro NEW_ARRAY("TimerDialog", "timerdialog")
//! runtextmacro NEW_ARRAY("Leaderboard", "leaderboard")
//! runtextmacro NEW_ARRAY("Multiboard", "multiboard")
//! runtextmacro NEW_ARRAY("MultiboardItem", "multiboarditem")
//! runtextmacro NEW_ARRAY("Trackable", "trackable")
//! runtextmacro NEW_ARRAY("Dialog", "dialog")
//! runtextmacro NEW_ARRAY("Button", "button")
//! runtextmacro NEW_ARRAY("TextTag", "texttag")
//! runtextmacro NEW_ARRAY("Lightning", "lightning")
//! runtextmacro NEW_ARRAY("Image", "image")
//! runtextmacro NEW_ARRAY("Ubersplat", "ubersplat")
//! runtextmacro NEW_ARRAY("Region", "region")
//! runtextmacro NEW_ARRAY("FogState", "fogstate")
//! runtextmacro NEW_ARRAY("FogModifier", "fogmodifier")
//! runtextmacro NEW_ARRAY("Hashtable", "hashtable")

//! runtextmacro NEW_ARRAY_BASIC_STRING_KEY("Integer", "Integer", "integer")
//! runtextmacro NEW_ARRAY_BASIC_STRING_KEY("Real", "Real", "real")
//! runtextmacro NEW_ARRAY_BASIC_STRING_KEY("Boolean", "Boolean", "boolean")
//! runtextmacro NEW_ARRAY_BASIC_STRING_KEY("String", "Str", "string")
    
//! runtextmacro NEW_ARRAY_STRING_KEY("Player", "player")
//! runtextmacro NEW_ARRAY_STRING_KEY("Widget", "widget")
//! runtextmacro NEW_ARRAY_STRING_KEY("Destructable", "destructable")
//! runtextmacro NEW_ARRAY_STRING_KEY("Item", "item")
//! runtextmacro NEW_ARRAY_STRING_KEY("Unit", "unit")
//! runtextmacro NEW_ARRAY_STRING_KEY("Ability", "ability")
//! runtextmacro NEW_ARRAY_STRING_KEY("Timer", "timer")
//! runtextmacro NEW_ARRAY_STRING_KEY("Trigger", "trigger")
//! runtextmacro NEW_ARRAY_STRING_KEY("TriggerCondition", "triggercondition")
//! runtextmacro NEW_ARRAY_STRING_KEY("TriggerAction", "triggeraction")
//! runtextmacro NEW_ARRAY_STRING_KEY("TriggerEvent", "event")
//! runtextmacro NEW_ARRAY_STRING_KEY("Force", "force")
//! runtextmacro NEW_ARRAY_STRING_KEY("Group", "group")
//! runtextmacro NEW_ARRAY_STRING_KEY("Location", "location")
//! runtextmacro NEW_ARRAY_STRING_KEY("Rect", "rect")
//! runtextmacro NEW_ARRAY_STRING_KEY("BooleanExpr", "boolexpr")
//! runtextmacro NEW_ARRAY_STRING_KEY("Sound", "sound")
//! runtextmacro NEW_ARRAY_STRING_KEY("Effect", "effect")
//! runtextmacro NEW_ARRAY_STRING_KEY("UnitPool", "unitpool")
//! runtextmacro NEW_ARRAY_STRING_KEY("ItemPool", "itempool")
//! runtextmacro NEW_ARRAY_STRING_KEY("Quest", "quest")
//! runtextmacro NEW_ARRAY_STRING_KEY("QuestItem", "questitem")
//! runtextmacro NEW_ARRAY_STRING_KEY("DefeatCondition", "defeatcondition")
//! runtextmacro NEW_ARRAY_STRING_KEY("TimerDialog", "timerdialog")
//! runtextmacro NEW_ARRAY_STRING_KEY("Leaderboard", "leaderboard")
//! runtextmacro NEW_ARRAY_STRING_KEY("Multiboard", "multiboard")
//! runtextmacro NEW_ARRAY_STRING_KEY("MultiboardItem", "multiboarditem")
//! runtextmacro NEW_ARRAY_STRING_KEY("Trackable", "trackable")
//! runtextmacro NEW_ARRAY_STRING_KEY("Dialog", "dialog")
//! runtextmacro NEW_ARRAY_STRING_KEY("Button", "button")
//! runtextmacro NEW_ARRAY_STRING_KEY("TextTag", "texttag")
//! runtextmacro NEW_ARRAY_STRING_KEY("Lightning", "lightning")
//! runtextmacro NEW_ARRAY_STRING_KEY("Image", "image")
//! runtextmacro NEW_ARRAY_STRING_KEY("Ubersplat", "ubersplat")
//! runtextmacro NEW_ARRAY_STRING_KEY("Region", "region")
//! runtextmacro NEW_ARRAY_STRING_KEY("FogState", "fogstate")
//! runtextmacro NEW_ARRAY_STRING_KEY("FogModifier", "fogmodifier")
//! runtextmacro NEW_ARRAY_STRING_KEY("Hashtable", "hashtable")

//! runtextmacro NEW_ARRAY_BASIC_HANDLE_KEY("Integer", "Integer", "integer")
//! runtextmacro NEW_ARRAY_BASIC_HANDLE_KEY("Real", "Real", "real")
//! runtextmacro NEW_ARRAY_BASIC_HANDLE_KEY("Boolean", "Boolean", "boolean")
//! runtextmacro NEW_ARRAY_BASIC_HANDLE_KEY("String", "Str", "string")
    
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Player", "player")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Widget", "widget")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Destructable", "destructable")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Item", "item")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Unit", "unit")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Ability", "ability")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Timer", "timer")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Trigger", "trigger")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("TriggerCondition", "triggercondition")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("TriggerAction", "triggeraction")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("TriggerEvent", "event")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Force", "force")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Group", "group")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Location", "location")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Rect", "rect")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("BooleanExpr", "boolexpr")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Sound", "sound")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Effect", "effect")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("UnitPool", "unitpool")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("ItemPool", "itempool")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Quest", "quest")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("QuestItem", "questitem")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("DefeatCondition", "defeatcondition")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("TimerDialog", "timerdialog")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Leaderboard", "leaderboard")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Multiboard", "multiboard")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("MultiboardItem", "multiboarditem")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Trackable", "trackable")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Dialog", "dialog")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Button", "button")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("TextTag", "texttag")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Lightning", "lightning")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Image", "image")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Ubersplat", "ubersplat")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Region", "region")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("FogState", "fogstate")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("FogModifier", "fogmodifier")
//! runtextmacro NEW_ARRAY_HANDLE_KEY("Hashtable", "hashtable")
    
struct Table extends array
    
    // Implement modules for intuitive syntax (tb.handle; tb.unit; etc.)
    implement realm
    implement booleanm
    implement stringm
    implement playerm
    implement widgetm
    implement destructablem
    implement itemm
    implement unitm
    implement abilitym
    implement timerm
    implement triggerm
    implement triggerconditionm
    implement triggeractionm
    implement eventm
    implement forcem
    implement groupm
    implement locationm
    implement rectm
    implement boolexprm
    implement soundm
    implement effectm
    implement unitpoolm
    implement itempoolm
    implement questm
    implement questitemm
    implement defeatconditionm
    implement timerdialogm
    implement leaderboardm
    implement multiboardm
    implement multiboarditemm
    implement trackablem
    implement dialogm
    implement buttonm
    implement texttagm
    implement lightningm
    implement imagem
    implement ubersplatm
    implement regionm
    implement fogstatem
    implement fogmodifierm
    implement hashtablem
    
    implement integerms
    implement realms
    implement booleanms
    implement stringms
    implement playerms
    implement widgetms
    implement destructablems
    implement itemms
    implement unitms
    implement abilityms
    implement timerms
    implement triggerms
    implement triggerconditionms
    implement triggeractionms
    implement eventms
    implement forcems
    implement groupms
    implement locationms
    implement rectms
    implement boolexprms
    implement soundms
    implement effectms
    implement unitpoolms
    implement itempoolms
    implement questms
    implement questitemms
    implement defeatconditionms
    implement timerdialogms
    implement leaderboardms
    implement multiboardms
    implement multiboarditemms
    implement trackablems
    implement dialogms
    implement buttonms
    implement texttagms
    implement lightningms
    implement imagems
    implement ubersplatms
    implement regionms
    implement fogstatems
    implement fogmodifierms
    implement hashtablems
    
    implement integermh
    implement realmh
    implement booleanmh
    implement stringmh
    implement playermh
    implement widgetmh
    implement destructablemh
    implement itemmh
    implement unitmh
    implement abilitymh
    implement timermh
    implement triggermh
    implement triggerconditionmh
    implement triggeractionmh
    implement eventmh
    implement forcemh
    implement groupmh
    implement locationmh
    implement rectmh
    implement boolexprmh
    implement soundmh
    implement effectmh
    implement unitpoolmh
    implement itempoolmh
    implement questmh
    implement questitemmh
    implement defeatconditionmh
    implement timerdialogmh
    implement leaderboardmh
    implement multiboardmh
    implement multiboarditemmh
    implement trackablemh
    implement dialogmh
    implement buttonmh
    implement texttagmh
    implement lightningmh
    implement imagemh
    implement ubersplatmh
    implement regionmh
    implement fogstatemh
    implement fogmodifiermh
    implement hashtablemh

    method operator handle takes nothing returns handles
        return this
    endmethod
    
    method operator agent takes nothing returns agents
        return this
    endmethod
    
    //set this = tb[GetSpellAbilityId()]
    method operator [] takes integer key returns Table
        return LoadInteger(ht, this, key)
    endmethod
    
    //set tb[389034] = 8192
    method operator []= takes integer key, Table tb returns nothing
        call SaveInteger(ht, this, key, tb)
    endmethod
    
    //set b = tb.has(2493223)
    method has takes integer key returns boolean
        return HaveSavedInteger(ht, this, key)
    endmethod
    method has_s takes string key returns boolean
        return HaveSavedInteger(ht, this, StringHash(key))
    endmethod
    method has_h takes handle key returns boolean
        return HaveSavedInteger(ht, this, GetHandleId(key))
    endmethod
    
    //call tb.remove(294080)
    method remove takes integer key returns nothing
        call RemoveSavedInteger(ht, this, key)
    endmethod
    method remove_s takes string key returns nothing
        call RemoveSavedInteger(ht, this, StringHash(key))
    endmethod
    method remove_h takes handle key returns nothing
        call RemoveSavedInteger(ht, this, GetHandleId(key))
    endmethod
    
    //Remove all data from a Table instance
    method flush takes nothing returns nothing
        call FlushChildHashtable(ht, this)
    endmethod
    
    //local Table tb = Table.create()
    static method create takes nothing returns Table
        local Table this = dex.list[0]
        
        if this == 0 then
            set this = more + 1
            set more = this
        else
            set dex.list[0] = dex.list[this]
            call dex.list.remove(this) //Clear hashed memory
        endif
        
        debug set dex.list[this] = -1
        return this
    endmethod
    
    // Removes all data from a Table instance and recycles its index.
    //
    //     call tb.destroy()
    //
    method destroy takes nothing returns nothing
        debug if dex.list[this] != -1 then
            debug call BJDebugMsg("Table Error: Tried to double-free instance: " + I2S(this))
            debug return
        debug endif
        
        call this.flush()
        
        set dex.list[this] = dex.list[0]
        set dex.list[0] = this
    endmethod
    
    //! runtextmacro optional TABLE_BC_METHODS()
endstruct
    
//! runtextmacro optional TABLE_BC_STRUCTS()
    
struct TableArray extends array
    
    //Returns a new TableArray to do your bidding. Simply use:
    //
    //    local TableArray ta = TableArray[array_size]
    //
    static method operator [] takes integer array_size returns TableArray
        local Table tb = dex.size[array_size] //Get the unique recycle list for this array size
        local TableArray this = tb[0]         //The last-destroyed TableArray that had this array size
        
        debug if array_size <= 0 then
            debug call BJDebugMsg("TypeError: Invalid specified TableArray size: " + I2S(array_size))
            debug return 0
        debug endif
        
        if this == 0 then
            set this = less - array_size
            set less = this
        else
            set tb[0] = tb[this]  //Set the last destroyed to the last-last destroyed
            call tb.remove(this)  //Clear hashed memory
        endif
        
        set dex.size[this] = array_size //This remembers the array size
        return this
    endmethod
    
    //Returns the size of the TableArray
    method operator size takes nothing returns integer
        return dex.size[this]
    endmethod
    
    //This magic method enables two-dimensional[array][syntax] for Tables,
    //similar to the two-dimensional utility provided by hashtables them-
    //selves.
    //
    //ta[integer a].unit[integer b] = unit u
    //ta[integer a][integer c] = integer d
    //
    //Inline-friendly when not running in debug mode
    //
    method operator [] takes integer key returns Table
        static if DEBUG_MODE then
            local integer i = this.size
            if i == 0 then
                call BJDebugMsg("IndexError: Tried to get key from invalid TableArray instance: " + I2S(this))
                return 0
            elseif key < 0 or key >= i then
                call BJDebugMsg("IndexError: Tried to get key [" + I2S(key) + "] from outside TableArray bounds: " + I2S(i))
                return 0
            endif
        endif
        return this + key
    endmethod
    
    //Destroys a TableArray without flushing it; I assume you call .flush()
    //if you want it flushed too. This is a public method so that you don't
    //have to loop through all TableArray indices to flush them if you don't
    //need to (ie. if you were flushing all child-keys as you used them).
    //
    method destroy takes nothing returns nothing
        local Table tb = dex.size[this.size]
        
        debug if this.size == 0 then
            debug call BJDebugMsg("TypeError: Tried to destroy an invalid TableArray: " + I2S(this))
            debug return
        debug endif
        
        if tb == 0 then
            //Create a Table to index recycled instances with their array size
            set tb = Table.create()
            set dex.size[this.size] = tb
        endif
        
        call dex.size.remove(this) //Clear the array size from hash memory
        
        set tb[this] = tb[0]
        set tb[0] = this
    endmethod
    
    private static Table tempTable
    private static integer tempEnd
    
    //Avoids hitting the op limit
    private static method clean takes nothing returns nothing
        local Table tb = .tempTable
        local integer end = tb + 0x1000
        if end < .tempEnd then
            set .tempTable = end
            call ForForce(bj_FORCE_PLAYER[0], function thistype.clean)
        else
            set end = .tempEnd
        endif
        loop
            call tb.flush()
            set tb = tb + 1
            exitwhen tb == end
        endloop
    endmethod
    
    //Flushes the TableArray and also destroys it. Doesn't get any more
    //similar to the FlushParentHashtable native than this.
    //
    method flush takes nothing returns nothing
        debug if this.size == 0 then
            debug call BJDebugMsg("TypeError: Tried to flush an invalid TableArray instance: " + I2S(this))
            debug return
        debug endif
        set .tempTable = this
        set .tempEnd = this + this.size
        call ForForce(bj_FORCE_PLAYER[0], function thistype.clean)
        call this.destroy()
    endmethod
    
endstruct
    
endlibrary//===========================================================================
