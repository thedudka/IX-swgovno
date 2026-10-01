SWEP.Base					= "tfa_nmrimelee_base"
SWEP.Category               = "TFA StarWars Reworked Melee"
SWEP.Manufacturer 			= ""
SWEP.Author					= "ChanceSphere574"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.PrintName				= "Corvax Blade"
SWEP.Type					= ""
SWEP.Slot					= 3
SWEP.SlotPos				= 100

SWEP.Primary.Damage         = 60
SWEP.Primary.Reach          = 110
SWEP.Primary.Range 			= 110
SWEP.Primary.RPM            = 40
SWEP.Primary.SoundDelay     = 0.2
SWEP.Primary.Delay          = 0.35
SWEP.Primary.Window         = 0.3

SWEP.Secondary.Damage       = SWEP.Primary.Damage*2
SWEP.Secondary.Reach        = 150
SWEP.Secondary.RPM          = 45
SWEP.Secondary.SoundDelay   = 0.05
SWEP.Secondary.Delay        = 0.25

SWEP.Secondary.BashDamage   = SWEP.Primary.Damage/2
SWEP.Secondary.BashDelay    = 0.2
SWEP.Secondary.BashLength   = 130
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
	["b"] = { type = "Model", model = "models/cs574/melees/corvax_droid_blade.mdl", bone = "v_me_sledge", rel = "", pos = Vector(0, 0, 18), angle = Angle(90, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}

SWEP.WElements = {
    ["b"] = { type = "Model", model = "models/cs574/melees/corvax_droid_blade.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 01, -09), angle = Angle(-90, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}