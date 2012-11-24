
//===========================================================================
//TESH.scrollpos=68
//TESH.alwaysfold=0

// This script is a protective script one can use to disable 
//  their team from team killing them using sleep. It is 
//  activated by a message entered from user.

library antiSleepTk initializer init
	
	//	VARIABLES:
	//		each players "switch" for allowing allies to sleep them
	//
	globals
		private constant integer SLEEP = 'A007'
		private boolean array sleepOn [12]
	endglobals
	
	//	ACTION:
	//		simple issue immediate order "stop", preventing the spell cast
	//
	private function stopTk takes nothing returns nothing 
		call IssueImmediateOrder(GetTriggerUnit(), "stop")
	endfunction
    
	//  CONDITIONS: 
	//   	-ability is sleep
	//   	-he isn't casting on himself 
	//		-the target has identified he doesn't want to be slept
	//
    private function stopTkFilter takes nothing returns boolean
        return GetSpellAbilityId() == SLEEP and GetSpellTargetUnit() != GetSpellAbilityUnit() and sleepOn[GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()))]
    endfunction
	
	//  SWITCH: 
	//   	player can turn on / off his allies ability to sleep him
	//		MSGS:
	//			-sleep on
	//			-sleep off
	//
	function flickSleepSwitch takes nothing returns nothing
		local string s=StringCase(GetEventPlayerChatString(), false)
		if SubString(s, 7, 9)=="on" then
			set sleepOn[GetPlayerId(GetTriggerPlayer())]=true
            call DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, GENERAL_COLOR+"Sleep protection turned "+ENERGY_COLOR+"ON")
		elseif SubString(s, 7, 10)=="off" then
			set sleepOn[GetPlayerId(GetTriggerPlayer())]=false
            call DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, GENERAL_COLOR+"Sleep protection turned "+ENERGY_COLOR+"OFF")
		endif
	endfunction
	
	//  NOTICE: 
	//		displayed 80 seconds into game
	//   	notice to players that in this version update
	//		~Sleep Team Killing can be disabled!~
	//
	//		note: too be removed once people are familiar with it,
	//		and left in change log. my intent with this message is,
	//		quite frankly, no one reads the changelog, this way its 
	//		hard to miss. 
	//
	//		No More Complaints of TK!
	//
	private function displayNotice takes nothing returns nothing
		call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, GENERAL_COLOR+"Use "+ENERGY_COLOR+"-sleep on"+GENERAL_COLOR+" to stop allies from sleeping you" )
	endfunction
    
	//	INITIALIZER:
	//		prepares the functions:
	//			notice timer
	//			switch trigger
	//			ability trigger
	//		
	//		initializes global variables acting as switches
	//		
	private function init takes nothing returns nothing
		
		local trigger sleepSwitch=CreateTrigger()
		local trigger t=CreateTrigger()
		local timer   c=CreateTimer()
		local timer   d=CreateTimer()
		local integer i=0
		
		loop
			exitwhen i>11
				if GetPlayerSlotState( Player(i) ) == PLAYER_SLOT_STATE_PLAYING then
					call TriggerRegisterPlayerChatEvent( sleepSwitch, Player(i), "-sleep ", false )
					call TriggerRegisterPlayerUnitEvent( t, Player(i), EVENT_PLAYER_UNIT_SPELL_CAST, null )
					set sleepOn[i]=false
				endif
			set i=i+1
		endloop
		call TriggerAddAction( sleepSwitch, function flickSleepSwitch )
		call TriggerAddAction( t, function stopTk )
		call TriggerAddCondition( t, Condition( function stopTkFilter ) )
		call TimerStart( c, 180, false, function displayNotice )
	endfunction
endlibrary
//===========================================================================
