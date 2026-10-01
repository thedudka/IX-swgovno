SWEP.Base					= "tfa_nmrimelee_base"
SWEP.Category               = "TFA StarWars Reworked Melee"
SWEP.Manufacturer 			= ""
SWEP.Author					= "ChanceSphere574"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.PrintName				= "ElectroStaff"
SWEP.Type					= ""
SWEP.Slot					= 3
SWEP.SlotPos				= 100

SWEP.Primary.Damage         = 55
SWEP.Primary.Reach          = 110
SWEP.Primary.Range 			= 110
SWEP.Primary.RPM            = 55
SWEP.Primary.SoundDelay     = 0.2
SWEP.Primary.Delay          = 0.35
SWEP.Primary.Window         = 0.3

SWEP.Secondary.Damage       = SWEP.Primary.Damage*2
SWEP.Secondary.Reach        = 125
SWEP.Secondary.RPM          = 65
SWEP.Secondary.SoundDelay   = 0.05
SWEP.Secondary.Delay        = 0.25

SWEP.Secondary.BashDamage   = SWEP.Primary.Damage/2
SWEP.Secondary.BashDelay    = 0.2
SWEP.Secondary.BashLength   = 110
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
	["b"] = { type = "Model", model = "models/red menace/fallenorder/props/purgetrooper/electrostaff.mdl", bone = "v_me_sledge", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 90), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 32, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 33.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 35, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 36.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 38, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 39.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 41, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 42.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 44, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 45.5, 0), size = { x = 11, y = 11}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 47, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 48.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -32, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -33.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -35, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -36.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -38, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -39.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -41, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -42.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -44, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -45.5, 0), size = { x = 11, y = 11}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -47, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, -48.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}

SWEP.WElements = {
    ["b"] = { type = "Model", model = "models/red menace/fallenorder/props/purgetrooper/electrostaff.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 01, 0), angle = Angle(0, 0, 90), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 32, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 33.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 35, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 36.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 38, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 39.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 41, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 42.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 44, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 45.5, 0), size = { x = 11, y = 11}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 47, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 48.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -32, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -33.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -35, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -36.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -38, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -39.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -41, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -42.5, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -44, 0), size = { x = 12, y = 12}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -45.5, 0), size = { x = 11, y = 11}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -47, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["2FX+++++++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, -48.5, 0), size = { x = 9, y = 9}, color = Color(150, 0, 255, 150), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}