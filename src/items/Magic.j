
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Magic_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == ITEM_MAGIC ) ) then
        return false
    endif
    return true
endfunction

function Trig_Magic_Actions takes nothing returns nothing
    local unit u = GetManipulatingUnit()
    local integer i = GetRandomInt(1,10)
    local location loc

    call itemLower(1)

    if Mammoth_Dead and DiscoDuck == null then
        call HornSound()
        set loc = GetRectCenter(gg_rct_discoduck)
        set DiscoDuck = CreateUnit( Player(12), UNIT_DISCO_DUCK, 999, 413, 270)
        call DestroyEffect(AddSpecialEffectTarget(teleportModel, DiscoDuck, "overhead"))
    elseif i == 1 then
        call SetUnitLifePercentBJ( u, 30 )
        call SetUnitManaPercentBJ( u, 30 )
    elseif i == 2 then
        call SetUnitLifePercentBJ( u, 6 )
        call SetUnitManaPercentBJ( u, 2 )
    elseif i == 3 then
        call SetTimeOfDay( 24.00 )
    elseif i == 4 then
        call KillUnit( u )
    elseif i >= 5 and i <= 6  then
        call masterCastAtTarget(u,u,0,0,'ANfs',"flamestrike")
    elseif i == 7 then
        call AddHeroXP( u, 500, true )
    elseif i >= 8 and i <= 9 then
        call SetUnitLifePercentBJ( u, 100 )
        call SetUnitManaPercentBJ( u, 100 )
    elseif i == 10 then
        call CreateItem( ITEM_MANA_CRYSTAL, GetUnitX(u), GetUnitY(u))
        call CreateItem( ITEM_MANA_CRYSTAL, GetUnitX(u), GetUnitY(u))
    endif

    set u = null
    set loc = null
endfunction

//===========================================================================
function InitTrig_Magic takes nothing returns nothing
    set gg_trg_Magic = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Magic, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_Magic, Condition( function Trig_Magic_Conditions ) )
    call TriggerAddAction( gg_trg_Magic, function Trig_Magic_Actions )
endfunction

//===========================================================================
