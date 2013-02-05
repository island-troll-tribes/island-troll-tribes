
//! zinc

library ChangeLog requires Utils, Constants {

    constant string ChangeLogNoticeString = GENERAL_COLOR+"Type "+ENERGY_COLOR+"-changelog"+GENERAL_COLOR+" to view changelog for this version";

    type IntFn extends function(integer);
    type StringFn extends function(string);

    public struct ChangeLog {

        static TableArray changes;
        static Table      versions;
        static integer    numVersions;
        static thistype   newest;

        private real       major;
        private integer    minor;
        private integer    length;
        private string     version;

        static method create(real major, integer minor) -> thistype {
            thistype this = thistype.allocate();

            this.major   = major;
            this.minor   = minor;
            this.length  = 0;
            this.version = R2S(major) + A2S(minor);

            thistype.numVersions += 1;
            thistype.versions.integer_s[version] = this;
            
            return this;
        }

        method toString() -> string {
            return "v" + version;
        }

        method operator to_s() -> string {
            return toString();
        }

        method push(string change) {
            changes[this].string[length] = change;
            length += 1;
        }

        method add(string change) {
            push(change);
        }
        
        method each(player p, StringFn f) {
            integer i = 0;
            for (0 <= i < length) {
                f.evaluate(changes[this].string[i]);
            }
        }

        method operator<(thistype t) -> boolean {
            if (major < t.major)
                return true;
            if (major > t.major)
                return false;
            return minor < t.minor;
        }

        method displayForPlayer(player p) {
            integer i = 0;
            for (0 <= i < length) {
                DisplayTimedTextToPlayer(p,0,0,30,GENERAL_COLOR+changes[this].string[i]);
            }
        }

        static method foreach(IntFn fn) {
            integer i = 0;
            for (0 <= i < thistype.numVersions)
                fn.evaluate(thistype(i));
        }

        static method getVersion(string whichVersion) -> thistype {
            return thistype(thistype.versions.integer_s[whichVersion]);
        }

        static method onInit() {
            changes     = TableArray[0x2000];
            versions    = Table.create();
            numVersions = 0;

            TimerStart(CreateTimer(), 0., false, function() {
                ChangeLog.foreach(function(ChangeLog this){
                    if (this > ChangeLog.newest) {
                        ChangeLog.newest = this;
                    }
                });
            });
        }
        
        method inspect() {
            debug {
                integer i;
                BJDebugMsg("Inspecting ChangeLog "+I2S(this));
                BJDebugMsg("major="+R2S(major));
                BJDebugMsg("minor="+I2S(minor));
                BJDebugMsg("version="+version);
                for (0 <= i < length) {
                    BJDebugMsg("changes[this]["+I2S(i)+"]="+changes[this].string[i]);
                }
            }
        }

        static method inspectAll() {  
            debug {
                BJDebugMsg("Inspecting ChangeLogs");
                BJDebugMsg("numVersions="+I2S(numVersions));
                BJDebugMsg("newest="+I2S(newest));
                thistype.foreach(function(ChangeLog i){
                    i.inspect();
                });
            }
        }
    }

    public function DisplayChangeLog(player p) {
        ChangeLog.newest.displayForPlayer(p);
    }
    
    function DisplayNotice() {
        DisplayTextToPlayer( GetLocalPlayer(), 0, 0, ChangeLogNoticeString );
	}
    
    function onInit() {
		TimerStart( CreateTimer(), 120, false, function DisplayNotice );
    }
}

//! endzinc
