AddCSLuaFile()

SWEP.Base = "weapon_lscs"
DEFINE_BASECLASS( "weapon_lscs" )

SWEP.Category			= "[LSCS]"
SWEP.PrintName		= "Vibro Sword"
SWEP.Author			= "Blu-x92 / Luna"

SWEP.Slot				= 0
SWEP.SlotPos			= 2

SWEP.Spawnable		= true
SWEP.AdminOnly		= false
SWEP.HoldType = "melee2"
SWEP.IsAlwaysRaised = true

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables( self )

	if SERVER then
		self:SetHiltR("vibrosword")
		self:SetBladeR("nanoparticles")
	end
end
