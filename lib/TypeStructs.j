//! zinc

library TypeStructs {
	
	public struct String {
		private string s="";
		
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
		unit u;
		
		static method operator[] (unit p) -> thistype {
			thistype a = thistype.allocate();
			a.u = p;
			return a;
		}
		
		method operator unit() -> unit {
			return u;
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
			str.val = "hi";
			BJDebugMsg(str.val);
		}
	}
}

//! endzinc