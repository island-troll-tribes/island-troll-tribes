
function Trig_GUI_REcipes_Actions takes nothing returns nothing

call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED,HIGHLIGHT_COLOR+"Cool Commands", HIGHLIGHT_COLOR+"-i am noob:|r pings the recipes again for those who cant find them
"+HIGHLIGHT_COLOR+"-cc [number]:|r changes your units color to the color of that number
"+HIGHLIGHT_COLOR+"-p:|r toggles private/public vision for your team
"+HIGHLIGHT_COLOR+"-h:|r toggles hints
"+HIGHLIGHT_COLOR+"-rn:|r shows a list of real names for current players
"+HIGHLIGHT_COLOR+"-ms:|r displays your troll's movement speed
"+HIGHLIGHT_COLOR+"-sc:|r gives share control to your whole team
"+HIGHLIGHT_COLOR+"-ac:|r gives advance control to your whole team (mainly for building)
"+HIGHLIGHT_COLOR+"-clear:|r clears displayed text messages
"+HIGHLIGHT_COLOR+"-modes:|r displays current established modes
"+HIGHLIGHT_COLOR+"-sleep [off/on]:|r disables/enables allies ability to sleep you, used to prevent tk by sleep.
"+HIGHLIGHT_COLOR+"-c ####:|r set your camera distance (-2000 to 5000) default: 0
"+HIGHLIGHT_COLOR+"-f ####:|r set your camera distance (4000 to 100000) default: 5000", "ReplaceableTextures\\WorldEditUI\\Editor-Force.blp" )
//_//_//_//

call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED,GENERAL_COLOR+"Shouts",ENERGY_COLOR+"Authors:|r"+GENERAL_COLOR+" Moop, PL0X_J33BUS, RocketRusty, Quazz, Mephisto.|r
"+GENERAL_COLOR+"Xel'Naga:|r For creating the original ice trolls
"+GENERAL_COLOR+"Foosh:|r For being almost as good as me at ice trolls
"+GENERAL_COLOR+"Clan RPP of USWest
"+GENERAL_COLOR+"Clan ITTP of Europe.
", "ReplaceableTextures\\CommandButtons\\BTNBattleRoar.blp" )

//_//_//_//
call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, GOLD_COLOR+"Contact",ENERGY_COLOR+"Quazz: djrquazz@gmail.com ; Mephisto.: ITTEditor@gmail.com

Checkout our github: https://github.com/theQuazz/island-troll-tribes
", "ReplaceableTextures\\CommandButtons\\BTNSilence.blp" )

call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "Clans", "For a more updated offical list, go to http://islandtrolltribes.wikia.com/wiki/Clans
"+GOLD_COLOR+"US East (Azeroth):|r
- Clan TwGB
"+GOLD_COLOR+"Europe (Northrend):|r
- Clan ITTP

If you want your clan to show up on the list get in touch with Quazz or Mephisto.!

Last updated: Quazz, June 2018
", "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp" )
//_//_//_//


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
", "ReplaceableTextures\\CommandButtons\\BTNDarkTrollTrapper.blp" )

endfunction

function InitTrig_CreateQuests takes nothing returns nothing
    set gg_trg_CreateQuests = CreateTrigger(  )
    call TriggerAddAction( gg_trg_CreateQuests, function Trig_GUI_REcipes_Actions )
endfunction
