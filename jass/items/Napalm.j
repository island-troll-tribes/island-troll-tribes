
//===========================================================================
//
//
//	 ________ _______ ________ ______      ________ __       ___ _____
//	\__    __|  ____/|__    __|	   o \    \__    __|  \    /   /|     \
//	   |  |  |  __/__ __|  |__|      /       |  |  \   \/\/   / |  o  | 
//	   |__|  |_______|________|__|\__\       |__|   \___/\___/  \_____|
//	  			 
//							    by Quazz
//								 v0.0.5
//	
// 			  Extending the play level of Island Troll Tribes
// 	
//	Purpose:
// 
//		In Island Troll Tribes, the game can get kind of boring once
// 		you have made your gear and are searching endlessly for people 
//		on the other teams. In attempts to remove this from the game,
//		my objective is to make certain "quests" which will allow you
//		to continually expand your gear collection and enjoy the game,
//		even if the other team is hiding.             
//	
//	Method:
// 
//		Island Troll Tribes is already a ripe map. There is great 
// 		potential for it to become a stellar map. All it needs is a 
//		bit of enhancements. Just like taking steroids boosts your 
//		preformance in sports, taking more vJass will turn ITT into 
//		an even more powerful sub-culture of wc3, and perhaps even 
//		pave the way for its development beyond the Warcraft III game
//		engine. 
//		
//	Procedure:
// 
//		Island Troll Tribes needs MORE. More items, more bosses, more 
//		secrets, more lore. As an avid troller, though I do not know
//		every tactic, I know enough that I get bored of the game. 
//		Further, when one of your tactics becomes too powerful, it is 
//		nerfed thus reducing your fun in the game, and when that fun is 
//		not replaced by something else new in the game, there is less 
//		attraction in playing the game. That is not to say I don't 
//		support balance, of course I do, however; there needs to be 
//		an inflow of new content to keep people curious and eager to 
//		play.
//		
//		The way to induce this environment of inflow of content that 
//		attracts gamers, I see fit the arrival of new lords in the 
//		Islands. They would have extremely powerful gear but be 
//		tricky to kill. For example, there may be a powerful djinn of 
//		sorts, extremely powerful normally, but use a mage masher on 
//		him and he is crippled. He would drop gear otherwise 
//		unaccessible. The key to these bosses is you can kill them solo!

library ttSpells initializer init_ttSpells
	
	// A forest fire:
	//	cast on one tree
	//	that tree dies immediately from flames
	//	those trees lights on fire, dieing in W seconds
	//	each tree, Y-Z seconds into burning, lights nearby trees on fire
	//	burning trees do dps to units around them
	//	burning trees heat units around them to full heat
	//	fire goes out after X seconds
	scope ForestFire
	
		// ###################################### CONSTANTS ##############################################
		globals
			// IDs
			private constant integer 	FLAME_BOMB 					= ITEM_NAPALM 	// ID GOES HERE
			private constant integer 	RUINS_TREE 					= DEST_RUINS_TREE 	// ID GOES HERE
			private constant integer 	RUINS_TREE_FAKE			    = DEST_SUPER_TREE	// ID GOES HERE
			private constant integer 	RUINS_TREE_FALSE		    = DEST_FALSE_TREE	// ID GOES HERE
			private constant integer 	RUINS_TREE_SKINNY			= DEST_RUINS_TREE_CANOPY	// ID GOES HERE
			private constant integer 	RUINS_TREE_FAKE_SKINNY		= DEST_SUPER_TREE_CANOPY	// ID GOES HERE
			// spell data
			private constant real	 	FLAME_DAMAGE_HERO			= 35.0		// FIRE DMG TO NEARBY HEROES
			private constant real	 	FLAME_DAMAGE_STRUCTURE		= 45.0		// FIRE DPS TO NEARBY STRUCTURES
			private constant real	 	FLAME_DAMAGE_OTHER		    = 80.0		// FIRE DPS TO NEARBY OTHER UNITS
			private constant real	 	FLAME_RANGE 				= 250.0		// FIRE SPEADING RANGE
			private constant real	 	FLAME_AOE 					= 75.0		// INITIAL CAST AOE VISION_MODIFIER_RANGE
			private constant real	 	VISION_DURATION				= 10.0		// VISION MODIFIER LIFE
			private constant real	 	VISION_MODIFIER_RANGE		= 800.0		// VISION MODIFIER RANGE
			private constant real	 	FOREST_FIRE_LENGTH			= 30.0		// WHEN THE FIRE BURNS OUT
			private constant real	 	FLAME_EFFECT_DURATION		= 10.0		// HOW LONG FLAME EFFECTS LAST
			private constant real	 	TREE_INITIAL_KILL_DELAY		= 0.5		// FIRST TREES MAXIMUM DEATH TIME
			private constant real	 	TREE_KILL_DELAY_LB 			= 3.0		// NEXT TREES MINIMUM DEATH TIME
			private constant real	 	TREE_KILL_DELAY_UB 			= 7.0		// NEXT TREES MAXIMUM DEATH TIME
			private constant real		FLAME_INITIAL_DMG_PERCENT 	= 50.0		// FIRE INITIAL DAMAGE TO TREES
			// model paths
			private constant string		FIRE_MODEL_PATH				= "Doodads\\Cinematic\\TownBurningFireEmitter\\TownBurningFireEmitter.mdl"
			private constant string		GUST_MODEL_PATH				= "Doodads\\Cinematic\\FirePillarMedium\\FirePillarMedium.mdl"
			private constant string		FIRE_BURST_MODEL_PATH		= "Doodads\\Cinematic\\FireTrapUp\\FireTrapUp.mdl"
		endglobals
		// ###############################################################################################
		
		// GLOBALS
		globals
			private hashtable 	fireHash 	= InitHashtable()				
			private integer		forestFire 	= 1						// the numFire of the forest fire (first, second, third, etc...)
            
            private keyword burnThisMotherfuckerDown
		endglobals
		
		// CONDITION FUNCTION
		private function isRuinsTree takes nothing returns boolean
            if GetDestructableLife( GetFilterDestructable() ) == 0 then
                return false
			elseif GetDestructableTypeId( GetFilterDestructable() ) == RUINS_TREE then
				return true
			elseif GetDestructableTypeId( GetFilterDestructable() ) == RUINS_TREE_FAKE then
				return true
			elseif GetDestructableTypeId( GetFilterDestructable() ) == RUINS_TREE_FALSE then
				return true
			else
				return false
			endif
		endfunction
        
		// CONDITION FUNCTION
		private function condition_burnThisMotherfuckerDown takes nothing returns boolean
			return GetSpellAbilityId() == FLAME_BOMB
		endfunction
		
		// TERMINATING FUNCTION EXECUTED ONCE PER FOREST FIRE
		private function endForestFire takes nothing returns nothing
			local integer numForestFire = LoadInteger( fireHash, StringHash("numFire"), GetHandleId(GetExpiredTimer()) )
			
			call SaveBoolean( fireHash, StringHash("stillBurning"), numForestFire, false )
			call DestroyTimer( GetExpiredTimer() )
			
            debug call BJDebugMsg("Fire Over")
		endfunction
		
		// TAKES AWAY VISION
		private function takeFireVision takes nothing returns nothing
			call FogModifierStop( LoadFogModifierHandle( fireHash, StringHash("vision"), GetHandleId( GetExpiredTimer() ) ) )
			call RemoveSavedHandle( fireHash, StringHash("vision"), GetHandleId( GetExpiredTimer() ) )
			call DestroyTimer( GetExpiredTimer() ) 
		endfunction
        
        // GIVES VISION TO NEARBY UNITS
        private function giveFireVision takes nothing returns nothing
			local fogmodifier vision
			local timer t
            if IsHeroUnitId( GetUnitTypeId( GetEnumUnit() ) ) then
				set t = CreateTimer()
				set vision = CreateFogModifierRadiusLoc( GetOwningPlayer( GetEnumUnit() ), FOG_OF_WAR_VISIBLE, GetUnitLoc( GetEnumUnit() ), VISION_MODIFIER_RANGE, true, true )
				call SaveFogModifierHandle( fireHash, StringHash("vision"), GetHandleId(t), vision )
				call FogModifierStart( vision )
				call TimerStart( t, VISION_DURATION, false, function takeFireVision )
			endif
        endfunction
		
		// GIVE CASTING UNIT VISION
		private function giveCasterVision takes integer numForestFire returns nothing
			local unit 	castingUnit = LoadUnitHandle( fireHash, StringHash("caster"), numForestFire )
			local group g			= CreateGroup()
			
			call GroupAddUnit( g, castingUnit )
            call ForGroup( g, function giveFireVision )			
			
			call DestroyGroup( g )
		endfunction
        
        // DAMAGES NEARBY UNITS
        private function damageUnits takes nothing returns nothing
            if IsHeroUnitId( GetUnitTypeId( GetEnumUnit() ) ) then
                call SetUnitState( GetEnumUnit(), UNIT_STATE_LIFE, GetUnitState( GetEnumUnit(), UNIT_STATE_LIFE )-FLAME_DAMAGE_HERO )
            elseif IsUnitType( GetEnumUnit(), UNIT_TYPE_STRUCTURE ) and GetOwningPlayer( GetEnumUnit() ) != Player( PLAYER_NEUTRAL_PASSIVE ) then
                call SetUnitState( GetEnumUnit(), UNIT_STATE_LIFE, GetUnitState( GetEnumUnit(), UNIT_STATE_LIFE )-FLAME_DAMAGE_STRUCTURE )
            elseif GetOwningPlayer( GetEnumUnit() ) != Player( PLAYER_NEUTRAL_PASSIVE ) then
                call SetUnitState( GetEnumUnit(), UNIT_STATE_LIFE, GetUnitState( GetEnumUnit(), UNIT_STATE_LIFE )-FLAME_DAMAGE_OTHER )
			endif
        endfunction
        
        // DESTROYS THE CREATED EFFECT
        private function removeFireEffect takes nothing returns nothing
            local effect fireEffect = LoadEffectHandle( fireHash, StringHash("effect"), GetHandleId(GetExpiredTimer()) )
			call RemoveSavedHandle( fireHash, StringHash("effect"), GetHandleId(GetExpiredTimer()) )
			call DestroyEffect( fireEffect )
			call DestroyTimer( GetExpiredTimer() )
        endfunction
        
        // CREATES AN EFFECT AT THE LOCATION OF THE BURNING TREE
        private function addFireEffect takes location loc returns nothing
            local effect fireEffect1
            local effect fireEffect2
			local timer timer1 = CreateTimer()
			local timer timer2 
			
			if GetRandomInt(1,2)==1 then
				set fireEffect1 = AddSpecialEffectLoc( FIRE_MODEL_PATH, loc )
			else
				set fireEffect1 = AddSpecialEffectLoc( GUST_MODEL_PATH, loc )
			endif
			
			call SaveEffectHandle( fireHash, StringHash("effect"), GetHandleId(timer1), fireEffect1 )
			call TimerStart( timer1, FLAME_EFFECT_DURATION, false, function removeFireEffect )
			
			if GetRandomReal(0,100)<15.0 then
				set fireEffect2 = AddSpecialEffectLoc( FIRE_BURST_MODEL_PATH, loc )
				set timer2		= CreateTimer()
				call SaveEffectHandle( fireHash, StringHash("effect"), GetHandleId(timer2), fireEffect2 )
				call TimerStart( timer2, 2, false, function removeFireEffect )
			endif
        endfunction
        
        // REQUIRED FOR MUTUAL RECURSION IN THIS CASE								// NOTE: Wouldn't be required if .evaluate worked how I want it to
        private function callBurnThisMotherFuckerDown takes nothing returns nothing
            call burnThisMotherfuckerDown.evaluate(GetExpiredTimer())
        endfunction
		
		// INITIATES BURNING OF EACH TREE BY PLACING THEIR DESTRUCTION ON TIMERS 	// NOTE: mutually recursive with burnThisMotherfuckerDown
		private function prepareTreeForBurning takes nothing returns nothing
			local timer 	waitTill	= CreateTimer()
			local integer	numFire		= LoadInteger( fireHash, StringHash("numFire"), StringHash("param") )
			local real 	    killDelay	= GetRandomReal(TREE_KILL_DELAY_LB,TREE_KILL_DELAY_UB) 	// check global constants
			
			if GetDestructableLife( GetEnumDestructable() ) / GetDestructableMaxLife( GetEnumDestructable() ) > FLAME_INITIAL_DMG_PERCENT * 0.01 then
				call SetDestructableLifePercentBJ( GetEnumDestructable(), FLAME_INITIAL_DMG_PERCENT )
			endif
            call addFireEffect( GetDestructableLoc( GetEnumDestructable() ) )
			
			call SaveDestructableHandle( fireHash, StringHash("burningTree"), GetHandleId(waitTill), GetEnumDestructable() ) 
			call SaveInteger( fireHash, StringHash("numFire"), GetHandleId(waitTill), numFire )
			call TimerStart( waitTill, killDelay, false, function callBurnThisMotherFuckerDown )
		endfunction
		
		// DESTROYS THE TARGET TREE AND INITIATES NEAR BY TREES TO BURN				// NOTE: mutually recursive with prepareTreeForBurning
		private function burnThisMotherfuckerDown takes timer t returns nothing
			local destructable 	targetTree 		= LoadDestructableHandle( fireHash, StringHash("burningTree"), GetHandleId(t) )
			local integer		numFire			= LoadInteger( fireHash, StringHash("numFire"), GetHandleId(t) )
			local boolean		stillBurning	= LoadBoolean( fireHash, StringHash("stillBurning"), numFire )
			local rect 			AoE				= Rect( GetDestructableX(targetTree)-FLAME_RANGE, GetDestructableY(targetTree)-FLAME_RANGE, GetDestructableX(targetTree)+FLAME_RANGE, GetDestructableY(targetTree)+FLAME_RANGE )
            local group         g               = CreateGroup()
			
            call SetDestructableLife( targetTree, 0 )
            
            call GroupEnumUnitsInRect( g, AoE, null )
            call ForGroup( g, function damageUnits )
            call ForGroup( g, function giveFireVision )
			call giveCasterVision( numFire )
			
			if stillBurning and GetRandomInt(1,10)>=2 then
				call SaveInteger( fireHash, StringHash("numFire"), StringHash("param"), numFire )
				call EnumDestructablesInRect( AoE, Condition( function isRuinsTree ), function prepareTreeForBurning )
			endif
			
			call RemoveSavedHandle( fireHash, StringHash("burningTree"), GetHandleId(t) )
			call RemoveSavedBoolean( fireHash, StringHash("numFire"), GetHandleId(t) )
			
			call DestroyTimer( t )
			
		endfunction
		
		// PREPARES TREES FOR BURNING BUT ON A QUICKER TIMER
		private function burnFirstTrees takes nothing returns nothing
			local timer 	waitTill	= CreateTimer()
			local integer	numFire		= LoadInteger( fireHash, StringHash("numFire"), StringHash("param") )
			local real 	    killDelay	= GetRandomReal(0,TREE_INITIAL_KILL_DELAY)
			
            debug call BJDebugMsg("First Trees Burning")
            
			if GetDestructableLife( GetEnumDestructable() ) / GetDestructableMaxLife( GetEnumDestructable() ) > FLAME_INITIAL_DMG_PERCENT * 0.01 then
				call SetDestructableLifePercentBJ( GetEnumDestructable(), FLAME_INITIAL_DMG_PERCENT )
			endif
            call addFireEffect( GetDestructableLoc( GetEnumDestructable() ) )
			
			call SaveDestructableHandle( fireHash, StringHash("burningTree"), GetHandleId(waitTill), GetEnumDestructable() ) 
			call SaveInteger( fireHash, StringHash("numFire"), GetHandleId(waitTill), numFire )
			call TimerStart( waitTill, killDelay, false, function callBurnThisMotherFuckerDown )	
		endfunction
		
		// INITIALIZES THE DESTRUCTION OF TREES
		//	- this function is important for two reasons
		//		A) initialize the timer to stop this numFire of forest fire
		//		B) burn the first trees extremely fast
		private function FlameCast takes nothing returns nothing
			local timer		endForestFireT 	= CreateTimer()
			local location  castTarget		= GetSpellTargetLoc()
			local rect 		AoE				= Rect( GetLocationX(castTarget)-FLAME_AOE, GetLocationY(castTarget)-FLAME_AOE, GetLocationX(castTarget)+FLAME_AOE, GetLocationY(castTarget)+FLAME_AOE )
			
            debug call BJDebugMsg("Napalm Cast")
            
			call SaveInteger( fireHash, StringHash("numFire"), StringHash("param"), forestFire )	
			call SaveInteger( fireHash, StringHash("numFire"), GetHandleId(endForestFireT), forestFire )		
			call SaveBoolean( fireHash, StringHash("stillBurning"), forestFire, true )
			call SaveUnitHandle( fireHash, StringHash("caster"), forestFire, GetTriggerUnit() )	
            
			call EnumDestructablesInRect( AoE, Condition( function isRuinsTree ), function burnFirstTrees )
			call TimerStart( endForestFireT, FOREST_FIRE_LENGTH, false, function endForestFire )
            
			set forestFire=forestFire+1 	// Increment so that next forest fire has new value in hashtable
		endfunction
		
		// TRIGGER FUNCTION
		public function init takes nothing returns nothing
			local trigger 	castFlameBomb	= CreateTrigger()
            
			call TriggerRegisterAnyUnitEventBJ( castFlameBomb, EVENT_PLAYER_UNIT_SPELL_CAST )
			call TriggerAddCondition( castFlameBomb, Condition(function condition_burnThisMotherfuckerDown) )
			call TriggerAddAction( castFlameBomb, function FlameCast )
			
		endfunction
        
	endscope
	//====================================================================================================
	
	// A zeppelin system for Buying Mats
	//	cast from defensive system
	//	summons to your base a zeppelin for trading
	//	you can pay more for more expensive mats
	scope ZeppelinTraders
	
		// ###################################### CONSTANTS ##############################################
		globals
			// IDs
			private constant integer    ZEPPELIN_ID		    = UNIT_TRADE_ZEPPELIN
			private constant integer    SUMMON_ZEPPELIN	    = 'A0B8'
			// LOCATIONS
			private constant location   MASTER_CRAFTER_LOC  = Location( 1210, -1210 )
			// SPELL DATA
			private constant real   	ZEPPELIN_DURATION   = 20.0
		endglobals
		// ###############################################################################################
		
		// GLOBALS
		globals
            hashtable zeppelinHash = InitHashtable()
		endglobals
        
        // CONDITION FUNCTION
        function castedSummonZeppelin takes nothing returns boolean
            return GetSpellAbilityId() == SUMMON_ZEPPELIN
        endfunction
		
		// REMOVE ZEPPELIN FUNCTION
		function removeZeppelin takes nothing returns nothing
			local unit zeppelin = LoadUnitHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId( GetExpiredTimer() ) ) 
            local rect MASTER_CRAFTER_RECT = Rect( 810, -1610, 1610, -810 )
			
			call IssuePointOrderLoc( zeppelin, "move", MASTER_CRAFTER_LOC )
			
			if RectContainsUnit( MASTER_CRAFTER_RECT, zeppelin ) then
				call RemoveUnit( zeppelin )
				call RemoveSavedHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId( GetExpiredTimer() ) )
				call PauseTimer( GetExpiredTimer() )
				call DestroyTimer( GetExpiredTimer() )
			endif
		endfunction
        
		// RETURN TO MASTER CRAFTER FUNCTION
		function returnHome takes nothing returns nothing
			local unit 		zeppelin 	= LoadUnitHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId(GetExpiredTimer()) )
			local timer 	t	        = CreateTimer()
            
            call IssuePointOrderLoc( zeppelin, "move", MASTER_CRAFTER_LOC )
            call SaveUnitHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId( t ), zeppelin )
            call TimerStart( t, 1.0, true, function removeZeppelin )
            
            call RemoveSavedHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId( GetExpiredTimer() ) )
            call DestroyTimer( GetExpiredTimer() )
        endfunction
		
		// PAUSE FOR BUYING FUNCTION
		function letBuy takes nothing returns nothing
			local unit 		zeppelin 	= LoadUnitHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId(GetExpiredTimer()) )
			local rect 		dwardRect 	= LoadRectHandle( zeppelinHash, StringHash("location"), GetHandleId(GetExpiredTimer()) )
			local location	dwardLoc	= LoadLocationHandle( zeppelinHash, StringHash("loc"), GetHandleId(GetExpiredTimer()) )
			local timer 	t			
				
			call IssuePointOrderLoc( zeppelin, "move", dwardLoc )
			
			if RectContainsUnit( dwardRect, zeppelin ) then
                call RemoveSavedHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId( GetExpiredTimer() ) )
				call RemoveSavedHandle( zeppelinHash, StringHash("location"), GetHandleId( GetExpiredTimer() ) )
				call PauseTimer( GetExpiredTimer() )
				call DestroyTimer( GetExpiredTimer() )
				
				set t = CreateTimer()
                call SaveUnitHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId(t), zeppelin )
                call TimerStart( t, ZEPPELIN_DURATION, false, function returnHome )
			endif
		endfunction
        
        // ACTION FUNCTION
        function summonZeppelin takes nothing returns nothing
            local unit 	zeppelin 	= CreateUnitAtLoc( Player(PLAYER_NEUTRAL_PASSIVE), ZEPPELIN_ID, MASTER_CRAFTER_LOC, 270 )
            local timer t			= CreateTimer()
			local rect  r			= Rect( GetUnitX( GetTriggerUnit() )- 400, GetUnitY( GetTriggerUnit() )- 400, GetUnitX( GetTriggerUnit() )+ 400, GetUnitY( GetTriggerUnit() )+ 400 )
			
            //call AddItemToStock( zeppelin, ID, STOCK, STOCK_MAX )
            
            call SetUnitPathing( zeppelin, false )
            call IssuePointOrderLoc( zeppelin, "move", GetUnitLoc(GetTriggerUnit()) )
			
			call SaveUnitHandle( zeppelinHash, StringHash("zeppelin"), GetHandleId(t), zeppelin )
			call SaveRectHandle( zeppelinHash, StringHash("location"), GetHandleId(t), r )
			call SaveLocationHandle( zeppelinHash, StringHash("loc"), GetHandleId(t), GetUnitLoc( GetTriggerUnit() ) )
			call TimerStart( t, 1.0, true, function letBuy )
        endfunction
		
		// TRIGGER FUNCTION
		public function init takes nothing returns nothing
			local trigger t = CreateTrigger()
            
			call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_CAST )
			call TriggerAddCondition( t, Condition(function castedSummonZeppelin) )
			call TriggerAddAction( t, function summonZeppelin )
			
		endfunction
	
	endscope
	
	// LIBRARY INITIALIZER
	//	- calls other spell specific initializers
	function init_ttSpells takes nothing returns nothing
		call ForestFire_init()
		call ZeppelinTraders_init()
	endfunction
	//====================================================================================================
	
endlibrary
//===========================================================================
