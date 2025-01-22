-- source: me @fatal lua cord
local checkboxEnableDeathEsp = gui.checkbox(gui.control_id('deathesp'))
local rowCheckboxEnable = gui.make_control('Enable ESP while dead', checkboxEnableDeathEsp)

local checkboxEnableDeathName = gui.checkbox(gui.control_id('deathname'))
local rowCheckboxEnableName = gui.make_control('Enable Name', checkboxEnableDeathName)

local checkboxEnableDeathHealth = gui.checkbox(gui.control_id('deathhealth'))
local rowCheckboxEnableHealth = gui.make_control('Enable Health', checkboxEnableDeathHealth)

local checkboxEnableDeathSkeleton = gui.checkbox(gui.control_id('deathskeleton'))
local rowCheckboxEnableSkeleton = gui.make_control('Enable Skeleton', checkboxEnableDeathSkeleton)

local checkboxEnableDeathBox = gui.checkbox(gui.control_id('deathbox'))
local rowCheckboxEnableBox = gui.make_control('Enable Box', checkboxEnableDeathBox)

local checkboxEnableDeathWeaponName = gui.checkbox(gui.control_id('deathweaponname'))
local rowCheckboxEnableWeaponName = gui.make_control('Enable Weapon Name', checkboxEnableDeathWeaponName)

local checkboxEnableWeaponIcon = gui.checkbox(gui.control_id('deathweaponicon'))
local rowCheckboxEnableWeaponIcon = gui.make_control('Enable Weapon Icon', checkboxEnableWeaponIcon)

local luaGroup = gui.ctx:find('lua>elements a')
luaGroup:add(rowCheckboxEnable)
luaGroup:add(rowCheckboxEnableName)
luaGroup:add(rowCheckboxEnableHealth)
luaGroup:add(rowCheckboxEnableSkeleton)
luaGroup:add(rowCheckboxEnableBox)
luaGroup:add(rowCheckboxEnableWeaponName)
luaGroup:add(rowCheckboxEnableWeaponIcon)
luaGroup:reset()

local Names = gui.ctx:find("visuals>enemy>esp>name") 
local Health = gui.ctx:find("visuals>enemy>esp>health")
local Skeleton = gui.ctx:find("visuals>enemy>esp>skeleton")
local Box = gui.ctx:find("visuals>enemy>esp>box")
local WeaponName = gui.ctx:find("visuals>enemy>esp>weapon")
local WeaponIcon = gui.ctx:find("visuals>enemy>esp>weapon icons")

local function SetEspVisible(bVisible)
    Names:get_value():set(bVisible and checkboxEnableDeathName:get_value():get())
    Health:get_value():set(bVisible and checkboxEnableDeathHealth:get_value():get())
    Skeleton:get_value():set(bVisible and checkboxEnableDeathSkeleton:get_value():get())
    Box:get_value():set(bVisible and checkboxEnableDeathBox:get_value():get())
    WeaponName:get_value():set(bVisible and checkboxEnableDeathWeaponName:get_value():get())
    WeaponIcon:get_value():set(bVisible and checkboxEnableWeaponIcon:get_value():get())
end

local function deathESP()
    if not checkboxEnableDeathEsp:get_value():get() then return end

    local Me = entities.get_local_pawn()
    if not Me then return end

    if (Me:is_alive()) then
        SetEspVisible(false)
    else
        SetEspVisible(true)
    end 
end
events.present_queue:add(deathESP)