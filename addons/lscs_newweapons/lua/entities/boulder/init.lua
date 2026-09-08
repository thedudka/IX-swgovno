AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/

function ENT:Initialize()
	self.Entity:SetModel("models/niksacokica/caves/caves_large_boulder.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow(true)
end

/*---------------------------------------------------------
   Name: Collision
---------------------------------------------------------*/

function ENT:PhysicsCollide(data, phys)
	timer.Simple(0.15, function()
		if not IsValid(self) then return end
		self:Remove()
	end)
end

function ENT:OnRemove()
	if not IsValid(self) then return end
	local pos = self:GetPos()
	local ex = ents.Create( "env_explosion" )
	local own = self.Owner
	ex:SetOwner( own )
	ex:SetKeyValue("iMagnitude", "0")
	ex:SetKeyValue("iRadiusOverride", "500")
	ex:SetPos(pos)
	ex:Spawn()
	ex:Activate()
	ex:Fire("Explode")
	util.BlastDamage(self, self.Owner, pos, 500, 2500)
end