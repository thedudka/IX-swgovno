SWEP.Base					= "tfa_nmrimelee_base"
SWEP.Category               = "TFA StarWars Reworked Melee"
SWEP.Manufacturer 			= ""
SWEP.Author					= "ChanceSphere574"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.PrintName				= "ElectroDagger"
SWEP.Type					= ""
SWEP.Slot					= 2
SWEP.SlotPos				= 100

SWEP.Primary.Damage         = 50
SWEP.Primary.Reach          = 90
SWEP.Primary.Range 			= 90
SWEP.Primary.RPM            = 110
SWEP.Primary.SoundDelay     = 0.2
SWEP.Primary.Delay          = 0.35
SWEP.Primary.Window         = 0.3

SWEP.Secondary.Damage       = SWEP.Primary.Damage*2
SWEP.Secondary.Reach        = 110
SWEP.Secondary.RPM          = 55
SWEP.Secondary.SoundDelay   = 0.05
SWEP.Secondary.Delay        = 0.25

SWEP.Secondary.BashDamage   = SWEP.Primary.Damage/2
SWEP.Secondary.BashDelay    = 0.1
SWEP.Secondary.BashLength   = 80
SWEP.Secondary.BashDamageType = DMG_FIRE

SWEP.Primary.Sound = Sound("Weapon_Melee.MacheteLight")
SWEP.Secondary.Sound = Sound("Weapon_Melee.MacheteHeavy")

SWEP.HoldType               = "melee"
SWEP.DefaultHoldType        = "melee"
SWEP.ViewModel			    = "models/weapons/tfa_nmrih/v_me_machete.mdl"
SWEP.WorldModel			    = "models/weapons/tfa_nmrih/w_me_machete.mdl"
SWEP.ShowWorldModel         = false
SWEP.ViewModelFOV           = 60
SWEP.Offset = {
    Pos = {Up = -4.7,Right = 1,Forward = 0.5,},
    Ang = {Up = -1,Right = 5,Forward = 178},
	Scale = 1.0
}

SWEP.MoveSpeed              = 1
SWEP.IronSightsMoveSpeed    = SWEP.MoveSpeed

SWEP.InspectPos = Vector(-10, 0, -5)
SWEP.InspectAng = Vector(0, 0, -50)

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["Maglite"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -30), angle = Angle(0, 0, 0) },
	["Machete"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -30), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["b"] = { type = "Model", model = "models/red menace/fallenorder/props/purgetrooper/dagger.mdl", bone = "NMRiH_FPS_Arms_Control_RightWrist", rel = "", pos = Vector(04, -0.5, -0.5), angle = Angle(90, 0, -90), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 7+4), size = { x = 10, y = 10 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 9+4), size = { x = 10, y = 10 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 11+4), size = { x = 9, y = 9 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 13+4), size = { x = 9, y = 9 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 15+4), size = { x = 9, y = 9 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 17+4), size = { x = 8, y = 8 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 19+4), size = { x = 8, y = 8 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 19+4), size = { x = 7, y = 7 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}

SWEP.WElements = {
    ["b"] = { type = "Model", model = "models/red menace/fallenorder/props/purgetrooper/dagger.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(03, 01, -0.5), angle = Angle(180, 70, 10), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 7+4), size = { x = 10, y = 10 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 9+4), size = { x = 10, y = 10 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 11+4), size = { x = 9, y = 9 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 13+4), size = { x = 9, y = 9 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 15+4), size = { x = 9, y = 9 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 17+4), size = { x = 8, y = 8 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 19+4), size = { x = 8, y = 8 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 19+4), size = { x = 7, y = 7 }, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}