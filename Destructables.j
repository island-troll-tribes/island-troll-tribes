
//***************************************************************************
//*
//*  Destructable Objects
//*
//***************************************************************************

function CreateAllDestructables takes nothing returns nothing
    local destructable d
    local trigger t
    local real life
    set d = CreateDestructable( 'LTbr', -2144.0, -11552.0, 270.000, 1.100, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad001928_DropItems )
    set d = CreateDestructable( 'LTbr', -4704.0, -11872.0, 117.000, 1.386, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad002625_DropItems )
    set d = CreateDestructable( 'LTbr', -4000.0, -11872.0, 176.000, 1.219, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad002635_DropItems )
    set d = CreateDestructable( 'LTbr', -7520.0, -12128.0, 270.000, 1.100, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad002881_DropItems )
    set d = CreateDestructable( 'LTbx', -2016.0, -12192.0, 79.000, 1.165, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad000881_DropItems )
    set d = CreateDestructable( 'LTbx', -2912.0, -12128.0, 66.000, 1.254, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad001476_DropItems )
    set d = CreateDestructable( 'LTbx', -6432.0, -12256.0, 173.000, 1.222, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad002882_DropItems )
    set d = CreateDestructable( 'LTbx', -6560.0, -11488.0, 0.000, 1.421, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterDeathEvent( t, d )
    call TriggerAddAction( t, function SaveDyingWidget )
    call TriggerAddAction( t, function Doodad004327_DropItems )
    set gg_dest_ZTsx_3140 = CreateDestructable( 'ZTsx', 1088.0, -576.0, 270.000, 1.000, 0 )
endfunction
