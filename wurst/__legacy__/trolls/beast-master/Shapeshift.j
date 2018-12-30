//===========================================================================
function keepSpellbook takes unit u returns nothing
    call UnitMakeAbilityPermanent(u, true, 'A0EI')
    call UnitMakeAbilityPermanent(u, true, 'A0EN')
    call UnitMakeAbilityPermanent(u, true, 'A0EO')
endfunction

function Trig_Shapeshift_Actions takes nothing returns nothing
    if ( GetIssuedOrderIdBJ() == String2OrderIdBJ("bearform") ) then
      call keepSpellbook(GetTriggerUnit())
      call SetPlayerAbilityAvailableBJ( false, 'A0EN', GetOwningPlayer(GetTriggerUnit()) )
      call SetPlayerAbilityAvailableBJ( false, 'A0EO', GetOwningPlayer(GetTriggerUnit()) )
    elseif ( GetIssuedOrderIdBJ() == String2OrderIdBJ("unbearform") ) then
      call keepSpellbook(GetTriggerUnit())
      call SetPlayerAbilityAvailableBJ( true, 'A0EN', GetOwningPlayer(GetTriggerUnit()) )
      call SetPlayerAbilityAvailableBJ( true, 'A0EO', GetOwningPlayer(GetTriggerUnit()) )
    elseif ( GetIssuedOrderIdBJ() == String2OrderIdBJ("ravenform") ) then
      call keepSpellbook(GetTriggerUnit())
      call SetPlayerAbilityAvailableBJ( false, 'A0EI', GetOwningPlayer(GetTriggerUnit()) )
      call SetPlayerAbilityAvailableBJ( false, 'A0EO', GetOwningPlayer(GetTriggerUnit()) )
    elseif ( GetIssuedOrderIdBJ() == String2OrderIdBJ("unravenform") ) then
      call keepSpellbook(GetTriggerUnit())
      call SetPlayerAbilityAvailableBJ( true, 'A0EI', GetOwningPlayer(GetTriggerUnit()) )
      call SetPlayerAbilityAvailableBJ( true, 'A0EO', GetOwningPlayer(GetTriggerUnit()) )
    elseif ( GetIssuedOrderIdBJ() == String2OrderIdBJ("robogoblin") ) then
      call keepSpellbook(GetTriggerUnit())
      call SetPlayerAbilityAvailableBJ( false, 'A0EI', GetOwningPlayer(GetTriggerUnit()) )
      call SetPlayerAbilityAvailableBJ( false, 'A0EN', GetOwningPlayer(GetTriggerUnit()) )
    elseif ( GetIssuedOrderIdBJ() == String2OrderIdBJ("unrobogoblin") ) then
      call keepSpellbook(GetTriggerUnit())
      call SetPlayerAbilityAvailableBJ( true, 'A0EI', GetOwningPlayer(GetTriggerUnit()) )
      call SetPlayerAbilityAvailableBJ( true, 'A0EN', GetOwningPlayer(GetTriggerUnit()) )
    endif
endfunction

//===========================================================================
function InitTrig_Shapeshift takes nothing returns nothing
    set gg_trg_Shapeshift = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Shapeshift, EVENT_PLAYER_UNIT_ISSUED_ORDER )
    call TriggerAddAction( gg_trg_Shapeshift, function Trig_Shapeshift_Actions )
endfunction

//===========================================================================
