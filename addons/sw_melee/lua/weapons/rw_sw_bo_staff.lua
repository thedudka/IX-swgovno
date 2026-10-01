SWEP.Base					= "tfa_nmrimelee_base"
SWEP.Category               = "TFA StarWars Reworked Melee"
SWEP.Manufacturer 			= "Lasan-Malamut Firearms Corporation"
SWEP.Author					= "ChanceSphere574"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.PrintName				= "BO Staff"
SWEP.Type					= "Galactic Electrified Bo-Staff"
SWEP.Slot					= 3
SWEP.SlotPos				= 100

SWEP.Primary.Damage         = 55
SWEP.Primary.Reach          = 100
SWEP.Primary.Range 			= 100
SWEP.Primary.RPM            = 55
SWEP.Primary.SoundDelay     = 0.2
SWEP.Primary.Delay          = 0.35
SWEP.Primary.Window         = 0.3

SWEP.Secondary.Damage       = SWEP.Primary.Damage*2
SWEP.Secondary.Reach        = 120
SWEP.Secondary.RPM          = 45
SWEP.Secondary.SoundDelay   = 0.05
SWEP.Secondary.Delay        = 0.25

SWEP.Secondary.BashDamage   = SWEP.Primary.Damage/2
SWEP.Secondary.BashDelay    = 0.2
SWEP.Secondary.BashLength   = 100
SWEP.Secondary.BashDamageType = DMG_FIRE

SWEP.HoldType               = "melee2"
SWEP.DefaultHoldType        = "melee2"
SWEP.ViewModel			    = "models/weapons/tfa_nmrih/v_me_pickaxe.mdl"
SWEP.WorldModel			    = "models/weapons/tfa_nmrih/w_me_pickaxe.mdl"
SWEP.ShowWorldModel         = false
SWEP.ViewModelFOV           = 60
SWEP.Offset = {
    Pos = {Up = -4.7,Right = 1,Forward = 0.5,},
    Ang = {Up = -1,Right = 5,Forward = 178},
	Scale = 1.0
}

SWEP.MoveSpeed              = 1
SWEP.IronSightsMoveSpeed    = SWEP.MoveSpeed

SWEP.InspectPos = Vector(3, 0, -2)
SWEP.InspectAng = Vector(0, -30, 0)

SWEP.ViewModelBoneMods = {
	["v_me_sledge"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["b"] = { type = "Model", model = "models/rising/bo_rifle.mdl", bone = "v_me_sledge", rel = "", pos = Vector(0.2, -0.5, -11), angle = Angle(90, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(43, 0.3, -0.5), size = { x = 12, y = 12}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(45.5, 0.3, -0.5), size = { x = 9, y = 9}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(47, 0.3, -0.5), size = { x = 6, y = 6}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(48, 0.3, -0.5), size = { x = 3, y = 3}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-14.5, 0.3, 0.5), size = { x = 12, y = 12}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-16, 0.3, 0.5), size = { x = 9, y = 9}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-18, 0.3, 0.5), size = { x = 6, y = 6}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-19, 0.3, 0.5), size = { x = 3, y = 3}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}

SWEP.WElements = {
    ["b"] = { type = "Model", model = "models/rising/bo_rifle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 01, 13), angle = Angle(-90, -90, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(5, -1.85, 37), size = { x = 12, y = 12}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(5, -1.85, 39), size = { x = 9, y = 9}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(5, -1.85, 40.5), size = { x = 6, y = 6}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(5, -1.85, 42), size = { x = 3, y = 3}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(1.8, 02.4, -19.5), size = { x = 12, y = 12}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(1.8, 02.4, -21.5), size = { x = 9, y = 9}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(1.8, 02.4, -23.5), size = { x = 6, y = 6}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(1.8, 02.4, -25), size = { x = 3, y = 3}, color = Color(255, 210, 0, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}