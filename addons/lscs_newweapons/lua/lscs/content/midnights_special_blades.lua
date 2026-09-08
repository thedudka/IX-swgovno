local blade = {}
blade.PrintName = "Rainbow" 
blade.Author = "Midnight"
blade.id = "rainbow" 
blade.color_blur = Color(255, 255, 255)
blade.color_core = Color(255, 255, 255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_rainbowglow" )
blade.material_trail = Material( "lscs/effects/lightsaber_rainbowtrail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Rainbow [Old]" 
blade.Author = "Midnight"
blade.id = "rainbow2" 
blade.color_blur = Color(100, 100, 100)
blade.color_core = Color(255, 255, 255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_rainbowtip2" )
blade.material_core = Material( "lscs/effects/lightsaber_rainbowcore2" )
blade.material_glow = Material( "lscs/effects/lightsaber_rainbowglow2" )
blade.material_trail = Material( "lscs/effects/lightsaber_rainbowtrail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )


local blade = {}
blade.PrintName = "Aventurine"
blade.Author = "Midnight"
blade.id = "aventurine"
blade.color_blur = Color(134,210,178)
blade.color_core = Color(116,190,151)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Alexandrite" 
blade.Author = "Midnight"
blade.id = "alexandrite"
blade.color_blur = Color(100, 100, 100)
blade.color_core = Color(255, 255, 255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_alexandritetip" )
blade.material_core = Material( "lscs/effects/lightsaber_alexandritecore" )
blade.material_glow = Material( "lscs/effects/lightsaber_alexandriteglow" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Aquamarine" 
blade.Author = "Midnight"
blade.id = "aquamarine" 
blade.color_blur = Color(58, 106, 101)
blade.color_core = Color(255, 255, 255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_aquamarinetip" )
blade.material_core = Material( "lscs/effects/lightsaber_aquamarinecore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Bluebird Azurite"
blade.Author = "Midnight"
blade.id = "bluebirdazurite"
blade.color_blur = Color(100,100,100)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_bluebirdtip" )
blade.material_core = Material( "lscs/effects/lightsaber_bluebirdcore" )
blade.material_glow = Material( "lscs/effects/lightsaber_bluebirdglow" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Blue Lotus"
blade.Author = "Midnight"
blade.id = "bluelotus"
blade.color_blur = Color(85,95,251)
blade.color_core = Color(118,135,253)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/lightsaber_core" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Carnelian" 
blade.Author = "Midnight"
blade.id = "carnelian"
blade.color_blur = Color(197, 51, 37)
blade.color_core = Color(255, 255, 255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_carneliantip" )
blade.material_core = Material( "lscs/effects/lightsaber_carneliancore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Carnelian Agate"
blade.Author = "Midnight"
blade.id = "carnagate"
blade.color_blur = Color(219,174,159)
blade.color_core = Color(222,62,5)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Chrysocolla"
blade.Author = "Midnight"
blade.id = "chrysocolla"
blade.color_blur = Color(23,62,47)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_chrysocollatip" )
blade.material_core = Material( "lscs/effects/lightsaber_chrysocollacore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Cinnabar"
blade.Author = "Midnight"
blade.id = "cinnabar"
blade.color_blur = Color(179,21,12)
blade.color_core = Color(95,18,26)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
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
blade.PrintName = "Cobalt"
blade.Author = "Midnight"
blade.id = "mcobalt"
blade.color_blur = Color(230,244,255)
blade.color_core = Color(0,25,153)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Dumortierite"
blade.Author = "Midnight"
blade.id = "dumortierite"
blade.color_blur = Color(68,122,197)
blade.color_core = Color(20,27,42)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Emerald"
blade.Author = "Midnight"
blade.id = "emerald"
blade.color_blur = Color(0,47,20)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_emeraldtip" )
blade.material_core = Material( "lscs/effects/lightsaber_emeraldcore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Fluorite"
blade.Author = "Midnight"
blade.id = "fluorite"
blade.color_blur = Color(193,150,114)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_fluoritetip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_fluoritecore" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Green Apple Quartz"
blade.Author = "Midnight"
blade.id = "greenapplequartz"
blade.color_blur = Color(100,54,96)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_greenapplequartztip" )
blade.material_core = Material( "lscs/effects/lightsaber_greenapplequartzcore" )
blade.material_glow = Material( "lscs/effects/lightsaber_greenapplequartzglow" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Hessonite"
blade.Author = "Midnight"
blade.id = "hessonite"
blade.color_blur = Color(168,19,0)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_hessonitetip" )
blade.material_core = Material( "lscs/effects/lightsaber_hessonitecore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Jasper"
blade.Author = "Midnight"
blade.id = "jasper"
blade.color_blur = Color(145,40,0)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_jaspertip" )
blade.material_core = Material( "lscs/effects/lightsaber_jaspercore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Lapis Lazuli"
blade.Author = "Midnight"
blade.id = "lapis"
blade.color_blur = Color(50,54,190)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_lapistip" )
blade.material_core = Material( "lscs/effects/lightsaber_lapiscore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Larimar"
blade.Author = "Midnight"
blade.id = "larimar"
blade.color_blur = Color(11,123,147)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_larimartip" )
blade.material_core = Material( "lscs/effects/lightsaber_larimarcore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Moonstone"
blade.Author = "Midnight"
blade.id = "moonstone"
blade.color_blur = Color(197,217,247)
blade.color_core = Color(224,253,253)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Sunstone"
blade.Author = "Midnight"
blade.id = "sunstone"
blade.color_blur = Color(236,123,58)
blade.color_core = Color(237,250,248)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" ) -- lscs/effects/solid/lightsaber_sunstonetip - Leaving this here because I'll need it later
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" ) -- lscs/effects/solid/lightsaber_sunstonecore
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Nephrite"
blade.Author = "Midnight"
blade.id = "nephrite"
blade.color_blur = Color(69,98,61)
blade.color_core = Color(150,150,150)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_nephritetip" )
blade.material_core = Material( "lscs/effects/lightsaber_nephritecore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Royal Purple"
blade.Author = "Midnight"
blade.id = "royalpurple"
blade.color_blur = Color(151,0,255)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tippurple" )
blade.material_core = Material( "lscs/effects/lightsaber_corepurple" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Sunset Sodalite"
blade.Author = "Midnight"
blade.id = "sunsetsodalite"
blade.color_blur = Color(0,20,223)
blade.color_core = Color(237,104,30)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Tiger's Eye"
blade.Author = "Midnight"
blade.id = "tigerseye"
blade.color_blur = Color(80,48,0)
blade.color_core = Color(255,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tigerseyetip" )
blade.material_core = Material( "lscs/effects/lightsaber_tigerseyecore" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Variscite"
blade.Author = "Midnight"
blade.id = "variscite"
blade.color_blur = Color(150,150,150)
blade.color_core = Color(131,208,152)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Pink Yellow Tourmaline"
blade.Author = "Midnight"
blade.id = "pytourmaline"
blade.color_blur = Color(255,103,174)
blade.color_core = Color(226,218,26)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Pink Blue Fluorite"
blade.Author = "Midnight"
blade.id = "pbfluorite"
blade.color_blur = Color(255,80,172)
blade.color_core = Color(78,130,253)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Watermelon Tourmaline"
blade.Author = "Midnight"
blade.id = "watermelontourmaline"
blade.color_blur = Color(37,160,30)
blade.color_core = Color(255,103,174)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Orange Spodumene"
blade.Author = "Midnight"
blade.id = "orangespodumene"
blade.color_blur = Color(32,72,72)
blade.color_core = Color(0,255,255)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/lightsaber_tiporange" )
blade.material_core = Material( "lscs/effects/lightsaber_coreorange" )
blade.material_glow = Material( "lscs/effects/lightsaber_glowblack" )
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
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

local blade = {}
blade.PrintName = "Yellow Sodalite"
blade.Author = "Midnight"
blade.id = "ysodalite"
blade.color_blur = Color(210,186,28)
blade.color_core = Color(41,58,140)
blade.length = 45 -- blade length
blade.width = 0.9 -- width
blade.widthWiggle = 0.6 -- how much "noise" the blade has idling
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true -- show dynamic light?
blade.no_trail = false -- disable trail?
blade.sounds = {
	Attack = "saber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Attack1 = "saber_spin1", -- SWEP:DoAttackSound( 1, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack2 = "saber_spin2", -- SWEP:DoAttackSound( 2, NUMBER_HAND) for NUMBER_HAND see comment above
	Attack3 = "saber_spin3", -- SWEP:DoAttackSound( 3, NUMBER_HAND) for NUMBER_HAND see comment above
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )