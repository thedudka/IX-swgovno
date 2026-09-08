AddCSLuaFile()

SWEP.Base = "weapon_lscs"
DEFINE_BASECLASS( "weapon_lscs" )

SWEP.Category		= "[LSCS]"
SWEP.PrintName		= "Training Saber"
SWEP.Author			= "Colt"

SWEP.Slot				= 0
SWEP.SlotPos			= 1

SWEP.Spawnable		= true
SWEP.AdminOnly		= true

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables( self )

	if SERVER then
		self:SetHiltR("colttrainingsaber")
		self:SetBladeR("trainingsaberblade")
	end
end

function SWEP:DoDamage( ent, trace, damage ) -- Idk what the FUCK IM DOING
	if SERVER and IsValid(ent) then
		damage = 0
		ent:TakeDamage(damage, self.Owner, self)
	end
end