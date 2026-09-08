local blade = {}
blade.PrintName = "Training Saber Blade" -- nice name in the menu
blade.Author = "Colt"
blade.Spawnable = false
blade.id = "trainingsaberblade" -- internal ID. Always lower case.
blade.color_blur = Color(135,135,135, 0)
blade.color_core = Color(135,135,135, 0)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 0 -- blade length
blade.width = 0 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" ) -- material of the inner cores blade-tip
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