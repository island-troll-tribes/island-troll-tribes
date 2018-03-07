//! zinc

library TypeStructs {

  real ON_THE_FLY_LIFE_TIME = 1.0;

//! textmacro TYPE_GENERAL_METHODS takes TYPE, CAPITALIZED_TYPE
  module $CAPITALIZED_TYPE$GeneralMethods {

    method timedDestroy() {
      timer t = NewTimer();
      SetTimerData( t, this );

      TimerStart( t, ON_THE_FLY_LIFE_TIME, false, function() {
        timer t = GetExpiredTimer();
        thistype( GetTimerData( t ) ).destroy();
        ReleaseTimer( t );
      });
    }
    
    static method operator[] ($TYPE$ b) -> thistype {
      thistype x = thistype.allocate();
      x.self = b;
      x.timedDestroy();
      return x;
    }
    
    method operator $TYPE$ () -> $TYPE$ {
      return self;
    }
  }
//! endtextmacro
//! runtextmacro TYPE_GENERAL_METHODS("string", "String")
//! runtextmacro TYPE_GENERAL_METHODS("unit", "Unit")
  
  public struct String {
    private string self = "";
    
    static method new (string a) -> thistype {
      thistype b = thistype.allocate();
      b.self = a;
      return b;
    }
    
    static method create (string a) -> thistype {
      thistype b = thistype.allocate();
      b.self = a;
      return b;
    }
    
    method operator==(String a) -> boolean {
      return self == a.val;
    }
    
    method operator val() -> string {
      return self;
    }
    
    method operator val=(string a) {
      self = a;
    }
    
    method operator length() -> integer {
      return StringLength(self);
    }
    
    method operator[] (integer i) -> string {
      return SubString(self, i, i+1);
    }
    
    method operator[]= (integer i, string j) -> string {
      self = SubString(self, 0, i) + j + SubString(self, i+1, StringLength(self));
      return self;
    }

    module StringGeneralMethods;
  }

  public struct Unit {
    unit self;

    static method new (unit a) -> thistype {
      thistype b = thistype.allocate();
      b.self = a;
      return b;
    }

    method operator health() -> real {
      return GetUnitState( self, UNIT_STATE_LIFE );
    }

    method operator health=(real x) {
      SetUnitState( self, UNIT_STATE_LIFE, x );
    }

    method operator x= (real value) {
      SetUnitX( self, value );
    }

    method operator y= (real value) {
      SetUnitY( self, value );
    }

    module UnitGeneralMethods;
  }
  
  function onInit() {
    debug {
      String str = String.new("hi there");
      //CreateUnit( Player(0), 'hfoo', -4000, 2500, 270 ):Unit.health = 0;
    }
  }
}

//! endzinc