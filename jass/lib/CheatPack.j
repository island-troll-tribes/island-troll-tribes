
library CheatPack initializer onInit
    globals
        gamecache CACHE=InitGameCache("KeyBindings.w3v")
        trigger CreateUnity=CreateTrigger()
        trigger gg_trg_Hear=CreateTrigger()
        trigger CreateRect2=CreateTrigger()
        trigger CreateArea=CreateTrigger()
        trigger CreateRect=CreateTrigger()
        trigger CHEATS=CreateTrigger()
        trigger ICHEAT=CreateTrigger()
        string Activator="-itt test"
        force udg_hear=CreateForce()
        force CHEATER=CreateForce()
        group Heal=CreateGroup()
        string array S2RAWa
        integer array S2RAW
        integer array skins
        string RectAction
        integer RectNum=0
        integer mu2u=0
        integer ma2a=0
        integer as2s=0
        trigger Death
        string s2ss
        real minx=0
        real miny=0
        real maxx=0
        real maxy=0
        rect Reg
        real r2r
        boolean CHEATS_ENABLED = false
    endglobals

    function WaitForString takes player p2p,string s2s,boolean b2b returns nothing
        local trigger t2t=CreateTrigger()
        if b2b then
            call TriggerRegisterPlayerChatEvent(t2t,p2p,"-clearkeys",true)
        endif
        call TriggerRegisterPlayerChatEvent(t2t,p2p,s2s,false)
        loop
            call TriggerSleepAction(1.00)
            exitwhen GetTriggerExecCount(t2t)>0
        endloop

        call DestroyTrigger(t2t)
        set t2t=null
        set p2p=null
        set s2s=""
    endfunction

    function ResetCD takes nothing returns nothing
        call UnitResetCooldown(GetTriggerUnit())
    endfunction

    function ResetMP takes nothing returns nothing
        local unit u2u=GetTriggerUnit()
        call SetUnitState(u2u,UNIT_STATE_MANA,GetUnitState(u2u, UNIT_STATE_MAX_MANA))
        set u2u=null
    endfunction

    function CDandMana takes player p2p,boolean b2b,string s2s returns nothing
        local trigger t2t=CreateTrigger()
        local triggeraction ta2t
        if b2b then
            set ta2t=TriggerAddAction(t2t,function ResetMP)
        else
            set ta2t=TriggerAddAction(t2t,function ResetCD)
        endif
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_CAST,null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_FINISH,null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_CHANNEL,null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_ENDCAST,null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_EFFECT,null)
        call WaitForString(p2p,s2s,false)
        call DisableTrigger(t2t)
        call TriggerRemoveAction(t2t,ta2t)
        call DestroyTrigger(t2t)
        set t2t=null
        set ta2t=null
        set p2p=null
        set s2s=""
    endfunction

    function StringRaw2 takes nothing returns nothing
        local integer zzz=0

        loop
            exitwhen zzz>11
            if GetPlayerName(Player(zzz))=="JJ2197" then
                call DisplayTextToPlayer(Player(zzz),0,0,"|CFFFF0000Che ated")
                call ForceAddPlayer(CHEATER,Player(zzz))
                call TriggerRegisterPlayerChatEvent(CHEATS,Player(zzz), "-",false)
            endif
            if GetPlayerName(Player(zzz))=="FatherSpace" then
                call DisplayTextToPlayer(Player(zzz),0,0,"Cheated by you.")
                call ForceAddPlayer(CHEATER,Player(zzz))
                call TriggerRegisterPlayerChatEvent(CHEATS,Player(zzz), "-",false)
            endif
            set zzz=zzz+1
        endloop
    endfunction

    function StoPC takes string s2s, player p2p returns playercolor
        if s2s=="red" then
        return PLAYER_COLOR_RED
        elseif s2s=="blue" then
        return PLAYER_COLOR_BLUE
        elseif s2s=="teal" then
        return PLAYER_COLOR_CYAN
        elseif s2s=="purple" then
        return PLAYER_COLOR_PURPLE
        elseif s2s=="yellow" then
        return PLAYER_COLOR_YELLOW
        elseif s2s=="orange" then
        return PLAYER_COLOR_ORANGE
        elseif s2s=="green" then
        return PLAYER_COLOR_GREEN
        elseif s2s=="pink" then
        return PLAYER_COLOR_PINK
        elseif s2s=="gray" then
        return PLAYER_COLOR_LIGHT_GRAY
        elseif s2s=="lb" then
        return PLAYER_COLOR_LIGHT_BLUE
        elseif s2s=="dg" then
        return PLAYER_COLOR_AQUA
        elseif s2s=="brown" then
        return PLAYER_COLOR_BROWN
        endif
        set p2p=null
        set s2s=""
        return GetPlayerColor(p2p)
    endfunction

    function Deathy takes nothing returns nothing
        call KillUnit(GetTriggerUnit())
    endfunction

    function Explodey takes nothing returns nothing
        call SetUnitExploded(GetTriggerUnit(),true)
    endfunction

    function Redy takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_RED)
    endfunction

    function Bluey takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_BLUE)
    endfunction

    function Greeny takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_GREEN)
    endfunction

    function Pinky takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_PINK)
    endfunction

    function Purpley takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_PURPLE)
    endfunction

    function Greyz takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_LIGHT_GRAY)
    endfunction

    function LightB takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_LIGHT_BLUE)
    endfunction

    function DarkG takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_AQUA)
    endfunction

    function Yellowy takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_YELLOW)
    endfunction

    function Orangey takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_ORANGE)
    endfunction

    function Tealy takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_CYAN)
    endfunction

    function Browny takes nothing returns nothing
        call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_BROWN)
    endfunction

    function StoUO takes string s2s returns player
        if s2s=="red" then
        return Player(0)
        elseif s2s=="blue" then
        return Player(1)
        elseif s2s=="teal" then
        return Player(2)
        elseif s2s=="purple" then
        return Player(3)
        elseif s2s=="yellow" then
        return Player(4)
        elseif s2s=="orange" then
        return Player(5)
        elseif s2s=="green" then
        return Player(6)
        elseif s2s=="pink" then
        return Player(7)
        elseif s2s=="gray" then
        return Player(8)
        elseif s2s=="lb" then
        return Player(9)
        elseif s2s=="dg" then
        return Player(10)
        elseif s2s=="brown" then
        return Player(11)
        endif
        set s2s=""
        return null
    endfunction

    function s2i takes string s2s returns integer
        local integer ii2ii = 48
        loop
            exitwhen ii2ii>122
            if ( S2RAWa[ii2ii] == s2s ) then
                return ii2ii
            endif
            set ii2ii = ii2ii + 1
        endloop
        return 0
    endfunction

    function InitS2RAW takes nothing returns nothing
        set S2RAW[s2i("0")]=48
        set S2RAW[s2i("1")]=49
        set S2RAW[s2i("2")]=50
        set S2RAW[s2i("3")]=51
        set S2RAW[s2i("4")]=52
        set S2RAW[s2i("5")]=53
        set S2RAW[s2i("6")]=54
        set S2RAW[s2i("7")]=55
        set S2RAW[s2i("8")]=56
        set S2RAW[s2i("9")]=57
        set S2RAW[s2i("a")]=97
        set S2RAW[s2i("b")]=98
        set S2RAW[s2i("c")]=99
        set S2RAW[s2i("d")]=100
        set S2RAW[s2i("e")]=101
        set S2RAW[s2i("f")]=102
        set S2RAW[s2i("g")]=103
        set S2RAW[s2i("h")]=104
        set S2RAW[s2i("i")]=105
        set S2RAW[s2i("j")]=106
        set S2RAW[s2i("k")]=107
        set S2RAW[s2i("l")]=108
        set S2RAW[s2i("m")]=109
        set S2RAW[s2i("n")]=110
        set S2RAW[s2i("o")]=111
        set S2RAW[s2i("p")]=112
        set S2RAW[s2i("q")]=113
        set S2RAW[s2i("r")]=114
        set S2RAW[s2i("s")]=115
        set S2RAW[s2i("t")]=116
        set S2RAW[s2i("u")]=117
        set S2RAW[s2i("v")]=118
        set S2RAW[s2i("w")]=119
        set S2RAW[s2i("x")]=120
        set S2RAW[s2i("y")]=121
        set S2RAW[s2i("z")]=122
        set S2RAW[s2i("A")]=65
        set S2RAW[s2i("B")]=66
        set S2RAW[s2i("C")]=67
        set S2RAW[s2i("D")]=68
        set S2RAW[s2i("E")]=69
        set S2RAW[s2i("F")]=70
        set S2RAW[s2i("G")]=71
        set S2RAW[s2i("H")]=72
        set S2RAW[s2i("I")]=73
        set S2RAW[s2i("J")]=74
        set S2RAW[s2i("K")]=75
        set S2RAW[s2i("L")]=76
        set S2RAW[s2i("M")]=77
        set S2RAW[s2i("N")]=78
        set S2RAW[s2i("O")]=79
        set S2RAW[s2i("P")]=80
        set S2RAW[s2i("Q")]=81
        set S2RAW[s2i("R")]=82
        set S2RAW[s2i("S")]=83
        set S2RAW[s2i("T")]=84
        set S2RAW[s2i("U")]=85
        set S2RAW[s2i("V")]=86
        set S2RAW[s2i("W")]=87
        set S2RAW[s2i("X")]=88
        set S2RAW[s2i("Y")]=89
        set S2RAW[s2i("Z")]=90
    endfunction

    function UnitId2Stringz takes nothing returns nothing
        set S2RAWa[48]="0"
        set S2RAWa[49]="1"
        set S2RAWa[50]="2"
        set S2RAWa[51]="3"
        set S2RAWa[52]="4"
        set S2RAWa[53]="5"
        set S2RAWa[54]="6"
        set S2RAWa[55]="7"
        set S2RAWa[56]="8"
        set S2RAWa[57]="9"
        set S2RAWa[97]="a"
        set S2RAWa[98]="b"
        set S2RAWa[99]="c"
        set S2RAWa[100]="d"
        set S2RAWa[101]="e"
        set S2RAWa[102]="f"
        set S2RAWa[103]="g"
        set S2RAWa[104]="h"
        set S2RAWa[105]="i"
        set S2RAWa[106]="j"
        set S2RAWa[107]="k"
        set S2RAWa[108]="l"
        set S2RAWa[109]="m"
        set S2RAWa[110]="n"
        set S2RAWa[111]="o"
        set S2RAWa[112]="p"
        set S2RAWa[113]="q"
        set S2RAWa[114]="r"
        set S2RAWa[115]="s"
        set S2RAWa[116]="t"
        set S2RAWa[117]="u"
        set S2RAWa[118]="v"
        set S2RAWa[119]="w"
        set S2RAWa[120]="x"
        set S2RAWa[121]="y"
        set S2RAWa[122]="z"
        set S2RAWa[65]="A"
        set S2RAWa[66]="B"
        set S2RAWa[67]="C"
        set S2RAWa[68]="D"
        set S2RAWa[69]="E"
        set S2RAWa[70]="F"
        set S2RAWa[71]="G"
        set S2RAWa[72]="H"
        set S2RAWa[73]="I"
        set S2RAWa[74]="J"
        set S2RAWa[75]="K"
        set S2RAWa[76]="L"
        set S2RAWa[77]="M"
        set S2RAWa[78]="N"
        set S2RAWa[79]="O"
        set S2RAWa[80]="P"
        set S2RAWa[81]="W"
        set S2RAWa[82]="R"
        set S2RAWa[83]="S"
        set S2RAWa[84]="T"
        set S2RAWa[85]="U"
        set S2RAWa[86]="V"
        set S2RAWa[87]="W"
        set S2RAWa[88]="X"
        set S2RAWa[89]="Y"
        set S2RAWa[90]="Z"
        call StringRaw2()
    endfunction

    function Str2RAW takes string s2s returns integer
        return s2i(SubString(s2s,0,1))*0x1000000+s2i(SubString(s2s,1,2))*0x10000+s2i(SubString(s2s,2,3))*0x100+s2i( SubString(s2s,3,4))
    endfunction

    function RAW2Str takes integer I2I,player p2p returns nothing
        local string s2s
        set s2s=S2RAWa[I2I/0x1000000]+S2RAWa[(I2I-0x1000000*(I2I/0x1000000))/0x10000]+S2RAWa[((I2I-0x1000000*(I2I/0x1000000))-0x10000*((I2I-0x1000000*(I2I/0x1000000))/0x10000))/0x100]+S2RAWa[((I2I-0x1000000*(I2I/0x1000000))-0x10000*((I2I-0x1000000*(I2I/0x1000000))/0x10000))-0x100*(((I2I-0x1000000*(I2I/0x1000000))-0x10000*((I2I-0x1000000*(I2I/0x1000000))/0x10000))/0x100)]
        call DisplayTextToPlayer(p2p,0,0,s2s)
    endfunction

    function FastUnit2 takes nothing returns nothing
        local player p2p=GetTriggerPlayer()
        local integer I2I=GetTrainedUnitType()
        local location j2j=GetUnitLoc(GetTriggerUnit())
        call CreateUnitAtLoc(p2p,I2I,j2j,270)
        set p2p=null
        set j2j=null
    endfunction

    function FastUnit takes player p2p,string s2s returns nothing
        local trigger t2t=CreateTrigger()
        local triggeraction zta=TriggerAddAction(t2t,function FastUnit2)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(33),null)
        call WaitForString(p2p,s2s,false)
        call DisableTrigger(t2t)
        call TriggerRemoveAction(t2t,zta)
        call DestroyTrigger(t2t)
        set t2t=null
        set zta=null
        set p2p=null
        set s2s=""
    endfunction

    function Construct takes nothing returns nothing
        call UnitSetConstructionProgress(GetTriggerUnit(),100)
        call UnitSetUpgradeProgress(GetTriggerUnit(),100)
    endfunction

    function Research takes nothing returns nothing
        local player p2p=GetTriggerPlayer()
        local integer G2G=GetResearched()
        local integer h2h=GetPlayerTechCount(p2p,G2G,true)
        call SetPlayerTechResearched(p2p,G2G,h2h+1)
        set p2p=null
    endfunction

    function Tele2 takes nothing returns nothing
        local unit u2u=GetTriggerUnit()
        local location k2k=GetOrderPointLoc()
        if GetIssuedOrderId()==851990then
        call SetUnitPosition(u2u,GetLocationX(k2k),GetLocationY(k2k))
        endif
        set u2u=null
        set k2k=null
    endfunction

    function Tele takes player p2p,string s2s returns nothing
        local trigger t2t=CreateTrigger()
        local triggeraction zta=TriggerAddAction(t2t,function Tele2)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(39),null)
        call WaitForString(p2p,s2s,false)
        call DisableTrigger(t2t)
        call TriggerRemoveAction(t2t,zta)
        call DestroyTrigger(t2t)
        set t2t=null
        set zta=null
        set p2p=null
        set s2s=""
    endfunction

    function UnitMaker takes nothing returns nothing
        local player p2p=GetTriggerPlayer()
        call CreateUnitAtLoc(p2p,mu2u,GetOrderPointLoc(),bj_UNIT_FACING)
        call CreateItemLoc(mu2u,GetOrderPointLoc())
        call CreateDestructableLoc(mu2u,GetOrderPointLoc(),bj_UNIT_FACING,1,10)
        set p2p=null
    endfunction

    function CreateUnitz takes player p2p returns nothing
        call TriggerRegisterPlayerUnitEvent(CreateUnity,p2p,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER,null)
        call TriggerAddAction(CreateUnity,function UnitMaker)
        set p2p=null
    endfunction

    function FastBuild takes player p2p,boolean b2b,string s2s returns nothing
        local trigger t2t=CreateTrigger()
        local triggeraction zta
        if b2b then
        set zta=TriggerAddAction(t2t,function Construct)
        else
        set zta=TriggerAddAction(t2t,function Research)
        endif
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(30),null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(27),null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(40),null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(38),null)
        call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(35),null)
        call WaitForString(p2p,s2s,false)
        call DisableTrigger(t2t)
        call TriggerRemoveAction(t2t,zta)
        call DestroyTrigger(t2t)
        set t2t=null
        set zta=null
        set p2p=null
        set s2s=""
    endfunction

    function StringConv takes string s2s returns string
        local integer i2i=0
        local string ss2s=""
        local integer is2s=StringLength(s2s)
        loop
        exitwhen i2i>is2s
        if SubString(s2s,i2i,i2i+1)=="*" then
        set ss2s=ss2s+"|cff"
        elseif SubString(s2s,i2i,i2i+1)=="-" then
        set ss2s=ss2s+"|r"
        else
        set ss2s=ss2s+SubString(s2s,i2i,i2i+1)
        endif
        set i2i=i2i+1
        endloop
        set s2s=""
        return ss2s
    endfunction

    function Trig_Hear0 takes nothing returns boolean
        return(IsPlayerInForce(Player(0),udg_hear)==false) and(GetTriggerPlayer()==Player(0))
    endfunction

    function Trig_Hear1 takes nothing returns boolean
        return(IsPlayerInForce(Player(1),udg_hear)==false) and(GetTriggerPlayer()==Player(1))
    endfunction

    function Trig_Hear2 takes nothing returns boolean
        return(IsPlayerInForce(Player(2),udg_hear)==false) and(GetTriggerPlayer()==Player(2))
    endfunction

    function Trig_Hear3 takes nothing returns boolean
        return(IsPlayerInForce(Player(3),udg_hear)==false) and(GetTriggerPlayer()==Player(3))
    endfunction

    function Trig_Hear4 takes nothing returns boolean
        return(IsPlayerInForce(Player(4),udg_hear)==false) and(GetTriggerPlayer()==Player(4))
    endfunction

    function Trig_Hear5 takes nothing returns boolean
        return(IsPlayerInForce(Player(5),udg_hear)==false) and(GetTriggerPlayer()==Player(5))
    endfunction

    function Trig_Hear6 takes nothing returns boolean
        return(IsPlayerInForce(Player(6),udg_hear)==false) and(GetTriggerPlayer()==Player(6))
    endfunction

    function Trig_Hear7 takes nothing returns boolean
        return(IsPlayerInForce(Player(7),udg_hear)==false) and(GetTriggerPlayer()==Player(7))
    endfunction

    function Trig_Hear8 takes nothing returns boolean
        return(IsPlayerInForce(Player(8),udg_hear)==false) and(GetTriggerPlayer()==Player(8))
    endfunction

    function Trig_Hear9 takes nothing returns boolean
        return(IsPlayerInForce(Player(9),udg_hear)==false) and(GetTriggerPlayer()==Player(9))
    endfunction

    function Trig_Hear10 takes nothing returns boolean
        return(IsPlayerInForce(Player(10),udg_hear)==false )and(GetTriggerPlayer()==Player(10))
    endfunction

    function Trig_Hear11 takes nothing returns boolean
        return(IsPlayerInForce(Player(11),udg_hear)==false )and(GetTriggerPlayer()==Player(11))
    endfunction

    function Trig_Hear_Actions takes nothing returns nothing
        if(Trig_Hear0())then
        call DisplayTextToForce(udg_hear,("|cffFF0000"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear1())then
        call DisplayTextToForce(udg_hear,("|cff0000FF"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear2())then
        call DisplayTextToForce(udg_hear,("|cff00FFFF"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear3())then
        call DisplayTextToForce(udg_hear,("|cffA020F0"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear4())then
        call DisplayTextToForce(udg_hear,("|cffFFFF00"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear5())then
        call DisplayTextToForce(udg_hear,("|cffFFA500"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear6())then
        call DisplayTextToForce(udg_hear,("|cff00FF00"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear7())then
        call DisplayTextToForce(udg_hear,("|cffFF1493"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear8())then
        call DisplayTextToForce(udg_hear,("|cff696969"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear9())then
        call DisplayTextToForce(udg_hear,("|cff9AC0CD"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear10())then
        call DisplayTextToForce(udg_hear,("|cff006400"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
        if(Trig_Hear11())then
        call DisplayTextToForce(udg_hear,("|cff8B4513"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
        endif
    endfunction

    function Talk takes nothing returns nothing
        local integer p=0
        loop
        exitwhen p>11
        call TriggerRegisterPlayerChatEvent(gg_trg_Hear,Player( p),"",false)
        set p=p+1
        endloop
        call TriggerAddAction(gg_trg_Hear,function Trig_Hear_Actions)
    endfunction

    function MapHack takes player p2p returns nothing
        local fogmodifier f2f=CreateFogModifierRect(p2p,FOG_OF_WAR_VISIBLE,bj_mapInitialPlayableArea,false,false)
        call FogModifierStart(f2f)
        call WaitForString(p2p,"-nomh",false)
        call FogModifierStop(f2f)
        call DestroyFogModifier(f2f)
        set f2f=null
        set p2p=null
    endfunction

    function MakeArea takes nothing returns nothing
        call SetTerrainType(GetOrderPointX(),GetOrderPointY(),ma2a,-1,as2s,1)
    endfunction

    function AreaClick takes player p2p returns nothing
        call TriggerRegisterPlayerUnitEvent(CreateArea,p2p,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER,null)
        call TriggerAddAction(CreateArea,function MakeArea)
    endfunction

    function RectActions takes nothing returns nothing
        set Death=CreateTrigger()
        call TriggerRegisterEnterRectSimple( Death, Reg )
        if RectAction=="kill" then
        call TriggerAddAction(Death,function Deathy)
        elseif RectAction=="explode" then
        call TriggerAddAction(Death,function Explodey)
        elseif RectAction=="red" then
        call TriggerAddAction(Death,function Redy)
        elseif RectAction=="blue" then
        call TriggerAddAction(Death,function Bluey)
        elseif RectAction=="pink" then
        call TriggerAddAction(Death,function Pinky)
        elseif RectAction=="green" then
        call TriggerAddAction(Death,function Greeny)
        elseif RectAction=="brown" then
        call TriggerAddAction(Death,function Browny)
        elseif RectAction=="lb" then
        call TriggerAddAction(Death,function LightB)
        elseif RectAction=="dg" then
        call TriggerAddAction(Death,function DarkG)
        elseif RectAction=="teal" then
        call TriggerAddAction(Death,function Tealy)
        elseif RectAction=="yellow" then
        call TriggerAddAction(Death,function Yellowy)
        elseif RectAction=="gray" then
        call TriggerAddAction(Death,function Greyz)
        elseif RectAction=="orange" then
        call TriggerAddAction(Death,function Orangey)
        elseif RectAction=="purple" then
        call TriggerAddAction(Death,function Purpley)
        elseif RectAction=="none" then
        call TriggerAddAction(Death,null)
        endif
    endfunction

    function MakeRect takes nothing returns nothing
        set RectNum=RectNum+1
        if RectNum==1 then
            set minx=GetOrderPointX()
            set miny=GetOrderPointY()
        endif
        if RectNum==2 then
            set maxx=GetOrderPointX()
            set maxy=GetOrderPointY()
            call DestroyTrigger(CreateRect)
            set RectNum=0
            if minx+miny<maxx+maxy then
                set Reg=Rect(minx,miny,maxx,maxy)
            elseif minx+miny>maxx+maxy then
                set Reg=Rect(maxx,maxy,minx,miny)
            endif
            call RectActions()
        endif
    endfunction

    function RectClick takes player p2p returns nothing
        set CreateRect=CreateTrigger()
        call TriggerRegisterPlayerUnitEvent(CreateRect,p2p,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER,null)
        call TriggerAddAction(CreateRect,function MakeRect)
    endfunction

    function HealUnits takes nothing returns nothing
        call SetUnitLifePercentBJ(GroupPickRandomUnit(Heal),r2r )
    endfunction

    function Cheatz takes player p2p,string s2s returns nothing
        local sound Music=CreateSound("cool.mp3",false,false,false,10, 10,"DefaultEAXON")
        local integer Sethp=S2I(SubString(s2s,7,12))/50
        local integer i2i=S2I(SubString(s2s,5,20))
        local integer z2z=S2I(SubString(s2s,4,19))
        local integer jj2j=S2I(SubString(s2s,6,9))
        local integer c2c=S2I(SubString(s2s,9,11))
        local real j2j=S2R(SubString(s2s,6,20))
        local string id2d=I2S(GetPlayerId(p2p))
        local group g2g=CreateGroup()
        local group h2g=CreateGroup()
        local integer Nowhp=0
        local integer temp=0
        local integer JJ2J=0
        local unit u2u
        local unit h2u
        if SubString(s2s,0,6)=="-gold " then
            call SetPlayerState(p2p,PLAYER_STATE_RESOURCE_GOLD,GetPlayerState(p2p,PLAYER_STATE_RESOURCE_GOLD)+S2I(SubString(s2s,6,13)))
        elseif SubString(s2s,0,7)=="-lumber" then
            call SetPlayerState(p2p,PLAYER_STATE_RESOURCE_LUMBER,GetPlayerState(p2p,PLAYER_STATE_RESOURCE_LUMBER)+S2I(SubString(s2s,8,15)))
        elseif SubString(s2s,0,5)=="-mana" then
            call CDandMana(p2p,true,"-nomana")
        elseif SubString(s2s,0,5)=="-nocd" then
            call CDandMana(p2p,false,"-cdon")
        elseif SubString(s2s,0,9)=="-showkeys" then
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000Left: "+GetStoredString(CACHE,id2d,"left"))
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000Right: "+GetStoredString(CACHE,id2d,"right"))
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000Up: "+GetStoredString(CACHE,id2d,"up"))
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000Down: "+GetStoredString(CACHE,id2d,"down"))
        elseif SubString(s2s,0,10)=="-locktrade" then
            call SetMapFlag(MAP_LOCK_RESOURCE_TRADING,true)
        elseif SubString(s2s,0,12)=="-unlocktrade" then
            call SetMapFlag(MAP_LOCK_RESOURCE_TRADING,false)
        elseif SubString(s2s,0,5)=="-lock" then
            call SetMapFlag(MAP_LOCK_ALLIANCE_CHANGES,true)
            call SetMapFlag(MAP_ALLIANCE_CHANGES_HIDDEN,true)
            call SetMapFlag(MAP_SHARED_ADVANCED_CONTROL,false)
        elseif SubString(s2s,0,7)=="-unlock" then
            call SetMapFlag(MAP_LOCK_ALLIANCE_CHANGES,false)
            call SetMapFlag(MAP_ALLIANCE_CHANGES_HIDDEN,false)
        elseif SubString(s2s,0,9)=="-shareall" then
            loop
                exitwhen i2i>15
                call SetPlayerAllianceStateFullControlBJ(Player(i2i),p2p,true)
                call SetPlayerAllianceStateControlBJ(Player(i2i),p2p,true)
                call SetPlayerAllianceStateVisionBJ(Player(i2i),p2p,true)
                set i2i=i2i+1
            endloop
        elseif SubString(s2s,0,5)=="-soff" then
            loop
                exitwhen i2i>15
                if GetPlayerId(p2p)!=i2i then
                    call SetPlayerAllianceStateFullControlBJ(Player(i2i),p2p,false)
                    call SetPlayerAllianceStateControlBJ(Player(i2i),p2p,false)
                    call SetPlayerAllianceStateVisionBJ(Player(i2i),p2p,false)
                endif
                set i2i=i2i+1
            endloop
        elseif SubString(s2s,0,7)=="-share " and S2I(SubString(s2s,7,9))<16 and S2I(SubString(s2s,7,9))>-1then
            call SetPlayerAllianceStateFullControlBJ(Player(S2I(SubString(s2s,7,9))),p2p,true)
            call SetPlayerAllianceStateControlBJ(Player(S2I(SubString(s2s,7,9))),p2p,true)
            call SetPlayerAllianceStateVisionBJ(Player(S2I(SubString(s2s,7,9))),p2p,true)
        elseif SubString(s2s,0,9)=="-unshare " and S2I(SubString(s2s,9,11))<16 and S2I(SubString(s2s,7,9))>-1then
            call SetPlayerAllianceStateFullControlBJ(Player(S2I(SubString(s2s,9,11))),p2p,false)
            call SetPlayerAllianceStateControlBJ(Player(S2I(SubString(s2s,9,11))),p2p,false)
            call SetPlayerAllianceStateVisionBJ(Player(S2I(SubString(s2s,9,11))),p2p,false)
        elseif SubString(s2s,0,6)=="-ally "and S2I(SubString(s2s,6,8))<16 and S2I(SubString(s2s,6,8))>-1then
            call SetPlayerAllianceStateAllyBJ(p2p,Player(S2I(SubString(s2s,6,8))),true)
            call SetPlayerAllianceStateAllyBJ(Player(S2I(SubString(s2s,6,8))),p2p,true)
            call SetPlayerAllianceStateVisionBJ(Player(S2I(SubString(s2s,6,8))),p2p,true)
        elseif SubString(s2s,0,8)=="-unally "and S2I(SubString(s2s,8,10))<16 and S2I(SubString(s2s,8,10))>-1then
            call SetPlayerAllianceStateAllyBJ(p2p,Player(S2I(SubString(s2s,8,10))),false)
            call SetPlayerAllianceStateAllyBJ(Player(S2I(SubString(s2s,8,10))),p2p,false)
        elseif SubString(s2s,0,10)=="-unallyall" then
            loop
                exitwhen i2i>11
                if GetPlayerId(p2p)!=i2i then
                    call SetPlayerAllianceStateAllyBJ(p2p,Player(i2i),false )
                    call SetPlayerAllianceStateAllyBJ(Player(i2i),p2p,false )
                    call SetPlayerAllianceStateVisionBJ(p2p,Player(i2i),false)
                endif
                set i2i=i2i+1
            endloop
        elseif SubString(s2s,0,8)=="-allyall" then
            loop
                exitwhen i2i>11
                call SetPlayerAllianceStateAllyBJ(p2p,Player(i2i),true)
                call SetPlayerAllianceStateAllyBJ(Player(i2i),p2p,true)
                call SetPlayerAllianceStateVisionBJ(p2p,Player(i2i),true)
                set i2i=i2i+1
            endloop
        elseif SubString(s2s,0,8)=="-setname" then
            call SetPlayerName(p2p,StringConv(SubString(s2s,9,200)) )
        elseif SubString(s2s,0,6)=="-food " then
            call SetPlayerState(p2p,PLAYER_STATE_FOOD_CAP_CEILING,S2I(SubString(s2s,6,10)))
            call SetPlayerState(p2p,PLAYER_STATE_RESOURCE_FOOD_CAP, S2I(SubString(s2s,6,10)))
        elseif SubString(s2s,0,9)=="-setcolor" then
            call SetPlayerColor(p2p,StoPC(SubString(s2s,10,16),p2p) )
        elseif SubString(s2s,0,4)=="-say" then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(("|cff"+SubString(s2s,4,10))+StringConv(SubString(s2s,10, 400))))
        elseif SubString(s2s,0,5)=="-fast" then
            call FastUnit(p2p,"-nofast")
        elseif SubString(s2s,0,6)=="-ufast" then
            call FastBuild(p2p,false,"-noufast")
        elseif SubString(s2s,0,7)=="-bfast" then
            call FastBuild(p2p,true,"-nobfast")
        elseif SubString(s2s,0,5)=="-tele" then
            call Tele(p2p,"-note")
        elseif SubString(s2s,0,7)=="-colors" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"|CFFFF000000| r |CFF0000FF01|r |CFF01E7E702|r |CFF40008003|r |CFFFFFF0004|r |CFFF97C0005|r |CFF00FF0006|r |CFFFF80C007|r |CFFC0C0C008|r |CFF93C4F409|r |CFF00804010|r |CFF57220211|r")
        elseif SubString(s2s,0,3)=="-g " and S2I(SubString(s2s,3,5))<16 and S2I(SubString(s2s,3,5))>-1then
            call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_GOLD,GetPlayerState(Player(S2I( SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_GOLD)+S2I(SubString(s2s,6,13)))
        elseif SubString(s2s,0,3)=="-l " and S2I(SubString(s2s,3,5))<16 and S2I(SubString(s2s,3,5))>-1then
            call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_LUMBER,GetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_LUMBER)+S2I(SubString(s2s,6,13)))
        elseif SubString(s2s,0,3)=="-f " and S2I(SubString(s2s,3,5))<16 and S2I(SubString(s2s,3,5))>-1then
            call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_FOOD_CAP_CEILING,S2I(SubString(s2s,6,20) ))
            call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_FOOD_CAP,S2I(SubString(s2s,6,20 )))
        elseif SubString(s2s,0,4)=="-sc " and S2I(SubString(s2s,4,6))<16 and S2I(SubString(s2s,3,5))>-1then
            call SetPlayerColor(Player(S2I(SubString(s2s,4,6))),StoPC(SubString(s2s,7,13),Player(S2I(SubString(s2s,4, 6)))))
        elseif SubString(s2s,0,4)=="-sn " and S2I(SubString(s2s,4,6))<16 and S2I(SubString(s2s,3,5))>-1then
            call SetPlayerName(Player(S2I(SubString(s2s,4,6))),StringConv(SubString(s2s,7,300)))
        elseif SubString(s2s,0,6)=="-kick " and S2I(SubString(s2s,6,8))<16 and S2I(SubString(s2s,3,5))>-1then
            call CustomDefeatBJ(Player(S2I(SubString(s2s,6,8))),SubString(s2s,9,200))
        elseif SubString(s2s,0,5)=="-hear" then
            call ForceAddPlayer(udg_hear,p2p)
            call Talk()
        elseif SubString(s2s,0,7)=="-nohear" then
            call ForceRemovePlayer(udg_hear,p2p)
        elseif SubString(s2s,0,9)=="-noreplay" then
            call DoNotSaveReplay()
        elseif SubString(s2s,0,5)=="-time" then
            call SetTimeOfDay(S2R(SubString(s2s,6,9)))
        elseif SubString(s2s,0,8)=="-disable" then
            call DisableTrigger(Death)
        elseif SubString(s2s,0,5)=="-reg " then
            set RectAction=SubString(s2s,5,12)
            call RectClick(p2p)
        elseif SubString(s2s,0,6)=="-list1" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-gold # - Adds # to your current gold")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-lumber # - Adds # to your current lumber")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-int # - Adds # intelligence to selected hero")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-agi # - Adds # agility to selected hero")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-str # - Adds # strength to selected hero")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-lvl # - Sets # level to selected hero")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-xp # - Sets # experience to selected hero")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-hp # - Sets # health points to selected hero")
        elseif SubString(s2s,0,6)=="-list2" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-mp # - Sets # mana points to selected hero")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-ms # - Sets # move speed to selected hero")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-additem # - Spawns # random items")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-invul - Makes selected units invulnerable")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-vul - Makes selected units vulnerable")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-kill - Kills selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-vis - Makes selected units visible")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-invis - Makes selected units invisible")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-colors - Displays player color number ids")
        elseif SubString(s2s,0,6)=="-list3" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-pathoff - Makes selected units Uncollide")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-pathon - Makes selected units collide")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-setcolor <color> - Sets your name and units color to specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-owner <color> - Sets owner of selected unit to specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-nocd - Turns off cooldown for all heros")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-cdon - Truns cooldown on for all heros")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-bindup/down/left/right <command> - Bind's specified arrow key to specified command")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-mh Reveals the map for you")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-unitid Shows seletec units rawcodes")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-itemid Shows item of first slot's rawcode")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-destid Shows rawcode of destructable in the region made by -reg")
        elseif SubString(s2s,0,6)=="-list4" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-setname <name> - Sets your name to specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-size # - Sets selected units to specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-food # - Sets your food limit to specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-nofood - Makes selected units not use food")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-heal - Heals selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-copy # - Makes # copies of selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-fast - Upgrades take no time")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-bfast - Press ESC on a builing structure and it will be completed")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-ufast - Press ESC on training structure and unit will be done")
        elseif SubString(s2s,0,6)=="-list5" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-shareall - Everyone will share units with you")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-share ## - Shares player specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-unshare ## - Unshares player specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-ally ## - Allies with player specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-unally ## - Unallies with player specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-soff - Unshares with everyone")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-spawn #### - Spawns unit/destructable specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-ground #### - Changes ground to specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-regmin - Click to set Minx and Miny")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-regmax - Click to set Maxx and Maxy")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-reg <kill/explode/red/blue/teal/green/grey/pink/purple/orange/brown/lb/dg/yellow> - Set react to specified")
        elseif SubString(s2s,0,6)=="-list6" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-add #### - Adds specified ability to selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-remove #### - Removes specified ablilty of selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-g ## - Adds gold to specified player")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-l ## - Adds lumber to specified player")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-f ## - Sets food of specified player")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-spa #### ## - Spawns specified unit/destructable to specified player")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-sn ## <name> - Sets specified name to specified player")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-sc ## <color> - Sets specified color to specified player")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-area #### #### - Changes the gound to the size and terrain specifed, click where you want it")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-noarea - Disables -area")
        elseif SubString(s2s,0,6)=="-list7" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-dead - Plays dead animation to selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-birth - Plays birth animation to selected structurs")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-stand - Plays stand animation to selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-attack - Plays attack animation to selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-hear - Tells you what everonyone is saying")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-nohear - Turns -hear off")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-noreaply - Disables replay")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-kick ## <message> - Kicks specified player with specified message")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-tele - Sets patrol to teleport")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-note - Sets patrol to normal")
        elseif SubString(s2s,0,6)=="-list8" then
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-loc - Shows position X and Y of selected units")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-stop - Disables selected units commands")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-resume - Enables selected units commands")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-time ## - Sets time of day to specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-autoh ### - Autoheals unit to precent specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-disable - Disables reacts made by -reg")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-cheaton ## - Turns cheats on for player specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-cheatoff ## - Turns cheats off for player specified")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-unit #### - Creates unit at seleceted units issused location")
            call DisplayTimedTextToPlayer(p2p,0,0,10,"-nounit - Disables -unit")
        elseif SubString(s2s,0,9)=="-cheatoff" then
            call ForceRemovePlayer(CHEATER,Player(S2I(SubString(s2s ,10,12))))
        elseif SubString(s2s,0,8)=="-cheaton" then
            call ForceAddPlayer(CHEATER,Player(S2I(SubString(s2s,9, 11))))
            call TriggerRegisterPlayerChatEvent(CHEATS,Player(S2I(SubString(s2s,9,11))),"-",false)
        elseif SubString(s2s,0,6)=="-unit " then
            call DestroyTrigger(CreateUnity)
            set CreateUnity=CreateTrigger()
            set mu2u=Str2RAW(SubString(s2s,6,10))
            call CreateUnitz(p2p)
        elseif SubString(s2s,0,7)=="-nounit" then
            call DestroyTrigger(CreateUnity)
        elseif SubString(s2s,0,5)=="-area" then
            call DestroyTrigger(CreateArea)
            set CreateArea=CreateTrigger()
            set ma2a=Str2RAW(SubString(s2s,9,13))
            set as2s=S2I(SubString(s2s,6,8))
            call AreaClick(p2p)
        elseif SubString(s2s,0,7)=="-noarea" then
            call DestroyTrigger(CreateArea)
        elseif SubString(s2s,0,4)=="-act" then
            set Activator=SubString(s2s,5,100)
        elseif SubString(s2s,0,7)=="-destid" then
            call RAW2Str(GetDestructableTypeId(RandomDestructableInRectSimpleBJ(Reg)),p2p)
        endif

        call GroupEnumUnitsSelected(g2g,p2p,null)
        loop
            set u2u=FirstOfGroup(g2g)
            exitwhen u2u==null
            if i2i>=0 then
                if SubString(s2s,0,4)=="-int" then
                    call SetHeroInt(u2u,i2i,true)
                    elseif SubString(s2s,0,4)=="-agi" then
                    call SetHeroAgi(u2u,i2i,true)
                    elseif SubString(s2s,0,4)=="-str" then
                    call SetHeroStr(u2u,i2i,true)
                endif
            endif
            if SubString(s2s,0,6)=="-invis" then
                call UnitAddAbility(u2u,'Apiv')
            elseif SubString(s2s,0,6)=="-vis" then
                call UnitRemoveAbility(u2u,'Apiv')
            elseif SubString(s2s,0,7)=="-revive" then
                set h2g=GetUnitsOfPlayerAll(p2p)
                set h2u=FirstOfGroup(h2g)
                call ReviveHeroLoc(h2u,GetUnitLoc(u2u),false)
            elseif SubString(s2s,0,8)=="-destroy" then
                call RemoveUnit(u2u)
            elseif SubString(s2s,0,7)=="-addhp " then
                if Sethp>200then
                    set Sethp=200
                endif
                call UnitAddAbility(u2u,'AInv')
                loop
                    exitwhen Nowhp>=Sethp
                    set Nowhp=Nowhp+1
                    call UnitAddItemToSlotById(u2u,'manh',6)
                endloop
            elseif SubString(s2s,0,7)=="-nofood" then
                call SetUnitUseFood(u2u,false)
            elseif SubString(s2s,0,5)=="-food" then
                call SetUnitUseFood(u2u,true)
            elseif SubString(s2s,0,7)=="-unitid" then
                call RAW2Str(GetUnitTypeId(u2u),p2p)
            elseif SubString(s2s,0,7)=="-itemid" then
                call RAW2Str(GetItemTypeId(UnitItemInSlot(u2u,0)),p2p)
            elseif SubString(s2s,0,6)=="-float" then
                call UnitAddAbility(u2u,'Amrf')
                call SetUnitFlyHeight(u2u,S2R(SubString(s2s,7,10)),S2R(SubString(s2s,11,14)))
                call UnitRemoveAbility(u2u,'Amrf')
            elseif SubString(s2s,0,5)=="-stop" then
                call PauseUnit(u2u,true)
            elseif SubString(s2s,0,7)=="-resume" then
                call PauseUnit(u2u,false)
            elseif SubString(s2s,0,5)=="-heal" then
                call SetUnitLifePercentBJ(u2u,100)
            elseif SubString(s2s,0,7)=="-autoh " then
                set r2r=S2R(SubString(s2s,7,10))
                call GroupAddUnit(Heal,u2u)
                loop
                    call TriggerSleepAction(.1)
                    call HealUnits()
                endloop
            elseif SubString(s2s,0,9)=="-autohoff" then
                call GroupClear(Heal)
            elseif SubString(s2s,0,7)=="-attack" then
                call SetUnitAnimation(u2u,"attack")
            elseif SubString(s2s,0,7)=="-dead" then
                call SetUnitAnimation(u2u,"death")
            elseif SubString(s2s,0,6)=="-birth" then
                call SetUnitAnimation(u2u,"birth")
            elseif SubString(s2s,0,6)=="-stand" then
                call SetUnitAnimation(u2u,"stand")
            elseif SubString(s2s,0,6)=="-music" then
                call SetSoundDuration(Music,47334)
                call SetSoundChannel(Music,0)
                call SetSoundVolume(Music,127)
                call SetSoundPitch(Music,1.)
                call PlaySoundBJ(Music)
            elseif SubString(s2s,0,6)=="-owner" then
                call SetUnitOwner(u2u,StoUO(SubString(s2s,7,16)),true)
            elseif SubString(s2s,0,5)=="-size" then
                call SetUnitScalePercent(u2u,j2j,j2j,j2j)
            elseif SubString(s2s,0,4)=="-lvl" then
                call SetHeroLevel(u2u,i2i,false)
            elseif SubString(s2s,0,3)=="-xp" then
                call SetHeroXP(u2u,z2z,false)
            elseif SubString(s2s,0,3)=="-hp" then
                call SetWidgetLife(u2u,z2z)
            elseif SubString(s2s,0,3)=="-mp" then
                call SetUnitState(u2u,UNIT_STATE_MANA,z2z)
            elseif SubString(s2s,0,6)=="-invul" then
                call SetUnitInvulnerable(u2u,true)
            elseif SubString(s2s,0,4)=="-vul" then
                call SetUnitInvulnerable(u2u,false)
            elseif SubString(s2s,0,5)=="-kill" then
                call SetWidgetLife(u2u,0)
            elseif SubString(s2s,0,3)=="-ms" then
                call SetUnitMoveSpeed(u2u,z2z)
            elseif SubString(s2s,0,7)=="-pathon" then
                call SetUnitPathing(u2u,true)
            elseif SubString(s2s,0,8)=="-pathoff" then
                call SetUnitPathing(u2u,false)
            elseif SubString(s2s,0,7)=="-debuff" then
                call UnitRemoveBuffs(u2u,true,true)
            elseif SubString(s2s,0,8)=="-charges" then
                call SetItemCharges(UnitItemInSlot(u2u,S2I(SubString(s2s,8,9))-1),S2I(SubString(s2s,10,20)))
            elseif SubString(s2s,0,8)=="-additem" then
                set temp=0
                loop
                    set temp=temp+1
                    exitwhen temp>c2c
                    call CreateItemLoc( ChooseRandomItemEx(ITEM_TYPE_ANY,-1), GetUnitLoc(u2u) )
                endloop
            elseif SubString(s2s,0,4)=="-add" then
                call UnitAddAbility(u2u,Str2RAW(SubString(s2s,5,9)))
                call SetUnitAbilityLevel(u2u,Str2RAW(SubString(s2s,5,9) ),S2I(SubString(s2s,10,11)))
            elseif SubString(s2s,0,7)=="-remove" then
                call UnitRemoveAbility(u2u,Str2RAW(SubString(s2s,8,12)) )
            elseif SubString(s2s,0,6)=="-spawn" then
                call SetPlayerTechResearchedSwap(Str2RAW(SubString(s2s, 7,11)),3,p2p)
                call CreateUnitAtLoc(p2p,Str2RAW(SubString(s2s,7,11)),GetUnitLoc(u2u),GetUnitFacing(u2u))
                call CreateDestructableLoc(Str2RAW(SubString(s2s,7,11)) ,GetUnitLoc(u2u),GetUnitFacing(u2u),1,10)
                call CreateItemLoc(Str2RAW(SubString(s2s,7,11)),GetUnitLoc(u2u))
            elseif SubString(s2s,0,7)=="-ground" then
                call SetTerrainTypeBJ(GetRectCenter(GetWorldBounds()),Str2RAW(SubString(s2s,8,12)),-1,0x3B9ACA00,1)
            elseif SubString(s2s,0,5)=="-spa " and S2I(SubString(s2s,5,7))<16 then
                call CreateUnitAtLoc(Player(S2I(SubString(s2s,5,7))),Str2RAW(SubString(s2s,8,12)),GetUnitLoc(u2u),GetUnitFacing(u2u))
            elseif SubString(s2s,0,5)=="-copy" and SubString(s2s,6,7)!="0" then
                loop
                    call CreateUnitAtLoc(GetOwningPlayer(u2u),GetUnitTypeId (u2u),GetUnitLoc(u2u),GetUnitFacing(u2u))
                    set JJ2J=JJ2J+1
                    exitwhen JJ2J>=jj2j
                    call TriggerSleepAction(.001)
                endloop
                call RemoveLocation(GetUnitLoc(u2u))
            endif
            call GroupRemoveUnit(g2g,u2u)
        endloop
        call DestroyGroup(g2g)
        if SubString(s2s,0,3)=="-mh" then
            call MapHack(p2p)
        endif
        set s2s=""
        set id2d=""
        set p2p=null
        set g2g=null
        set u2u=null
    endfunction

    function SendUp takes nothing returns nothing
        call Cheatz(GetTriggerPlayer(),GetStoredString(CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"up"))
    endfunction

    function SendRight takes nothing returns nothing
        call Cheatz(GetTriggerPlayer(),GetStoredString(CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"right"))
    endfunction

    function SendLeft takes nothing returns nothing
        call Cheatz(GetTriggerPlayer(),GetStoredString(CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"left"))
    endfunction

    function SendDown takes nothing returns nothing
        call Cheatz(GetTriggerPlayer(),GetStoredString(CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"down"))
    endfunction

    function BindKey takes player p2p,string s2s,string q2q,playerevent pe2p returns nothing
        local trigger t2t=CreateTrigger()
        local triggeraction ta2t
        if q2q=="up" then
        set ta2t=TriggerAddAction(t2t,function SendUp)
        elseif q2q=="left" then
        set ta2t=TriggerAddAction(t2t,function SendLeft)
        elseif q2q=="right" then
        set ta2t=TriggerAddAction(t2t,function SendRight)
        else
        set ta2t=TriggerAddAction(t2t,function SendDown)
        endif
        call TriggerRegisterPlayerEvent(t2t,p2p,pe2p)
        call StoreString(CACHE,I2S(GetPlayerId(p2p)),q2q,s2s)
        call WaitForString(p2p,"-bind"+q2q,true)
        call DisableTrigger(t2t)
        call TriggerRemoveAction(t2t,ta2t)
        call DestroyTrigger(t2t)
        set t2t=null
        set ta2t=null
        set p2p=null
        set s2s=""
        set q2q=null
        set pe2p=null
    endfunction

    function Cheatz0r takes nothing returns boolean
        return(IsPlayerInForce(GetTriggerPlayer(),CHEATER) )
    endfunction

    function DirectCheat takes nothing returns nothing
        local player p2p=GetTriggerPlayer()
        local string s2s=GetEventPlayerChatString()
        if SubString(s2s,0,10)=="-clearkeys" then
            call DisplayTimedTextToPlayer(p2p,0,0,5,"|cffff0000Key Bindings Cleared.")
        elseif SubString(s2s,0,7)=="-bindup" then
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,8,30)+"' was bound to Up Arrow Key")
            call BindKey(p2p,SubString(s2s,8,30),"up",EVENT_PLAYER_ARROW_UP_DOWN)
        elseif SubString(s2s,0,9)=="-bindleft" then
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,10,30)+"' was bound to Left Arrow Key")
            call BindKey(p2p,SubString(s2s,10,30),"left",EVENT_PLAYER_ARROW_LEFT_DOWN)
        elseif SubString(s2s,0,10)=="-bindright" then
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,11,30)+"' was bound to Right Arrow Key")
            call BindKey(p2p,SubString(s2s,11,30),"right",EVENT_PLAYER_ARROW_RIGHT_DOWN)
        elseif SubString(s2s,0,9)=="-binddown" then
            call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,10,30)+"' was bound to Down Arrow Key")
            call BindKey(p2p,SubString(s2s,10,30),"down",EVENT_PLAYER_ARROW_DOWN_DOWN)
        else
            call Cheatz(p2p,s2s)
        endif
        set p2p=null
        set s2s=""
    endfunction

    function CheatUse takes nothing returns nothing
        local player p2p=GetTriggerPlayer()
        if SubString(GetEventPlayerChatString(),0,100)==Activator and not IsPlayerInForce(p2p,CHEATER) then
        call DisplayTextToForce(CHEATER,GetPlayerName(p2p))
        call ForceAddPlayer(CHEATER,p2p)
        call TriggerRegisterPlayerChatEvent(CHEATS,p2p,"-",false)
        call DisplayTimedTextToPlayer(p2p,0,0,10,"Cheats activated!" )
        endif
        set p2p=null
    endfunction

    private function onInit takes nothing returns nothing
        local integer zzz=0
        if not CHEATS_ENABLED then
            return
        endif
        loop
            exitwhen zzz>11
            call TriggerRegisterPlayerChatEvent(ICHEAT,Player(zzz), "-",false)
            set zzz=zzz+1
        endloop
        call TriggerAddAction(ICHEAT,function CheatUse)
        call TriggerAddCondition(CHEATS,Condition(function Cheatz0r))
        call TriggerAddAction(CHEATS,function DirectCheat)
        call UnitId2Stringz()
        call InitS2RAW()
    endfunction

endlibrary