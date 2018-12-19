library FilterTypeIsThing requires IsTypeThing
  function FilterUnitIsHunter takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HUNTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHunter1 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HUNTER_1 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTracker takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRACKER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsWarrior takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_WARRIOR and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsJuggernaut takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_JUGGERNAUT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBeastMaster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BEAST_MASTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrueForm takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRUE_FORM and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsDruid takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DRUID and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsChickenForm takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_CHICKEN_FORM and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsUltimateForm takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ULTIMATE_FORM and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBeastMaster1 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BEAST_MASTER_1 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsShapeshifterWolf takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SHAPESHIFTER_WOLF and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsShapeshifterBear takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SHAPESHIFTER_BEAR and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsShapeshifterPanther takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SHAPESHIFTER_PANTHER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsShapeshifterTiger takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SHAPESHIFTER_TIGER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMage takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MAGE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMage1 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MAGE_1 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsElementalist takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ELEMENTALIST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsElementalist1 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ELEMENTALIST_1 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHypnotist takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HYPNOTIST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsDementiaMaster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DEMENTIA_MASTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsPriest takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_PRIEST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBooster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BOOSTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBooster1 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BOOSTER_1 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMasterHealer takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MASTER_HEALER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSage takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SAGE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsThief takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_THIEF and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsEscapeArtist takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ESCAPE_ARTIST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsContortionist takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_CONTORTIONIST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAssassin takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ASSASSIN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsScout takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SCOUT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsObserver takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_OBSERVER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsRadarScout takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_RADAR_SCOUT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSpy takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SPY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsGatherer takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_GATHERER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsRadarGatherer takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_RADAR_GATHERER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHerbMaster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HERB_MASTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsOmnigatherer takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_OMNIGATHERER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsRepickTroll takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_REPICK_TROLL and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsDrunkenTroll takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DRUNKEN_TROLL and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollBrawler takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_BRAWLER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollBrewmaster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_BREWMASTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsIslandTroll takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ISLAND_TROLL and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHeadHunter takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HEAD_HUNTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsArcherIntrepide takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ARCHER_INTREPIDE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMirrorTroll takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MIRROR_TROLL and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMirrorTrollClone takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MIRROR_TROLL_CLONE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsNecromancer takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_NECROMANCER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsShaman takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SHAMAN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsShadowArcher takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SHADOW_ARCHER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsShadowHunter takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SHADOW_HUNTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSpiritWalker takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SPIRIT_WALKER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrackerTourny2011 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRACKER_TOURNY_2011 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrickster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRICKSTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollConartist takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_CONARTIST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollMageAlt takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_MAGE_ALT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollWitchDoctor takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_WITCH_DOCTOR and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsEaTourny2011 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_EA_TOURNY_2011 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAligatorMan takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ALIGATOR_MAN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAncientHydra takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ANCIENT_HYDRA and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsDiscoDuck takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DISCO_DUCK and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLesserHydra takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LESSER_HYDRA and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMagentaFish takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MAGENTA_FISH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMammoth takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MAMMOTH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsOne takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ONE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsRapidTurtle takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_RAPID_TURTLE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAdultElk takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ADULT_ELK and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAdultJungleBear takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ADULT_JUNGLE_BEAR and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAdultJungleWolf takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ADULT_JUNGLE_WOLF and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAlphaHawk takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ALPHA_HAWK and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBronzeDragon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BRONZE_DRAGON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBronzeDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BRONZE_DRAGON_HATCHLING and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBearCub takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BEAR_CUB and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsElderPanther takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ELDER_PANTHER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsElk takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ELK and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsElkAdolescent takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ELK_ADOLESCENT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsFawn takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_FAWN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsFish takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_FISH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsForestDragon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_FOREST_DRAGON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsForestDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_FOREST_DRAGON_HATCHLING and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsGreaterBronzeDragon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_GREATER_BRONZE_DRAGON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsGreaterForestDragon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_GREATER_FOREST_DRAGON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsGreaterNetherDragon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_GREATER_NETHER_DRAGON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsGreaterRedDragon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_GREATER_RED_DRAGON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsGreenFish takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_GREEN_FISH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHawk takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HAWK and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHawkAdolescent takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HAWK_ADOLESCENT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHawkHatchling takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HAWK_HATCHLING and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsJungleBear takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_JUNGLE_BEAR and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsJungleWolf takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_JUNGLE_WOLF and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsNetherDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_NETHER_DRAGON_HATCHLING and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsPanther takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_PANTHER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsRedDragonHatchling takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_RED_DRAGON_HATCHLING and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSnake takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SNAKE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsWolfPup takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_WOLF_PUP and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsArmory takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ARMORY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBuildingTree takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BUILDING_TREE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsFire takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_FIRE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsDefenseWard takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DEFENSE_WARD and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsEnsnareTrap takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ENSNARE_TRAP and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHatchery takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HATCHERY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMageFire takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MAGE_FIRE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMageFireSummoned takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MAGE_FIRE_SUMMONED and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsPot takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_POT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMudHut takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MUD_HUT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsOmnitower takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_OMNITOWER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSmokeHouse takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SMOKE_HOUSE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSpiritWard takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SPIRIT_WARD and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsStorageHut takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_STORAGE_HUT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTannery takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TANNERY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTeleportationBeacon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TELEPORTATION_BEACON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTent takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TENT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollBurrow takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_BURROW and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollHut takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_HUT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollTotem takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_TOTEM and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollTransportShip takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_TRANSPORT_SHIP and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsWitchDoctorsHit takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_WITCH_DOCTORS_HUT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsWorkshop takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_WORKSHOP and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsPowerGenerator takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_POWER_GENERATOR and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBlueHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BLUE_HERB_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHaisetsuBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HAISETSU_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHiddenStash takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HIDDEN_STASH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMushroomColony takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MUSHROOM_COLONY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsOrangeHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ORANGE_HERB_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsPurpleHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_PURPLE_HERB_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsScoutsBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SCOUTS_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsThiefsBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_THIEFS_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsThistleShrub takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_THISTLE_SHRUB and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsWaterHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_WATER_HERB_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsYellowHerbBush takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_YELLOW_HERB_BUSH and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsCraftMaster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_CRAFT_MASTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsOminousAltar takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_OMINOUS_ALTAR and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTradeShip1 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRADE_SHIP_1 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTradeShip2 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRADE_SHIP_2 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTradeShip3 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRADE_SHIP_3 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTradeShip4 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRADE_SHIP_4 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTradeShip5 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRADE_SHIP_5 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTradeShip6 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRADE_SHIP_6 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTrollMerchant takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_MERCHANT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBlurImage takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BLUR_IMAGE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBee takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BEE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBeeHive takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BEE_HIVE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsBeeHiveSummoned takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_BEE_HIVE_SUMMONED and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsDiseaseCloud takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DISEASE_CLOUD and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsDummy takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DUMMY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsAmhsDummy takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_AMHS_DUMMY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsUnusedDummy takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_UNUSED_DUMMY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLivingClay takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LIVING_CLAY and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocust takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustAlt takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_ALT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustDarkNode takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_DARK_NODE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustFireLord takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_FIRE_LORD and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustGhost takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_GHOST and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustInnerFire takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_INNER_FIRE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustKa takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_KA and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustLez takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_LEZ and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustLightNode takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_LIGHT_NODE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustNel takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_NEL and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustOpposingPanther takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_OPPOSING_PANTHER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustPoop takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_POOP and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustSkeleton takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_SKELETON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLocustWaterLord takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LOCUST_WATER_LORD and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMasterCaster takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MASTER_CASTER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTradeZeppelin takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TRADE_ZEPPELIN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsUberHive takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_UBER_HIVE and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsRock takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ROCK and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsChicken takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_CHICKEN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsFarm takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_FARM and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsFootman takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_FOOTMAN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsHeroPicker takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_HERO_PICKER and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsLivingClayUnused takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LIVING_CLAY_UNUSED and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsMeat takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MEAT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsPeasant takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_PEASANT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsPeon takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_PEON and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSmokedMeat takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SMOKED_MEAT and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSoulReflection1 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SOUL_REFLECTION_1 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSoulReflection2 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SOUL_REFLECTION_2 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsSoulReflection3 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_SOUL_REFLECTION_3 and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsTestCloak takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TEST_CLOAK and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterUnitIsUltraFootman takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_ULTRA_FOOTMAN and GetWidgetLife(GetFilterUnit()) > 0
  endfunction


  function FilterItemIsAncientBow takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ANCIENT_BOW and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBowBloodGod takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BOW_BLOOD_GOD and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsClayExplosion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CLAY_EXPLOSION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDdPinionFire takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DD_PINION_FIRE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDdPinionPain takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DD_PINION_PAIN and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDdPinionShadow takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DD_PINION_SHADOW and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDustyOldBow takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DUSTY_OLD_BOW and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsGlowingAncientBow takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_GLOWING_ANCIENT_BOW and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHornMammoth takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HORN_MAMMOTH and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHydraClaws takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HYDRA_CLAWS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHydraScale takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HYDRA_SCALE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHydraacFins takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HYDRAAC_FINS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedBeastMaster takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_BEAST_MASTER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedPriest takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_PRIEST and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedScout takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_SCOUT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedGatherer takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_GATHERER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedMage takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_MAGE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedThief takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_THIEF and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedHunter takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_HUNTER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedHeadHuner takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MED_HEAD_HUNER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsThiefMed takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_THIEF_MED and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMedallionCourage takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MEDALLION_COURAGE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBlueHerb takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BLUE_HERB and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBone takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BONE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsButsu takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BUTSU and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsClayBall takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CLAY_BALL and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsElkHide takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ELK_HIDE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsFlint takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_FLINT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHardenScales takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HARDEN_SCALES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHawkEgg takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HAWK_EGG and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsJungleWolfHide takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_JUNGLE_WOLF_HIDE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsJungleBearHide takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_JUNGLE_BEAR_HIDE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMagic takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MAGIC and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsManaCrystal takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MANA_CRYSTAL and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMushroom takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MUSHROOM and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsOrangeHerb takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ORANGE_HERB and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsPurpleHerb takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_PURPLE_HERB and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsRiverStem takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_RIVER_STEM and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsRiverRoot takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_RIVER_ROOT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsStick takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STICK and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsStone takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STONE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTinder takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TINDER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsYellowHerb takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_YELLOW_HERB and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsAcidBomb takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ACID_BOMB and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsAntiMagicPotion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ANTI_MAGIC_POTION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsAnabolicPotion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ANABOLIC_POTION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCureAll takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CURE_ALL and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDiseasePotion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DISEASE_POTION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDrunksPotion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DRUNKS_POTION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsElementalShieldPotion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ELEMENTAL_SHIELD_POTION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsEssenceBees takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ESSENCE_BEES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsFerverPotion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_FERVER_POTION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHealingPotionI takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HEALING_POTION_I and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHealingPotionIi takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HEALING_POTION_II and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHealingPotionIii takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HEALING_POTION_III and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHealingPotionIv takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HEALING_POTION_IV and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsManaPotionI takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MANA_POTION_I and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsManaPotionIi takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MANA_POTION_II and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsManaPotionIii takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MANA_POTION_III and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsManaPotionIv takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MANA_POTION_IV and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsNapalm takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_NAPALM and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsNetherPotion takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_NETHER_POTION and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsPotionTwinIslands takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_POTION_TWIN_ISLANDS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsOmnicure takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_OMNICURE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDarkRock takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DARK_ROCK and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsGemOfKnowledge takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_GEM_OF_KNOWLEDGE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSpiritWater takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SPIRIT_WATER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSpiritWind takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SPIRIT_WIND and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsAcorn takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ACORN and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCookedMeat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_COOKED_MEAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDiseasedMeat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DISEASED_MEAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMagicAcorn takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MAGIC_ACORN and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSmokedMeat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SMOKED_MEAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsAnabolicBoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ANABOLIC_BOOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBattleArmor takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BATTLE_ARMOR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBattleAxe takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BATTLE_AXE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBattleGloves takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BATTLE_GLOVES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBattleShield takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BATTLE_SHIELD and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBattleSuit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BATTLE_SUIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBeeHive takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BEE_HIVE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBlowGun takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BLOW_GUN and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCamouflageCoat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CAMOUFLAGE_COAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDarkThistles takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DARK_THISTLES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsEmp takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_EMP and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsFireBomb takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_FIRE_BOMB and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsNets takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_NETS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSmokeBomb takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SMOKE_BOMB and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSonarCompass takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SONAR_COMPASS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsThistles takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_THISTLES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCloakOfFlames takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CLOAK_OF_FLAMES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCloakOfFrost takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CLOAK_OF_FROST and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCloakOfHealing takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CLOAK_OF_HEALING and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsLivingClay takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_LIVING_CLAY and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMagicSeed takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MAGIC_SEED and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsPoison takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_POISON and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsPoisonSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_POISON_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsRefinedPoisonSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_REFINED_POISON_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsScrollSwiftness takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SCROLL_SWIFTNESS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsScrollCyclone takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SCROLL_CYCLONE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsScrollEntanglingRoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SCROLL_ENTANGLING_ROOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsScrollFireball takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SCROLL_FIREBALL and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsScrollLivingDead takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SCROLL_LIVING_DEAD and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsScrollStoneArmor takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SCROLL_STONE_ARMOR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsScrollTsunami takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SCROLL_TSUNAMI and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsUltraPoison takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ULTRA_POISON and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsUltraPoisonSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ULTRA_POISON_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBoneBoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BONE_BOOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBoneCoat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BONE_COAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBoneGloves takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BONE_GLOVES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBoneShield takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BONE_SHIELD and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDarkSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DARK_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsFlintAxe takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_FLINT_AXE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsIronAxe takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_IRON_AXE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsIronBoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_IRON_BOOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsIronCoat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_IRON_COAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsIronGloves takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_IRON_GLOVES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsIronIngot takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_IRON_INGOT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsIronShield takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_IRON_SHIELD and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsIronSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_IRON_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMageMasher takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MAGE_MASHER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsShield takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SHIELD and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSteelAxe takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STEEL_AXE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSteelBoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STEEL_BOOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSteelCoat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STEEL_COAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSteelGloves takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STEEL_GLOVES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSteelIngot takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STEEL_INGOT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSteelShield takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STEEL_SHIELD and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSteelSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STEEL_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsStoneAxe takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STONE_AXE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsLoadedThistles takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_LOADED_THISTLES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsLoadedDarkThistles takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_LOADED_DARK_THISTLES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsLoadedBone takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_LOADED_BONE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBearSkinBoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BEAR_SKIN_BOOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBearSkinCoat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BEAR_SKIN_COAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBearSkinGloves takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BEAR_SKIN_GLOVES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsElkSkinBoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ELK_SKIN_BOOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsElkSkinCoat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ELK_SKIN_COAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsElkSkinGloves takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ELK_SKIN_GLOVES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsWolfSkinBoots takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_WOLF_SKIN_BOOTS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsWolfSkinCoat takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_WOLF_SKIN_COAT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsWolfSkinGloves takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_WOLF_SKIN_GLOVES and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsArmoryKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ARMORY_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsDefensiveWardKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_DEFENSIVE_WARD_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsEnsnareTrapKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_ENSNARE_TRAP_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsFireKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_FIRE_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHatcheryKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HATCHERY_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMageFireKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MAGE_FIRE_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsMudHutKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_MUD_HUT_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsOmnidefenderKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_OMNIDEFENDER_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsPotKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_POT_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSmokeHouseKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SMOKE_HOUSE_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSpiritWardKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SPIRIT_WARD_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsStorageHutKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_STORAGE_HUT_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTanneryKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TANNERY_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTeleportBeaconKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TELEPORT_BEACON_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTentKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TENT_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTransportShipKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TRANSPORT_SHIP_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTrollBurrowKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TROLL_BURROW_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTrollHutKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TROLL_HUT_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsWitchDoctorsHutKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_WITCH_DOCTORS_HUT_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsWorkshopKit takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_WORKSHOP_KIT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBattleSuitSpells takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BATTLE_SUIT_SPELLS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsBattleSuitSpellsTwo takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_BATTLE_SUIT_SPELLS_TWO and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCheese takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CHEESE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHeadHunterSteelSpear takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HEAD_HUNTER_STEEL_SPEAR and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe1 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_1 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe2 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_2 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe3 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_3 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe4 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_4 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe5 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_5 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe6 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_6 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe7 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_7 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe8 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_8 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe9 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_9 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe10 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_10 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHerbRecipe11 takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HERB_RECIPE_11 and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsHydraHint takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_HYDRA_HINT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsOpposingNightItem takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_OPPOSING_NIGHT_ITEM and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsPantherHide takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_PANTHER_HIDE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsSecretHint takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_SECRET_HINT and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsTomeLoss takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_TOME_LOSS and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsRepairHammer takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_REPAIR_HAMMER and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsNull takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_NULL and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterItemIsCandyCane takes nothing returns boolean
    return GetItemTypeId(GetFilterItem()) == ITEM_CANDY_CANE and GetWidgetLife(GetFilterItem()) > 0
  endfunction


  function FilterDestructableIsFalseTree takes nothing returns boolean
    return GetDestructableTypeId(GetFilterDestructable()) == DEST_FALSE_TREE and GetWidgetLife(GetFilterDestructable()) > 0
  endfunction


  function FilterDestructableIsRuinsTree takes nothing returns boolean
    return GetDestructableTypeId(GetFilterDestructable()) == DEST_RUINS_TREE and GetWidgetLife(GetFilterDestructable()) > 0
  endfunction


  function FilterDestructableIsRuinsTreeCanopy takes nothing returns boolean
    return GetDestructableTypeId(GetFilterDestructable()) == DEST_RUINS_TREE_CANOPY and GetWidgetLife(GetFilterDestructable()) > 0
  endfunction


  function FilterDestructableIsRuinsTreeItem takes nothing returns boolean
    return GetDestructableTypeId(GetFilterDestructable()) == DEST_RUINS_TREE_ITEM and GetWidgetLife(GetFilterDestructable()) > 0
  endfunction


  function FilterDestructableIsSuperTree takes nothing returns boolean
    return GetDestructableTypeId(GetFilterDestructable()) == DEST_SUPER_TREE and GetWidgetLife(GetFilterDestructable()) > 0
  endfunction


  function FilterDestructableIsSuperTreeCanopy takes nothing returns boolean
    return GetDestructableTypeId(GetFilterDestructable()) == DEST_SUPER_TREE_CANOPY and GetWidgetLife(GetFilterDestructable()) > 0
  endfunction


  function FilterItemIsPole takes nothing returns boolean
    return FilterItemIsStick() or FilterItemIsBone()
  endfunction

  function FilterItemIsBaseShield takes nothing returns boolean
    return IsItemBasicShield(GetFilterItem()) and GetWidgetLife(GetFilterItem()) > 0
  endfunction

  function FilterItemIsBaseBoots takes nothing returns boolean
    return IsItemBasicBoots(GetFilterItem()) and GetWidgetLife(GetFilterItem()) > 0
  endfunction

  function FilterItemIsBaseGloves takes nothing returns boolean
    return IsItemBasicGloves(GetFilterItem()) and GetWidgetLife(GetFilterItem()) > 0
  endfunction

  function FilterItemIsBaseCoat takes nothing returns boolean
    return IsItemBasicCoat(GetFilterItem()) and GetWidgetLife(GetFilterItem()) > 0
  endfunction

  function FilterItemIsHide takes nothing returns boolean
    return IsItemHide(GetFilterItem()) and GetWidgetLife(GetFilterItem()) > 0
  endfunction

  function FilterUnitIsCorpse takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MEAT
  endfunction

  function FilterUnitIsTroll takes nothing returns boolean
    return IsUnitTroll(GetFilterUnit())
  endfunction

  function FilterUnitIsTradeShip takes nothing returns boolean
    return IsUnitTradeShip(GetFilterUnit())
  endfunction
endlibrary
