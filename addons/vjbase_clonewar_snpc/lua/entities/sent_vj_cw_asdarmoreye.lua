AddCSLuaFile()
ENT.Base 			= "base_entity"
ENT.Type 			= "ai"
ENT.PrintName 		= "ASD Eye Armor"
ENT.Author 			= "Helghast Loyalist"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "VJ Base"

function ENT:Draw() self:DrawModel() end
function ENT:DrawTranslucent() self:Draw() end

if (!SERVER) then return end
ENT.VJ_NPC_Class = {"CLASS_CIS"}

function ENT:Initialize()
	
	self:SetModel("models/vjsw/confederacyofindependentsystems/Advanced_Dwarf_Spider_Droid_EyeArmor.mdl")
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMaxHealth(500)
	self:SetHealth(500)

	if !IsValid(self:GetOwner()) then
		self:Remove()
	end
	
end

function ENT:OnTakeDamage(dmginfo)
	if !dmginfo:IsExplosionDamage() then
		dmginfo:SetDamage(0)
	end
	self:SetHealth(self:Health() - dmginfo:GetDamage())
	
	if self:Health() <= 0 then -- If health is now less than 0 then explode!
		self:GetOwner():CreateEyeArmorGib()
		self:Remove()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()

end