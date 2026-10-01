SWEP.Base					= "tfa_nmrimelee_base"
SWEP.Category               = "TFA StarWars Reworked Melee"
SWEP.Manufacturer 			= ""
SWEP.Author					= "ChanceSphere574"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.PrintName				= "Priest Staff"
SWEP.Type					= ""
SWEP.Slot					= 2
SWEP.SlotPos				= 100

SWEP.Primary.Damage         = 40
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

SWEP.Primary.Sound          = Sound("")
SWEP.Secondary.Sound        = Sound("")

SWEP.HoldType               = "melee2"
SWEP.DefaultHoldType        = "melee2"
SWEP.ViewModel			    = "models/weapons/tfa_nmrih/v_me_hatchet.mdl"
SWEP.WorldModel			    = "models/weapons/tfa_nmrih/w_me_hatchet.mdl"
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
	["LeadPipe"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["b"] = { type = "Model", model = "models/cs574/melees/mus_priest_staff.mdl", bone = "LeadPipe", rel = "", pos = Vector(-0.25, -0.75, -34), angle = Angle(90, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}

SWEP.WElements = {
    ["b"] = { type = "Model", model = "models/cs574/melees/mus_priest_staff.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-03, 0.25, 35), angle = Angle(-80, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.AnimSequences = {
	attack_quick = "Attack_Quick",
	attack_quick2 = "Attack_Quick2",
	charge_begin = "Attack_Charge_Begin",
	charge_loop = "Attack_Charge_Idle",
	charge_end = "Attack_Charge_End"
}