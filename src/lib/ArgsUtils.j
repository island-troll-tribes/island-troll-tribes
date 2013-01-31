//! zinc

library ArgsUtils requires ArrayLists, IDUtils, Table, TypeStructs {
	
	public struct ArgsList extends ArrayListString {
		string cmd;
		player triggerPlayer;
		
		method inspect() {
			debug {
			  	integer i;
				BJDebugMsg("Inspecting ArgsList "+I2S(this));
				BJDebugMsg("cmd="+cmd);
				for (0 <= i < size()) {
					BJDebugMsg("Args["+I2S(i)+"]="+this[i]);
				}
			}
		}
	}
	
	// Break down a command like a list of arguments like in shell programs
	public function ProcessArgs(string s) -> ArgsList {
		ArgsList a = ArgsList.create();
		boolean  b = false;
		integer  i = 0;
		string   c = "";
		string   d = "";
		s = s + " ";
		debug BJDebugMsg("ArgsUtils: For String <"+s+">");
		for (0 <= i < StringLength(s)) {
			c = SubString(s, i, i+1);
			if (i == 0 && c == "-") {
				// Do Nothing
			}
			else if (c == " ") {
				if (b) {
					a.push(d);
					debug BJDebugMsg("ArgsUtils: Pushed Arg <"+d+">");
				} else {
					a.cmd = d;
					b = true;
					debug BJDebugMsg("ArgsUtils: Setting Command to <"+a.cmd+">");
				}
				d = "";
			}
			else {
				d = d + c;
			}
		}
		return a;
	}
	
	public {
		type ArgFunc extends function(ArgsList);
	}
	
	public struct ChatCommands {
		private static trigger chatEvent;
		private static TableArray cmdFns;
		
		static method registerArgFunc(player forWho, string command, ArgFunc fn) {
			integer i;
			if (forWho == null) {
				for (0 <= i <= 11) {
					cmdFns[i][StringHash(command)] = fn;
				} 
			} else
				cmdFns[GetPlayerId(forWho)][StringHash(command)] = fn;
		}
		
		static method executeArgFunc() {
			ArgsList a = ProcessArgs(GetEventPlayerChatString());
			ArgFunc fn;
			a.triggerPlayer = GetTriggerPlayer();
			if (cmdFns[GetPlayerId(a.triggerPlayer)].has(StringHash(a.cmd))) {
				fn = cmdFns[GetPlayerId(a.triggerPlayer)][StringHash(a.cmd)];
				fn.evaluate(a);
			}
		}
						  
		static method onInit() {
			integer i = 0;
			
			cmdFns = TableArray[12];
			chatEvent = CreateTrigger();
		
			for (0 <= i <= 11) {
				if (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) {
					TriggerRegisterPlayerChatEvent(chatEvent, Player(i), "-", false);
				}
			}
			TriggerAddAction(chatEvent, static method ChatCommands.executeArgFunc);
		}
	}
	
	function TestArgsUtils(ArgsList a) {
		integer i;
		if (a[0] == "spawn") {
			debug BJDebugMsg("Creating "+I2S(S2ID(a[2])));
			if (a[1] == "unit") {
				CreateUnit(a.triggerPlayer, S2ID(a[2]), S2R(a[3]), S2R(a[4]), 270);
				a.destroy();
			}
			else if (a[1] == "item") {
				CreateItem(S2ID(a[2]), S2R(a[3]), S2R(a[4]));
				a.destroy();
			}
			else if (a[1] == "all") {
				if (a[2] == "units") {
					if (a[3] == "--help") {
						DisplayTextToPlayer(a.triggerPlayer, 0, 0, "syntax: -tau spawn all units <time between> <loc x> <loc y>");
						a.destroy();
					}
					else {
						TimerStart(NewTimerEx(a), S2R(a[3]), true, function() {
							ArgsList a = GetTimerData(GetExpiredTimer());
							if (UNIT_ALL.length() > 0) {
								debug BJDebugMsg("UNIT_ALL.last = "+ID2S(UNIT_ALL[UNIT_ALL.length()-1]));
								TimerStart(
									NewTimerEx(Unit[CreateUnit(a.triggerPlayer, UNIT_ALL.pop(), S2R(a[4]), S2R(a[5]), 270)]),
									S2R(a[3])-0.01,
									false,
									function() {
										Unit u = GetTimerData(GetExpiredTimer());
										RemoveUnit(u.unit);
										u.destroy();
										ReleaseTimer(GetExpiredTimer());
								});
							} else {
								ReleaseTimer(GetExpiredTimer());
								a.destroy();
							}
						});
					}
				}
				else if (a[2] == "items") {
					if (a[3] == "--help") {
						DisplayTextToPlayer(a.triggerPlayer, 0, 0, "syntax: -tau spawn all items <time between> <loc x> <loc y>");
					}
					else {
						TimerStart(NewTimerEx(a), S2R(a[3]), true, function() {
							ArgsList a = GetTimerData(GetExpiredTimer());
							if (ITEM_ALL.length() >= 0) {
								debug BJDebugMsg("ITEM_ALL.last = "+ID2S(ITEM_ALL[ITEM_ALL.length()-1]));
								CreateItem(ITEM_ALL.pop(), S2R(a[4]), S2R(a[5]));
							} else {
								ReleaseTimer(GetExpiredTimer());
								a.destroy();
							}
						});
					}
				}
			}
		}
	}
			  
	function onInit() {
		// tau = TestArgsUtils
		ChatCommands.registerArgFunc(Player(0), "tau", TestArgsUtils);
	}
}

//! endzinc