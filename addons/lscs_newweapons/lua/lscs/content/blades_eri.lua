local blade = {}
blade.PrintName = "White Pink Inner" -- nice name in the menu
blade.Author = "Tenkara"
blade.id = "ericrystall" -- internal ID. Always lower case.
blade.color_blur = Color(255,255,255)
blade.color_core = Color(128,128,128)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 45 -- blade length
blade.width = 0.4 -- width
blade.widthWiggle = 0.4 -- how much "noise" the blade has idling
blade.material_core = Material("lscs/effects/lightsaber_tenkara")
blade.material_trail = Material( "" ) -- what material to use for the trail
blade.material_core_tip = Material("")
blade.no_trail = true -- disable trail?
blade.sounds = {
	Attack = "tenkara/tenkara_attack.wav", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "tenkara/tenkara_attack2.wav", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "tenkara/tenkara_attack3.wav", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "tenkara/tenkara_attack.wav", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "tenkara/tenkara_on.wav",
	Disable = "tenkara/tenkara_off.wav",
	Idle =  "tenkara/tenkara_idle.wav",
}
LSCS:RegisterBlade( blade ) -- register it to the system. This will also register a new entity

