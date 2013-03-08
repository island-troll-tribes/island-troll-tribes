//! zinc

library TypeStructs {
	
	public struct String {
		private string s = "";
		
		static method new (string a) -> thistype {
			thistype b = thistype.allocate();
			b.s = a;
			return b;
		}
		
		method operator==(String a) -> boolean {
			return s == a.val;
		}
		
		method operator val() -> string {
			return s;
		}
		
		method operator val=(string a) {
			s = a;
		}
		
		method operator length() -> integer {
			return StringLength(s);
		}
		
		method operator[] (integer i) -> string {
			return SubString(s, i, i+1);
		}
		
		method operator[]= (integer i, string j) -> string {
			s = SubString(s, 0, i) + j + SubString(s, i+1, StringLength(s));
			return s;
		}
		
		static method operator[] (string a) -> thistype {
			thistype b = thistype.allocate();
			b.s = a;
			return b;
		}
	}

	public struct Unit {
		unit self;
		
		static method operator[] (unit p) -> thistype {
			thistype a = thistype.allocate();
			a.self = p;
			return a;
		}
		
		method operator unit() -> unit {
			return self;
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
	}
		  
//! textmacro CREATE_TYPE_STRUCT takes TYPE, UCASE_TYPE, NULL_VALUE
	public struct $UCASE_TYPE$ {
		$TYPE$ a;
		
		static method operator[] ($TYPE$ b) -> thistype {
			thistype i = thistype.allocate();
			i.a = b;
			return i;
		}
		
		method operator $TYPE$ () -> $TYPE$ {
			return a;
		}
	}
//! endtextmacro
	
	function onInit() {
		debug {
			String str = String.new("hi there");
			Unit[CreateUnit( Player(0), 'hfoo', -4000, 2500, 270 )].health = 0;
		}
	}
}

//! endzinc