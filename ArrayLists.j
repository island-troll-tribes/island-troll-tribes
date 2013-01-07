
library ArrayLists
    
    //! textmacro ARRAYLIST takes TYPE, NAME, NULLVAL
    
    struct ArrayList$NAME$

        private integer          itsIndex
        private $TYPE$ array     s [500]
        
        static method create takes nothing returns thistype
            local ArrayList$NAME$ myself = ArrayList$NAME$.allocate()
            set myself.itsIndex=-1
            return myself
        endmethod
        
		method push takes $TYPE$ p returns nothing
			if .itsIndex==8190 then
				debug call BJDebugMsg("Warning: ArrayList is full")
			else
				set .itsIndex=.itsIndex+1
				set .s[.itsIndex]=p
			endif
		endmethod
        
        method get takes integer i returns $TYPE$
            if i>=0 and i<=.itsIndex then
                return .s[i]
            endif
            return $NULLVAL$
        endmethod
        
        method operator [] takes integer i returns $TYPE$
            if i>=0 and i<=.itsIndex then
                return .s[i]
            endif
            return $NULLVAL$
        endmethod
        
        method operator []= takes integer i, $TYPE$ what returns nothing
            if i>=0 and i<=.itsIndex then
                set .s[i] = what
            endif
        endmethod
             
        method length takes nothing returns integer
            return .itsIndex + 1
        endmethod
             
        method size takes nothing returns integer
            return .itsIndex + 1
        endmethod
        
        method empty takes nothing returns nothing
            set .itsIndex=-1
        endmethod
        
        method isEmpty takes nothing returns boolean
            return (.itsIndex==-1)
        endmethod
			
        method count takes $TYPE$ what returns integer
            local integer c=0
            local integer i=0
            loop
                exitwhen i>.itsIndex
                    if .s[i]==what then
                        set c=c+1
                    endif
                set i=i+1
            endloop
            return c
        endmethod
        
        method has takes $TYPE$ what returns boolean
            local integer i=0
            loop
                exitwhen i>.itsIndex
                    if what==.s[i] then
                        return true
                    endif
                set i=i+1
            endloop
            return false
        endmethod
    
        method remove takes integer index returns nothing
            local integer i=0
            set .itsIndex=.itsIndex-1
            set i=index
            loop
                exitwhen i>.itsIndex
                    set .s[i]=.s[i+1]
                set i=i+1
            endloop
        endmethod
	
		method pop takes nothing returns $TYPE$
	  		local $TYPE$ v = .s[.itsIndex]
	 		set .s[.itsIndex] = $NULLVAL$
	  		set .itsIndex = .itsIndex - 1
	  		return v
	  	endmethod
    
        method removeAll takes $TYPE$ what returns nothing
            local integer i=0
            local integer j=0
            loop
                exitwhen i>.itsIndex
                    if what==.s[i] then
                        set .itsIndex=.itsIndex-1
                        set j=i
                        loop
                            exitwhen j>.itsIndex
                                set .s[i]=.s[i+1]
                            set j=j+1
                        endloop
                    else
                        set i=i+1
                    endif
            endloop
        endmethod
       
    endstruct
    
    //! endtextmacro
    
    
    //! textmacro CREATEARRAYLIST takes TYPE, NAME
    ArrayList$TYPE$ $NAME$ 
    //! endtextmacro
    
    //! textmacro INITARRAYLIST takes TYPE, NAME
    set $NAME$ = ArrayList$TYPE$.create()
    //! endtextmacro
	
	// NATIVE TYPES:
	//! runtextmacro ARRAYLIST("string","String","\"\"")
	//! runtextmacro ARRAYLIST("integer","Integer","0")
	//! runtextmacro ARRAYLIST("real","Real","0.0")
	//! runtextmacro ARRAYLIST("handle","Handle","null")
	//! runtextmacro ARRAYLIST("boolean","Boolean","false")
	
	// FOR NON-NATIVE TYPES, CREATE YOUR OWN
    
endlibrary//===========================================================================
