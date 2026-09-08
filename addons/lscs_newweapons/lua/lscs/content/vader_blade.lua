local blade = {}
blade.PrintName = "Vader"
blade.Author = "Skip"
blade.id = "vader"
blade.color_blur = Color(200,0,0)
blade.color_core = Color(255,255,255)
blade.length = 45
blade.width = 1.5
blade.widthWiggle = 0.2
blade.material_core_tip = Material( "lscs/effects/lightsaber_tip" )
blade.material_core = Material( "lscs/effects/lightsaber_core" )
blade.material_glow = Material( "lscs/effects/lightsaber_glow" )
blade.material_trail = Material( "lscs/effects/lightsaber_trail" )
blade.dynamic_light = true
blade.no_trail = false
blade.sounds = {
	Attack = "saber_hup",
	Attack1 = "saber_spin1",
	Attack2 = "saber_spin2",
	Attack3 = "saber_spin3",
	Activate = "vader_saber_on",
	Disable = "saber_turnoff",
	Idle =  "saber_idle4",
}
LSCS:RegisterBlade( blade )