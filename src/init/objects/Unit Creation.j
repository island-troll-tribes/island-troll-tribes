
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

library InitUnits requires ItemTables
    //===========================================================================
    function CreateUnitsForPlayer0 takes nothing returns nothing
        local player p = Player(0)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', -4320.5, 2340.2, 315.471 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer1 takes nothing returns nothing
        local player p = Player(1)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', -4338.5, 2447.1, 328.560 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer2 takes nothing returns nothing
        local player p = Player(2)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', -4317.0, 2695.8, 275.170 )
    endfunction

    //===========================================================================
    function CreateBuildingsForPlayer3 takes nothing returns nothing
        local player p = Player(3)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'o00H', -4160.0, 2496.0, 270.000 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer3 takes nothing returns nothing
        local player p = Player(3)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', -4333.5, 2567.3, 247.310 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer4 takes nothing returns nothing
        local player p = Player(4)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set gg_unit_O00J_0024 = CreateUnit( p, 'O00J', 4991.1, 1922.2, 108.120 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer5 takes nothing returns nothing
        local player p = Player(5)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set gg_unit_O00J_0025 = CreateUnit( p, 'O00J', 5002.4, 2015.1, 335.895 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer6 takes nothing returns nothing
        local player p = Player(6)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set gg_unit_O00J_0026 = CreateUnit( p, 'O00J', 5005.5, 2138.7, 51.462 )
    endfunction

    //===========================================================================
    function CreateBuildingsForPlayer7 takes nothing returns nothing
        local player p = Player(7)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set gg_unit_o00H_0032 = CreateUnit( p, 'o00H', 4800.0, 2112.0, 270.000 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer7 takes nothing returns nothing
        local player p = Player(7)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set gg_unit_O00J_0027 = CreateUnit( p, 'O00J', 5008.2, 2234.7, 23.654 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer8 takes nothing returns nothing
        local player p = Player(8)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', 2240.3, -4387.9, 141.256 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer9 takes nothing returns nothing
        local player p = Player(9)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', 2244.4, -4574.6, 181.225 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer10 takes nothing returns nothing
        local player p = Player(10)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', 2262.1, -4482.0, 170.227 )
    endfunction

    //===========================================================================
    function CreateBuildingsForPlayer11 takes nothing returns nothing
        local player p = Player(11)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'o00H', 2048.0, -4480.0, 270.000 )
    endfunction

    //===========================================================================
    function CreateUnitsForPlayer11 takes nothing returns nothing
        local player p = Player(11)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'O00J', 2223.8, -4658.9, 317.844 )
    endfunction

    //===========================================================================
    function CreateNeutralHostileBuildings takes nothing returns nothing
        local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'h02J', -6272.0, 2048.0, 270.000 )
        set u = CreateUnit( p, 'h02J', 6464.0, 1920.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 5120.0, -9856.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -3008.0, -7936.0, 270.000 )
        set u = CreateUnit( p, 'h01H', -9408.0, -6720.0, 270.000 )
        set u = CreateUnit( p, 'h01G', -2624.0, -7360.0, 270.000 )
        set u = CreateUnit( p, 'h01H', 1408.0, -896.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -5056.0, -128.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -3840.0, -9472.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -3328.0, -9536.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -5888.0, -9024.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -1152.0, 1536.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 9408.0, -1344.0, 270.000 )
        set u = CreateUnit( p, 'h02J', 2304.0, -6656.0, 270.000 )
        set u = CreateUnit( p, 'h02J', -8640.0, -7488.0, 270.000 )
        set u = CreateUnit( p, 'h02J', -2112.0, 320.0, 270.000 )
        set u = CreateUnit( p, 'h02J', 5824.0, -6208.0, 270.000 )
        set u = CreateUnit( p, 'h02J', 1984.0, 7616.0, 270.000 )
        set u = CreateUnit( p, 'h02J', -8256.0, 8000.0, 270.000 )
    endfunction

    //===========================================================================
    function CreateNeutralHostile takes nothing returns nothing
        local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'n01B', -11338.7, -9959.1, 313.436 )
        set gg_unit_n005_0034 = CreateUnit( p, 'n005', 1124.8, 431.4, 180.000 )
        set u = CreateUnit( p, 'O00M', -6906.7, 10871.3, 228.704 )
        call SetUnitState( u, UNIT_STATE_MANA, 3 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'n01B', -9471.6, -11649.9, 313.436 )
        set u = CreateUnit( p, 'n01B', -9611.9, 10762.9, 353.555 )
        set u = CreateUnit( p, 'O00M', -11532.4, -550.4, 278.500 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set t = CreateTrigger(  )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
        call TriggerAddAction( t, function ItemTable000000_DropItems )
        set u = CreateUnit( p, 'n01B', -11335.0, 513.7, 307.022 )
        set u = CreateUnit( p, 'O00M', -2191.5, 10994.1, 62.680 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'n011', 10997.8, -12177.1, 135.000 )
        set u = CreateUnit( p, 'n011', -11898.9, -11915.7, 45.000 )
        set t = CreateTrigger(  )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
        call TriggerAddAction( t, function ItemTable000000_DropItems )
        set u = CreateUnit( p, 'n011', -12162.9, 11005.1, 316.031 )
        set u = CreateUnit( p, 'n011', 10880.7, 11008.1, 225.000 )
        set t = CreateTrigger(  )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
        call TriggerAddAction( t, function ItemTable000000_DropItems )
        set u = CreateUnit( p, 'O00M', 9006.9, 10769.7, 178.154 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set t = CreateTrigger(  )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
        call TriggerAddAction( t, function ItemTable000000_DropItems )
        set u = CreateUnit( p, 'n01B', 10921.3, 985.2, 303.360 )
        set u = CreateUnit( p, 'n01B', 10534.8, -5082.3, 33.125 )
        set u = CreateUnit( p, 'n01B', 7449.1, -10468.1, 98.715 )
        set u = CreateUnit( p, 'O00M', 6016.3, -12186.0, 278.500 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set t = CreateTrigger(  )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
        call TriggerAddAction( t, function ItemTable000000_DropItems )
        set u = CreateUnit( p, 'O00M', 8713.3, -11453.7, 117.766 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', 11206.6, -7294.1, 260.867 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', 10348.3, 2875.0, 303.638 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', 5822.0, 10838.1, 339.532 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', 746.1, 11014.0, 98.660 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', -11571.0, 1768.8, 79.016 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', -11790.5, -6359.7, 347.376 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', 10826.7, 6500.8, 62.680 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'n01B', 3594.4, 10844.1, 56.200 )
        set u = CreateUnit( p, 'O00M', 10687.4, -3219.5, 62.680 )
        call SetUnitState( u, UNIT_STATE_MANA, 0 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', -11588.8, 4350.0, 261.885 )
        call SetUnitState( u, UNIT_STATE_MANA, 195 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'O00M', -725.6, -9827.9, 107.680 )
        call SetUnitState( u, UNIT_STATE_MANA, 3 )
        call IssueImmediateOrder( u, "webon" )
        set u = CreateUnit( p, 'n01B', -10657.6, -5648.6, 307.022 )
    endfunction

    //===========================================================================
    function CreateNeutralPassiveBuildings takes nothing returns nothing
        local player p = Player(PLAYER_NEUTRAL_PASSIVE)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'h00J', 1920.0, -10816.0, 270.000 )
        set MASTER_CRAFTER = CreateUnit( p, 'n00N', 1216.0, -1216.0, 270.000 )
        set u = CreateUnit( p, 'h00A', 2432.0, -11136.0, 270.000 )
        set u = CreateUnit( p, 'h016', 1600.0, -10880.0, 270.000 )
        set u = CreateUnit( p, 'h00W', 2240.0, -10816.0, 270.000 )
        set u = CreateUnit( p, 'h01R', 1728.0, -10752.0, 270.000 )
        set u = CreateUnit( p, 'h01G', -6016.0, -3520.0, 270.000 )
        set u = CreateUnit( p, 'h01G', 9088.0, -8000.0, 270.000 )
        set u = CreateUnit( p, 'h01G', 1600.0, 8128.0, 270.000 )
        set u = CreateUnit( p, 'h01G', -7808.0, 2048.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -1600.0, 8896.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -9152.0, 192.0, 270.000 )
        set u = CreateUnit( p, 'h01F', 9536.0, 7680.0, 270.000 )
        set u = CreateUnit( p, 'h01F', 7040.0, -6016.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -5952.0, 3904.0, 270.000 )
        set u = CreateUnit( p, 'h01F', 4288.0, 8768.0, 270.000 )
        set u = CreateUnit( p, 'h01F', 8000.0, 4928.0, 270.000 )
        set u = CreateUnit( p, 'h01H', 768.0, -1152.0, 270.000 )
        set u = CreateUnit( p, 'h01H', -128.0, -320.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -6912.0, -5568.0, 270.000 )
        set u = CreateUnit( p, 'h01H', 7936.0, 7360.0, 270.000 )
        set u = CreateUnit( p, 'h01H', 5568.0, 320.0, 270.000 )
        set u = CreateUnit( p, 'h01H', -6336.0, 6208.0, 270.000 )
        set u = CreateUnit( p, 'h01H', -320.0, -4480.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 1600.0, -3712.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -7808.0, 2624.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -6656.0, -4544.0, 270.000 )
        set u = CreateUnit( p, 'h01G', -6656.0, -4800.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -192.0, -5248.0, 270.000 )
        set u = CreateUnit( p, 'h01I', -4480.0, 9472.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 1472.0, 7680.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 5312.0, 6848.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 7616.0, -4160.0, 270.000 )
        set u = CreateUnit( p, 'h01J', -7296.0, 7104.0, 270.000 )
        set u = CreateUnit( p, 'h01J', -5312.0, 7104.0, 270.000 )
        set u = CreateUnit( p, 'h01K', 6208.0, 6144.0, 270.000 )
        set u = CreateUnit( p, 'h01K', 5056.0, 6080.0, 270.000 )
        set u = CreateUnit( p, 'h01L', 8896.0, -2112.0, 270.000 )
        set u = CreateUnit( p, 'h01L', 3328.0, -5696.0, 270.000 )
        set u = CreateUnit( p, 'h024', -5056.0, 4416.0, 270.000 )
        set u = CreateUnit( p, 'h01M', 1600.0, -11456.0, 270.000 )
        set u = CreateUnit( p, 'h01Q', 2432.0, -11328.0, 270.000 )
        set u = CreateUnit( p, 'h01Y', 2496.0, -10816.0, 270.000 )
        set u = CreateUnit( p, 'h02C', 1472.0, -11200.0, 270.000 )
        set u = CreateUnit( p, 'h024', 8704.0, 8768.0, 270.000 )
        set u = CreateUnit( p, 'h024', 8320.0, 512.0, 270.000 )
        set u = CreateUnit( p, 'h024', 8576.0, 384.0, 270.000 )
        set u = CreateUnit( p, 'h024', 1792.0, -1088.0, 270.000 )
        set u = CreateUnit( p, 'h024', 6208.0, -1216.0, 270.000 )
        set u = CreateUnit( p, 'h024', 8768.0, -8256.0, 270.000 )
        set u = CreateUnit( p, 'h024', 1408.0, -5440.0, 270.000 )
        set u = CreateUnit( p, 'h024', 2112.0, -3520.0, 270.000 )
        set u = CreateUnit( p, 'h024', -7616.0, 9152.0, 270.000 )
        set u = CreateUnit( p, 'h024', -704.0, 4928.0, 270.000 )
        set u = CreateUnit( p, 'h024', 2624.0, 832.0, 270.000 )
        set u = CreateUnit( p, 'h024', -8640.0, -512.0, 270.000 )
        set u = CreateUnit( p, 'h024', -7872.0, -5888.0, 270.000 )
        set u = CreateUnit( p, 'h024', -2496.0, -1216.0, 270.000 )
        set u = CreateUnit( p, 'h025', -7168.0, -1664.0, 270.000 )
        set u = CreateUnit( p, 'h025', -2880.0, -128.0, 270.000 )
        set u = CreateUnit( p, 'h025', -2880.0, 7360.0, 270.000 )
        set u = CreateUnit( p, 'h025', -4288.0, 3200.0, 270.000 )
        set u = CreateUnit( p, 'h025', 3136.0, 8064.0, 270.000 )
        set u = CreateUnit( p, 'h025', 2752.0, 3968.0, 270.000 )
        set u = CreateUnit( p, 'h025', 8384.0, -3008.0, 270.000 )
        set u = CreateUnit( p, 'h025', 3712.0, -4928.0, 270.000 )
        set u = CreateUnit( p, 'h025', -6912.0, -6720.0, 270.000 )
        set u = CreateUnit( p, 'h025', -8896.0, -4480.0, 270.000 )
        set u = CreateUnit( p, 'h026', -8896.0, -6848.0, 270.000 )
        set u = CreateUnit( p, 'h026', -2496.0, -3072.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -5632.0, 1088.0, 270.000 )
        set u = CreateUnit( p, 'h025', -1600.0, -2560.0, 270.000 )
        set u = CreateUnit( p, 'h024', -2880.0, 832.0, 270.000 )
        set u = CreateUnit( p, 'h025', 1472.0, -2240.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -3200.0, 512.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -3648.0, 192.0, 270.000 )
        set u = CreateUnit( p, 'h025', -2112.0, 1472.0, 270.000 )
        set u = CreateUnit( p, 'h01H', -64.0, -1024.0, 270.000 )
        set u = CreateUnit( p, 'h025', 4416.0, 3776.0, 270.000 )
        set u = CreateUnit( p, 'h01F', 192.0, 5824.0, 270.000 )
        set u = CreateUnit( p, 'h025', 2176.0, 6464.0, 270.000 )
        set u = CreateUnit( p, 'h01H', 5824.0, 3264.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 7616.0, 3520.0, 270.000 )
        set u = CreateUnit( p, 'h025', 9024.0, 6144.0, 270.000 )
        set u = CreateUnit( p, 'h01F', -5696.0, 8768.0, 270.000 )
        set u = CreateUnit( p, 'h025', -1536.0, -4096.0, 270.000 )
        set u = CreateUnit( p, 'h01I', 7360.0, -1088.0, 270.000 )
        set u = CreateUnit( p, 'h025', -3008.0, -6464.0, 270.000 )
        set gg_unit_n019_0145 = CreateUnit( p, 'n019', -64.0, 3264.0, 270.000 )
        set gg_unit_o003_0157 = CreateUnit( p, 'o003', 2368.0, -10816.0, 270.000 )
        set gg_unit_o00I_0173 = CreateUnit( p, 'o00I', 1728.0, -11456.0, 270.000 )
        set gg_unit_o00K_0174 = CreateUnit( p, 'o00K', 1600.0, -11136.0, 270.000 )
        set gg_unit_o005_0176 = CreateUnit( p, 'o005', 1728.0, -10880.0, 270.000 )
        set gg_unit_o004_0179 = CreateUnit( p, 'o004', 2048.0, -10816.0, 270.000 )
        set gg_unit_h000_0181 = CreateUnit( p, 'h000', 2048.0, -11200.0, 270.000 )
        set u = CreateUnit( p, 'h031', 1728.0, -11584.0, 270.000 )
    endfunction

    //===========================================================================
    function CreateNeutralPassive takes nothing returns nothing
        local player p = Player(PLAYER_NEUTRAL_PASSIVE)
        local unit u
        local integer unitID
        local trigger t
        local real life

        set u = CreateUnit( p, 'n013', 8497.4, -11916.3, 47.959 )
        set u = CreateUnit( p, 'n013', 10849.9, 6621.6, 270.000 )
        set u = CreateUnit( p, 'n013', -2112.4, 11003.5, 180.000 )
        set u = CreateUnit( p, 'n013', 10657.7, -3170.7, 270.000 )
        set u = CreateUnit( p, 'n013', 5745.7, 11074.2, 0.000 )
        set gg_unit_O00B_0180 = CreateUnit( p, 'O00B', 2309.0, -11213.2, 172.169 )
        call SetUnitState( gg_unit_O00B_0180, UNIT_STATE_MANA, 0 )
    endfunction

    //===========================================================================
    function CreatePlayerBuildings takes nothing returns nothing
        call CreateBuildingsForPlayer3(  )
        call CreateBuildingsForPlayer7(  )
        call CreateBuildingsForPlayer11(  )
    endfunction

    //===========================================================================
    function CreatePlayerUnits takes nothing returns nothing
        call CreateUnitsForPlayer0(  )
        call CreateUnitsForPlayer1(  )
        call CreateUnitsForPlayer2(  )
        call CreateUnitsForPlayer3(  )
        call CreateUnitsForPlayer4(  )
        call CreateUnitsForPlayer5(  )
        call CreateUnitsForPlayer6(  )
        call CreateUnitsForPlayer7(  )
        call CreateUnitsForPlayer8(  )
        call CreateUnitsForPlayer9(  )
        call CreateUnitsForPlayer10(  )
        call CreateUnitsForPlayer11(  )
    endfunction

    //===========================================================================
    function CreateAllUnits takes nothing returns nothing
        call CreateNeutralHostileBuildings(  )
        call CreateNeutralPassiveBuildings(  )
        call CreatePlayerBuildings(  )
        call CreateNeutralHostile(  )
        call CreateNeutralPassive(  )
        call CreatePlayerUnits(  )
    endfunction
endlibrary
