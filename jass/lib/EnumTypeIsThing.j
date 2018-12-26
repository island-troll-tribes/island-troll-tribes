library EnumTypeIsThing requires IsTypeThing
  function EnumUnitIsHunter takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HUNTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHunter1 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HUNTER_1 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTracker takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRACKER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsWarrior takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_WARRIOR and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsJuggernaut takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_JUGGERNAUT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBeastMaster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BEAST_MASTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrueForm takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRUE_FORM and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsDruid takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_DRUID and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsChickenForm takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_CHICKEN_FORM and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsUltimateForm takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ULTIMATE_FORM and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBeastMaster1 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BEAST_MASTER_1 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsShapeshifterWolf takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SHAPESHIFTER_WOLF and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsShapeshifterBear takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SHAPESHIFTER_BEAR and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsShapeshifterPanther takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SHAPESHIFTER_PANTHER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsShapeshifterTiger takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SHAPESHIFTER_TIGER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMage takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMage1 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_1 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsElementalist takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ELEMENTALIST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsElementalist1 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ELEMENTALIST_1 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHypnotist takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HYPNOTIST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsDementiaMaster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_DEMENTIA_MASTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsPriest takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_PRIEST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBooster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BOOSTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBooster1 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BOOSTER_1 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMasterHealer takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MASTER_HEALER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSage takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SAGE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsThief takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_THIEF and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsEscapeArtist takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ESCAPE_ARTIST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsContortionist takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_CONTORTIONIST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAssassin takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ASSASSIN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsScout takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SCOUT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsObserver takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_OBSERVER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsRadarScout takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_RADAR_SCOUT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSpy takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SPY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsGatherer takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_GATHERER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsRadarGatherer takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_RADAR_GATHERER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHerbMaster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HERB_MASTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsOmnigatherer takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_OMNIGATHERER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsRepickTroll takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_REPICK_TROLL and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsDrunkenTroll takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_DRUNKEN_TROLL and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollBrawler takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_BRAWLER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollBrewmaster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_BREWMASTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsIslandTroll takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ISLAND_TROLL and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHeadHunter takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HEAD_HUNTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsArcherIntrepide takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ARCHER_INTREPIDE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMirrorTroll takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MIRROR_TROLL and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMirrorTrollClone takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MIRROR_TROLL_CLONE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsNecromancer takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_NECROMANCER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsShaman takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SHAMAN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsShadowArcher takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SHADOW_ARCHER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsShadowHunter takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SHADOW_HUNTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSpiritWalker takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SPIRIT_WALKER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrackerTourny2011 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRACKER_TOURNY_2011 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrickster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRICKSTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollConartist takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_CONARTIST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollMageAlt takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_MAGE_ALT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollWitchDoctor takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_WITCH_DOCTOR and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsEaTourny2011 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_EA_TOURNY_2011 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAligatorMan takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ALIGATOR_MAN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAncientHydra takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ANCIENT_HYDRA and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsDiscoDuck takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_DISCO_DUCK and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLesserHydra takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LESSER_HYDRA and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMagentaFish takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MAGENTA_FISH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMammoth takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MAMMOTH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsOne takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ONE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsRapidTurtle takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_RAPID_TURTLE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAdultElk takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ADULT_ELK and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAdultJungleBear takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ADULT_JUNGLE_BEAR and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAdultJungleWolf takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ADULT_JUNGLE_WOLF and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAlphaHawk takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ALPHA_HAWK and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBronzeDragon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BRONZE_DRAGON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBronzeDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BRONZE_DRAGON_HATCHLING and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBearCub takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BEAR_CUB and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsElderPanther takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ELDER_PANTHER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsElk takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ELK and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsElkAdolescent takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ELK_ADOLESCENT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsFawn takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_FAWN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsFish takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_FISH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsForestDragon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_FOREST_DRAGON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsForestDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_FOREST_DRAGON_HATCHLING and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsGreaterBronzeDragon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_GREATER_BRONZE_DRAGON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsGreaterForestDragon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_GREATER_FOREST_DRAGON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsGreaterNetherDragon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_GREATER_NETHER_DRAGON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsGreaterRedDragon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_GREATER_RED_DRAGON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsGreenFish takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_GREEN_FISH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHawk takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HAWK and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHawkAdolescent takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HAWK_ADOLESCENT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHawkHatchling takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HAWK_HATCHLING and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsJungleBear takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_JUNGLE_BEAR and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsJungleWolf takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_JUNGLE_WOLF and GetWidgetLife(GetEnumUnit()) > 0
  endfunction

  function EnumUnitIsNetherDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_NETHER_DRAGON_HATCHLING and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsPanther takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_PANTHER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsRedDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_RED_DRAGON_HATCHLING and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSnake takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SNAKE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsWolfPup takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_WOLF_PUP and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsArmory takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ARMORY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBuildingTree takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BUILDING_TREE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsFire takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_FIRE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsDefenseWard takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_DEFENSE_WARD and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsEnsnareTrap takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ENSNARE_TRAP and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHatchery takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HATCHERY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMageFire takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMageFireSummoned takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE_SUMMONED and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsPot takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_POT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMudHut takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MUD_HUT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsOmnitower takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_OMNITOWER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSmokeHouse takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SMOKE_HOUSE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSpiritWard takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SPIRIT_WARD and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsStorageHut takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_STORAGE_HUT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTannery takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TANNERY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTeleportationBeacon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TELEPORTATION_BEACON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTent takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TENT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollBurrow takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_BURROW and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollHut takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_HUT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollTotem takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_TOTEM and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollTransportShip takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_TRANSPORT_SHIP and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsWitchDoctorsHit takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_WITCH_DOCTORS_HUT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsWorkshop takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_WORKSHOP and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsPowerGenerator takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_POWER_GENERATOR and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBlueHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BLUE_HERB_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHaisetsuBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HAISETSU_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHiddenStash takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HIDDEN_STASH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMushroomColony takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MUSHROOM_COLONY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsOrangeHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ORANGE_HERB_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsPurpleHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_PURPLE_HERB_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsScoutsBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SCOUTS_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsThiefsBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_THIEFS_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsThistleShrub takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_THISTLE_SHRUB and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsWaterHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_WATER_HERB_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsYellowHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_YELLOW_HERB_BUSH and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsCraftMaster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_CRAFT_MASTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsOminousAltar takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_OMINOUS_ALTAR and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTradeShip1 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRADE_SHIP_1 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTradeShip2 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRADE_SHIP_2 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTradeShip3 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRADE_SHIP_3 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTradeShip4 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRADE_SHIP_4 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTradeShip5 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRADE_SHIP_5 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTradeShip6 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRADE_SHIP_6 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTrollMerchant takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_MERCHANT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBlurImage takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BLUR_IMAGE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBee takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BEE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBeeHive takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BEE_HIVE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsBeeHiveSummoned takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_BEE_HIVE_SUMMONED and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsDiseaseCloud takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_DISEASE_CLOUD and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsDummy takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_DUMMY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsAmhsDummy takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_AMHS_DUMMY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsUnusedDummy takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_UNUSED_DUMMY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLivingClay takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LIVING_CLAY and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocust takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustAlt takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_ALT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustDarkNode takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_DARK_NODE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustFireLord takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_FIRE_LORD and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustGhost takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_GHOST and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustInnerFire takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_INNER_FIRE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustKa takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_KA and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustLez takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_LEZ and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustLightNode takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_LIGHT_NODE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustNel takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_NEL and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustOpposingPanther takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_OPPOSING_PANTHER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustPoop takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_POOP and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustSkeleton takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_SKELETON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLocustWaterLord takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LOCUST_WATER_LORD and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMasterCaster takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MASTER_CASTER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTradeZeppelin takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TRADE_ZEPPELIN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsUberHive takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_UBER_HIVE and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsRock takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ROCK and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsChicken takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_CHICKEN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsFarm takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_FARM and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsFootman takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_FOOTMAN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsHeroPicker takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_HERO_PICKER and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsLivingClayUnused takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_LIVING_CLAY_UNUSED and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsMeat takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_MEAT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsPeasant takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_PEASANT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsPeon takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_PEON and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSmokedMeat takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SMOKED_MEAT and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSoulReflection1 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SOUL_REFLECTION_1 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSoulReflection2 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SOUL_REFLECTION_2 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsSoulReflection3 takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_SOUL_REFLECTION_3 and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsTestCloak takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_TEST_CLOAK and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumUnitIsUltraFootman takes nothing returns boolean
    return GetUnitTypeId(GetEnumUnit()) == UNIT_ULTRA_FOOTMAN and GetWidgetLife(GetEnumUnit()) > 0
  endfunction


  function EnumItemIsAncientBow takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ANCIENT_BOW and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBowBloodGod takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BOW_BLOOD_GOD and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsClayExplosion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CLAY_EXPLOSION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDdPinionFire takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DD_PINION_FIRE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDdPinionPain takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DD_PINION_PAIN and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDdPinionShadow takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DD_PINION_SHADOW and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDustyOldBow takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DUSTY_OLD_BOW and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsGlowingAncientBow takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_GLOWING_ANCIENT_BOW and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHornMammoth takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HORN_MAMMOTH and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHydraClaws takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HYDRA_CLAWS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHydraScale takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HYDRA_SCALE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHydraacFins takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HYDRAAC_FINS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedBeastMaster takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_BEAST_MASTER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedPriest takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_PRIEST and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedScout takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_SCOUT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedGatherer takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_GATHERER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedMage takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_MAGE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedThief takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_THIEF and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedHunter takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_HUNTER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedHeadHuner takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MED_HEAD_HUNER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsThiefMed takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_THIEF_MED and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMedallionCourage takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MEDALLION_COURAGE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBlueHerb takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BLUE_HERB and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBone takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BONE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsButsu takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BUTSU and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsClayBall takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CLAY_BALL and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsElkHide takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ELK_HIDE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsFlint takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_FLINT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHardenScales takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HARDEN_SCALES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHawkEgg takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HAWK_EGG and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsJungleWolfHide takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_JUNGLE_WOLF_HIDE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsJungleBearHide takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_JUNGLE_BEAR_HIDE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMagic takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MAGIC and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsManaCrystal takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MANA_CRYSTAL and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMushroom takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MUSHROOM and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsOrangeHerb takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ORANGE_HERB and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsPurpleHerb takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_PURPLE_HERB and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsRiverStem takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_RIVER_STEM and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsRiverRoot takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_RIVER_ROOT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsStick takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STICK and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsStone takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STONE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTinder takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TINDER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsYellowHerb takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_YELLOW_HERB and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsAcidBomb takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ACID_BOMB and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsAntiMagicPotion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ANTI_MAGIC_POTION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsAnabolicPotion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ANABOLIC_POTION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCureAll takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CURE_ALL and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDiseasePotion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DISEASE_POTION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDrunksPotion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DRUNKS_POTION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsElementalShieldPotion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ELEMENTAL_SHIELD_POTION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsEssenceBees takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ESSENCE_BEES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsFerverPotion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_FERVER_POTION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHealingPotionI takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HEALING_POTION_I and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHealingPotionIi takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HEALING_POTION_II and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHealingPotionIii takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HEALING_POTION_III and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHealingPotionIv takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HEALING_POTION_IV and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsManaPotionI takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MANA_POTION_I and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsManaPotionIi takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MANA_POTION_II and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsManaPotionIii takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MANA_POTION_III and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsManaPotionIv takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MANA_POTION_IV and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsNapalm takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_NAPALM and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsNetherPotion takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_NETHER_POTION and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsPotionTwinIslands takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_POTION_TWIN_ISLANDS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsOmnicure takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_OMNICURE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDarkRock takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DARK_ROCK and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsGemOfKnowledge takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_GEM_OF_KNOWLEDGE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSpiritWater takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SPIRIT_WATER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSpiritWind takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SPIRIT_WIND and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsAcorn takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ACORN and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCookedMeat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_COOKED_MEAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDiseasedMeat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DISEASED_MEAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMagicAcorn takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MAGIC_ACORN and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSmokedMeat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SMOKED_MEAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsAnabolicBoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ANABOLIC_BOOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBattleArmor takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BATTLE_ARMOR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBattleAxe takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BATTLE_AXE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBattleGloves takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BATTLE_GLOVES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBattleShield takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BATTLE_SHIELD and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBattleSuit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BATTLE_SUIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBeeHive takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BEE_HIVE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBlowGun takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BLOW_GUN and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCamouflageCoat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CAMOUFLAGE_COAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDarkThistles takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DARK_THISTLES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsEmp takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_EMP and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsFireBomb takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_FIRE_BOMB and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsNets takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_NETS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSmokeBomb takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SMOKE_BOMB and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSonarCompass takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SONAR_COMPASS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsThistles takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_THISTLES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCloakOfFlames takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CLOAK_OF_FLAMES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCloakOfFrost takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CLOAK_OF_FROST and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCloakOfHealing takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CLOAK_OF_HEALING and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsLivingClay takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_LIVING_CLAY and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMagicSeed takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MAGIC_SEED and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsPoison takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_POISON and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsPoisonSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_POISON_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsRefinedPoisonSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_REFINED_POISON_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsScrollSwiftness takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SCROLL_SWIFTNESS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsScrollCyclone takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SCROLL_CYCLONE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsScrollEntanglingRoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SCROLL_ENTANGLING_ROOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsScrollFireball takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SCROLL_FIREBALL and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsScrollLivingDead takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SCROLL_LIVING_DEAD and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsScrollStoneArmor takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SCROLL_STONE_ARMOR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsScrollTsunami takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SCROLL_TSUNAMI and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsUltraPoison takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ULTRA_POISON and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsUltraPoisonSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ULTRA_POISON_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBoneBoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BONE_BOOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBoneCoat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BONE_COAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBoneGloves takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BONE_GLOVES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBoneShield takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BONE_SHIELD and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDarkSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DARK_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsFlintAxe takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_FLINT_AXE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsIronAxe takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_IRON_AXE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsIronBoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_IRON_BOOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsIronCoat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_IRON_COAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsIronGloves takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_IRON_GLOVES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsIronIngot takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_IRON_INGOT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsIronShield takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_IRON_SHIELD and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsIronSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_IRON_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMageMasher takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MAGE_MASHER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsShield takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SHIELD and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSteelAxe takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STEEL_AXE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSteelBoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STEEL_BOOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSteelCoat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STEEL_COAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSteelGloves takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STEEL_GLOVES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSteelIngot takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STEEL_INGOT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSteelShield takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STEEL_SHIELD and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSteelSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STEEL_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsStoneAxe takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STONE_AXE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsLoadedThistles takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_LOADED_THISTLES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsLoadedDarkThistles takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_LOADED_DARK_THISTLES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsLoadedBone takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_LOADED_BONE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBearSkinBoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BEAR_SKIN_BOOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBearSkinCoat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BEAR_SKIN_COAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBearSkinGloves takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BEAR_SKIN_GLOVES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsElkSkinBoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ELK_SKIN_BOOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsElkSkinCoat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ELK_SKIN_COAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsElkSkinGloves takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ELK_SKIN_GLOVES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsWolfSkinBoots takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_WOLF_SKIN_BOOTS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsWolfSkinCoat takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_WOLF_SKIN_COAT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsWolfSkinGloves takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_WOLF_SKIN_GLOVES and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsArmoryKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ARMORY_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsDefensiveWardKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_DEFENSIVE_WARD_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsEnsnareTrapKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_ENSNARE_TRAP_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsFireKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_FIRE_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHatcheryKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HATCHERY_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMageFireKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MAGE_FIRE_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsMudHutKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_MUD_HUT_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsOmnidefenderKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_OMNIDEFENDER_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsPotKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_POT_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSmokeHouseKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SMOKE_HOUSE_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSpiritWardKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SPIRIT_WARD_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsStorageHutKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_STORAGE_HUT_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTanneryKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TANNERY_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTeleportBeaconKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TELEPORT_BEACON_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTentKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TENT_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTransportShipKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TRANSPORT_SHIP_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTrollBurrowKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TROLL_BURROW_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTrollHutKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TROLL_HUT_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsWitchDoctorsHutKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_WITCH_DOCTORS_HUT_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsWorkshopKit takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_WORKSHOP_KIT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBattleSuitSpells takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BATTLE_SUIT_SPELLS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsBattleSuitSpellsTwo takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_BATTLE_SUIT_SPELLS_TWO and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCheese takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CHEESE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHeadHunterSteelSpear takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HEAD_HUNTER_STEEL_SPEAR and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe1 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_1 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe2 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_2 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe3 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_3 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe4 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_4 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe5 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_5 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe6 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_6 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe7 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_7 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe8 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_8 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe9 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_9 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe10 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_10 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHerbRecipe11 takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HERB_RECIPE_11 and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsHydraHint takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_HYDRA_HINT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsOpposingNightItem takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_OPPOSING_NIGHT_ITEM and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsPantherHide takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_PANTHER_HIDE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsSecretHint takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_SECRET_HINT and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsTomeLoss takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_TOME_LOSS and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsRepairHammer takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_REPAIR_HAMMER and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsNull takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_NULL and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumItemIsCandyCane takes nothing returns boolean
    return GetItemTypeId(GetEnumItem()) == ITEM_CANDY_CANE and GetWidgetLife(GetEnumItem()) > 0
  endfunction


  function EnumDestructableIsFalseTree takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == DEST_FALSE_TREE and GetWidgetLife(GetEnumDestructable()) > 0
  endfunction


  function EnumDestructableIsRuinsTree takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == DEST_RUINS_TREE and GetWidgetLife(GetEnumDestructable()) > 0
  endfunction


  function EnumDestructableIsRuinsTreeCanopy takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == DEST_RUINS_TREE_CANOPY and GetWidgetLife(GetEnumDestructable()) > 0
  endfunction


  function EnumDestructableIsRuinsTreeItem takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == DEST_RUINS_TREE_ITEM and GetWidgetLife(GetEnumDestructable()) > 0
  endfunction


  function EnumDestructableIsSuperTree takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == DEST_SUPER_TREE and GetWidgetLife(GetEnumDestructable()) > 0
  endfunction


  function EnumDestructableIsSuperTreeCanopy takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == DEST_SUPER_TREE_CANOPY and GetWidgetLife(GetEnumDestructable()) > 0
  endfunction
endlibrary
