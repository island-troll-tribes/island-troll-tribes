//! zinc

library TypeStructs {

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
	
}

//! endzinc