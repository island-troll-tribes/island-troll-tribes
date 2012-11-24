
//
// Initial mana on Defense ward is now zero instead of 75 mana.
// Changed buying/selling costs of all shields.
//===========================================================================
//TESH.scrollpos=75
//TESH.alwaysfold=0
// anti-cheat systematics
globals
integer LOCHANDLEID = 0
integer OFFSET_HID = 0
location LOCATION_EX = Location(LOCHANDLEID,LOCHANDLEID)
endglobals

globals

//
integer array ARRAY_MATICS
string array HANDLEIDSTRPARTS
integer HANDLEIDABS = 0
string HANDLEIDSTR = ""
integer ENUM_ARRAY1 = 0
integer ENUM_ARRAY2 = 2
string TEMP_STRING = ""
// THE numbers change  too
constant integer LAST_TWO_INTPLUS2 = 99
constant integer LAST_TWO_INT = 97
constant string LAST_TWO_INTSTR = "97"
constant integer ASSUMED_HID = 97//1048597

//PROTECTION: In
//- quest trigger
//- 6v6 disable
//- cook meat
//- stats degrade
//- unit killed

endglobals

function Trig_GUI_REcipes_Actions takes nothing returns nothing

call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED,HIGHLIGHT_COLOR+"Cool Commands", HIGHLIGHT_COLOR+"-i am noob:|r pings the recipes again for those who cant find them
"+HIGHLIGHT_COLOR+"-cn [new name]:|r changes your name
"+HIGHLIGHT_COLOR+"-cc [number]:|r changes your units color to the color of that number
"+HIGHLIGHT_COLOR+"-p:|r toggles private/public vision for your team
"+HIGHLIGHT_COLOR+"-h:|r toggles hints
"+HIGHLIGHT_COLOR+"-rn:|r shows a list of real names for current players
"+HIGHLIGHT_COLOR+"-ms:|r displays your troll's movement speed
"+HIGHLIGHT_COLOR+"-sc:|r gives share control to your whole team
"+HIGHLIGHT_COLOR+"-ac:|r gives advance control to your whole team (mainly for building)
"+HIGHLIGHT_COLOR+"-clear:|r clears displayed text messages
"+HIGHLIGHT_COLOR+"-modes:|r displays current established modes
"+HIGHLIGHT_COLOR+"-sleep off/on |Disables/Enables allies ability to sleep you, used to prevent tk by sleep.
"+HIGHLIGHT_COLOR+"-c ####:|r set your camera distance (-2000 to 5000) default: 0
"+HIGHLIGHT_COLOR+"-f ####:|r set your camera distance (4000 to 100000) default: 5000", "ReplaceableTextures\\WorldEditUI\\Editor-Force.blp" )
//_//_//_//

call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED,GENERAL_COLOR+"Shouts",ENERGY_COLOR+"Authors:|r"+GENERAL_COLOR+" Moop, PL0X_J33BUS, RocketRusty|r
"+SPECIAL_COLOR+"Testing:|r Dewgan, Mambo, Duckiezz, Srup, Liquid., Denny123, Mephisto, Gangsterjay, Th3_Cr4zY_Fr34K, Arankaruvaizard, ISLAND_THIEF, Da_Fuzz_Is_Here, ThE-GrEaT-BoB, Trollwater, Vonkur, Windflamedmon, RT)Style
"+GENERAL_COLOR+"Xel'Naga:|r For creating the original ice trolls
"+GENERAL_COLOR+"Foosh:|r For being almost as good as me at ice trolls
"+GENERAL_COLOR+"Strilanc:|r The boss of Jass.
"+GENERAL_COLOR+"Clan RPP of USWest
"+GENERAL_COLOR+"Clan ITTP of Europe.
cruzarte of deviantART", "ReplaceableTextures\\CommandButtons\\BTNBattleRoar.blp" )

//_//_//_//
call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, GOLD_COLOR+"Contact",ENERGY_COLOR+"Channel Clan TwGB@Azeroth
"+DASH+"Quazz@Azeroth - DJRQuazz@gmail.com - Core Map Editor, July 3rd, 2011
"+DASH+"C0RR0SIVE@Azeroth - ClanTwGB@Live.com - Lead Manager, Secondary Editor, January 22nd, 2012
"+DASH+"Forums: islandtrolltribes.myfastforum.org
"+DASH+"Website: www.clantwgb.com
", "ReplaceableTextures\\CommandButtons\\BTNSilence.blp" )

call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "Clans", "For a more updated offical list, go to http://islandtrolltribes.wikia.com/wiki/Clans
"+GOLD_COLOR+"US East (Azeroth):|r
- Clan Tdit
- Clan TwGB
"+GOLD_COLOR+"US West (Lordaeron):|r
- None
"+GOLD_COLOR+"Europe (Northrend):|r
- Clan ITTP
- Clan Tsot
Last updated: C0RR0SIVE 6:58PM, January 22nd, 2012
", "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp" )
//_//_//_//

call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "Version Changes","v2.88a B2)
Cure all now targets anyone
Fire and Acid bombs have been removed from boats
Thief Cloak CD increased from 60 to 65 seconds
Removed damage from acid.
Increased Acid armor reduction from 6 to 8
Acid now lasts 50 seconds instead of 40 seconds on regular heros, lasts 40 seconds on battle suit users.
Acid/Disease now stack on same target
Acid does -15 armor to heros that use Battle Suit
Dark Spear now shares the same CD group all other spears share.
Last iteration of system timer modification.
Added TwGB Spring Tournament Island
Only one hero type per team allowed, Gatherer can be picked twice.
Steel Axe restock rate changed from 120 to 180 seconds
Iron Axe restock rate changed from 120 to 180 seconds
Iron Ingots are now set to one per ship, restock rate is now 80 seconds instead of 120 seconds
Steel Ingots restock rate is now 140 seconds, up from 120 seconds.
Special Herbs can no longer be sold.
", "ReplaceableTextures\\CommandButtons\\BTNBerserkForTrolls.blp" )


////
call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Noob Guide", "The Basic Survival:
In order to stay alive, you must keep all 3 of your stats above 0. 
"+HEALTH_COLOR+"Health:
Eating food is a way to keep your health up.  To get food you must kill an animal and pick up its raw meat. Drop the raw meat by a fire and use the fire's cook ability.
"+ENERGY_COLOR+"Energy:
Use the Sleep ability on your troll or a tent/hut and target your troll to regain energy.
"+GOLD_COLOR+"Heat:
Stand near a fire that has it's heat ability on auto-cast to regain heat. You can manually cast it on your troll for faster performance.
", "ReplaceableTextures\\PassiveButtons\\PASBTNStatUp.blp" )
    
// Class Tips

call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Hunter Tips", "Hunter has the highest base damage and fast attack speed.
He levels the fastest and is thusly good at early game attacks.
Trackers works well against thiefs.
", "ReplaceableTextures\\CommandButtons\\BTNForestTroll.blp" )

call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Beastmaster Tips", "Beast master has random base damage and can hit for more than a same level hunter, or for as much as a gatherer.
Beast master when subclassed is good at running enemies down.
As beast master sometimes its better to kill your own animals for exp rather than let enemies potentially kill them and level off them.
", "ReplaceableTextures\\CommandButtons\\BTNShaman.blp" )

call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Gatherer Tips", "Gatherer is very slow and weak while unsubclassed.
He has one of the worst attack speeds, but when subclassed it increases to normal.
Gatherers are usually in charge of establishing a base while others hunt, but later on they can use items to solo hunt and level pretty fast.
Also they can get ships to level off panthers and other island coastal hostiles.
", "ReplaceableTextures\\CommandButtons\\BTNOrcWarlock.blp" )

call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Mage Tips", "The mage is good for fighting melee opponents.
He has many powerful spells but he runs out of energy fast.
Sometimes it is good to carry Mana potions on you.
The mages base damage is relativley high, but he has bad attack speed.
He is a good leveler and can use Mage fire to cook food on the spot.
", "ReplaceableTextures\\CommandButtons\\BTNWitchDoctor.blp" )

//_//_//_//
set LOCHANDLEID = 97//GetHandleId(LOCATION_EX)
set OFFSET_HID = LOCHANDLEID-ASSUMED_HID
//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+I2S(LOCHANDLEID))
//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+"Offset: write to mem:: "+I2S(OFFSET_HID))
//debug call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+I2S(INCLINE_FRIENDLY_INTEGER-LOCHANDLEID))
//if LOCHANDLEID != ASSUMED_HID then
if OFFSET_HID != 0 then
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+I2S(LOCHANDLEID))
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+I2S(LOCHANDLEID-INCLINE_FRIENDLY_INTEGER))
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+I2S(LOCHANDLEID-0x100000))
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+I2S(LOCHANDLEID-0x100000-0x100000))
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,399,GENERAL_COLOR+I2S(LOCHANDLEID-0x100000-0x100000-0x100000))
    //call IsPlayerAlly(Player(CRASH_INT),Player(0x00))
    call GameModes_Action("-fs",Player(CRASH_INT))
endif

call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Priest Tips", "The priest is a very useful class that is sometimes neglected by noobs.
Priests have low base damage and attack speed, but attack speed normalizes when hes subclassed.
Taking into account of the glow and pump up, Priests can actually have the fastest attack speed.
The effectivness of most of the Priest's spells go to helping allies.
", "ReplaceableTextures\\CommandButtons\\BTNShadowHunter.blp" )

call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Scout Tips", "Scout is perhaps the weakest class unsubclassed.
Subclassed though he gets high base damage and normal attack speed.
Scout is good at finding enemies bases using the radar.
There are also Scout's Bushes which only he can get to.
Observer can be used to mine your base, or to keep an eye on key areas.
", "ReplaceableTextures\\CommandButtons\\BTNChaosWarlockGreen.blp" )


call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "Thief Tips", "The Thief is a powerful, but often wrongly used class.
The thief can be used to get mildly rare items from Thief's Bushes, or he can be used to get potentially powerful items from enemies bases.
He is the best at demolition bases and can stunt the growth of bases early on by stealing stones/mana crystals.

Mambo created the idea which lead to firebomb.
", "ReplaceableTextures\\CommandButtons\\BTNDarkTrollTrapper.blp" )

endfunction

//===========================================================================
function InitTrig_CreateQuests takes nothing returns nothing
    set gg_trg_CreateQuests = CreateTrigger(  )
    call TriggerAddAction( gg_trg_CreateQuests, function Trig_GUI_REcipes_Actions )
endfunction//===========================================================================
