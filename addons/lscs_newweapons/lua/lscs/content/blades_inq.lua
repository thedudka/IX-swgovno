local blade = {}
blade.PrintName = "EnergoModule" -- nice name in the menu
blade.Author = "Miller"
blade.id = "elst" -- internal ID. Always lower case.
blade.color_blur = Color(60,19,119)
blade.color_core = Color(163,84,212)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 21 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 5 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" ) -- material of the inner cores blade-tip
blade.material_core = Material( "lscs/effects/lightsaber_core" ) -- material of the inner cores blade
blade.material_glow = Material( "lscs/effects/lightsaber_glow" ) -- glow sprite effect
blade.material_trail = Material( "lscs/effects/lightsaber_trail" ) -- what material to use for the trail
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "nanosword_hup",
	Attack1 = "nanosword_hup",
	Attack2 = "nanosword_hup",
	Attack3 = "nanosword_hup",
	Activate = "nanosword_turnon",
	Disable = "nanosword_turnoff",
	Idle =  "nanosword_idle",
}
LSCS:RegisterBlade( blade ) -- register it to the system. This will also register a new entity


local blade = {}
blade.PrintName = "EnergoModule Long" -- nice name in the menu
blade.Author = "Miller"
blade.id = "elstl" -- internal ID. Always lower case.
blade.color_blur = Color(60,19,119)
blade.color_core = Color(163,84,212)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 25 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" ) -- material of the inner cores blade-tip
blade.material_core = Material( "lscs/effects/lightsaber_core" ) -- material of the inner cores blade
blade.material_glow = Material( "lscs/effects/lightsaber_glow" ) -- glow sprite effect
blade.material_trail = Material( "lscs/effects/lightsaber_trail" ) -- what material to use for the trail
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "nanosword_hup",
	Attack1 = "nanosword_hup",
	Attack2 = "nanosword_hup",
	Attack3 = "nanosword_hup",
	Activate = "nanosword_turnon",
	Disable = "nanosword_turnoff",
	Idle =  "nanosword_idle",
}
LSCS:RegisterBlade( blade ) -- register it to the system. This will also register a new entity



local blade = {}
blade.PrintName = "EnergoModule Bat" -- nice name in the menu
blade.Author = "Miller"
blade.id = "elstb" -- internal ID. Always lower case.
blade.color_blur = Color(60,19,119)
blade.color_core = Color(163,84,212)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 15 -- blade length
blade.width = 2 -- width
blade.widthWiggle = 8 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" ) -- material of the inner cores blade-tip
blade.material_core = Material( "lscs/effects/lightsaber_core" ) -- material of the inner cores blade
blade.material_glow = Material( "lscs/effects/lightsaber_glow" ) -- glow sprite effect
blade.material_trail = Material( "lscs/effects/lightsaber_trail" ) -- what material to use for the trail
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "nanosword_hup",
	Attack1 = "nanosword_hup",
	Attack2 = "nanosword_hup",
	Attack3 = "nanosword_hup",
	Activate = "nanosword_turnon",
	Disable = "nanosword_turnoff",
	Idle =  "nanosword_idle",
}
LSCS:RegisterBlade( blade ) -- register it to the system. This will also register a new entity


local blade = {}
blade.PrintName = "EnergoModule Katana" -- nice name in the menu
blade.Author = "Miller"
blade.id = "elstk" -- internal ID. Always lower case.
blade.color_blur = Color(60,19,119)
blade.color_core = Color(163,84,212)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 40 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 4 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" ) -- material of the inner cores blade-tip
blade.material_core = Material( "lscs/effects/lightsaber_core" ) -- material of the inner cores blade
blade.material_glow = Material( "lscs/effects/lightsaber_glow" ) -- glow sprite effect
blade.material_trail = Material( "lscs/effects/lightsaber_trail" ) -- what material to use for the trail
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "nanosword_hup",
	Attack1 = "nanosword_hup",
	Attack2 = "nanosword_hup",
	Attack3 = "nanosword_hup",
	Activate = "nanosword_turnon",
	Disable = "nanosword_turnoff",
	Idle =  "nanosword_idle",
}
LSCS:RegisterBlade( blade ) -- register it to the system. This will also register a new entity

local blade = {}
blade.PrintName = "Electrohammer Crystal" -- nice name in the menu
blade.Author = "Midnight"
blade.id = "elecham" -- internal ID. Always lower case.
blade.color_blur = Color(60,19,119)
blade.color_core = Color(163,84,212)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 10 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 5 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" ) -- material of the inner cores blade-tip
blade.material_core = Material( "lscs/effects/lightsaber_core" ) -- material of the inner cores blade
blade.material_glow = Material( "lscs/effects/lightsaber_glow" ) -- glow sprite effect
blade.material_trail = Material( "lscs/effects/lightsaber_trail" ) -- what material to use for the trail
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "nanosword_hup",
	Attack1 = "nanosword_hup",
	Attack2 = "nanosword_hup",
	Attack3 = "nanosword_hup",
	Activate = "nanosword_turnon",
	Disable = "nanosword_turnoff",
	Idle =  "nanosword_idle",
}
LSCS:RegisterBlade( blade ) -- register it to the system. This will also register a new entity