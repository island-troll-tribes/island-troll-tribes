//! zinc
// Arrays cannot be constant

library Constants {

  /* Compile time constants */
  public {
    constant boolean PRIVATE_MAP = false;
  }

  /* General constants */
  public {
    constant real TIME_NOOBTIME_STARTS_AT = 46.;

    Table UNIT_TROLL_ALL;
    constant integer TROLL_BASE_CLASS  = 100;
    constant integer TROLL_SUB_CLASS   = 101;
    constant integer TROLL_SUPER_CLASS = 102;
  }

  /* Dialog button hotkey constants */
  public {
    constant integer HK_ESC=512;
    
    constant integer HK_0 = 48;
    constant integer HK_1 = 49;
    constant integer HK_2 = 50;
    constant integer HK_3 = 51;
    constant integer HK_4 = 52;
    constant integer HK_5 = 53;
    constant integer HK_6 = 54;
    constant integer HK_7 = 55;
    constant integer HK_8 = 56;
    constant integer HK_9 = 57;
    
    constant integer HK_A = 65;
    constant integer HK_B = 66;
    constant integer HK_C = 67;
    constant integer HK_D = 68;
    constant integer HK_E = 69;
    constant integer HK_F = 70;
    constant integer HK_G = 71;
    constant integer HK_H = 72;
    constant integer HK_I = 73;
    constant integer HK_J = 74;
    constant integer HK_K = 75;
    constant integer HK_L = 76;
    constant integer HK_M = 77;
    constant integer HK_N = 78;
    constant integer HK_O = 79;
    constant integer HK_P = 80;
    constant integer HK_Q = 81;
    constant integer HK_R = 82;
    constant integer HK_S = 83;
    constant integer HK_T = 84;
    constant integer HK_U = 85;
    constant integer HK_V = 86;
    constant integer HK_W = 87;
    constant integer HK_X = 88;
    constant integer HK_Y = 89;
    constant integer HK_Z = 90;
  }

  public {
    string COLOR_CODE[];

    constant string DASH            = "|cffb8860b - |r";   // DarkGoldenRod
    constant string ENERGY_COLOR    = "|cff6495ed";        // CornflowerBlue
    constant string GENERAL_COLOR   = "|cffc2e8eb";        // LightBlue
    constant string GOLD_COLOR      = "|cffffd700";        // Gold
    constant string GRAY_COLOR      = "|cffa0a0a0";        // Gray
    constant string GREEN_COLOR     = "|cff00df00";        // LimeGreen
    constant string HIGHLIGHT_COLOR = "|cffdeb887";        // BurlyWood
    constant string RED_COLOR       = "|cffff0000";        // Red
    constant string SPECIAL_COLOR   = "|cffff6347";        // Tomato
    constant string HEALTH_COLOR    = "|cffd67a7a";        // Salmon
  }

  /* Language constants */
  public {
    constant string CHANGE_LOG_NOTICE_STRING = GENERAL_COLOR+"Type "+ENERGY_COLOR+"-changelog"+GENERAL_COLOR+" to view changelog for this version";
  }

  /* InitArrays */
  function onInit () {
    COLOR_CODE[0]  = "|cffff0303";
    COLOR_CODE[1]  = "|cff0042ff";
    COLOR_CODE[2]  = "|cff1ce6b9";
    COLOR_CODE[3]  = "|cff540081";
    COLOR_CODE[4]  = "|cfffffc00";
    COLOR_CODE[5]  = "|cfffe8a0e";
    COLOR_CODE[6]  = "|cff20c000";
    COLOR_CODE[7]  = "|cffe55bb0";
    COLOR_CODE[8]  = "|cff959697";
    COLOR_CODE[9]  = "|cff7fbff1";
    COLOR_CODE[10] = "|cff106246";
    COLOR_CODE[11] = "|cff492a04";
    COLOR_CODE[12] = "|cff696969";

    UNIT_TROLL_ALL = Table.create();
    UNIT_TROLL_ALL[UNIT_HUNTER]          = TROLL_BASE_CLASS;
    UNIT_TROLL_ALL[UNIT_TRACKER]         = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_WARRIOR]         = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_JUGGERNAUT]      = TROLL_SUPER_CLASS;
    UNIT_TROLL_ALL[UNIT_BEAST_MASTER]    = TROLL_BASE_CLASS;
    UNIT_TROLL_ALL[UNIT_TRUE_FORM]       = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_CHICKEN_FORM]    = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_ULTIMATE_FORM]   = TROLL_SUPER_CLASS;
    UNIT_TROLL_ALL[UNIT_MAGE]            = TROLL_BASE_CLASS;
    UNIT_TROLL_ALL[UNIT_ELEMENTALIST]    = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_HYPNOTIST]       = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_DEMENTIA_MASTER] = TROLL_SUPER_CLASS;
    UNIT_TROLL_ALL[UNIT_PRIEST]          = TROLL_BASE_CLASS;
    UNIT_TROLL_ALL[UNIT_BOOSTER]         = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_MASTER_HEALER]   = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_SAGE]            = TROLL_SUPER_CLASS;
    UNIT_TROLL_ALL[UNIT_THIEF]           = TROLL_BASE_CLASS;
    UNIT_TROLL_ALL[UNIT_ESCAPE_ARTIST]   = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_CONTORTIONIST]   = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_ASSASSIN]        = TROLL_SUPER_CLASS;
    UNIT_TROLL_ALL[UNIT_SCOUT]           = TROLL_BASE_CLASS;
    UNIT_TROLL_ALL[UNIT_OBSERVER]        = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_RADAR_SCOUT]     = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_SPY]             = TROLL_SUPER_CLASS;
    UNIT_TROLL_ALL[UNIT_GATHERER]        = TROLL_BASE_CLASS;
    UNIT_TROLL_ALL[UNIT_RADAR_GATHERER]  = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_HERB_MASTER]     = TROLL_SUB_CLASS;
    UNIT_TROLL_ALL[UNIT_OMNIGATHERER]    = TROLL_SUPER_CLASS;
  }

}

//! endzinc