SWEP.Base					= "tfa_nmrimelee_base"
SWEP.Category               = "TFA StarWars Reworked Melee"
SWEP.Manufacturer 			= ""
SWEP.Author					= "ChanceSphere574"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.PrintName				= "Royal Staff"
SWEP.Type					= ""
SWEP.Slot					= 3
SWEP.SlotPos				= 100

SWEP.Primary.Damage         = 80
SWEP.Primary.Reach          = 90
SWEP.Primary.Range 			= 90
SWEP.Primary.RPM            = 70
SWEP.Primary.SoundDelay     = 0.2
SWEP.Primary.Delay          = 0.35
SWEP.Primary.Window         = 0.3

SWEP.Secondary.Damage       = SWEP.Primary.Damage*2
SWEP.Secondary.Reach        = 110
SWEP.Secondary.RPM          = 45
SWEP.Secondary.SoundDelay   = 0.05
SWEP.Secondary.Delay        = 0.25

SWEP.Secondary.BashDamage   = SWEP.Primary.Damage/2
SWEP.Secondary.BashDelay    = 0.2
SWEP.Secondary.BashLength   = 80
SWEP.Secondary.BashDamageType = DMG_FIRE

SWEP.Primary.Sound 			= Sound("")
SWEP.Secondary.Sound 		= Sound("")

SWEP.HoldType               = "melee2"
SWEP.DefaultHoldType        = "melee2"
SWEP.ViewModel			    = "models/weapons/tfa_nmrih/v_me_axe_fire.mdl"
SWEP.WorldModel			    = "models/weapons/tfa_nmrih/w_me_axe_fire.mdl"
SWEP.ShowWorldModel         = false
SWEP.ViewModelFOV           = 60
SWEP.Offset = {
	Pos = {Up = -6,Right = 1,Forward = 3,},
    Ang = {Up = -1,Right = -4,Forward = 178},
	Scale = 1.0
}

SWEP.MoveSpeed              = 1
SWEP.IronSightsMoveSpeed    = SWEP.MoveSpeed

SWEP.InspectPos = Vector(5, 0, -5)
SWEP.InspectAng = Vector(0, 35, 0)

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["Middle04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-8.212, 1.121, 1.263) },
	["Pinky05"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(11.793, 4.677, 11.218) },
	["v_me_axe_fire"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
}

SWEP.VElements = {
	["b"] = { type = "Model", model = "models/epangelmatikes/royalguard/weapon.mdl", bone = "v_me_axe_fire", rel = "", pos = Vector(-0.5, -0.5, -6), angle = Angle(0, 0, 05), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-0.2, 0.3, 59.5+2), size = { x = 3, y = 3 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-0.2, 0.3, 58.5+2), size = { x = 3, y = 3 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-0.2, 0.3, 57+2), size = { x = 6, y = 6 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-0.2, 0.3, 55+2), size = { x = 6, y = 6 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(-0.2, 0.3, 53.5+2), size = { x = 3, y = 3 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}

SWEP.WElements = {
    ["b"] = { type = "Model", model = "models/epangelmatikes/royalguard/weapon.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 0.75, 7.5), angle = Angle(190, 0, 05), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(-0.2, 0.3, 59.5+2), size = { x = 3, y = 3 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(-0.2, 0.3, 58.5+2), size = { x = 3, y = 3 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(-0.2, 0.3, 57+2), size = { x = 6, y = 6 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(-0.2, 0.3, 55+2), size = { x = 6, y = 6 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(-0.2, 0.3, 53.5+2), size = { x = 3, y = 3 }, color = Color(255, 255, 50, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}