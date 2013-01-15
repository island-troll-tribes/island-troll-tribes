
//! zinc

library ChangeLog {

    constant string ChangeLogNoticeString = GENERAL_COLOR+"Type "+ENERGY_COLOR+"-changelog"+GENERAL_COLOR+" to view changelog for this version";

    type IntFn extends function(integer);
    type StringFn extends function(string);

    public struct ChangeLog {

        static  TableArray changes;
        static  Table      versions;
        static  integer    numVersions;

        private real       major;
        private integer    minor;
        private integer    length;
        private string     version;
        private thistype   newest;

        static method create(real major, integer minor) -> thistype {
            thistype this = thistype.allocate();

            this.major   = major;
            this.minor   = minor;
            this.length  = 0;
            this.version = R2S(major) + I2S(minor);

            thistype.numVersions += 1;
            thistype.versions.integer_s[version] = this;
            
            return this;
        }

        method push(string change) {
            changes[this][length] = change;
            length += 1;
        }
        
        method each(StringFn f) {
            integer i = 0;
            for (0 <= i < length) {
                f.evaluate(changes[this][i]);
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
            this.each(function(string change){
                DisplayTimedTextToPlayer(p,0,0,30,GENERAL_COLOR+change);
            });
        }

        static method each(IntFn fn) {
            integer i = 0;
            for (0 <= i < thistype.numVersions)
                fn.evaluate(thistype(i));
        }

        static method getVersion(string version) -> thistype {
            return thistype(thistype.versions[version]);
        }

        static method onInit() {
            changes     = TableArray[0x2000];
            versions    = Table.create();
            numVersions = 0;
        }
        
        method inspect() {
            debug {
                integer i;
                BJDebugMsg("Inspecting ChangeLog "+I2S(this));
                BJDebugMsg("major="+R2S(major));
                BJDebugMsg("minor="+I2S(minor));
                BJDebugMsg("version="+version);
                for (0 <= i < length) {
                    BJDebugMsg("changes[this]["+I2S(i)+"]="+changes[this][i]);
                }
            }
        }

        static method inspectAll() {  
            debug {
                BJDebugMsg("Inspecting ChangeLogs");
                BJDebugMsg("numVersions="+I2S(numVersions));
                BJDebugMsg("newest="+I2S(newest));
                thistype.each(function(ChangeLog i){
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
        ChangeLog.each(function(ChangeLog this){
            if (this > ChangeLog.newest) {
                ChangeLog.newest = this;
            }
        });
    }
}

//! endzinc
