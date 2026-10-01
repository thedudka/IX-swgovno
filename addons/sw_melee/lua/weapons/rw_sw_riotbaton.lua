SWEP.Base					= "tfa_nmrimelee_base"
SWEP.Category               = "TFA StarWars Reworked Melee"
SWEP.Manufacturer 			= ""
SWEP.Author					= "ChanceSphere574"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.PrintName				= "Riot Baton"
SWEP.Type					= ""
SWEP.Slot					= 2
SWEP.SlotPos				= 100

SWEP.Primary.Damage         = 55
SWEP.Primary.Reach          = 90
SWEP.Primary.Range 			= 90
SWEP.Primary.RPM            = 95
SWEP.Primary.SoundDelay     = 0.2
SWEP.Primary.Delay          = 0.35
SWEP.Primary.Window         = 0.3

SWEP.Secondary.Damage       = SWEP.Primary.Damage*2
SWEP.Secondary.Reach        = 110
SWEP.Secondary.RPM          = 75
SWEP.Secondary.SoundDelay   = 0.05
SWEP.Secondary.Delay        = 0.25

SWEP.Secondary.BashDamage   = SWEP.Primary.Damage/2
SWEP.Secondary.BashDelay    = 0.1
SWEP.Secondary.BashLength   = 80
SWEP.Secondary.BashDamageType = DMG_FIRE

SWEP.Primary.Sound          = Sound("Weapon_Melee.HammerSwing")
SWEP.Secondary.Sound        = Sound("Weapon_Melee.HammerSwing")

SWEP.HoldType               = "melee"
SWEP.DefaultHoldType        = "melee"
SWEP.ViewModel			    = "models/weapons/tfa_nmrih/v_tool_barricade.mdl"
SWEP.WorldModel			    = "models/weapons/tfa_nmrih/w_tool_barricade.mdl"
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
	["v_me_hammer"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -30), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["b"] = { type = "Model", model = "models/red menace/fallenorder/props/scouttrooper/riotbaton.mdl", bone = "NMRiH_FPS_Arms_Control_RightWrist", rel = "", pos = Vector(3.75, -2, -0.75), angle = Angle(0, 0, -80), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 16), size = { x = 6, y = 6 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 17), size = { x = 7, y = 7 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 18), size = { x = 9, y = 9 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 19), size = { x = 9, y = 9 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 20), size = { x = 9, y = 9 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 21), size = { x = 7, y = 7 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "", rel = "b", pos = Vector(0, 0, 22), size = { x = 6, y = 6 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}

SWEP.WElements = {
    ["b"] = { type = "Model", model = "models/red menace/fallenorder/props/scouttrooper/riotbaton.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(03, 01.25, 0), angle = Angle(180, 70, 10), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["FX"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 16), size = { x = 6, y = 6 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 17), size = { x = 7, y = 7 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 18), size = { x = 9, y = 9 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 19), size = { x = 9, y = 9 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 20), size = { x = 9, y = 9 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX+++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 21), size = { x = 7, y = 7 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["FX++++++"] = { type = "Sprite", sprite = "particle/particle_glow_04", bone = "ValveBiped.Bip01_R_Hand", rel = "b", pos = Vector(0, 0, 22), size = { x = 6, y = 6 }, color = Color(0, 120, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
}

SWEP.AnimSequences = {
	attack_quick = "Attack_Quick_1",
	attack_quick2 = "Attack_Quick_2",
	charge_begin = "Attack_Charge_Begin",
	charge_loop = "Attack_Charge_Idle",
	charge_end = "Attack_Charge_End"
}