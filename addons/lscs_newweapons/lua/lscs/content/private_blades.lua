local blade = {}
blade.PrintName = "Blue" 
blade.Author = "RareLogan"
blade.id = "bluehor" -- internal ID. Always lower case.
blade.color_blur = Color(0, 0, 190)
blade.color_core = Color(255, 255, 255)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl"
--blade.mdl_poseparameter = "blade_retract" 
blade.length = 45 -- blade length
blade.width = 0.6 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "lightsaber/saber_on1.wav",
	Disable = "lightsaber/saber_off1.wav",
	Idle =  "lightsaber/saber_loop1.wav",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Light Blue" 
blade.Author = "RareLogan"
blade.id = "lblue" -- internal ID. Always lower case.
blade.color_blur = Color(0, 120, 190)
blade.color_core = Color(255, 255, 255)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl"
--blade.mdl_poseparameter = "blade_retract" 
blade.length = 45 -- blade length
blade.width = 0.6 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "lightsaber/saber_on1.wav",
	Disable = "lightsaber/saber_off1.wav",
	Idle =  "lightsaber/saber_loop1.wav",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Green" 
blade.Author = "RareLogan"
blade.id = "greenhor" -- internal ID. Always lower case.
blade.color_blur = Color(0, 200, 0)
blade.color_core = Color(255, 255, 255)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl"
--blade.mdl_poseparameter = "blade_retract" 
blade.length = 45 -- blade length
blade.width = 0.6 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "lightsaber/saber_on1.wav",
	Disable = "lightsaber/saber_off1.wav",
	Idle =  "lightsaber/saber_loop1.wav",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Red" 
blade.Author = "RareLogan"
blade.id = "redhor" -- internal ID. Always lower case.
blade.color_blur = Color(200, 0, 0)
blade.color_core = Color(255, 255, 255)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl"
--blade.mdl_poseparameter = "blade_retract" 
blade.length = 45 -- blade length
blade.width = 0.6 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "lightsaber/saber_on3.wav",
	Disable = "lightsaber/saber_off3.wav",
	Idle =  "lightsaber/saber_loop3.wav",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "White" 
blade.Author = "RareLogan"
blade.id = "white" -- internal ID. Always lower case.
blade.color_blur = Color(255,255,255)
blade.color_core = Color(255, 255, 255)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl"
--blade.mdl_poseparameter = "blade_retract" 
blade.length = 45 -- blade length
blade.width = 0.6 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "lscs/saber/saberhum4.wav",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Dark Crystal" -- nice name in the menu
blade.Author = "RareLogan"
blade.id = "darksaber" -- internal ID. Always lower case.
blade.color_blur = Color(255,255,255)
blade.color_core = Color(255,255,255)
--blade.mdl = "models/lscs/weapons/nanosword_bladefx.mdl" -- use a model as blade?
--blade.mdl_poseparameter = "blade_retract" -- pose parameter to retract the blade. Should go from 0-1
blade.length = 45 -- blade length
blade.width = 0.6 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core = Material( "lscs/effects/lightsaber_coreblack")
blade.material_trail = Material( "lscs/effects/lightsaber_trailblack" ) -- what material to use for the trail
blade.material_core_tip = Material( "lscs/effects/lightsaber_tipblack" )
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "lightsaber/darksaber_on.wav",
	Disable = "lightsaber/darksaber_off.wav",
	Idle =  "lightsaber/darksaber_loop.wav",
}
LSCS:RegisterBlade( blade ) -- register it to the system. This will also register a new entity