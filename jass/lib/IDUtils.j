library IDUtils initializer onInit requires ArrayLists
	globals
		ArrayListInteger UNIT_ALL
		ArrayListInteger SPELL_ALL
		ArrayListInteger ABILITY_ALL
		ArrayListInteger BUFF_ALL
		ArrayListInteger ITEM_ALL
		ArrayListInteger DEST_ALL
	endglobals

	function S2ID takes string s returns integer
		if s == "UNIT_HUNTER" then
            return UNIT_HUNTER
        endif
		if s == "UNIT_HUNTER_1" then
            return UNIT_HUNTER_1
        endif
		if s == "UNIT_TRACKER" then
            return UNIT_TRACKER
        endif
		if s == "UNIT_WARRIOR" then
            return UNIT_WARRIOR
        endif
		if s == "UNIT_JUGGERNAUT" then
            return UNIT_JUGGERNAUT
        endif
		if s == "UNIT_BEAST_MASTER" then
            return UNIT_BEAST_MASTER
        endif
		if s == "UNIT_TRUE_FORM" then
            return UNIT_TRUE_FORM
        endif
		if s == "UNIT_DRUID" then
            return UNIT_DRUID
        endif
		if s == "UNIT_CHICKEN_FORM" then
            return UNIT_CHICKEN_FORM
        endif
		if s == "UNIT_ULTIMATE_FORM" then
            return UNIT_ULTIMATE_FORM
        endif
		if s == "UNIT_BEAST_MASTER_1" then
            return UNIT_BEAST_MASTER_1
        endif
		if s == "UNIT_SHAPESHIFTER_WOLF" then
            return UNIT_SHAPESHIFTER_WOLF
        endif
		if s == "UNIT_SHAPESHIFTER_BEAR" then
            return UNIT_SHAPESHIFTER_BEAR
        endif
		if s == "UNIT_SHAPESHIFTER_PANTHER" then
            return UNIT_SHAPESHIFTER_PANTHER
        endif
		if s == "UNIT_SHAPESHIFTER_TIGER" then
            return UNIT_SHAPESHIFTER_TIGER
        endif
		if s == "UNIT_MAGE" then
            return UNIT_MAGE
        endif
		if s == "UNIT_MAGE_1" then
            return UNIT_MAGE_1
        endif
		if s == "UNIT_ELEMENTALIST" then
            return UNIT_ELEMENTALIST
        endif
		if s == "UNIT_ELEMENTALIST_1" then
            return UNIT_ELEMENTALIST_1
        endif
		if s == "UNIT_HYPNOTIST" then
            return UNIT_HYPNOTIST
        endif
		if s == "UNIT_DEMENTIA_MASTER" then
            return UNIT_DEMENTIA_MASTER
        endif
		if s == "UNIT_PRIEST" then
            return UNIT_PRIEST
        endif
		if s == "UNIT_BOOSTER" then
            return UNIT_BOOSTER
        endif
		if s == "UNIT_BOOSTER_1" then
            return UNIT_BOOSTER_1
        endif
		if s == "UNIT_MASTER_HEALER" then
            return UNIT_MASTER_HEALER
        endif
		if s == "UNIT_SAGE" then
            return UNIT_SAGE
        endif
		if s == "UNIT_THIEF" then
            return UNIT_THIEF
        endif
		if s == "UNIT_ESCAPE_ARTIST" then
            return UNIT_ESCAPE_ARTIST
        endif
		if s == "UNIT_CONTORTIONIST" then
            return UNIT_CONTORTIONIST
        endif
		if s == "UNIT_ASSASSIN" then
            return UNIT_ASSASSIN
        endif
		if s == "UNIT_SCOUT" then
            return UNIT_SCOUT
        endif
		if s == "UNIT_OBSERVER" then
            return UNIT_OBSERVER
        endif
		if s == "UNIT_RADAR_SCOUT" then
            return UNIT_RADAR_SCOUT
        endif
		if s == "UNIT_SPY" then
            return UNIT_SPY
        endif
		if s == "UNIT_GATHERER" then
            return UNIT_GATHERER
        endif
		if s == "UNIT_RADAR_GATHERER" then
            return UNIT_RADAR_GATHERER
        endif
		if s == "UNIT_HERB_MASTER" then
            return UNIT_HERB_MASTER
        endif
		if s == "UNIT_OMNIGATHERER" then
            return UNIT_OMNIGATHERER
        endif
		if s == "UNIT_REPICK_TROLL" then
            return UNIT_REPICK_TROLL
        endif
		if s == "UNIT_DRUNKEN_TROLL" then
            return UNIT_DRUNKEN_TROLL
        endif
		if s == "UNIT_TROLL_BRAWLER" then
            return UNIT_TROLL_BRAWLER
        endif
		if s == "UNIT_TROLL_BREWMASTER" then
            return UNIT_TROLL_BREWMASTER
        endif
		if s == "UNIT_ISLAND_TROLL" then
            return UNIT_ISLAND_TROLL
        endif
		if s == "UNIT_HEAD_HUNTER" then
            return UNIT_HEAD_HUNTER
        endif
		if s == "UNIT_ARCHER_INTREPIDE" then
            return UNIT_ARCHER_INTREPIDE
        endif
		if s == "UNIT_MIRROR_TROLL" then
            return UNIT_MIRROR_TROLL
        endif
		if s == "UNIT_MIRROR_TROLL_CLONE" then
            return UNIT_MIRROR_TROLL_CLONE
        endif
		if s == "UNIT_NECROMANCER" then
            return UNIT_NECROMANCER
        endif
		if s == "UNIT_SHAMAN" then
            return UNIT_SHAMAN
        endif
		if s == "UNIT_SHADOW_ARCHER" then
            return UNIT_SHADOW_ARCHER
        endif
		if s == "UNIT_SHADOW_HUNTER" then
            return UNIT_SHADOW_HUNTER
        endif
		if s == "UNIT_SPIRIT_WALKER" then
            return UNIT_SPIRIT_WALKER
        endif
		if s == "UNIT_TRACKER_TOURNY_2011" then
            return UNIT_TRACKER_TOURNY_2011
        endif
		if s == "UNIT_TRICKSTER" then
            return UNIT_TRICKSTER
        endif
		if s == "UNIT_TROLL_CONARTIST" then
            return UNIT_TROLL_CONARTIST
        endif
		if s == "UNIT_TROLL_MAGE_ALT" then
            return UNIT_TROLL_MAGE_ALT
        endif
		if s == "UNIT_TROLL_WITCH_DOCTOR" then
            return UNIT_TROLL_WITCH_DOCTOR
        endif
		if s == "UNIT_EA_TOURNY_2011" then
            return UNIT_EA_TOURNY_2011
        endif
		if s == "UNIT_ALIGATOR_MAN" then
            return UNIT_ALIGATOR_MAN
        endif
		if s == "UNIT_ANCIENT_HYDRA" then
            return UNIT_ANCIENT_HYDRA
        endif
		if s == "UNIT_DISCO_DUCK" then
            return UNIT_DISCO_DUCK
        endif
		if s == "UNIT_LESSER_HYDRA" then
            return UNIT_LESSER_HYDRA
        endif
		if s == "UNIT_MAGENTA_FISH" then
            return UNIT_MAGENTA_FISH
        endif
		if s == "UNIT_MAMMOTH" then
            return UNIT_MAMMOTH
        endif
		if s == "UNIT_ONE" then
            return UNIT_ONE
        endif
		if s == "UNIT_RAPID_TURTLE" then
            return UNIT_RAPID_TURTLE
        endif
		if s == "UNIT_ADULT_ELK" then
            return UNIT_ADULT_ELK
        endif
		if s == "UNIT_ADULT_JUNGLE_BEAR" then
            return UNIT_ADULT_JUNGLE_BEAR
        endif
		if s == "UNIT_ADULT_JUNGLE_WOLF" then
            return UNIT_ADULT_JUNGLE_WOLF
        endif
		if s == "UNIT_ALPHA_HAWK" then
            return UNIT_ALPHA_HAWK
        endif
		if s == "UNIT_BRONZE_DRAGON" then
            return UNIT_BRONZE_DRAGON
        endif
		if s == "UNIT_BRONZE_DRAGON_HATCHLING" then
            return UNIT_BRONZE_DRAGON_HATCHLING
        endif
		if s == "UNIT_BEAR_CUB" then
            return UNIT_BEAR_CUB
        endif
		if s == "UNIT_ELDER_PANTHER" then
            return UNIT_ELDER_PANTHER
        endif
		if s == "UNIT_ELK" then
            return UNIT_ELK
        endif
		if s == "UNIT_ELK_ADOLESCENT" then
            return UNIT_ELK_ADOLESCENT
        endif
		if s == "UNIT_FAWN" then
            return UNIT_FAWN
        endif
		if s == "UNIT_FISH" then
            return UNIT_FISH
        endif
		if s == "UNIT_FOREST_DRAGON" then
            return UNIT_FOREST_DRAGON
        endif
		if s == "UNIT_FOREST_DRAGON_HATCHLING" then
            return UNIT_FOREST_DRAGON_HATCHLING
        endif
		if s == "UNIT_GREATER_BRONZE_DRAGON" then
            return UNIT_GREATER_BRONZE_DRAGON
        endif
		if s == "UNIT_GREATER_FOREST_DRAGON" then
            return UNIT_GREATER_FOREST_DRAGON
        endif
		if s == "UNIT_GREATER_NETHER_DRAGON" then
            return UNIT_GREATER_NETHER_DRAGON
        endif
		if s == "UNIT_GREATER_RED_DRAGON" then
            return UNIT_GREATER_RED_DRAGON
        endif
		if s == "UNIT_GREEN_FISH" then
            return UNIT_GREEN_FISH
        endif
		if s == "UNIT_HAWK" then
            return UNIT_HAWK
        endif
		if s == "UNIT_HAWK_ADOLESCENT" then
            return UNIT_HAWK_ADOLESCENT
        endif
		if s == "UNIT_HAWK_HATCHLING" then
            return UNIT_HAWK_HATCHLING
        endif
		if s == "UNIT_JUNGLE_BEAR" then
            return UNIT_JUNGLE_BEAR
        endif
		if s == "UNIT_JUNGLE_WOLF" then
            return UNIT_JUNGLE_WOLF
        endif
		if s == "UNIT_NETHER_DRAGON_HATCHLING" then
            return UNIT_NETHER_DRAGON_HATCHLING
        endif
		if s == "UNIT_PANTHER" then
            return UNIT_PANTHER
        endif
		if s == "UNIT_RED_DRAGON_HATCHLING" then
            return UNIT_RED_DRAGON_HATCHLING
        endif
		if s == "UNIT_SNAKE" then
            return UNIT_SNAKE
        endif
		if s == "UNIT_WOLF_PUP" then
            return UNIT_WOLF_PUP
        endif
		if s == "UNIT_ARMORY" then
            return UNIT_ARMORY
        endif
		if s == "UNIT_BUILDING_TREE" then
            return UNIT_BUILDING_TREE
        endif
		if s == "UNIT_FIRE" then
            return UNIT_FIRE
        endif
		if s == "UNIT_DEFENSE_WARD" then
            return UNIT_DEFENSE_WARD
        endif
		if s == "UNIT_ENSNARE_TRAP" then
            return UNIT_ENSNARE_TRAP
        endif
		if s == "UNIT_HATCHERY" then
            return UNIT_HATCHERY
        endif
		if s == "UNIT_MAGE_FIRE" then
            return UNIT_MAGE_FIRE
        endif
		if s == "UNIT_MAGE_FIRE_SUMMONED" then
            return UNIT_MAGE_FIRE_SUMMONED
        endif
		if s == "UNIT_POT" then
            return UNIT_POT
        endif
		if s == "UNIT_MUD_HUT" then
            return UNIT_MUD_HUT
        endif
		if s == "UNIT_OMNITOWER" then
            return UNIT_OMNITOWER
        endif
		if s == "UNIT_SMOKE_HOUSE" then
            return UNIT_SMOKE_HOUSE
        endif
		if s == "UNIT_SPIRIT_WARD" then
            return UNIT_SPIRIT_WARD
        endif
		if s == "UNIT_STORAGE_HUT" then
            return UNIT_STORAGE_HUT
        endif
		if s == "UNIT_TANNERY" then
            return UNIT_TANNERY
        endif
		if s == "UNIT_TELEPORTATION_BEACON" then
            return UNIT_TELEPORTATION_BEACON
        endif
		if s == "UNIT_TENT" then
            return UNIT_TENT
        endif
		if s == "UNIT_TROLL_BURROW" then
            return UNIT_TROLL_BURROW
        endif
		if s == "UNIT_TROLL_HUT" then
            return UNIT_TROLL_HUT
        endif
		if s == "UNIT_TROLL_TOTEM" then
            return UNIT_TROLL_TOTEM
        endif
		if s == "UNIT_TROLL_TRANSPORT_SHIP" then
            return UNIT_TROLL_TRANSPORT_SHIP
        endif
		if s == "UNIT_WITCH_DOCTORS_HUT" then
            return UNIT_WITCH_DOCTORS_HUT
        endif
		if s == "UNIT_WORKSHOP" then
            return UNIT_WORKSHOP
        endif
		if s == "UNIT_POWER_GENERATOR" then
            return UNIT_POWER_GENERATOR
        endif
		if s == "UNIT_BLUE_HERB_BUSH" then
            return UNIT_BLUE_HERB_BUSH
        endif
		if s == "UNIT_HAISETSU_BUSH" then
            return UNIT_HAISETSU_BUSH
        endif
		if s == "UNIT_HIDDEN_STASH" then
            return UNIT_HIDDEN_STASH
        endif
		if s == "UNIT_MUSHROOM_COLONY" then
            return UNIT_MUSHROOM_COLONY
        endif
		if s == "UNIT_ORANGE_HERB_BUSH" then
            return UNIT_ORANGE_HERB_BUSH
        endif
		if s == "UNIT_PURPLE_HERB_BUSH" then
            return UNIT_PURPLE_HERB_BUSH
        endif
		if s == "UNIT_SCOUTS_BUSH" then
            return UNIT_SCOUTS_BUSH
        endif
		if s == "UNIT_THIEFS_BUSH" then
            return UNIT_THIEFS_BUSH
        endif
		if s == "UNIT_THISTLE_SHRUB" then
            return UNIT_THISTLE_SHRUB
        endif
		if s == "UNIT_WATER_HERB_BUSH" then
            return UNIT_WATER_HERB_BUSH
        endif
		if s == "UNIT_YELLOW_HERB_BUSH" then
            return UNIT_YELLOW_HERB_BUSH
        endif
		if s == "UNIT_CRAFT_MASTER" then
            return UNIT_CRAFT_MASTER
        endif
		if s == "UNIT_OMINOUS_ALTAR" then
            return UNIT_OMINOUS_ALTAR
        endif
		if s == "UNIT_TRADE_SHIP_1" then
            return UNIT_TRADE_SHIP_1
        endif
		if s == "UNIT_TRADE_SHIP_2" then
            return UNIT_TRADE_SHIP_2
        endif
		if s == "UNIT_TRADE_SHIP_3" then
            return UNIT_TRADE_SHIP_3
        endif
		if s == "UNIT_TRADE_SHIP_4" then
            return UNIT_TRADE_SHIP_4
        endif
		if s == "UNIT_TRADE_SHIP_5" then
            return UNIT_TRADE_SHIP_5
        endif
		if s == "UNIT_TRADE_SHIP_6" then
            return UNIT_TRADE_SHIP_6
        endif
		if s == "UNIT_TROLL_MERCHANT" then
            return UNIT_TROLL_MERCHANT
        endif
		if s == "UNIT_BLUR_IMAGE" then
            return UNIT_BLUR_IMAGE
        endif
		if s == "UNIT_BEE" then
            return UNIT_BEE
        endif
		if s == "UNIT_BEE_HIVE" then
            return UNIT_BEE_HIVE
        endif
		if s == "UNIT_BEE_HIVE_SUMMONED" then
            return UNIT_BEE_HIVE_SUMMONED
        endif
		if s == "UNIT_DISEASE_CLOUD" then
            return UNIT_DISEASE_CLOUD
        endif
		if s == "UNIT_DUMMY" then
            return UNIT_DUMMY
        endif
		if s == "UNIT_AMHS_DUMMY" then
            return UNIT_AMHS_DUMMY
        endif
		if s == "UNIT_UNUSED_DUMMY" then
            return UNIT_UNUSED_DUMMY
        endif
		if s == "UNIT_LIVING_CLAY" then
            return UNIT_LIVING_CLAY
        endif
		if s == "UNIT_LOCUST" then
            return UNIT_LOCUST
        endif
		if s == "UNIT_LOCUST_ALT" then
            return UNIT_LOCUST_ALT
        endif
		if s == "UNIT_LOCUST_DARK_NODE" then
            return UNIT_LOCUST_DARK_NODE
        endif
		if s == "UNIT_LOCUST_FIRE_LORD" then
            return UNIT_LOCUST_FIRE_LORD
        endif
		if s == "UNIT_LOCUST_GHOST" then
            return UNIT_LOCUST_GHOST
        endif
		if s == "UNIT_LOCUST_INNER_FIRE" then
            return UNIT_LOCUST_INNER_FIRE
        endif
		if s == "UNIT_LOCUST_KA" then
            return UNIT_LOCUST_KA
        endif
		if s == "UNIT_LOCUST_LEZ" then
            return UNIT_LOCUST_LEZ
        endif
		if s == "UNIT_LOCUST_LIGHT_NODE" then
            return UNIT_LOCUST_LIGHT_NODE
        endif
		if s == "UNIT_LOCUST_NEL" then
            return UNIT_LOCUST_NEL
        endif
		if s == "UNIT_LOCUST_OPPOSING_PANTHER" then
            return UNIT_LOCUST_OPPOSING_PANTHER
        endif
		if s == "UNIT_LOCUST_POOP" then
            return UNIT_LOCUST_POOP
        endif
		if s == "UNIT_LOCUST_SKELETON" then
            return UNIT_LOCUST_SKELETON
        endif
		if s == "UNIT_LOCUST_WATER_LORD" then
            return UNIT_LOCUST_WATER_LORD
        endif
		if s == "UNIT_MASTER_CASTER" then
            return UNIT_MASTER_CASTER
        endif
		if s == "UNIT_TRADE_ZEPPELIN" then
            return UNIT_TRADE_ZEPPELIN
        endif
		if s == "UNIT_UBER_HIVE" then
            return UNIT_UBER_HIVE
        endif
		if s == "UNIT_ROCK" then
            return UNIT_ROCK
        endif
		if s == "UNIT_CHICKEN" then
            return UNIT_CHICKEN
        endif
		if s == "UNIT_FARM" then
            return UNIT_FARM
        endif
		if s == "UNIT_FOOTMAN" then
            return UNIT_FOOTMAN
        endif
		if s == "UNIT_HERO_PICKER" then
            return UNIT_HERO_PICKER
        endif
		if s == "UNIT_LIVING_CLAY_UNUSED" then
            return UNIT_LIVING_CLAY_UNUSED
        endif
		if s == "UNIT_MEAT" then
            return UNIT_MEAT
        endif
		if s == "UNIT_PEASANT" then
            return UNIT_PEASANT
        endif
		if s == "UNIT_PEON" then
            return UNIT_PEON
        endif
		if s == "UNIT_SMOKED_MEAT" then
            return UNIT_SMOKED_MEAT
        endif
		if s == "UNIT_SOUL_REFLECTION_1" then
            return UNIT_SOUL_REFLECTION_1
        endif
		if s == "UNIT_SOUL_REFLECTION_2" then
            return UNIT_SOUL_REFLECTION_2
        endif
		if s == "UNIT_SOUL_REFLECTION_3" then
            return UNIT_SOUL_REFLECTION_3
        endif
		if s == "UNIT_TEST_CLOAK" then
            return UNIT_TEST_CLOAK
        endif
		if s == "UNIT_ULTRA_FOOTMAN" then
            return UNIT_ULTRA_FOOTMAN
        endif
		if s == "SPELL_PET_ATTACK" then
            return SPELL_PET_ATTACK
        endif
		if s == "SPELL_PET_BRING_ITEMS" then
            return SPELL_PET_BRING_ITEMS
        endif
		if s == "SPELL_PET_DROP_ITEMS" then
            return SPELL_PET_DROP_ITEMS
        endif
		if s == "SPELL_PET_FOLLOW" then
            return SPELL_PET_FOLLOW
        endif
		if s == "SPELL_PET_GO_TO_HATCHERY" then
            return SPELL_PET_GO_TO_HATCHERY
        endif
		if s == "SPELL_PET_RELEASE" then
            return SPELL_PET_RELEASE
        endif
		if s == "SPELL_PET_SCOUT" then
            return SPELL_PET_SCOUT
        endif
		if s == "SPELL_PET_SLEEP" then
            return SPELL_PET_SLEEP
        endif
		if s == "SPELL_PET_STAY" then
            return SPELL_PET_STAY
        endif
		if s == "SPELL_PET_TAME" then
            return SPELL_PET_TAME
        endif
		if s == "SPELL_SMOKE_MEAT" then
            return SPELL_SMOKE_MEAT
        endif
		if s == "SPELL_PACK_BUILDING" then
            return SPELL_PACK_BUILDING
        endif
		if s == "SPELL_SELF_DESTRUCT" then
            return SPELL_SELF_DESTRUCT
        endif
		if s == "SPELL_DISEASE" then
            return SPELL_DISEASE
        endif
		if s == "SPELL_CURE_ALL_ITEM" then
            return SPELL_CURE_ALL_ITEM
        endif
		if s == "SPELL_SUPER_FORM_CAST" then
            return SPELL_SUPER_FORM_CAST
        endif
		if s == "SPELL_SONAR_COMPASS" then
            return SPELL_SONAR_COMPASS
        endif
		if s == "SPELL_SUPERSUB_COURAGE" then
            return SPELL_SUPERSUB_COURAGE
        endif
		if s == "SPELL_SPEAR_CAST" then
            return SPELL_SPEAR_CAST
        endif
		if s == "SPELL_IRON_SPEAR_CAST" then
            return SPELL_IRON_SPEAR_CAST
        endif
		if s == "SPELL_STEEL_SPEAR_CAST" then
            return SPELL_STEEL_SPEAR_CAST
        endif
		if s == "SPELL_POISON_SPEAR_CAST" then
            return SPELL_POISON_SPEAR_CAST
        endif
		if s == "SPELL_RPOISON_SPEAR_CAST" then
            return SPELL_RPOISON_SPEAR_CAST
        endif
		if s == "SPELL_UPOISON_SPEAR_CAST" then
            return SPELL_UPOISON_SPEAR_CAST
        endif
		if s == "SPELL_DARK_SPEAR_CAST" then
            return SPELL_DARK_SPEAR_CAST
        endif
		if s == "SPELL_DARK_SPEAR" then
            return SPELL_DARK_SPEAR
        endif
		if s == "SPELL_RPOISON_SPEAR" then
            return SPELL_RPOISON_SPEAR
        endif
		if s == "SPELL_POISON_SPEAR" then
            return SPELL_POISON_SPEAR
        endif
		if s == "SPELL_IRON_SPEAR" then
            return SPELL_IRON_SPEAR
        endif
		if s == "SPELL_UPOISON_SPEAR" then
            return SPELL_UPOISON_SPEAR
        endif
		if s == "SPELL_STEEL_SPEAR" then
            return SPELL_STEEL_SPEAR
        endif
		if s == "SPELL_SPEAR" then
            return SPELL_SPEAR
        endif
		if s == "SPELL_BATTLE_SPEAR_CAST" then
            return SPELL_BATTLE_SPEAR_CAST
        endif
		if s == "SPELL_DYSENTERY" then
            return SPELL_DYSENTERY
        endif
		if s == "ABILITY_LOCUST" then
            return ABILITY_LOCUST
        endif
		if s == "ABILITY_ASSASINATE" then
            return ABILITY_ASSASINATE
        endif
		if s == "ABILITY_MEU_DUMMY" then
            return ABILITY_MEU_DUMMY
        endif
		if s == "ABILITY_MEU_OMNIGATHERER" then
            return ABILITY_MEU_OMNIGATHERER
        endif
		if s == "ABILITY_MEU_DEMENTIA_MASTER" then
            return ABILITY_MEU_DEMENTIA_MASTER
        endif
		if s == "ABILITY_MEU_SAGE" then
            return ABILITY_MEU_SAGE
        endif
		if s == "ABILITY_MEU_SPY" then
            return ABILITY_MEU_SPY
        endif
		if s == "ABILITY_MEU_ASSASSIN" then
            return ABILITY_MEU_ASSASSIN
        endif
		if s == "ABILITY_INVULNERABLE" then
            return ABILITY_INVULNERABLE
        endif
		if s == "BUFF_GOK" then
            return BUFF_GOK
        endif
		if s == "BUFF_SPRINTING" then
            return BUFF_SPRINTING
        endif
		if s == "BUFF_SPEAR_INCOMING" then
            return BUFF_SPEAR_INCOMING
        endif
		if s == "BUFF_DYSENTERY" then
            return BUFF_DYSENTERY
        endif
		if s == "ITEM_ANCIENT_BOW" then
            return ITEM_ANCIENT_BOW
        endif
		if s == "ITEM_BOW_BLOOD_GOD" then
            return ITEM_BOW_BLOOD_GOD
        endif
		if s == "ITEM_CLAY_EXPLOSION" then
            return ITEM_CLAY_EXPLOSION
        endif
		if s == "ITEM_DD_PINION_FIRE" then
            return ITEM_DD_PINION_FIRE
        endif
		if s == "ITEM_DD_PINION_PAIN" then
            return ITEM_DD_PINION_PAIN
        endif
		if s == "ITEM_DD_PINION_SHADOW" then
            return ITEM_DD_PINION_SHADOW
        endif
		if s == "ITEM_DUSTY_OLD_BOW" then
            return ITEM_DUSTY_OLD_BOW
        endif
		if s == "ITEM_GLOWING_ANCIENT_BOW" then
            return ITEM_GLOWING_ANCIENT_BOW
        endif
		if s == "ITEM_HORN_MAMMOTH" then
            return ITEM_HORN_MAMMOTH
        endif
		if s == "ITEM_HYDRA_CLAWS" then
            return ITEM_HYDRA_CLAWS
        endif
		if s == "ITEM_HYDRA_SCALE" then
            return ITEM_HYDRA_SCALE
        endif
		if s == "ITEM_HYDRAAC_FINS" then
            return ITEM_HYDRAAC_FINS
        endif
		if s == "ITEM_MED_BEAST_MASTER" then
            return ITEM_MED_BEAST_MASTER
        endif
		if s == "ITEM_MED_PRIEST" then
            return ITEM_MED_PRIEST
        endif
		if s == "ITEM_MED_SCOUT" then
            return ITEM_MED_SCOUT
        endif
		if s == "ITEM_MED_GATHERER" then
            return ITEM_MED_GATHERER
        endif
		if s == "ITEM_MED_MAGE" then
            return ITEM_MED_MAGE
        endif
		if s == "ITEM_MED_THIEF" then
            return ITEM_MED_THIEF
        endif
		if s == "ITEM_MED_HUNTER" then
            return ITEM_MED_HUNTER
        endif
		if s == "ITEM_MED_HEAD_HUNER" then
            return ITEM_MED_HEAD_HUNER
        endif
		if s == "ITEM_THIEF_MED" then
            return ITEM_THIEF_MED
        endif
		if s == "ITEM_MEDALLION_COURAGE" then
            return ITEM_MEDALLION_COURAGE
        endif
		if s == "ITEM_BLUE_HERB" then
            return ITEM_BLUE_HERB
        endif
		if s == "ITEM_BONE" then
            return ITEM_BONE
        endif
		if s == "ITEM_BUTSU" then
            return ITEM_BUTSU
        endif
		if s == "ITEM_CLAY_BALL" then
            return ITEM_CLAY_BALL
        endif
		if s == "ITEM_ELK_HIDE" then
            return ITEM_ELK_HIDE
        endif
		if s == "ITEM_FLINT" then
            return ITEM_FLINT
        endif
		if s == "ITEM_HARDEN_SCALES" then
            return ITEM_HARDEN_SCALES
        endif
		if s == "ITEM_HAWK_EGG" then
            return ITEM_HAWK_EGG
        endif
		if s == "ITEM_JUNGLE_WOLF_HIDE" then
            return ITEM_JUNGLE_WOLF_HIDE
        endif
		if s == "ITEM_JUNGLE_BEAR_HIDE" then
            return ITEM_JUNGLE_BEAR_HIDE
        endif
		if s == "ITEM_MAGIC" then
            return ITEM_MAGIC
        endif
		if s == "ITEM_MANA_CRYSTAL" then
            return ITEM_MANA_CRYSTAL
        endif
		if s == "ITEM_MUSHROOM" then
            return ITEM_MUSHROOM
        endif
		if s == "ITEM_ORANGE_HERB" then
            return ITEM_ORANGE_HERB
        endif
		if s == "ITEM_PURPLE_HERB" then
            return ITEM_PURPLE_HERB
        endif
		if s == "ITEM_RIVER_STEM" then
            return ITEM_RIVER_STEM
        endif
		if s == "ITEM_RIVER_ROOT" then
            return ITEM_RIVER_ROOT
        endif
		if s == "ITEM_STICK" then
            return ITEM_STICK
        endif
		if s == "ITEM_STONE" then
            return ITEM_STONE
        endif
		if s == "ITEM_TINDER" then
            return ITEM_TINDER
        endif
		if s == "ITEM_YELLOW_HERB" then
            return ITEM_YELLOW_HERB
        endif
		if s == "ITEM_ACID_BOMB" then
            return ITEM_ACID_BOMB
        endif
		if s == "ITEM_ANTI_MAGIC_POTION" then
            return ITEM_ANTI_MAGIC_POTION
        endif
		if s == "ITEM_ANABOLIC_POTION" then
            return ITEM_ANABOLIC_POTION
        endif
		if s == "ITEM_CURE_ALL" then
            return ITEM_CURE_ALL
        endif
		if s == "ITEM_DISEASE_POTION" then
            return ITEM_DISEASE_POTION
        endif
		if s == "ITEM_DRUNKS_POTION" then
            return ITEM_DRUNKS_POTION
        endif
		if s == "ITEM_ELEMENTAL_SHIELD_POTION" then
            return ITEM_ELEMENTAL_SHIELD_POTION
        endif
		if s == "ITEM_ESSENCE_BEES" then
            return ITEM_ESSENCE_BEES
        endif
		if s == "ITEM_FERVER_POTION" then
            return ITEM_FERVER_POTION
        endif
		if s == "ITEM_HEALING_POTION_I" then
            return ITEM_HEALING_POTION_I
        endif
		if s == "ITEM_HEALING_POTION_II" then
            return ITEM_HEALING_POTION_II
        endif
		if s == "ITEM_HEALING_POTION_III" then
            return ITEM_HEALING_POTION_III
        endif
		if s == "ITEM_HEALING_POTION_IV" then
            return ITEM_HEALING_POTION_IV
        endif
		if s == "ITEM_MANA_POTION_I" then
            return ITEM_MANA_POTION_I
        endif
		if s == "ITEM_MANA_POTION_II" then
            return ITEM_MANA_POTION_II
        endif
		if s == "ITEM_MANA_POTION_III" then
            return ITEM_MANA_POTION_III
        endif
		if s == "ITEM_MANA_POTION_IV" then
            return ITEM_MANA_POTION_IV
        endif
		if s == "ITEM_NAPALM" then
            return ITEM_NAPALM
        endif
		if s == "ITEM_NETHER_POTION" then
            return ITEM_NETHER_POTION
        endif
		if s == "ITEM_POTION_TWIN_ISLANDS" then
            return ITEM_POTION_TWIN_ISLANDS
        endif
		if s == "ITEM_OMNICURE" then
            return ITEM_OMNICURE
        endif
		if s == "ITEM_DARK_ROCK" then
            return ITEM_DARK_ROCK
        endif
		if s == "ITEM_GEM_OF_KNOWLEDGE" then
            return ITEM_GEM_OF_KNOWLEDGE
        endif
		if s == "ITEM_SPIRIT_WATER" then
            return ITEM_SPIRIT_WATER
        endif
		if s == "ITEM_SPIRIT_WIND" then
            return ITEM_SPIRIT_WIND
        endif
		if s == "ITEM_ACORN" then
            return ITEM_ACORN
        endif
		if s == "ITEM_COOKED_MEAT" then
            return ITEM_COOKED_MEAT
        endif
		if s == "ITEM_DISEASED_MEAT" then
            return ITEM_DISEASED_MEAT
        endif
		if s == "ITEM_MAGIC_ACORN" then
            return ITEM_MAGIC_ACORN
        endif
		if s == "ITEM_SMOKED_MEAT" then
            return ITEM_SMOKED_MEAT
        endif
		if s == "ITEM_ANABOLIC_BOOTS" then
            return ITEM_ANABOLIC_BOOTS
        endif
		if s == "ITEM_BATTLE_ARMOR" then
            return ITEM_BATTLE_ARMOR
        endif
		if s == "ITEM_BATTLE_AXE" then
            return ITEM_BATTLE_AXE
        endif
		if s == "ITEM_BATTLE_GLOVES" then
            return ITEM_BATTLE_GLOVES
        endif
		if s == "ITEM_BATTLE_SHIELD" then
            return ITEM_BATTLE_SHIELD
        endif
		if s == "ITEM_BATTLE_SUIT" then
            return ITEM_BATTLE_SUIT
        endif
		if s == "ITEM_BEE_HIVE" then
            return ITEM_BEE_HIVE
        endif
		if s == "ITEM_BLOW_GUN" then
            return ITEM_BLOW_GUN
        endif
		if s == "ITEM_CAMOUFLAGE_COAT" then
            return ITEM_CAMOUFLAGE_COAT
        endif
		if s == "ITEM_DARK_THISTLES" then
            return ITEM_DARK_THISTLES
        endif
		if s == "ITEM_EMP" then
            return ITEM_EMP
        endif
		if s == "ITEM_FIRE_BOMB" then
            return ITEM_FIRE_BOMB
        endif
		if s == "ITEM_NETS" then
            return ITEM_NETS
        endif
		if s == "ITEM_SMOKE_BOMB" then
            return ITEM_SMOKE_BOMB
        endif
		if s == "ITEM_SONAR_COMPASS" then
            return ITEM_SONAR_COMPASS
        endif
		if s == "ITEM_THISTLES" then
            return ITEM_THISTLES
        endif
		if s == "ITEM_CLOAK_OF_FLAMES" then
            return ITEM_CLOAK_OF_FLAMES
        endif
		if s == "ITEM_CLOAK_OF_FROST" then
            return ITEM_CLOAK_OF_FROST
        endif
		if s == "ITEM_CLOAK_OF_HEALING" then
            return ITEM_CLOAK_OF_HEALING
        endif
		if s == "ITEM_LIVING_CLAY" then
            return ITEM_LIVING_CLAY
        endif
		if s == "ITEM_MAGIC_SEED" then
            return ITEM_MAGIC_SEED
        endif
		if s == "ITEM_POISON" then
            return ITEM_POISON
        endif
		if s == "ITEM_POISON_SPEAR" then
            return ITEM_POISON_SPEAR
        endif
		if s == "ITEM_REFINED_POISON_SPEAR" then
            return ITEM_REFINED_POISON_SPEAR
        endif
		if s == "ITEM_SCROLL_SWIFTNESS" then
            return ITEM_SCROLL_SWIFTNESS
        endif
		if s == "ITEM_SCROLL_CYCLONE" then
            return ITEM_SCROLL_CYCLONE
        endif
		if s == "ITEM_SCROLL_ENTANGLING_ROOTS" then
            return ITEM_SCROLL_ENTANGLING_ROOTS
        endif
		if s == "ITEM_SCROLL_FIREBALL" then
            return ITEM_SCROLL_FIREBALL
        endif
		if s == "ITEM_SCROLL_LIVING_DEAD" then
            return ITEM_SCROLL_LIVING_DEAD
        endif
		if s == "ITEM_SCROLL_STONE_ARMOR" then
            return ITEM_SCROLL_STONE_ARMOR
        endif
		if s == "ITEM_SCROLL_TSUNAMI" then
            return ITEM_SCROLL_TSUNAMI
        endif
		if s == "ITEM_ULTRA_POISON" then
            return ITEM_ULTRA_POISON
        endif
		if s == "ITEM_ULTRA_POISON_SPEAR" then
            return ITEM_ULTRA_POISON_SPEAR
        endif
		if s == "ITEM_BONE_BOOTS" then
            return ITEM_BONE_BOOTS
        endif
		if s == "ITEM_BONE_COAT" then
            return ITEM_BONE_COAT
        endif
		if s == "ITEM_BONE_GLOVES" then
            return ITEM_BONE_GLOVES
        endif
		if s == "ITEM_BONE_SHIELD" then
            return ITEM_BONE_SHIELD
        endif
		if s == "ITEM_DARK_SPEAR" then
            return ITEM_DARK_SPEAR
        endif
		if s == "ITEM_FLINT_AXE" then
            return ITEM_FLINT_AXE
        endif
		if s == "ITEM_IRON_AXE" then
            return ITEM_IRON_AXE
        endif
		if s == "ITEM_IRON_BOOTS" then
            return ITEM_IRON_BOOTS
        endif
		if s == "ITEM_IRON_COAT" then
            return ITEM_IRON_COAT
        endif
		if s == "ITEM_IRON_GLOVES" then
            return ITEM_IRON_GLOVES
        endif
		if s == "ITEM_IRON_INGOT" then
            return ITEM_IRON_INGOT
        endif
		if s == "ITEM_IRON_SHIELD" then
            return ITEM_IRON_SHIELD
        endif
		if s == "ITEM_IRON_SPEAR" then
            return ITEM_IRON_SPEAR
        endif
		if s == "ITEM_MAGE_MASHER" then
            return ITEM_MAGE_MASHER
        endif
		if s == "ITEM_SHIELD" then
            return ITEM_SHIELD
        endif
		if s == "ITEM_SPEAR" then
            return ITEM_SPEAR
        endif
		if s == "ITEM_STEEL_AXE" then
            return ITEM_STEEL_AXE
        endif
		if s == "ITEM_STEEL_BOOTS" then
            return ITEM_STEEL_BOOTS
        endif
		if s == "ITEM_STEEL_COAT" then
            return ITEM_STEEL_COAT
        endif
		if s == "ITEM_STEEL_GLOVES" then
            return ITEM_STEEL_GLOVES
        endif
		if s == "ITEM_STEEL_INGOT" then
            return ITEM_STEEL_INGOT
        endif
		if s == "ITEM_STEEL_SHIELD" then
            return ITEM_STEEL_SHIELD
        endif
		if s == "ITEM_STEEL_SPEAR" then
            return ITEM_STEEL_SPEAR
        endif
		if s == "ITEM_STONE_AXE" then
            return ITEM_STONE_AXE
        endif
		if s == "ITEM_LOADED_THISTLES" then
            return ITEM_LOADED_THISTLES
        endif
		if s == "ITEM_LOADED_DARK_THISTLES" then
            return ITEM_LOADED_DARK_THISTLES
        endif
		if s == "ITEM_LOADED_BONE" then
            return ITEM_LOADED_BONE
        endif
		if s == "ITEM_BEAR_SKIN_BOOTS" then
            return ITEM_BEAR_SKIN_BOOTS
        endif
		if s == "ITEM_BEAR_SKIN_COAT" then
            return ITEM_BEAR_SKIN_COAT
        endif
		if s == "ITEM_BEAR_SKIN_GLOVES" then
            return ITEM_BEAR_SKIN_GLOVES
        endif
		if s == "ITEM_ELK_SKIN_BOOTS" then
            return ITEM_ELK_SKIN_BOOTS
        endif
		if s == "ITEM_ELK_SKIN_COAT" then
            return ITEM_ELK_SKIN_COAT
        endif
		if s == "ITEM_ELK_SKIN_GLOVES" then
            return ITEM_ELK_SKIN_GLOVES
        endif
		if s == "ITEM_WOLF_SKIN_BOOTS" then
            return ITEM_WOLF_SKIN_BOOTS
        endif
		if s == "ITEM_WOLF_SKIN_COAT" then
            return ITEM_WOLF_SKIN_COAT
        endif
		if s == "ITEM_WOLF_SKIN_GLOVES" then
            return ITEM_WOLF_SKIN_GLOVES
        endif
		if s == "ITEM_ARMORY_KIT" then
            return ITEM_ARMORY_KIT
        endif
		if s == "ITEM_DEFENSIVE_WARD_KIT" then
            return ITEM_DEFENSIVE_WARD_KIT
        endif
		if s == "ITEM_ENSNARE_TRAP_KIT" then
            return ITEM_ENSNARE_TRAP_KIT
        endif
		if s == "ITEM_FIRE_KIT" then
            return ITEM_FIRE_KIT
        endif
		if s == "ITEM_HATCHERY_KIT" then
            return ITEM_HATCHERY_KIT
        endif
		if s == "ITEM_MAGE_FIRE_KIT" then
            return ITEM_MAGE_FIRE_KIT
        endif
		if s == "ITEM_MUD_HUT_KIT" then
            return ITEM_MUD_HUT_KIT
        endif
		if s == "ITEM_OMNIDEFENDER_KIT" then
            return ITEM_OMNIDEFENDER_KIT
        endif
		if s == "ITEM_POT_KIT" then
            return ITEM_POT_KIT
        endif
		if s == "ITEM_SMOKE_HOUSE_KIT" then
            return ITEM_SMOKE_HOUSE_KIT
        endif
		if s == "ITEM_SPIRIT_WARD_KIT" then
            return ITEM_SPIRIT_WARD_KIT
        endif
		if s == "ITEM_STORAGE_HUT_KIT" then
            return ITEM_STORAGE_HUT_KIT
        endif
		if s == "ITEM_TANNERY_KIT" then
            return ITEM_TANNERY_KIT
        endif
		if s == "ITEM_TELEPORT_BEACON_KIT" then
            return ITEM_TELEPORT_BEACON_KIT
        endif
		if s == "ITEM_TENT_KIT" then
            return ITEM_TENT_KIT
        endif
		if s == "ITEM_TRANSPORT_SHIP_KIT" then
            return ITEM_TRANSPORT_SHIP_KIT
        endif
		if s == "ITEM_TROLL_BURROW_KIT" then
            return ITEM_TROLL_BURROW_KIT
        endif
		if s == "ITEM_TROLL_HUT_KIT" then
            return ITEM_TROLL_HUT_KIT
        endif
		if s == "ITEM_WITCH_DOCTORS_HUT_KIT" then
            return ITEM_WITCH_DOCTORS_HUT_KIT
        endif
		if s == "ITEM_WORKSHOP_KIT" then
            return ITEM_WORKSHOP_KIT
        endif
		if s == "ITEM_BATTLE_SUIT_SPELLS" then
            return ITEM_BATTLE_SUIT_SPELLS
        endif
		if s == "ITEM_BATTLE_SUIT_SPELLS_TWO" then
            return ITEM_BATTLE_SUIT_SPELLS_TWO
        endif
		if s == "ITEM_CHEESE" then
            return ITEM_CHEESE
        endif
		if s == "ITEM_HEAD_HUNTER_STEEL_SPEAR" then
            return ITEM_HEAD_HUNTER_STEEL_SPEAR
        endif
		if s == "ITEM_HERB_RECIPE_1" then
            return ITEM_HERB_RECIPE_1
        endif
		if s == "ITEM_HERB_RECIPE_2" then
            return ITEM_HERB_RECIPE_2
        endif
		if s == "ITEM_HERB_RECIPE_3" then
            return ITEM_HERB_RECIPE_3
        endif
		if s == "ITEM_HERB_RECIPE_4" then
            return ITEM_HERB_RECIPE_4
        endif
		if s == "ITEM_HERB_RECIPE_5" then
            return ITEM_HERB_RECIPE_5
        endif
		if s == "ITEM_HERB_RECIPE_6" then
            return ITEM_HERB_RECIPE_6
        endif
		if s == "ITEM_HERB_RECIPE_7" then
            return ITEM_HERB_RECIPE_7
        endif
		if s == "ITEM_HERB_RECIPE_8" then
            return ITEM_HERB_RECIPE_8
        endif
		if s == "ITEM_HERB_RECIPE_9" then
            return ITEM_HERB_RECIPE_9
        endif
		if s == "ITEM_HERB_RECIPE_10" then
            return ITEM_HERB_RECIPE_10
        endif
		if s == "ITEM_HERB_RECIPE_11" then
            return ITEM_HERB_RECIPE_11
        endif
		if s == "ITEM_HYDRA_HINT" then
            return ITEM_HYDRA_HINT
        endif
		if s == "ITEM_OPPOSING_NIGHT_ITEM" then
            return ITEM_OPPOSING_NIGHT_ITEM
        endif
		if s == "ITEM_PANTHER_HIDE" then
            return ITEM_PANTHER_HIDE
        endif
		if s == "ITEM_SECRET_HINT" then
            return ITEM_SECRET_HINT
        endif
		if s == "ITEM_TOME_LOSS" then
            return ITEM_TOME_LOSS
        endif
		if s == "ITEM_REPAIR_HAMMER" then
            return ITEM_REPAIR_HAMMER
        endif
		if s == "ITEM_NULL" then
            return ITEM_NULL
        endif
		if s == "ITEM_CANDY_CANE" then
            return ITEM_CANDY_CANE
        endif
		if s == "ITEM_BLINK" then
            return ITEM_BLINK
        endif
		if s == "DEST_FALSE_TREE" then
            return DEST_FALSE_TREE
        endif
		if s == "DEST_RUINS_TREE" then
            return DEST_RUINS_TREE
        endif
		if s == "DEST_RUINS_TREE_CANOPY" then
            return DEST_RUINS_TREE_CANOPY
        endif
		if s == "DEST_RUINS_TREE_ITEM" then
            return DEST_RUINS_TREE_ITEM
        endif
		if s == "DEST_SUPER_TREE" then
            return DEST_SUPER_TREE
        endif
		if s == "DEST_SUPER_TREE_CANOPY" then
            return DEST_SUPER_TREE_CANOPY
        endif

		return 0
	endfunction

	function ID2S takes integer i returns string
		if i == UNIT_HUNTER then
            return "UNIT_HUNTER"
        endif
		if i == UNIT_HUNTER_1 then
            return "UNIT_HUNTER_1"
        endif
		if i == UNIT_TRACKER then
            return "UNIT_TRACKER"
        endif
		if i == UNIT_WARRIOR then
            return "UNIT_WARRIOR"
        endif
		if i == UNIT_JUGGERNAUT then
            return "UNIT_JUGGERNAUT"
        endif
		if i == UNIT_BEAST_MASTER then
            return "UNIT_BEAST_MASTER"
        endif
		if i == UNIT_TRUE_FORM then
            return "UNIT_TRUE_FORM"
        endif
		if i == UNIT_DRUID then
            return "UNIT_DRUID"
        endif
		if i == UNIT_CHICKEN_FORM then
            return "UNIT_CHICKEN_FORM"
        endif
		if i == UNIT_ULTIMATE_FORM then
            return "UNIT_ULTIMATE_FORM"
        endif
		if i == UNIT_BEAST_MASTER_1 then
            return "UNIT_BEAST_MASTER_1"
        endif
		if i == UNIT_SHAPESHIFTER_WOLF then
            return "UNIT_SHAPESHIFTER_WOLF"
        endif
		if i == UNIT_SHAPESHIFTER_BEAR then
            return "UNIT_SHAPESHIFTER_BEAR"
        endif
		if i == UNIT_SHAPESHIFTER_PANTHER then
            return "UNIT_SHAPESHIFTER_PANTHER"
        endif
		if i == UNIT_SHAPESHIFTER_TIGER then
            return "UNIT_SHAPESHIFTER_TIGER"
        endif
		if i == UNIT_MAGE then
            return "UNIT_MAGE"
        endif
		if i == UNIT_MAGE_1 then
            return "UNIT_MAGE_1"
        endif
		if i == UNIT_ELEMENTALIST then
            return "UNIT_ELEMENTALIST"
        endif
		if i == UNIT_ELEMENTALIST_1 then
            return "UNIT_ELEMENTALIST_1"
        endif
		if i == UNIT_HYPNOTIST then
            return "UNIT_HYPNOTIST"
        endif
		if i == UNIT_DEMENTIA_MASTER then
            return "UNIT_DEMENTIA_MASTER"
        endif
		if i == UNIT_PRIEST then
            return "UNIT_PRIEST"
        endif
		if i == UNIT_BOOSTER then
            return "UNIT_BOOSTER"
        endif
		if i == UNIT_BOOSTER_1 then
            return "UNIT_BOOSTER_1"
        endif
		if i == UNIT_MASTER_HEALER then
            return "UNIT_MASTER_HEALER"
        endif
		if i == UNIT_SAGE then
            return "UNIT_SAGE"
        endif
		if i == UNIT_THIEF then
            return "UNIT_THIEF"
        endif
		if i == UNIT_ESCAPE_ARTIST then
            return "UNIT_ESCAPE_ARTIST"
        endif
		if i == UNIT_CONTORTIONIST then
            return "UNIT_CONTORTIONIST"
        endif
		if i == UNIT_ASSASSIN then
            return "UNIT_ASSASSIN"
        endif
		if i == UNIT_SCOUT then
            return "UNIT_SCOUT"
        endif
		if i == UNIT_OBSERVER then
            return "UNIT_OBSERVER"
        endif
		if i == UNIT_RADAR_SCOUT then
            return "UNIT_RADAR_SCOUT"
        endif
		if i == UNIT_SPY then
            return "UNIT_SPY"
        endif
		if i == UNIT_GATHERER then
            return "UNIT_GATHERER"
        endif
		if i == UNIT_RADAR_GATHERER then
            return "UNIT_RADAR_GATHERER"
        endif
		if i == UNIT_HERB_MASTER then
            return "UNIT_HERB_MASTER"
        endif
		if i == UNIT_OMNIGATHERER then
            return "UNIT_OMNIGATHERER"
        endif
		if i == UNIT_REPICK_TROLL then
            return "UNIT_REPICK_TROLL"
        endif
		if i == UNIT_DRUNKEN_TROLL then
            return "UNIT_DRUNKEN_TROLL"
        endif
		if i == UNIT_TROLL_BRAWLER then
            return "UNIT_TROLL_BRAWLER"
        endif
		if i == UNIT_TROLL_BREWMASTER then
            return "UNIT_TROLL_BREWMASTER"
        endif
		if i == UNIT_ISLAND_TROLL then
            return "UNIT_ISLAND_TROLL"
        endif
		if i == UNIT_HEAD_HUNTER then
            return "UNIT_HEAD_HUNTER"
        endif
		if i == UNIT_ARCHER_INTREPIDE then
            return "UNIT_ARCHER_INTREPIDE"
        endif
		if i == UNIT_MIRROR_TROLL then
            return "UNIT_MIRROR_TROLL"
        endif
		if i == UNIT_MIRROR_TROLL_CLONE then
            return "UNIT_MIRROR_TROLL_CLONE"
        endif
		if i == UNIT_NECROMANCER then
            return "UNIT_NECROMANCER"
        endif
		if i == UNIT_SHAMAN then
            return "UNIT_SHAMAN"
        endif
		if i == UNIT_SHADOW_ARCHER then
            return "UNIT_SHADOW_ARCHER"
        endif
		if i == UNIT_SHADOW_HUNTER then
            return "UNIT_SHADOW_HUNTER"
        endif
		if i == UNIT_SPIRIT_WALKER then
            return "UNIT_SPIRIT_WALKER"
        endif
		if i == UNIT_TRACKER_TOURNY_2011 then
            return "UNIT_TRACKER_TOURNY_2011"
        endif
		if i == UNIT_TRICKSTER then
            return "UNIT_TRICKSTER"
        endif
		if i == UNIT_TROLL_CONARTIST then
            return "UNIT_TROLL_CONARTIST"
        endif
		if i == UNIT_TROLL_MAGE_ALT then
            return "UNIT_TROLL_MAGE_ALT"
        endif
		if i == UNIT_TROLL_WITCH_DOCTOR then
            return "UNIT_TROLL_WITCH_DOCTOR"
        endif
		if i == UNIT_EA_TOURNY_2011 then
            return "UNIT_EA_TOURNY_2011"
        endif
		if i == UNIT_ALIGATOR_MAN then
            return "UNIT_ALIGATOR_MAN"
        endif
		if i == UNIT_ANCIENT_HYDRA then
            return "UNIT_ANCIENT_HYDRA"
        endif
		if i == UNIT_DISCO_DUCK then
            return "UNIT_DISCO_DUCK"
        endif
		if i == UNIT_LESSER_HYDRA then
            return "UNIT_LESSER_HYDRA"
        endif
		if i == UNIT_MAGENTA_FISH then
            return "UNIT_MAGENTA_FISH"
        endif
		if i == UNIT_MAMMOTH then
            return "UNIT_MAMMOTH"
        endif
		if i == UNIT_ONE then
            return "UNIT_ONE"
        endif
		if i == UNIT_RAPID_TURTLE then
            return "UNIT_RAPID_TURTLE"
        endif
		if i == UNIT_ADULT_ELK then
            return "UNIT_ADULT_ELK"
        endif
		if i == UNIT_ADULT_JUNGLE_BEAR then
            return "UNIT_ADULT_JUNGLE_BEAR"
        endif
		if i == UNIT_ADULT_JUNGLE_WOLF then
            return "UNIT_ADULT_JUNGLE_WOLF"
        endif
		if i == UNIT_ALPHA_HAWK then
            return "UNIT_ALPHA_HAWK"
        endif
		if i == UNIT_BRONZE_DRAGON then
            return "UNIT_BRONZE_DRAGON"
        endif
		if i == UNIT_BRONZE_DRAGON_HATCHLING then
            return "UNIT_BRONZE_DRAGON_HATCHLING"
        endif
		if i == UNIT_BEAR_CUB then
            return "UNIT_BEAR_CUB"
        endif
		if i == UNIT_ELDER_PANTHER then
            return "UNIT_ELDER_PANTHER"
        endif
		if i == UNIT_ELK then
            return "UNIT_ELK"
        endif
		if i == UNIT_ELK_ADOLESCENT then
            return "UNIT_ELK_ADOLESCENT"
        endif
		if i == UNIT_FAWN then
            return "UNIT_FAWN"
        endif
		if i == UNIT_FISH then
            return "UNIT_FISH"
        endif
		if i == UNIT_FOREST_DRAGON then
            return "UNIT_FOREST_DRAGON"
        endif
		if i == UNIT_FOREST_DRAGON_HATCHLING then
            return "UNIT_FOREST_DRAGON_HATCHLING"
        endif
		if i == UNIT_GREATER_BRONZE_DRAGON then
            return "UNIT_GREATER_BRONZE_DRAGON"
        endif
		if i == UNIT_GREATER_FOREST_DRAGON then
            return "UNIT_GREATER_FOREST_DRAGON"
        endif
		if i == UNIT_GREATER_NETHER_DRAGON then
            return "UNIT_GREATER_NETHER_DRAGON"
        endif
		if i == UNIT_GREATER_RED_DRAGON then
            return "UNIT_GREATER_RED_DRAGON"
        endif
		if i == UNIT_GREEN_FISH then
            return "UNIT_GREEN_FISH"
        endif
		if i == UNIT_HAWK then
            return "UNIT_HAWK"
        endif
		if i == UNIT_HAWK_ADOLESCENT then
            return "UNIT_HAWK_ADOLESCENT"
        endif
		if i == UNIT_HAWK_HATCHLING then
            return "UNIT_HAWK_HATCHLING"
        endif
		if i == UNIT_JUNGLE_BEAR then
            return "UNIT_JUNGLE_BEAR"
        endif
		if i == UNIT_JUNGLE_WOLF then
            return "UNIT_JUNGLE_WOLF"
        endif
		if i == UNIT_NETHER_DRAGON_HATCHLING then
            return "UNIT_NETHER_DRAGON_HATCHLING"
        endif
		if i == UNIT_PANTHER then
            return "UNIT_PANTHER"
        endif
		if i == UNIT_RED_DRAGON_HATCHLING then
            return "UNIT_RED_DRAGON_HATCHLING"
        endif
		if i == UNIT_SNAKE then
            return "UNIT_SNAKE"
        endif
		if i == UNIT_WOLF_PUP then
            return "UNIT_WOLF_PUP"
        endif
		if i == UNIT_ARMORY then
            return "UNIT_ARMORY"
        endif
		if i == UNIT_BUILDING_TREE then
            return "UNIT_BUILDING_TREE"
        endif
		if i == UNIT_FIRE then
            return "UNIT_FIRE"
        endif
		if i == UNIT_DEFENSE_WARD then
            return "UNIT_DEFENSE_WARD"
        endif
		if i == UNIT_ENSNARE_TRAP then
            return "UNIT_ENSNARE_TRAP"
        endif
		if i == UNIT_HATCHERY then
            return "UNIT_HATCHERY"
        endif
		if i == UNIT_MAGE_FIRE then
            return "UNIT_MAGE_FIRE"
        endif
		if i == UNIT_MAGE_FIRE_SUMMONED then
            return "UNIT_MAGE_FIRE_SUMMONED"
        endif
		if i == UNIT_POT then
            return "UNIT_POT"
        endif
		if i == UNIT_MUD_HUT then
            return "UNIT_MUD_HUT"
        endif
		if i == UNIT_OMNITOWER then
            return "UNIT_OMNITOWER"
        endif
		if i == UNIT_SMOKE_HOUSE then
            return "UNIT_SMOKE_HOUSE"
        endif
		if i == UNIT_SPIRIT_WARD then
            return "UNIT_SPIRIT_WARD"
        endif
		if i == UNIT_STORAGE_HUT then
            return "UNIT_STORAGE_HUT"
        endif
		if i == UNIT_TANNERY then
            return "UNIT_TANNERY"
        endif
		if i == UNIT_TELEPORTATION_BEACON then
            return "UNIT_TELEPORTATION_BEACON"
        endif
		if i == UNIT_TENT then
            return "UNIT_TENT"
        endif
		if i == UNIT_TROLL_BURROW then
            return "UNIT_TROLL_BURROW"
        endif
		if i == UNIT_TROLL_HUT then
            return "UNIT_TROLL_HUT"
        endif
		if i == UNIT_TROLL_TOTEM then
            return "UNIT_TROLL_TOTEM"
        endif
		if i == UNIT_TROLL_TRANSPORT_SHIP then
            return "UNIT_TROLL_TRANSPORT_SHIP"
        endif
		if i == UNIT_WITCH_DOCTORS_HUT then
            return "UNIT_WITCH_DOCTORS_HUT"
        endif
		if i == UNIT_WORKSHOP then
            return "UNIT_WORKSHOP"
        endif
		if i == UNIT_POWER_GENERATOR then
            return "UNIT_POWER_GENERATOR"
        endif
		if i == UNIT_BLUE_HERB_BUSH then
            return "UNIT_BLUE_HERB_BUSH"
        endif
		if i == UNIT_HAISETSU_BUSH then
            return "UNIT_HAISETSU_BUSH"
        endif
		if i == UNIT_HIDDEN_STASH then
            return "UNIT_HIDDEN_STASH"
        endif
		if i == UNIT_MUSHROOM_COLONY then
            return "UNIT_MUSHROOM_COLONY"
        endif
		if i == UNIT_ORANGE_HERB_BUSH then
            return "UNIT_ORANGE_HERB_BUSH"
        endif
		if i == UNIT_PURPLE_HERB_BUSH then
            return "UNIT_PURPLE_HERB_BUSH"
        endif
		if i == UNIT_SCOUTS_BUSH then
            return "UNIT_SCOUTS_BUSH"
        endif
		if i == UNIT_THIEFS_BUSH then
            return "UNIT_THIEFS_BUSH"
        endif
		if i == UNIT_THISTLE_SHRUB then
            return "UNIT_THISTLE_SHRUB"
        endif
		if i == UNIT_WATER_HERB_BUSH then
            return "UNIT_WATER_HERB_BUSH"
        endif
		if i == UNIT_YELLOW_HERB_BUSH then
            return "UNIT_YELLOW_HERB_BUSH"
        endif
		if i == UNIT_CRAFT_MASTER then
            return "UNIT_CRAFT_MASTER"
        endif
		if i == UNIT_OMINOUS_ALTAR then
            return "UNIT_OMINOUS_ALTAR"
        endif
		if i == UNIT_TRADE_SHIP_1 then
            return "UNIT_TRADE_SHIP_1"
        endif
		if i == UNIT_TRADE_SHIP_2 then
            return "UNIT_TRADE_SHIP_2"
        endif
		if i == UNIT_TRADE_SHIP_3 then
            return "UNIT_TRADE_SHIP_3"
        endif
		if i == UNIT_TRADE_SHIP_4 then
            return "UNIT_TRADE_SHIP_4"
        endif
		if i == UNIT_TRADE_SHIP_5 then
            return "UNIT_TRADE_SHIP_5"
        endif
		if i == UNIT_TRADE_SHIP_6 then
            return "UNIT_TRADE_SHIP_6"
        endif
		if i == UNIT_TROLL_MERCHANT then
            return "UNIT_TROLL_MERCHANT"
        endif
		if i == UNIT_BLUR_IMAGE then
            return "UNIT_BLUR_IMAGE"
        endif
		if i == UNIT_BEE then
            return "UNIT_BEE"
        endif
		if i == UNIT_BEE_HIVE then
            return "UNIT_BEE_HIVE"
        endif
		if i == UNIT_BEE_HIVE_SUMMONED then
            return "UNIT_BEE_HIVE_SUMMONED"
        endif
		if i == UNIT_DISEASE_CLOUD then
            return "UNIT_DISEASE_CLOUD"
        endif
		if i == UNIT_DUMMY then
            return "UNIT_DUMMY"
        endif
		if i == UNIT_AMHS_DUMMY then
            return "UNIT_AMHS_DUMMY"
        endif
		if i == UNIT_UNUSED_DUMMY then
            return "UNIT_UNUSED_DUMMY"
        endif
		if i == UNIT_LIVING_CLAY then
            return "UNIT_LIVING_CLAY"
        endif
		if i == UNIT_LOCUST then
            return "UNIT_LOCUST"
        endif
		if i == UNIT_LOCUST_ALT then
            return "UNIT_LOCUST_ALT"
        endif
		if i == UNIT_LOCUST_DARK_NODE then
            return "UNIT_LOCUST_DARK_NODE"
        endif
		if i == UNIT_LOCUST_FIRE_LORD then
            return "UNIT_LOCUST_FIRE_LORD"
        endif
		if i == UNIT_LOCUST_GHOST then
            return "UNIT_LOCUST_GHOST"
        endif
		if i == UNIT_LOCUST_INNER_FIRE then
            return "UNIT_LOCUST_INNER_FIRE"
        endif
		if i == UNIT_LOCUST_KA then
            return "UNIT_LOCUST_KA"
        endif
		if i == UNIT_LOCUST_LEZ then
            return "UNIT_LOCUST_LEZ"
        endif
		if i == UNIT_LOCUST_LIGHT_NODE then
            return "UNIT_LOCUST_LIGHT_NODE"
        endif
		if i == UNIT_LOCUST_NEL then
            return "UNIT_LOCUST_NEL"
        endif
		if i == UNIT_LOCUST_OPPOSING_PANTHER then
            return "UNIT_LOCUST_OPPOSING_PANTHER"
        endif
		if i == UNIT_LOCUST_POOP then
            return "UNIT_LOCUST_POOP"
        endif
		if i == UNIT_LOCUST_SKELETON then
            return "UNIT_LOCUST_SKELETON"
        endif
		if i == UNIT_LOCUST_WATER_LORD then
            return "UNIT_LOCUST_WATER_LORD"
        endif
		if i == UNIT_MASTER_CASTER then
            return "UNIT_MASTER_CASTER"
        endif
		if i == UNIT_TRADE_ZEPPELIN then
            return "UNIT_TRADE_ZEPPELIN"
        endif
		if i == UNIT_UBER_HIVE then
            return "UNIT_UBER_HIVE"
        endif
		if i == UNIT_ROCK then
            return "UNIT_ROCK"
        endif
		if i == UNIT_CHICKEN then
            return "UNIT_CHICKEN"
        endif
		if i == UNIT_FARM then
            return "UNIT_FARM"
        endif
		if i == UNIT_FOOTMAN then
            return "UNIT_FOOTMAN"
        endif
		if i == UNIT_HERO_PICKER then
            return "UNIT_HERO_PICKER"
        endif
		if i == UNIT_LIVING_CLAY_UNUSED then
            return "UNIT_LIVING_CLAY_UNUSED"
        endif
		if i == UNIT_MEAT then
            return "UNIT_MEAT"
        endif
		if i == UNIT_PEASANT then
            return "UNIT_PEASANT"
        endif
		if i == UNIT_PEON then
            return "UNIT_PEON"
        endif
		if i == UNIT_SMOKED_MEAT then
            return "UNIT_SMOKED_MEAT"
        endif
		if i == UNIT_SOUL_REFLECTION_1 then
            return "UNIT_SOUL_REFLECTION_1"
        endif
		if i == UNIT_SOUL_REFLECTION_2 then
            return "UNIT_SOUL_REFLECTION_2"
        endif
		if i == UNIT_SOUL_REFLECTION_3 then
            return "UNIT_SOUL_REFLECTION_3"
        endif
		if i == UNIT_TEST_CLOAK then
            return "UNIT_TEST_CLOAK"
        endif
		if i == UNIT_ULTRA_FOOTMAN then
            return "UNIT_ULTRA_FOOTMAN"
        endif
		if i == SPELL_PET_ATTACK then
            return "SPELL_PET_ATTACK"
        endif
		if i == SPELL_PET_BRING_ITEMS then
            return "SPELL_PET_BRING_ITEMS"
        endif
		if i == SPELL_PET_DROP_ITEMS then
            return "SPELL_PET_DROP_ITEMS"
        endif
		if i == SPELL_PET_FOLLOW then
            return "SPELL_PET_FOLLOW"
        endif
		if i == SPELL_PET_GO_TO_HATCHERY then
            return "SPELL_PET_GO_TO_HATCHERY"
        endif
		if i == SPELL_PET_RELEASE then
            return "SPELL_PET_RELEASE"
        endif
		if i == SPELL_PET_SCOUT then
            return "SPELL_PET_SCOUT"
        endif
		if i == SPELL_PET_SLEEP then
            return "SPELL_PET_SLEEP"
        endif
		if i == SPELL_PET_STAY then
            return "SPELL_PET_STAY"
        endif
		if i == SPELL_PET_TAME then
            return "SPELL_PET_TAME"
        endif
		if i == SPELL_SMOKE_MEAT then
            return "SPELL_SMOKE_MEAT"
        endif
		if i == SPELL_PACK_BUILDING then
            return "SPELL_PACK_BUILDING"
        endif
		if i == SPELL_SELF_DESTRUCT then
            return "SPELL_SELF_DESTRUCT"
        endif
		if i == SPELL_DISEASE then
            return "SPELL_DISEASE"
        endif
		if i == SPELL_CURE_ALL_ITEM then
            return "SPELL_CURE_ALL_ITEM"
        endif
		if i == SPELL_SUPER_FORM_CAST then
            return "SPELL_SUPER_FORM_CAST"
        endif
		if i == SPELL_SONAR_COMPASS then
            return "SPELL_SONAR_COMPASS"
        endif
		if i == SPELL_SUPERSUB_COURAGE then
            return "SPELL_SUPERSUB_COURAGE"
        endif
		if i == SPELL_SPEAR_CAST then
            return "SPELL_SPEAR_CAST"
        endif
		if i == SPELL_IRON_SPEAR_CAST then
            return "SPELL_IRON_SPEAR_CAST"
        endif
		if i == SPELL_STEEL_SPEAR_CAST then
            return "SPELL_STEEL_SPEAR_CAST"
        endif
		if i == SPELL_POISON_SPEAR_CAST then
            return "SPELL_POISON_SPEAR_CAST"
        endif
		if i == SPELL_RPOISON_SPEAR_CAST then
            return "SPELL_RPOISON_SPEAR_CAST"
        endif
		if i == SPELL_UPOISON_SPEAR_CAST then
            return "SPELL_UPOISON_SPEAR_CAST"
        endif
		if i == SPELL_DARK_SPEAR_CAST then
            return "SPELL_DARK_SPEAR_CAST"
        endif
		if i == SPELL_DARK_SPEAR then
            return "SPELL_DARK_SPEAR"
        endif
		if i == SPELL_RPOISON_SPEAR then
            return "SPELL_RPOISON_SPEAR"
        endif
		if i == SPELL_POISON_SPEAR then
            return "SPELL_POISON_SPEAR"
        endif
		if i == SPELL_IRON_SPEAR then
            return "SPELL_IRON_SPEAR"
        endif
		if i == SPELL_UPOISON_SPEAR then
            return "SPELL_UPOISON_SPEAR"
        endif
		if i == SPELL_STEEL_SPEAR then
            return "SPELL_STEEL_SPEAR"
        endif
		if i == SPELL_SPEAR then
            return "SPELL_SPEAR"
        endif
		if i == SPELL_BATTLE_SPEAR_CAST then
            return "SPELL_BATTLE_SPEAR_CAST"
        endif
		if i == SPELL_DYSENTERY then
            return "SPELL_DYSENTERY"
        endif
		if i == ABILITY_LOCUST then
            return "ABILITY_LOCUST"
        endif
		if i == ABILITY_ASSASINATE then
            return "ABILITY_ASSASINATE"
        endif
		if i == ABILITY_MEU_DUMMY then
            return "ABILITY_MEU_DUMMY"
        endif
		if i == ABILITY_MEU_OMNIGATHERER then
            return "ABILITY_MEU_OMNIGATHERER"
        endif
		if i == ABILITY_MEU_DEMENTIA_MASTER then
            return "ABILITY_MEU_DEMENTIA_MASTER"
        endif
		if i == ABILITY_MEU_SAGE then
            return "ABILITY_MEU_SAGE"
        endif
		if i == ABILITY_MEU_SPY then
            return "ABILITY_MEU_SPY"
        endif
		if i == ABILITY_MEU_ASSASSIN then
            return "ABILITY_MEU_ASSASSIN"
        endif
		if i == ABILITY_INVULNERABLE then
            return "ABILITY_INVULNERABLE"
        endif
		if i == BUFF_GOK then
            return "BUFF_GOK"
        endif
		if i == BUFF_SPRINTING then
            return "BUFF_SPRINTING"
        endif
		if i == BUFF_SPEAR_INCOMING then
            return "BUFF_SPEAR_INCOMING"
        endif
		if i == BUFF_DYSENTERY then
            return "BUFF_DYSENTERY"
        endif
		if i == ITEM_ANCIENT_BOW then
            return "ITEM_ANCIENT_BOW"
        endif
		if i == ITEM_BOW_BLOOD_GOD then
            return "ITEM_BOW_BLOOD_GOD"
        endif
		if i == ITEM_CLAY_EXPLOSION then
            return "ITEM_CLAY_EXPLOSION"
        endif
		if i == ITEM_DD_PINION_FIRE then
            return "ITEM_DD_PINION_FIRE"
        endif
		if i == ITEM_DD_PINION_PAIN then
            return "ITEM_DD_PINION_PAIN"
        endif
		if i == ITEM_DD_PINION_SHADOW then
            return "ITEM_DD_PINION_SHADOW"
        endif
		if i == ITEM_DUSTY_OLD_BOW then
            return "ITEM_DUSTY_OLD_BOW"
        endif
		if i == ITEM_GLOWING_ANCIENT_BOW then
            return "ITEM_GLOWING_ANCIENT_BOW"
        endif
		if i == ITEM_HORN_MAMMOTH then
            return "ITEM_HORN_MAMMOTH"
        endif
		if i == ITEM_HYDRA_CLAWS then
            return "ITEM_HYDRA_CLAWS"
        endif
		if i == ITEM_HYDRA_SCALE then
            return "ITEM_HYDRA_SCALE"
        endif
		if i == ITEM_HYDRAAC_FINS then
            return "ITEM_HYDRAAC_FINS"
        endif
		if i == ITEM_MED_BEAST_MASTER then
            return "ITEM_MED_BEAST_MASTER"
        endif
		if i == ITEM_MED_PRIEST then
            return "ITEM_MED_PRIEST"
        endif
		if i == ITEM_MED_SCOUT then
            return "ITEM_MED_SCOUT"
        endif
		if i == ITEM_MED_GATHERER then
            return "ITEM_MED_GATHERER"
        endif
		if i == ITEM_MED_MAGE then
            return "ITEM_MED_MAGE"
        endif
		if i == ITEM_MED_THIEF then
            return "ITEM_MED_THIEF"
        endif
		if i == ITEM_MED_HUNTER then
            return "ITEM_MED_HUNTER"
        endif
		if i == ITEM_MED_HEAD_HUNER then
            return "ITEM_MED_HEAD_HUNER"
        endif
		if i == ITEM_THIEF_MED then
            return "ITEM_THIEF_MED"
        endif
		if i == ITEM_MEDALLION_COURAGE then
            return "ITEM_MEDALLION_COURAGE"
        endif
		if i == ITEM_BLUE_HERB then
            return "ITEM_BLUE_HERB"
        endif
		if i == ITEM_BONE then
            return "ITEM_BONE"
        endif
		if i == ITEM_BUTSU then
            return "ITEM_BUTSU"
        endif
		if i == ITEM_CLAY_BALL then
            return "ITEM_CLAY_BALL"
        endif
		if i == ITEM_ELK_HIDE then
            return "ITEM_ELK_HIDE"
        endif
		if i == ITEM_FLINT then
            return "ITEM_FLINT"
        endif
		if i == ITEM_HARDEN_SCALES then
            return "ITEM_HARDEN_SCALES"
        endif
		if i == ITEM_HAWK_EGG then
            return "ITEM_HAWK_EGG"
        endif
		if i == ITEM_JUNGLE_WOLF_HIDE then
            return "ITEM_JUNGLE_WOLF_HIDE"
        endif
		if i == ITEM_JUNGLE_BEAR_HIDE then
            return "ITEM_JUNGLE_BEAR_HIDE"
        endif
		if i == ITEM_MAGIC then
            return "ITEM_MAGIC"
        endif
		if i == ITEM_MANA_CRYSTAL then
            return "ITEM_MANA_CRYSTAL"
        endif
		if i == ITEM_MUSHROOM then
            return "ITEM_MUSHROOM"
        endif
		if i == ITEM_ORANGE_HERB then
            return "ITEM_ORANGE_HERB"
        endif
		if i == ITEM_PURPLE_HERB then
            return "ITEM_PURPLE_HERB"
        endif
		if i == ITEM_RIVER_STEM then
            return "ITEM_RIVER_STEM"
        endif
		if i == ITEM_RIVER_ROOT then
            return "ITEM_RIVER_ROOT"
        endif
		if i == ITEM_STICK then
            return "ITEM_STICK"
        endif
		if i == ITEM_STONE then
            return "ITEM_STONE"
        endif
		if i == ITEM_TINDER then
            return "ITEM_TINDER"
        endif
		if i == ITEM_YELLOW_HERB then
            return "ITEM_YELLOW_HERB"
        endif
		if i == ITEM_ACID_BOMB then
            return "ITEM_ACID_BOMB"
        endif
		if i == ITEM_ANTI_MAGIC_POTION then
            return "ITEM_ANTI_MAGIC_POTION"
        endif
		if i == ITEM_ANABOLIC_POTION then
            return "ITEM_ANABOLIC_POTION"
        endif
		if i == ITEM_CURE_ALL then
            return "ITEM_CURE_ALL"
        endif
		if i == ITEM_DISEASE_POTION then
            return "ITEM_DISEASE_POTION"
        endif
		if i == ITEM_DRUNKS_POTION then
            return "ITEM_DRUNKS_POTION"
        endif
		if i == ITEM_ELEMENTAL_SHIELD_POTION then
            return "ITEM_ELEMENTAL_SHIELD_POTION"
        endif
		if i == ITEM_ESSENCE_BEES then
            return "ITEM_ESSENCE_BEES"
        endif
		if i == ITEM_FERVER_POTION then
            return "ITEM_FERVER_POTION"
        endif
		if i == ITEM_HEALING_POTION_I then
            return "ITEM_HEALING_POTION_I"
        endif
		if i == ITEM_HEALING_POTION_II then
            return "ITEM_HEALING_POTION_II"
        endif
		if i == ITEM_HEALING_POTION_III then
            return "ITEM_HEALING_POTION_III"
        endif
		if i == ITEM_HEALING_POTION_IV then
            return "ITEM_HEALING_POTION_IV"
        endif
		if i == ITEM_MANA_POTION_I then
            return "ITEM_MANA_POTION_I"
        endif
		if i == ITEM_MANA_POTION_II then
            return "ITEM_MANA_POTION_II"
        endif
		if i == ITEM_MANA_POTION_III then
            return "ITEM_MANA_POTION_III"
        endif
		if i == ITEM_MANA_POTION_IV then
            return "ITEM_MANA_POTION_IV"
        endif
		if i == ITEM_NAPALM then
            return "ITEM_NAPALM"
        endif
		if i == ITEM_NETHER_POTION then
            return "ITEM_NETHER_POTION"
        endif
		if i == ITEM_POTION_TWIN_ISLANDS then
            return "ITEM_POTION_TWIN_ISLANDS"
        endif
		if i == ITEM_OMNICURE then
            return "ITEM_OMNICURE"
        endif
		if i == ITEM_DARK_ROCK then
            return "ITEM_DARK_ROCK"
        endif
		if i == ITEM_GEM_OF_KNOWLEDGE then
            return "ITEM_GEM_OF_KNOWLEDGE"
        endif
		if i == ITEM_SPIRIT_WATER then
            return "ITEM_SPIRIT_WATER"
        endif
		if i == ITEM_SPIRIT_WIND then
            return "ITEM_SPIRIT_WIND"
        endif
		if i == ITEM_ACORN then
            return "ITEM_ACORN"
        endif
		if i == ITEM_COOKED_MEAT then
            return "ITEM_COOKED_MEAT"
        endif
		if i == ITEM_DISEASED_MEAT then
            return "ITEM_DISEASED_MEAT"
        endif
		if i == ITEM_MAGIC_ACORN then
            return "ITEM_MAGIC_ACORN"
        endif
		if i == ITEM_SMOKED_MEAT then
            return "ITEM_SMOKED_MEAT"
        endif
		if i == ITEM_ANABOLIC_BOOTS then
            return "ITEM_ANABOLIC_BOOTS"
        endif
		if i == ITEM_BATTLE_ARMOR then
            return "ITEM_BATTLE_ARMOR"
        endif
		if i == ITEM_BATTLE_AXE then
            return "ITEM_BATTLE_AXE"
        endif
		if i == ITEM_BATTLE_GLOVES then
            return "ITEM_BATTLE_GLOVES"
        endif
		if i == ITEM_BATTLE_SHIELD then
            return "ITEM_BATTLE_SHIELD"
        endif
		if i == ITEM_BATTLE_SUIT then
            return "ITEM_BATTLE_SUIT"
        endif
		if i == ITEM_BEE_HIVE then
            return "ITEM_BEE_HIVE"
        endif
		if i == ITEM_BLOW_GUN then
            return "ITEM_BLOW_GUN"
        endif
		if i == ITEM_CAMOUFLAGE_COAT then
            return "ITEM_CAMOUFLAGE_COAT"
        endif
		if i == ITEM_DARK_THISTLES then
            return "ITEM_DARK_THISTLES"
        endif
		if i == ITEM_EMP then
            return "ITEM_EMP"
        endif
		if i == ITEM_FIRE_BOMB then
            return "ITEM_FIRE_BOMB"
        endif
		if i == ITEM_NETS then
            return "ITEM_NETS"
        endif
		if i == ITEM_SMOKE_BOMB then
            return "ITEM_SMOKE_BOMB"
        endif
		if i == ITEM_SONAR_COMPASS then
            return "ITEM_SONAR_COMPASS"
        endif
		if i == ITEM_THISTLES then
            return "ITEM_THISTLES"
        endif
		if i == ITEM_CLOAK_OF_FLAMES then
            return "ITEM_CLOAK_OF_FLAMES"
        endif
		if i == ITEM_CLOAK_OF_FROST then
            return "ITEM_CLOAK_OF_FROST"
        endif
		if i == ITEM_CLOAK_OF_HEALING then
            return "ITEM_CLOAK_OF_HEALING"
        endif
		if i == ITEM_LIVING_CLAY then
            return "ITEM_LIVING_CLAY"
        endif
		if i == ITEM_MAGIC_SEED then
            return "ITEM_MAGIC_SEED"
        endif
		if i == ITEM_POISON then
            return "ITEM_POISON"
        endif
		if i == ITEM_POISON_SPEAR then
            return "ITEM_POISON_SPEAR"
        endif
		if i == ITEM_REFINED_POISON_SPEAR then
            return "ITEM_REFINED_POISON_SPEAR"
        endif
		if i == ITEM_SCROLL_SWIFTNESS then
            return "ITEM_SCROLL_SWIFTNESS"
        endif
		if i == ITEM_SCROLL_CYCLONE then
            return "ITEM_SCROLL_CYCLONE"
        endif
		if i == ITEM_SCROLL_ENTANGLING_ROOTS then
            return "ITEM_SCROLL_ENTANGLING_ROOTS"
        endif
		if i == ITEM_SCROLL_FIREBALL then
            return "ITEM_SCROLL_FIREBALL"
        endif
		if i == ITEM_SCROLL_LIVING_DEAD then
            return "ITEM_SCROLL_LIVING_DEAD"
        endif
		if i == ITEM_SCROLL_STONE_ARMOR then
            return "ITEM_SCROLL_STONE_ARMOR"
        endif
		if i == ITEM_SCROLL_TSUNAMI then
            return "ITEM_SCROLL_TSUNAMI"
        endif
		if i == ITEM_ULTRA_POISON then
            return "ITEM_ULTRA_POISON"
        endif
		if i == ITEM_ULTRA_POISON_SPEAR then
            return "ITEM_ULTRA_POISON_SPEAR"
        endif
		if i == ITEM_BONE_BOOTS then
            return "ITEM_BONE_BOOTS"
        endif
		if i == ITEM_BONE_COAT then
            return "ITEM_BONE_COAT"
        endif
		if i == ITEM_BONE_GLOVES then
            return "ITEM_BONE_GLOVES"
        endif
		if i == ITEM_BONE_SHIELD then
            return "ITEM_BONE_SHIELD"
        endif
		if i == ITEM_DARK_SPEAR then
            return "ITEM_DARK_SPEAR"
        endif
		if i == ITEM_FLINT_AXE then
            return "ITEM_FLINT_AXE"
        endif
		if i == ITEM_IRON_AXE then
            return "ITEM_IRON_AXE"
        endif
		if i == ITEM_IRON_BOOTS then
            return "ITEM_IRON_BOOTS"
        endif
		if i == ITEM_IRON_COAT then
            return "ITEM_IRON_COAT"
        endif
		if i == ITEM_IRON_GLOVES then
            return "ITEM_IRON_GLOVES"
        endif
		if i == ITEM_IRON_INGOT then
            return "ITEM_IRON_INGOT"
        endif
		if i == ITEM_IRON_SHIELD then
            return "ITEM_IRON_SHIELD"
        endif
		if i == ITEM_IRON_SPEAR then
            return "ITEM_IRON_SPEAR"
        endif
		if i == ITEM_MAGE_MASHER then
            return "ITEM_MAGE_MASHER"
        endif
		if i == ITEM_SHIELD then
            return "ITEM_SHIELD"
        endif
		if i == ITEM_SPEAR then
            return "ITEM_SPEAR"
        endif
		if i == ITEM_STEEL_AXE then
            return "ITEM_STEEL_AXE"
        endif
		if i == ITEM_STEEL_BOOTS then
            return "ITEM_STEEL_BOOTS"
        endif
		if i == ITEM_STEEL_COAT then
            return "ITEM_STEEL_COAT"
        endif
		if i == ITEM_STEEL_GLOVES then
            return "ITEM_STEEL_GLOVES"
        endif
		if i == ITEM_STEEL_INGOT then
            return "ITEM_STEEL_INGOT"
        endif
		if i == ITEM_STEEL_SHIELD then
            return "ITEM_STEEL_SHIELD"
        endif
		if i == ITEM_STEEL_SPEAR then
            return "ITEM_STEEL_SPEAR"
        endif
		if i == ITEM_STONE_AXE then
            return "ITEM_STONE_AXE"
        endif
		if i == ITEM_LOADED_THISTLES then
            return "ITEM_LOADED_THISTLES"
        endif
		if i == ITEM_LOADED_DARK_THISTLES then
            return "ITEM_LOADED_DARK_THISTLES"
        endif
		if i == ITEM_LOADED_BONE then
            return "ITEM_LOADED_BONE"
        endif
		if i == ITEM_BEAR_SKIN_BOOTS then
            return "ITEM_BEAR_SKIN_BOOTS"
        endif
		if i == ITEM_BEAR_SKIN_COAT then
            return "ITEM_BEAR_SKIN_COAT"
        endif
		if i == ITEM_BEAR_SKIN_GLOVES then
            return "ITEM_BEAR_SKIN_GLOVES"
        endif
		if i == ITEM_ELK_SKIN_BOOTS then
            return "ITEM_ELK_SKIN_BOOTS"
        endif
		if i == ITEM_ELK_SKIN_COAT then
            return "ITEM_ELK_SKIN_COAT"
        endif
		if i == ITEM_ELK_SKIN_GLOVES then
            return "ITEM_ELK_SKIN_GLOVES"
        endif
		if i == ITEM_WOLF_SKIN_BOOTS then
            return "ITEM_WOLF_SKIN_BOOTS"
        endif
		if i == ITEM_WOLF_SKIN_COAT then
            return "ITEM_WOLF_SKIN_COAT"
        endif
		if i == ITEM_WOLF_SKIN_GLOVES then
            return "ITEM_WOLF_SKIN_GLOVES"
        endif
		if i == ITEM_ARMORY_KIT then
            return "ITEM_ARMORY_KIT"
        endif
		if i == ITEM_DEFENSIVE_WARD_KIT then
            return "ITEM_DEFENSIVE_WARD_KIT"
        endif
		if i == ITEM_ENSNARE_TRAP_KIT then
            return "ITEM_ENSNARE_TRAP_KIT"
        endif
		if i == ITEM_FIRE_KIT then
            return "ITEM_FIRE_KIT"
        endif
		if i == ITEM_HATCHERY_KIT then
            return "ITEM_HATCHERY_KIT"
        endif
		if i == ITEM_MAGE_FIRE_KIT then
            return "ITEM_MAGE_FIRE_KIT"
        endif
		if i == ITEM_MUD_HUT_KIT then
            return "ITEM_MUD_HUT_KIT"
        endif
		if i == ITEM_OMNIDEFENDER_KIT then
            return "ITEM_OMNIDEFENDER_KIT"
        endif
		if i == ITEM_POT_KIT then
            return "ITEM_POT_KIT"
        endif
		if i == ITEM_SMOKE_HOUSE_KIT then
            return "ITEM_SMOKE_HOUSE_KIT"
        endif
		if i == ITEM_SPIRIT_WARD_KIT then
            return "ITEM_SPIRIT_WARD_KIT"
        endif
		if i == ITEM_STORAGE_HUT_KIT then
            return "ITEM_STORAGE_HUT_KIT"
        endif
		if i == ITEM_TANNERY_KIT then
            return "ITEM_TANNERY_KIT"
        endif
		if i == ITEM_TELEPORT_BEACON_KIT then
            return "ITEM_TELEPORT_BEACON_KIT"
        endif
		if i == ITEM_TENT_KIT then
            return "ITEM_TENT_KIT"
        endif
		if i == ITEM_TRANSPORT_SHIP_KIT then
            return "ITEM_TRANSPORT_SHIP_KIT"
        endif
		if i == ITEM_TROLL_BURROW_KIT then
            return "ITEM_TROLL_BURROW_KIT"
        endif
		if i == ITEM_TROLL_HUT_KIT then
            return "ITEM_TROLL_HUT_KIT"
        endif
		if i == ITEM_WITCH_DOCTORS_HUT_KIT then
            return "ITEM_WITCH_DOCTORS_HUT_KIT"
        endif
		if i == ITEM_WORKSHOP_KIT then
            return "ITEM_WORKSHOP_KIT"
        endif
		if i == ITEM_BATTLE_SUIT_SPELLS then
            return "ITEM_BATTLE_SUIT_SPELLS"
        endif
		if i == ITEM_BATTLE_SUIT_SPELLS_TWO then
            return "ITEM_BATTLE_SUIT_SPELLS_TWO"
        endif
		if i == ITEM_CHEESE then
            return "ITEM_CHEESE"
        endif
		if i == ITEM_HEAD_HUNTER_STEEL_SPEAR then
            return "ITEM_HEAD_HUNTER_STEEL_SPEAR"
        endif
		if i == ITEM_HERB_RECIPE_1 then
            return "ITEM_HERB_RECIPE_1"
        endif
		if i == ITEM_HERB_RECIPE_2 then
            return "ITEM_HERB_RECIPE_2"
        endif
		if i == ITEM_HERB_RECIPE_3 then
            return "ITEM_HERB_RECIPE_3"
        endif
		if i == ITEM_HERB_RECIPE_4 then
            return "ITEM_HERB_RECIPE_4"
        endif
		if i == ITEM_HERB_RECIPE_5 then
            return "ITEM_HERB_RECIPE_5"
        endif
		if i == ITEM_HERB_RECIPE_6 then
            return "ITEM_HERB_RECIPE_6"
        endif
		if i == ITEM_HERB_RECIPE_7 then
            return "ITEM_HERB_RECIPE_7"
        endif
		if i == ITEM_HERB_RECIPE_8 then
            return "ITEM_HERB_RECIPE_8"
        endif
		if i == ITEM_HERB_RECIPE_9 then
            return "ITEM_HERB_RECIPE_9"
        endif
		if i == ITEM_HERB_RECIPE_10 then
            return "ITEM_HERB_RECIPE_10"
        endif
		if i == ITEM_HERB_RECIPE_11 then
            return "ITEM_HERB_RECIPE_11"
        endif
		if i == ITEM_HYDRA_HINT then
            return "ITEM_HYDRA_HINT"
        endif
		if i == ITEM_OPPOSING_NIGHT_ITEM then
            return "ITEM_OPPOSING_NIGHT_ITEM"
        endif
		if i == ITEM_PANTHER_HIDE then
            return "ITEM_PANTHER_HIDE"
        endif
		if i == ITEM_SECRET_HINT then
            return "ITEM_SECRET_HINT"
        endif
		if i == ITEM_TOME_LOSS then
            return "ITEM_TOME_LOSS"
        endif
		if i == ITEM_REPAIR_HAMMER then
            return "ITEM_REPAIR_HAMMER"
        endif
		if i == ITEM_NULL then
            return "ITEM_NULL"
        endif
		if i == ITEM_CANDY_CANE then
            return "ITEM_CANDY_CANE"
        endif
		if i == DEST_FALSE_TREE then
            return "DEST_FALSE_TREE"
        endif
		if i == DEST_RUINS_TREE then
            return "DEST_RUINS_TREE"
        endif
		if i == DEST_RUINS_TREE_CANOPY then
            return "DEST_RUINS_TREE_CANOPY"
        endif
		if i == DEST_RUINS_TREE_ITEM then
            return "DEST_RUINS_TREE_ITEM"
        endif
		if i == DEST_SUPER_TREE then
            return "DEST_SUPER_TREE"
        endif
		if i == DEST_SUPER_TREE_CANOPY then
            return "DEST_SUPER_TREE_CANOPY"
        endif

		return ""
	endfunction

	private function onInit takes nothing returns nothing
		set UNIT_ALL = ArrayListInteger.create()
		set SPELL_ALL = ArrayListInteger.create()
		set ABILITY_ALL = ArrayListInteger.create()
		set BUFF_ALL = ArrayListInteger.create()
		set ITEM_ALL = ArrayListInteger.create()
		set DEST_ALL = ArrayListInteger.create()

		call UNIT_ALL.push(UNIT_HUNTER)
		call UNIT_ALL.push(UNIT_HUNTER_1)
		call UNIT_ALL.push(UNIT_TRACKER)
		call UNIT_ALL.push(UNIT_WARRIOR)
		call UNIT_ALL.push(UNIT_JUGGERNAUT)
		call UNIT_ALL.push(UNIT_BEAST_MASTER)
		call UNIT_ALL.push(UNIT_TRUE_FORM)
		call UNIT_ALL.push(UNIT_DRUID)
		call UNIT_ALL.push(UNIT_CHICKEN_FORM)
		call UNIT_ALL.push(UNIT_ULTIMATE_FORM)
		call UNIT_ALL.push(UNIT_BEAST_MASTER_1)
		call UNIT_ALL.push(UNIT_SHAPESHIFTER_WOLF)
		call UNIT_ALL.push(UNIT_SHAPESHIFTER_BEAR)
		call UNIT_ALL.push(UNIT_SHAPESHIFTER_PANTHER)
		call UNIT_ALL.push(UNIT_SHAPESHIFTER_TIGER)
		call UNIT_ALL.push(UNIT_MAGE)
		call UNIT_ALL.push(UNIT_MAGE_1)
		call UNIT_ALL.push(UNIT_ELEMENTALIST)
		call UNIT_ALL.push(UNIT_ELEMENTALIST_1)
		call UNIT_ALL.push(UNIT_HYPNOTIST)
		call UNIT_ALL.push(UNIT_DEMENTIA_MASTER)
		call UNIT_ALL.push(UNIT_PRIEST)
		call UNIT_ALL.push(UNIT_BOOSTER)
		call UNIT_ALL.push(UNIT_BOOSTER_1)
		call UNIT_ALL.push(UNIT_MASTER_HEALER)
		call UNIT_ALL.push(UNIT_SAGE)
		call UNIT_ALL.push(UNIT_THIEF)
		call UNIT_ALL.push(UNIT_ESCAPE_ARTIST)
		call UNIT_ALL.push(UNIT_CONTORTIONIST)
		call UNIT_ALL.push(UNIT_ASSASSIN)
		call UNIT_ALL.push(UNIT_SCOUT)
		call UNIT_ALL.push(UNIT_OBSERVER)
		call UNIT_ALL.push(UNIT_RADAR_SCOUT)
		call UNIT_ALL.push(UNIT_SPY)
		call UNIT_ALL.push(UNIT_GATHERER)
		call UNIT_ALL.push(UNIT_RADAR_GATHERER)
		call UNIT_ALL.push(UNIT_HERB_MASTER)
		call UNIT_ALL.push(UNIT_OMNIGATHERER)
		call UNIT_ALL.push(UNIT_REPICK_TROLL)
		call UNIT_ALL.push(UNIT_DRUNKEN_TROLL)
		call UNIT_ALL.push(UNIT_TROLL_BRAWLER)
		call UNIT_ALL.push(UNIT_TROLL_BREWMASTER)
		call UNIT_ALL.push(UNIT_ISLAND_TROLL)
		call UNIT_ALL.push(UNIT_HEAD_HUNTER)
		call UNIT_ALL.push(UNIT_ARCHER_INTREPIDE)
		call UNIT_ALL.push(UNIT_MIRROR_TROLL)
		call UNIT_ALL.push(UNIT_MIRROR_TROLL_CLONE)
		call UNIT_ALL.push(UNIT_NECROMANCER)
		call UNIT_ALL.push(UNIT_SHAMAN)
		call UNIT_ALL.push(UNIT_SHADOW_ARCHER)
		call UNIT_ALL.push(UNIT_SHADOW_HUNTER)
		call UNIT_ALL.push(UNIT_SPIRIT_WALKER)
		call UNIT_ALL.push(UNIT_TRACKER_TOURNY_2011)
		call UNIT_ALL.push(UNIT_TRICKSTER)
		call UNIT_ALL.push(UNIT_TROLL_CONARTIST)
		call UNIT_ALL.push(UNIT_TROLL_MAGE_ALT)
		call UNIT_ALL.push(UNIT_TROLL_WITCH_DOCTOR)
		call UNIT_ALL.push(UNIT_EA_TOURNY_2011)
		call UNIT_ALL.push(UNIT_ALIGATOR_MAN)
		call UNIT_ALL.push(UNIT_ANCIENT_HYDRA)
		call UNIT_ALL.push(UNIT_DISCO_DUCK)
		call UNIT_ALL.push(UNIT_LESSER_HYDRA)
		call UNIT_ALL.push(UNIT_MAGENTA_FISH)
		call UNIT_ALL.push(UNIT_MAMMOTH)
		call UNIT_ALL.push(UNIT_ONE)
		call UNIT_ALL.push(UNIT_RAPID_TURTLE)
		call UNIT_ALL.push(UNIT_ADULT_ELK)
		call UNIT_ALL.push(UNIT_ADULT_JUNGLE_BEAR)
		call UNIT_ALL.push(UNIT_ADULT_JUNGLE_WOLF)
		call UNIT_ALL.push(UNIT_ALPHA_HAWK)
		call UNIT_ALL.push(UNIT_BRONZE_DRAGON)
		call UNIT_ALL.push(UNIT_BRONZE_DRAGON_HATCHLING)
		call UNIT_ALL.push(UNIT_BEAR_CUB)
		call UNIT_ALL.push(UNIT_ELDER_PANTHER)
		call UNIT_ALL.push(UNIT_ELK)
		call UNIT_ALL.push(UNIT_ELK_ADOLESCENT)
		call UNIT_ALL.push(UNIT_FAWN)
		call UNIT_ALL.push(UNIT_FISH)
		call UNIT_ALL.push(UNIT_FOREST_DRAGON)
		call UNIT_ALL.push(UNIT_FOREST_DRAGON_HATCHLING)
		call UNIT_ALL.push(UNIT_GREATER_BRONZE_DRAGON)
		call UNIT_ALL.push(UNIT_GREATER_FOREST_DRAGON)
		call UNIT_ALL.push(UNIT_GREATER_NETHER_DRAGON)
		call UNIT_ALL.push(UNIT_GREATER_RED_DRAGON)
		call UNIT_ALL.push(UNIT_GREEN_FISH)
		call UNIT_ALL.push(UNIT_HAWK)
		call UNIT_ALL.push(UNIT_HAWK_ADOLESCENT)
		call UNIT_ALL.push(UNIT_HAWK_HATCHLING)
		call UNIT_ALL.push(UNIT_JUNGLE_BEAR)
		call UNIT_ALL.push(UNIT_JUNGLE_WOLF)
		call UNIT_ALL.push(UNIT_NETHER_DRAGON_HATCHLING)
		call UNIT_ALL.push(UNIT_PANTHER)
		call UNIT_ALL.push(UNIT_RED_DRAGON_HATCHLING)
		call UNIT_ALL.push(UNIT_SNAKE)
		call UNIT_ALL.push(UNIT_WOLF_PUP)
		call UNIT_ALL.push(UNIT_ARMORY)
		call UNIT_ALL.push(UNIT_BUILDING_TREE)
		call UNIT_ALL.push(UNIT_FIRE)
		call UNIT_ALL.push(UNIT_DEFENSE_WARD)
		call UNIT_ALL.push(UNIT_ENSNARE_TRAP)
		call UNIT_ALL.push(UNIT_HATCHERY)
		call UNIT_ALL.push(UNIT_MAGE_FIRE)
		call UNIT_ALL.push(UNIT_MAGE_FIRE_SUMMONED)
		call UNIT_ALL.push(UNIT_POT)
		call UNIT_ALL.push(UNIT_MUD_HUT)
		call UNIT_ALL.push(UNIT_OMNITOWER)
		call UNIT_ALL.push(UNIT_SMOKE_HOUSE)
		call UNIT_ALL.push(UNIT_SPIRIT_WARD)
		call UNIT_ALL.push(UNIT_STORAGE_HUT)
		call UNIT_ALL.push(UNIT_TANNERY)
		call UNIT_ALL.push(UNIT_TELEPORTATION_BEACON)
		call UNIT_ALL.push(UNIT_TENT)
		call UNIT_ALL.push(UNIT_TROLL_BURROW)
		call UNIT_ALL.push(UNIT_TROLL_HUT)
		call UNIT_ALL.push(UNIT_TROLL_TOTEM)
		call UNIT_ALL.push(UNIT_TROLL_TRANSPORT_SHIP)
		call UNIT_ALL.push(UNIT_WITCH_DOCTORS_HUT)
		call UNIT_ALL.push(UNIT_WORKSHOP)
		call UNIT_ALL.push(UNIT_POWER_GENERATOR)
		call UNIT_ALL.push(UNIT_BLUE_HERB_BUSH)
		call UNIT_ALL.push(UNIT_HAISETSU_BUSH)
		call UNIT_ALL.push(UNIT_HIDDEN_STASH)
		call UNIT_ALL.push(UNIT_MUSHROOM_COLONY)
		call UNIT_ALL.push(UNIT_ORANGE_HERB_BUSH)
		call UNIT_ALL.push(UNIT_PURPLE_HERB_BUSH)
		call UNIT_ALL.push(UNIT_SCOUTS_BUSH)
		call UNIT_ALL.push(UNIT_THIEFS_BUSH)
		call UNIT_ALL.push(UNIT_THISTLE_SHRUB)
		call UNIT_ALL.push(UNIT_WATER_HERB_BUSH)
		call UNIT_ALL.push(UNIT_YELLOW_HERB_BUSH)
		call UNIT_ALL.push(UNIT_CRAFT_MASTER)
		call UNIT_ALL.push(UNIT_OMINOUS_ALTAR)
		call UNIT_ALL.push(UNIT_TRADE_SHIP_1)
		call UNIT_ALL.push(UNIT_TRADE_SHIP_2)
		call UNIT_ALL.push(UNIT_TRADE_SHIP_3)
		call UNIT_ALL.push(UNIT_TRADE_SHIP_4)
		call UNIT_ALL.push(UNIT_TRADE_SHIP_5)
		call UNIT_ALL.push(UNIT_TRADE_SHIP_6)
		call UNIT_ALL.push(UNIT_TROLL_MERCHANT)
		call UNIT_ALL.push(UNIT_BLUR_IMAGE)
		call UNIT_ALL.push(UNIT_BEE)
		call UNIT_ALL.push(UNIT_BEE_HIVE)
		call UNIT_ALL.push(UNIT_BEE_HIVE_SUMMONED)
		call UNIT_ALL.push(UNIT_DISEASE_CLOUD)
		call UNIT_ALL.push(UNIT_DUMMY)
		call UNIT_ALL.push(UNIT_AMHS_DUMMY)
		call UNIT_ALL.push(UNIT_UNUSED_DUMMY)
		call UNIT_ALL.push(UNIT_LIVING_CLAY)
		call UNIT_ALL.push(UNIT_LOCUST)
		call UNIT_ALL.push(UNIT_LOCUST_ALT)
		call UNIT_ALL.push(UNIT_LOCUST_DARK_NODE)
		call UNIT_ALL.push(UNIT_LOCUST_FIRE_LORD)
		call UNIT_ALL.push(UNIT_LOCUST_GHOST)
		call UNIT_ALL.push(UNIT_LOCUST_INNER_FIRE)
		call UNIT_ALL.push(UNIT_LOCUST_KA)
		call UNIT_ALL.push(UNIT_LOCUST_LEZ)
		call UNIT_ALL.push(UNIT_LOCUST_LIGHT_NODE)
		call UNIT_ALL.push(UNIT_LOCUST_NEL)
		call UNIT_ALL.push(UNIT_LOCUST_OPPOSING_PANTHER)
		call UNIT_ALL.push(UNIT_LOCUST_POOP)
		call UNIT_ALL.push(UNIT_LOCUST_SKELETON)
		call UNIT_ALL.push(UNIT_LOCUST_WATER_LORD)
		call UNIT_ALL.push(UNIT_MASTER_CASTER)
		call UNIT_ALL.push(UNIT_TRADE_ZEPPELIN)
		call UNIT_ALL.push(UNIT_UBER_HIVE)
		call UNIT_ALL.push(UNIT_ROCK)
		call UNIT_ALL.push(UNIT_CHICKEN)
		call UNIT_ALL.push(UNIT_FARM)
		call UNIT_ALL.push(UNIT_FOOTMAN)
		call UNIT_ALL.push(UNIT_HERO_PICKER)
		call UNIT_ALL.push(UNIT_LIVING_CLAY_UNUSED)
		call UNIT_ALL.push(UNIT_MEAT)
		call UNIT_ALL.push(UNIT_PEASANT)
		call UNIT_ALL.push(UNIT_PEON)
		call UNIT_ALL.push(UNIT_SMOKED_MEAT)
		call UNIT_ALL.push(UNIT_SOUL_REFLECTION_1)
		call UNIT_ALL.push(UNIT_SOUL_REFLECTION_2)
		call UNIT_ALL.push(UNIT_SOUL_REFLECTION_3)
		call UNIT_ALL.push(UNIT_TEST_CLOAK)
		call UNIT_ALL.push(UNIT_ULTRA_FOOTMAN)
		call SPELL_ALL.push(SPELL_PET_ATTACK)
		call SPELL_ALL.push(SPELL_PET_BRING_ITEMS)
		call SPELL_ALL.push(SPELL_PET_DROP_ITEMS)
		call SPELL_ALL.push(SPELL_PET_FOLLOW)
		call SPELL_ALL.push(SPELL_PET_GO_TO_HATCHERY)
		call SPELL_ALL.push(SPELL_PET_RELEASE)
		call SPELL_ALL.push(SPELL_PET_SCOUT)
		call SPELL_ALL.push(SPELL_PET_SLEEP)
		call SPELL_ALL.push(SPELL_PET_STAY)
		call SPELL_ALL.push(SPELL_PET_TAME)
		call SPELL_ALL.push(SPELL_SMOKE_MEAT)
		call SPELL_ALL.push(SPELL_PACK_BUILDING)
		call SPELL_ALL.push(SPELL_SELF_DESTRUCT)
		call SPELL_ALL.push(SPELL_DISEASE)
		call SPELL_ALL.push(SPELL_CURE_ALL_ITEM)
		call SPELL_ALL.push(SPELL_SUPER_FORM_CAST)
		call SPELL_ALL.push(SPELL_SONAR_COMPASS)
		call SPELL_ALL.push(SPELL_SUPERSUB_COURAGE)
		call SPELL_ALL.push(SPELL_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_IRON_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_STEEL_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_POISON_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_RPOISON_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_UPOISON_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_DARK_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_DARK_SPEAR)
		call SPELL_ALL.push(SPELL_RPOISON_SPEAR)
		call SPELL_ALL.push(SPELL_POISON_SPEAR)
		call SPELL_ALL.push(SPELL_IRON_SPEAR)
		call SPELL_ALL.push(SPELL_UPOISON_SPEAR)
		call SPELL_ALL.push(SPELL_STEEL_SPEAR)
		call SPELL_ALL.push(SPELL_SPEAR)
		call SPELL_ALL.push(SPELL_BATTLE_SPEAR_CAST)
		call SPELL_ALL.push(SPELL_DYSENTERY)
		call ABILITY_ALL.push(ABILITY_LOCUST)
		call ABILITY_ALL.push(ABILITY_ASSASINATE)
		call ABILITY_ALL.push(ABILITY_MEU_DUMMY)
		call ABILITY_ALL.push(ABILITY_MEU_OMNIGATHERER)
		call ABILITY_ALL.push(ABILITY_MEU_DEMENTIA_MASTER)
		call ABILITY_ALL.push(ABILITY_MEU_SAGE)
		call ABILITY_ALL.push(ABILITY_MEU_SPY)
		call ABILITY_ALL.push(ABILITY_MEU_ASSASSIN)
		call ABILITY_ALL.push(ABILITY_INVULNERABLE)
		call BUFF_ALL.push(BUFF_GOK)
		call BUFF_ALL.push(BUFF_SPRINTING)
		call BUFF_ALL.push(BUFF_SPEAR_INCOMING)
		call BUFF_ALL.push(BUFF_DYSENTERY)
		call ITEM_ALL.push(ITEM_ANCIENT_BOW)
		call ITEM_ALL.push(ITEM_BOW_BLOOD_GOD)
		call ITEM_ALL.push(ITEM_CLAY_EXPLOSION)
		call ITEM_ALL.push(ITEM_DD_PINION_FIRE)
		call ITEM_ALL.push(ITEM_DD_PINION_PAIN)
		call ITEM_ALL.push(ITEM_DD_PINION_SHADOW)
		call ITEM_ALL.push(ITEM_DUSTY_OLD_BOW)
		call ITEM_ALL.push(ITEM_GLOWING_ANCIENT_BOW)
		call ITEM_ALL.push(ITEM_HORN_MAMMOTH)
		call ITEM_ALL.push(ITEM_HYDRA_CLAWS)
		call ITEM_ALL.push(ITEM_HYDRA_SCALE)
		call ITEM_ALL.push(ITEM_HYDRAAC_FINS)
		call ITEM_ALL.push(ITEM_MED_BEAST_MASTER)
		call ITEM_ALL.push(ITEM_MED_PRIEST)
		call ITEM_ALL.push(ITEM_MED_SCOUT)
		call ITEM_ALL.push(ITEM_MED_GATHERER)
		call ITEM_ALL.push(ITEM_MED_MAGE)
		call ITEM_ALL.push(ITEM_MED_THIEF)
		call ITEM_ALL.push(ITEM_MED_HUNTER)
		call ITEM_ALL.push(ITEM_MED_HEAD_HUNER)
		call ITEM_ALL.push(ITEM_THIEF_MED)
		call ITEM_ALL.push(ITEM_MEDALLION_COURAGE)
		call ITEM_ALL.push(ITEM_BLUE_HERB)
		call ITEM_ALL.push(ITEM_BONE)
		call ITEM_ALL.push(ITEM_BUTSU)
		call ITEM_ALL.push(ITEM_CLAY_BALL)
		call ITEM_ALL.push(ITEM_ELK_HIDE)
		call ITEM_ALL.push(ITEM_FLINT)
		call ITEM_ALL.push(ITEM_HARDEN_SCALES)
		call ITEM_ALL.push(ITEM_HAWK_EGG)
		call ITEM_ALL.push(ITEM_JUNGLE_WOLF_HIDE)
		call ITEM_ALL.push(ITEM_JUNGLE_BEAR_HIDE)
		call ITEM_ALL.push(ITEM_MAGIC)
		call ITEM_ALL.push(ITEM_MANA_CRYSTAL)
		call ITEM_ALL.push(ITEM_MUSHROOM)
		call ITEM_ALL.push(ITEM_ORANGE_HERB)
		call ITEM_ALL.push(ITEM_PURPLE_HERB)
		call ITEM_ALL.push(ITEM_RIVER_STEM)
		call ITEM_ALL.push(ITEM_RIVER_ROOT)
		call ITEM_ALL.push(ITEM_STICK)
		call ITEM_ALL.push(ITEM_STONE)
		call ITEM_ALL.push(ITEM_TINDER)
		call ITEM_ALL.push(ITEM_YELLOW_HERB)
		call ITEM_ALL.push(ITEM_ACID_BOMB)
		call ITEM_ALL.push(ITEM_ANTI_MAGIC_POTION)
		call ITEM_ALL.push(ITEM_ANABOLIC_POTION)
		call ITEM_ALL.push(ITEM_CURE_ALL)
		call ITEM_ALL.push(ITEM_DISEASE_POTION)
		call ITEM_ALL.push(ITEM_DRUNKS_POTION)
		call ITEM_ALL.push(ITEM_ELEMENTAL_SHIELD_POTION)
		call ITEM_ALL.push(ITEM_ESSENCE_BEES)
		call ITEM_ALL.push(ITEM_FERVER_POTION)
		call ITEM_ALL.push(ITEM_HEALING_POTION_I)
		call ITEM_ALL.push(ITEM_HEALING_POTION_II)
		call ITEM_ALL.push(ITEM_HEALING_POTION_III)
		call ITEM_ALL.push(ITEM_HEALING_POTION_IV)
		call ITEM_ALL.push(ITEM_MANA_POTION_I)
		call ITEM_ALL.push(ITEM_MANA_POTION_II)
		call ITEM_ALL.push(ITEM_MANA_POTION_III)
		call ITEM_ALL.push(ITEM_MANA_POTION_IV)
		call ITEM_ALL.push(ITEM_NAPALM)
		call ITEM_ALL.push(ITEM_NETHER_POTION)
		call ITEM_ALL.push(ITEM_POTION_TWIN_ISLANDS)
		call ITEM_ALL.push(ITEM_OMNICURE)
		call ITEM_ALL.push(ITEM_DARK_ROCK)
		call ITEM_ALL.push(ITEM_GEM_OF_KNOWLEDGE)
		call ITEM_ALL.push(ITEM_SPIRIT_WATER)
		call ITEM_ALL.push(ITEM_SPIRIT_WIND)
		call ITEM_ALL.push(ITEM_ACORN)
		call ITEM_ALL.push(ITEM_COOKED_MEAT)
		call ITEM_ALL.push(ITEM_DISEASED_MEAT)
		call ITEM_ALL.push(ITEM_MAGIC_ACORN)
		call ITEM_ALL.push(ITEM_SMOKED_MEAT)
		call ITEM_ALL.push(ITEM_ANABOLIC_BOOTS)
		call ITEM_ALL.push(ITEM_BATTLE_ARMOR)
		call ITEM_ALL.push(ITEM_BATTLE_AXE)
		call ITEM_ALL.push(ITEM_BATTLE_GLOVES)
		call ITEM_ALL.push(ITEM_BATTLE_SHIELD)
		call ITEM_ALL.push(ITEM_BATTLE_SUIT)
		call ITEM_ALL.push(ITEM_BEE_HIVE)
		call ITEM_ALL.push(ITEM_BLOW_GUN)
		call ITEM_ALL.push(ITEM_CAMOUFLAGE_COAT)
		call ITEM_ALL.push(ITEM_DARK_THISTLES)
		call ITEM_ALL.push(ITEM_EMP)
		call ITEM_ALL.push(ITEM_FIRE_BOMB)
		call ITEM_ALL.push(ITEM_NETS)
		call ITEM_ALL.push(ITEM_SMOKE_BOMB)
		call ITEM_ALL.push(ITEM_SONAR_COMPASS)
		call ITEM_ALL.push(ITEM_THISTLES)
		call ITEM_ALL.push(ITEM_CLOAK_OF_FLAMES)
		call ITEM_ALL.push(ITEM_CLOAK_OF_FROST)
		call ITEM_ALL.push(ITEM_CLOAK_OF_HEALING)
		call ITEM_ALL.push(ITEM_LIVING_CLAY)
		call ITEM_ALL.push(ITEM_MAGIC_SEED)
		call ITEM_ALL.push(ITEM_POISON)
		call ITEM_ALL.push(ITEM_POISON_SPEAR)
		call ITEM_ALL.push(ITEM_REFINED_POISON_SPEAR)
		call ITEM_ALL.push(ITEM_SCROLL_SWIFTNESS)
		call ITEM_ALL.push(ITEM_SCROLL_CYCLONE)
		call ITEM_ALL.push(ITEM_SCROLL_ENTANGLING_ROOTS)
		call ITEM_ALL.push(ITEM_SCROLL_FIREBALL)
		call ITEM_ALL.push(ITEM_SCROLL_LIVING_DEAD)
		call ITEM_ALL.push(ITEM_SCROLL_STONE_ARMOR)
		call ITEM_ALL.push(ITEM_SCROLL_TSUNAMI)
		call ITEM_ALL.push(ITEM_ULTRA_POISON)
		call ITEM_ALL.push(ITEM_ULTRA_POISON_SPEAR)
		call ITEM_ALL.push(ITEM_BONE_BOOTS)
		call ITEM_ALL.push(ITEM_BONE_COAT)
		call ITEM_ALL.push(ITEM_BONE_GLOVES)
		call ITEM_ALL.push(ITEM_BONE_SHIELD)
		call ITEM_ALL.push(ITEM_DARK_SPEAR)
		call ITEM_ALL.push(ITEM_FLINT_AXE)
		call ITEM_ALL.push(ITEM_IRON_AXE)
		call ITEM_ALL.push(ITEM_IRON_BOOTS)
		call ITEM_ALL.push(ITEM_IRON_COAT)
		call ITEM_ALL.push(ITEM_IRON_GLOVES)
		call ITEM_ALL.push(ITEM_IRON_INGOT)
		call ITEM_ALL.push(ITEM_IRON_SHIELD)
		call ITEM_ALL.push(ITEM_IRON_SPEAR)
		call ITEM_ALL.push(ITEM_MAGE_MASHER)
		call ITEM_ALL.push(ITEM_SHIELD)
		call ITEM_ALL.push(ITEM_SPEAR)
		call ITEM_ALL.push(ITEM_STEEL_AXE)
		call ITEM_ALL.push(ITEM_STEEL_BOOTS)
		call ITEM_ALL.push(ITEM_STEEL_COAT)
		call ITEM_ALL.push(ITEM_STEEL_GLOVES)
		call ITEM_ALL.push(ITEM_STEEL_INGOT)
		call ITEM_ALL.push(ITEM_STEEL_SHIELD)
		call ITEM_ALL.push(ITEM_STEEL_SPEAR)
		call ITEM_ALL.push(ITEM_STONE_AXE)
		call ITEM_ALL.push(ITEM_LOADED_THISTLES)
		call ITEM_ALL.push(ITEM_LOADED_DARK_THISTLES)
		call ITEM_ALL.push(ITEM_LOADED_BONE)
		call ITEM_ALL.push(ITEM_BEAR_SKIN_BOOTS)
		call ITEM_ALL.push(ITEM_BEAR_SKIN_COAT)
		call ITEM_ALL.push(ITEM_BEAR_SKIN_GLOVES)
		call ITEM_ALL.push(ITEM_ELK_SKIN_BOOTS)
		call ITEM_ALL.push(ITEM_ELK_SKIN_COAT)
		call ITEM_ALL.push(ITEM_ELK_SKIN_GLOVES)
		call ITEM_ALL.push(ITEM_WOLF_SKIN_BOOTS)
		call ITEM_ALL.push(ITEM_WOLF_SKIN_COAT)
		call ITEM_ALL.push(ITEM_WOLF_SKIN_GLOVES)
		call ITEM_ALL.push(ITEM_ARMORY_KIT)
		call ITEM_ALL.push(ITEM_DEFENSIVE_WARD_KIT)
		call ITEM_ALL.push(ITEM_ENSNARE_TRAP_KIT)
		call ITEM_ALL.push(ITEM_FIRE_KIT)
		call ITEM_ALL.push(ITEM_HATCHERY_KIT)
		call ITEM_ALL.push(ITEM_MAGE_FIRE_KIT)
		call ITEM_ALL.push(ITEM_MUD_HUT_KIT)
		call ITEM_ALL.push(ITEM_OMNIDEFENDER_KIT)
		call ITEM_ALL.push(ITEM_POT_KIT)
		call ITEM_ALL.push(ITEM_SMOKE_HOUSE_KIT)
		call ITEM_ALL.push(ITEM_SPIRIT_WARD_KIT)
		call ITEM_ALL.push(ITEM_STORAGE_HUT_KIT)
		call ITEM_ALL.push(ITEM_TANNERY_KIT)
		call ITEM_ALL.push(ITEM_TELEPORT_BEACON_KIT)
		call ITEM_ALL.push(ITEM_TENT_KIT)
		call ITEM_ALL.push(ITEM_TRANSPORT_SHIP_KIT)
		call ITEM_ALL.push(ITEM_TROLL_BURROW_KIT)
		call ITEM_ALL.push(ITEM_TROLL_HUT_KIT)
		call ITEM_ALL.push(ITEM_WITCH_DOCTORS_HUT_KIT)
		call ITEM_ALL.push(ITEM_WORKSHOP_KIT)
		call ITEM_ALL.push(ITEM_BATTLE_SUIT_SPELLS)
		call ITEM_ALL.push(ITEM_BATTLE_SUIT_SPELLS_TWO)
		call ITEM_ALL.push(ITEM_CHEESE)
		call ITEM_ALL.push(ITEM_HEAD_HUNTER_STEEL_SPEAR)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_1)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_2)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_3)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_4)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_5)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_6)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_7)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_8)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_9)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_10)
		call ITEM_ALL.push(ITEM_HERB_RECIPE_11)
		call ITEM_ALL.push(ITEM_HYDRA_HINT)
		call ITEM_ALL.push(ITEM_OPPOSING_NIGHT_ITEM)
		call ITEM_ALL.push(ITEM_PANTHER_HIDE)
		call ITEM_ALL.push(ITEM_SECRET_HINT)
		call ITEM_ALL.push(ITEM_TOME_LOSS)
		call ITEM_ALL.push(ITEM_REPAIR_HAMMER)
		call ITEM_ALL.push(ITEM_NULL)
		call ITEM_ALL.push(ITEM_CANDY_CANE)
		call DEST_ALL.push(DEST_FALSE_TREE)
		call DEST_ALL.push(DEST_RUINS_TREE)
		call DEST_ALL.push(DEST_RUINS_TREE_CANOPY)
		call DEST_ALL.push(DEST_RUINS_TREE_ITEM)
		call DEST_ALL.push(DEST_SUPER_TREE)
		call DEST_ALL.push(DEST_SUPER_TREE_CANOPY)
	endfunction
endlibrary
