
//
// Abilities\Spells\Undead\DevourMagic\DevourMagicBirthMissile.mdl
//===========================================================================
//TESH.scrollpos=90
//TESH.alwaysfold=0
scope ItemPull initializer onInit
private function Conditions takes nothing returns boolean
    return  GetSpellAbilityId() == 'A06W'
endfunction

private struct data
    unit caster
    unit it
    item i
    integer ticks
    integer ticksMax
    real x
    real y
    timer t
    real speed
    effect sfx
    boolean valid = false
endstruct

private function PullItem takes nothing returns nothing
    local timer t = GetExpiredTimer()
	//local data d = data(GetHandleInt(t,"struct"))
    local data d = data(LoadInteger(udg_GameHash,GetHandleId(t),StringHash("struct")))
    local real x = GetUnitX(d.it)
    local real y = GetUnitY((d.it))
    local real xloc = GetUnitX(d.caster)
    local real yloc = GetUnitY(d.caster)
    local real ang = Atan2(yloc-y,xloc-x)
    
    local real dx = xloc - x
    local real dy = yloc - y
    
    set d.x = d.speed*Cos(ang)
    set d.y = d.speed*Sin(ang)
    
    if d.ticks <= 4 or d.ticks >= d.ticksMax or d.valid == false then
        call PauseTimer(d.t)
        call DestroyTimer(d.t)
        call RemoveUnit(d.it)
        call SetItemPosition(d.i, x, y) 
        call SetItemVisible(d.i, true)
        call d.destroy()
    else
        //set d.ticks = R2I(DistanceBetweenPoints(GetUnitLoc(d.it), GetUnitLoc(d.caster))/d.speed)
        set d.ticks = R2I(SquareRoot(dx * dx + dy * dy)/d.speed)
        call SetUnitPosition(d.it,GetUnitX(d.it)+d.x,GetUnitY(d.it)+d.y)
        set t = CreateTimer()
    endif
endfunction

private function PullItemsSetup takes nothing returns nothing
    local data d = data.create()
    local unit u = GetSpellAbilityUnit()
    //local location loc = GetUnitLoc(u)
    local item i = GetEnumItem()
    local integer itype = GetItemTypeId(i)
    //local location iloc = GetItemLoc(i)
    local real x = GetItemX(i) //GetLocationX(iloc)
    local real y = GetItemY(i) //GetLocationY(iloc)
    local unit it = CreateUnit(GetOwningPlayer(u), UNIT_DUMMY, x , y, 270)
    local real xloc = GetUnitX(u) //GetLocationX(loc)
    local real yloc = GetUnitY(u) //GetLocationY(loc)
    local real ang = Atan2(yloc-y,xloc-x)
    local real dx = y - yloc
    local real dy = x - xloc
    local real dist = SquareRoot(dx * dx + dy * dy) //DistanceBetweenPoints(loc, iloc)
    local real speed = 15
    //6 * GetUnitAbilityLevelSwapped('A06W', u)
    set d.speed = speed
    set d.t = CreateTimer()
    set d.caster = u
    set d.x = speed*Cos(ang)
    set d.y = speed*Sin(ang)
    set d.ticks = R2I(dist/speed)
    set d.ticksMax = GetUnitAbilityLevel(u,'A06W') * 60
    set d.it = it
    set d.i = i
    
    set d.valid = true
    //set d.sfx = AddSpecialEffectTarget("Doodads\\Cinematic\\EyeOfSargeras\\EyeOfSargeras.mdl",it,"origin")
    set d.sfx = AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DevourMagic\\DevourMagicBirthMissile.mdl",it,"origin")
        
    call SetItemVisible(i, false)
    
    //call SetHandleInt(d.t,"struct",d)
    call SaveInteger(udg_GameHash,GetHandleId(d.t),StringHash("struct"),d)   
    call TimerStart(d.t, .03, true, function PullItem)
    
    set i = null
    set u = null
    set it = null
endfunction


private function Actions takes nothing returns nothing
    local unit u = GetSpellAbilityUnit()
    //local location loc = GetUnitLoc(u)
    local real x = GetUnitX(u)
    local real y = GetUnitY(u)
    //local rect r = RectFromCenterSizeBJ(loc, 900.00 * I2R(GetUnitAbilityLevelSwapped('A06W', u)), 900.00 * I2R(GetUnitAbilityLevelSwapped('A06W', u)))
    local real hw = 900.00 * I2R(GetUnitAbilityLevel(u,'A06W'))
    local rect r = Rect( x - hw, y - hw, x + hw, y + hw )
    
    call EnumItemsInRect( r, null, function PullItemsSetup )

    call RemoveRect(r)
    //call RemoveLocation(loc)
    set r = null
    //set loc = null
    set u = null
endfunction

//===========================================================================
private function onInit takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition(t, Condition( function Conditions ))
    call TriggerAddAction(t, function Actions)
endfunction
endscope
//===========================================================================
