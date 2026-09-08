		
--[[
	v v v Blade v v v
]]
local blade = {}
blade.PrintName = "Demantoid"
blade.Author = "Midnight"
blade.id = "demantoid"
blade.color_blur = Color(6,97,76)
blade.color_core = Color(193,230,101)
blade.length = 45
blade.width = 0.9
blade.widthWiggle = 0.6
blade.material_core_tip = Material( "lscs/effects/solid/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/solid/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/solid/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/solid/lightsaber_trail" )
blade.dynamic_light = true
blade.no_trail = false
blade.sounds = {
	Attack = "saber_hup",
	Attack1 = "saber_spin1",
	Attack2 = "saber_spin2",
	Attack3 = "saber_spin3",
	Activate = "saber_turnon",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )

-- modify previous blade, only change what we need to change

blade.PrintName = "Andesine"
blade.id = "andesine"
blade.color_blur = Color(215,52,69)
blade.color_core = Color(252,194,193)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Amethyst"
blade.id = "amethyst"
blade.color_blur = Color(129,0,191)
blade.color_core = Color(80,45,133)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Ametrine"
blade.id = "ametrine"
blade.color_blur = Color(254,220,119)
blade.color_core = Color(117,54,158)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Amber"
blade.id = "amber"
blade.color_blur = Color(255,193,2)
blade.color_core = Color(255,237,135)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Antimony"
blade.id = "antimony"
blade.color_blur = Color(166,116,139)
blade.color_core = Color(150,150,150)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Bleeding Amethyst"
blade.id = "bleedingamethyst"
blade.color_blur = Color(113,0,115)
blade.color_core = Color(100,9,27)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Clinohumite"
blade.id = "clinohumite"
blade.color_blur = Color(249,189,37)
blade.color_core = Color(192,8,1)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Cherry Quartz"
blade.id = "cherryquartz"
blade.color_blur = Color(224,84,79)
blade.color_core = Color(163,0,18)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Cherry Quartz Dark Inner"
blade.id = "darkcherryquartz"
blade.color_blur = Color(224,84,79)
blade.color_core = Color(0,0,0)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle4"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Chert"
blade.id = "chert"
blade.color_blur = Color(60,28,5)
blade.color_core = Color(116,60,27)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Crocoite"
blade.id = "crocoite"
blade.color_blur = Color(251,249,89)
blade.color_core = Color(250,62,1)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle3"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Deep Blue"
blade.id = "deepblue"
blade.color_blur = Color(4,2,115)
blade.color_core = Color(4,2,115)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Garnet"
blade.id = "garnet"
blade.color_blur = Color(200,0,0)
blade.color_core = Color(200,0,0)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Grey"
blade.id = "grey"
blade.color_blur = Color(135,135,135)
blade.color_core = Color(50,50,50)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Hot Pink"
blade.id = "hotpink"
blade.color_blur = Color(254,104,179)
blade.color_core = Color(237,24,90)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle5"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Jeremejevite"
blade.id = "jeremejevite"
blade.color_blur = Color(0,0,190)
blade.color_core = Color(0,0,190)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle5"
LSCS:RegisterBlade( blade )


blade.PrintName = "Lemon Quartz"
blade.id = "lemonquartz"
blade.color_blur = Color(176,163,38)
blade.color_core = Color(225,216,155)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle5"
LSCS:RegisterBlade( blade )

blade.PrintName = "Malachite"
blade.id = "malachite"
blade.color_blur = Color(31,184,147)
blade.color_core = Color(44,87,83)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Metallic Green"
blade.id = "metallicgreen"
blade.color_blur = Color(0,72,61)
blade.color_core = Color(97,243,195)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Midnight Blue"
blade.id = "midnightblue"
blade.color_blur = Color(25,25,112)
blade.color_core = Color(25,25,112)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle2"
LSCS:RegisterBlade( blade )

blade.PrintName = "Morganite"
blade.id = "morganite"
blade.color_blur = Color(206,190,168)
blade.color_core = Color(197,128,121)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle2"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Old Rose"
blade.id = "oldrose"
blade.color_blur = Color(156,88,99)
blade.color_core = Color(176,146,151)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Padparadscha"
blade.id = "padparadscha"
blade.color_blur = Color(253,73,74)
blade.color_core = Color(253,158,76)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Pastel Green"
blade.id = "pastelgreen"
blade.color_blur = Color(119,221,119)
blade.color_core = Color(255,255,255)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Peridot"
blade.id = "bluelotus"
blade.color_blur = Color(101,139,2)
blade.color_core = Color(238,241,76)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Rhodonite"
blade.id = "rhodonite"
blade.color_blur = Color(191,111,121)
blade.color_core = Color(197,30,48)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Rose Gold"
blade.id = "rosegold"
blade.color_blur = Color(174,114,112)
blade.color_core = Color(254,249,237)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Rose Quartz"
blade.id = "rosequartz"
blade.color_blur = Color(216,117,148)
blade.color_core = Color(234,207,214)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Ruby"
blade.id = "ruby"
blade.color_blur = Color(50,1,5)
blade.color_core = Color(136,0,34)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Sardonyx"
blade.id = "sardonyx"
blade.color_blur = Color(247,186,25) -- (252,235,197)
blade.color_core = Color(252,235,197) -- (247,126,2)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Script Stone"
blade.id = "scripts"
blade.color_blur = Color(253,182,13)
blade.color_core = Color(80,33,31)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Coquina Jasper"
blade.id = "scripts2"
blade.color_blur = Color(80,33,31)
blade.color_core = Color(253,182,13)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Serpentine"
blade.id = "serpentine"
blade.color_blur = Color(41,48,32)
blade.color_core = Color(169,181,98)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Shattuckite"
blade.id = "shattuckite"
blade.color_blur = Color(126,255,212)
blade.color_core = Color(0,225,200)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Spessartine"
blade.id = "spessartine"
blade.color_blur = Color(255,174,1)
blade.color_core = Color(250,103,18)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Spinel"
blade.id = "spinel"
blade.color_blur = Color(138,2,42)
blade.color_core = Color(255,87,135)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Sugilite"
blade.id = "sugilite"
blade.color_blur = Color(146,42,135)
blade.color_core = Color(10,0,37)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Sulfur"
blade.id = "sulfur"
blade.color_blur = Color(245,234,181)
blade.color_core = Color(240,219,29)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Topaz"
blade.id = "topaz"
blade.color_blur = Color(211,78,14)
blade.color_core = Color(246,230,60)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Turquenite"
blade.id = "turquenite"
blade.color_blur = Color(0,255,230)
blade.color_core = Color(0,255,230)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Red Agate"
blade.id = "redagate"
blade.color_blur = Color(255,255,255)
blade.color_core = Color(200,0,0)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Fire Opal"
blade.id = "fireopal"
blade.color_blur = Color(255,108,0)
blade.color_core = Color(200,0,0)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Dragon's Blood Jasper"
blade.id = "dbloodjasper"
blade.color_blur = Color(0,100,0)
blade.color_core = Color(100,14,3)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Bloodstone"
blade.id = "bloodstone"
blade.color_blur = Color(182,0,0) -- (9,63,29)
blade.color_core = Color(9,63,29) -- (182,0,0) Just a thought
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Heliotrope"
blade.id = "heliotrope"
blade.color_blur = Color(0,150,0)
blade.color_core = Color(150,0,0)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Cuprite Chrysocolla"
blade.id = "cupritechrys"
blade.color_blur = Color(100,14,3)
blade.color_core = Color(25,238,212)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Sonora Sunrise"
blade.id = "sonoras"
blade.color_blur = Color(100,14,3)
blade.color_core = Color(0,255,126)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Painite"
blade.id = "painite"
blade.color_blur = Color(187,0,38)
blade.color_core = Color(0,0,0)
blade.width = 0.9
blade.widthWiggle = 0.6
-- blade.material_core = Material( "lscs/effects/lightsaber_coreblack")
blade.material_trail = Material( "lscs/effects/lightsaber_trailblack" )
-- blade.material_core_tip = Material( "lscs/effects/lightsaber_tipblack" )
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Rhodochrosite"
blade.id = "rhodochrosite"
blade.color_blur = Color(255,186,230)
blade.color_core = Color(214,68,97)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Pietersite"
blade.id = "pietersite"
blade.color_blur = Color(3,50,146)
blade.color_core = Color(214,55,36)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Copper"
blade.id = "copper"
blade.color_blur = Color(223,143,89)
blade.color_core = Color(228,64,45)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Covellite"
blade.id = "covellite"
blade.color_blur = Color(40,58,220)
blade.color_core = Color(24,11,57)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Cyanocitrine"
blade.id = "cyanocitrine"
blade.color_blur = Color(250,234,63)
blade.color_core = Color(4,141,179)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Aquacitrine"
blade.id = "aquacitrine"
blade.color_blur = Color(4,141,179)
blade.color_core = Color(250,234,63)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Golden Flash Labradorite"
blade.id = "goldflabradorite"
blade.color_blur = Color(250,234,63)
blade.color_core = Color(7,52,181)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

blade.PrintName = "Labradorite"
blade.id = "labradorite"
blade.color_blur = Color(7,52,181)
blade.color_core = Color(143,131,40)
blade.width = 0.9
blade.widthWiggle = 0.6
blade.sounds.Idle = "saber_idle1"
LSCS:RegisterBlade( blade )

-- repeat ^^
blade.PrintName = "Icon" -- This is a figment of your imagination, you're crazy you're insane.
blade.id = "icon"
blade.Spawnable = false
blade.color_blur = Color(0,0,0)
blade.color_core = Color(255,255,255)
blade.width = 0.9
blade.widthWiggle = 0
blade.sounds.Idle = "saber_idle1"
blade.material_core_tip = Material( "lscs/effects/white/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/white/lightsaber_core" )
LSCS:RegisterBlade( blade )