AddCSLuaFile()

SWEP.Base = "weapon_lscs"
DEFINE_BASECLASS( "weapon_lscs" )

SWEP.Category		= "[LSCS]"
SWEP.PrintName	= "Electrostaff [Dual]"
SWEP.Author		= "BadJay707"
SWEP.Slot		= 0
SWEP.SlotPos 	= 3
SWEP.HoldType = "jediwep"
SWEP.Spawnable	= true
SWEP.AdminOnly	= false

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables( self )

	if SERVER then
		self:SetHiltR("staffel") 
		self:SetBladeR("purpstaff") 
	end
end