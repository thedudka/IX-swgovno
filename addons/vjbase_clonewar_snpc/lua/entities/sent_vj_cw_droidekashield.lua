AddCSLuaFile()

ENT.Base 			= "base_entity"
ENT.Type 			= "ai"
ENT.PrintName 		= "Droideka Shield"
ENT.Author 			= "Helghast Loyalist"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "VJ Base"

function ENT:Draw() self:DrawModel() end
function ENT:DrawTranslucent() self:Draw() end

if (!SERVER) then return end
ENT.VJ_NPC_Class = {"CLASS_CIS"}

function ENT:Initialize()
	
	self:SetModel("models/vjsw/confederacyofindependentsystems/Droideka_Shield.mdl")
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMaxHealth(500)
	self:SetHealth(500)
	self.ShieldRegenTime = 0
	self.MaxShieldHealth = 500
	
	if !IsValid(self:GetOwner()) then
		self:Remove()
	end
	
end

function ENT:Think()
	if !self.MaxShieldHealth then return true end
	self:NextThink(CurTime())
	
	if self:Health() > 150 then
		self:SetSkin(0)
	else
		self:SetSkin(1)
	end
	
	if CurTime() > self.ShieldRegenTime && self:Health() < self.MaxShieldHealth then
		self:SetHealth(self.MaxShieldHealth)
	end
	return true
end

function ENT:OnTakeDamage(dmginfo)

	local myPos = self:GetPos()
	self:SetHealth(self:Health() - dmginfo:GetDamage())
	ParticleEffect("hcea_t25r_core_2", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
	self:EmitSound("vj_sw_clone_wars_era/snpcs/droideka/SHIELD_IMP_0"..math.random(1,5)..".wav", 90)
	self.ShieldRegenTime = CurTime() + 10
	
	if self:Health() <= 0 then -- If health is now less than 0 then explode!
		self:EmitSound("vj_sw_clone_wars_era/snpcs/droideka/SHIELD_BRK"..math.random(1,4)..".wav", 90)
		ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self:GetOwner(),self:GetOwner():LookupAttachment("Shield"))
		self:GetOwner().DroidekaShieldRegenerateTime = CurTime() + 15
		self:GetOwner().DroidekaShieldDestroyed = true
		self:Remove()
	end
end