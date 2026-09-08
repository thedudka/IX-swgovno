
sound.Add( {
	name = "darksaber_hup",
	channel = CHAN_STATIC,
	volume = 1,
	level = 110,
	pitch = 100,
	sound = {
		"gica_costi/darksaber_swing1.wav",
		"gica_costi/darksaber_swing2.wav",
	}
} )

sound.Add( {
	name = "darksaber_turnon",
	channel = CHAN_STATIC,
	volume = 0.5,
	level = 75,
	pitch = 100,
	sound = "gica_costi/darksaber_activate.wav",
} )

sound.Add( {
	name = "darksaber_turnoff",
	channel = CHAN_STATIC,
	volume = 0.3,
	level = 75,
	pitch = 100,
	sound = {
		"gica_costi/darksaber_turnoff.wav",
	}
} )

sound.Add( {
	name = "darksaber_idle",
	channel = CHAN_STATIC,
	volume = 1,
	level = 75,
	pitch = 75,
	sound = "gica_costi/darksaber_idle.wav",
} )


local blade = {}
blade.PrintName = "Darksaber Crystal"
blade.Author = "Gica Costi"
blade.Spawnable = false
blade.id = "actual_darksaber"
blade.color_blur = Color(255,255,255)
blade.color_core = Color(0,0,0)
blade.mdl = "models/dreadtrap/starwars/DarkSaber.mdl"
blade.mdl_poseparameter = "blade_retract"
blade.length = 50
blade.dynamic_light = true
blade.no_trail = false
blade.sounds = {
	Attack = "darksaber_hup", -- called then the combo file calls SWEP:DoAttackSound() or SWEP:DoAttackSound(nil, NUMBER_HAND) where NUMBER_HAND being SWEP.HAND_LEFT or SWEP.HAND_RIGHT or nil for both sabers
	Activate = "darksaber_turnon",
	Disable = "darksaber_turnoff",
	Idle =  "darksaber_idle",
}
LSCS:RegisterBlade( blade )
