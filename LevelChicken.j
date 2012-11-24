
//===========================================================================
function Trig_LevelChicken_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == UNIT_CHICKEN_FORM ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLevel(GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLevel(GetTriggerUnit()) > 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLevel(GetTriggerUnit()) > 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLevel(GetTriggerUnit()) > 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Func001Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLevel(GetTriggerUnit()) > 12 ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLevel(GetTriggerUnit()) > 20 ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Func001C takes nothing returns boolean
    if ( not ( GetUnitLevel(GetTriggerUnit()) == 30 ) ) then
        return false
    endif
    return true
endfunction

function Trig_LevelChicken_Actions takes nothing returns nothing
    if ( Trig_LevelChicken_Func001C() ) then
        call SetUnitAbilityLevelSwapped( 'A07N', GetTriggerUnit(), 8 )
    else
        if ( Trig_LevelChicken_Func001Func001C() ) then
            call SetUnitAbilityLevelSwapped( 'A07N', GetTriggerUnit(), 7 )
        else
            if ( Trig_LevelChicken_Func001Func001Func001C() ) then
                call SetUnitAbilityLevelSwapped( 'A07N', GetTriggerUnit(), 6 )
            else
                if ( Trig_LevelChicken_Func001Func001Func001Func001C() ) then
                    call SetUnitAbilityLevelSwapped( 'A07N', GetTriggerUnit(), 5 )
                else
                    if ( Trig_LevelChicken_Func001Func001Func001Func001Func001C() ) then
                        call SetUnitAbilityLevelSwapped( 'A07N', GetTriggerUnit(), 4 )
                    else
                        if ( Trig_LevelChicken_Func001Func001Func001Func001Func001Func001C() ) then
                            call SetUnitAbilityLevelSwapped( 'A07N', GetTriggerUnit(), 3 )
                        else
                            if ( Trig_LevelChicken_Func001Func001Func001Func001Func001Func001Func001C() ) then
                                call SetUnitAbilityLevelSwapped( 'A07N', GetTriggerUnit(), 2 )
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction

//===========================================================================
function InitTrig_LevelChicken takes nothing returns nothing
    set gg_trg_LevelChicken = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_LevelChicken, EVENT_PLAYER_HERO_LEVEL )
    call TriggerAddCondition( gg_trg_LevelChicken, Condition( function Trig_LevelChicken_Conditions ) )
    call TriggerAddAction( gg_trg_LevelChicken, function Trig_LevelChicken_Actions )
endfunction

//===========================================================================
