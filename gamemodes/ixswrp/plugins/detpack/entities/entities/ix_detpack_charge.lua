AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Detpack"
ENT.Category = "Helix"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.bNoPersist = true
ENT.Holdable = true

local DETPACK_MODEL = "models/props/starwars/weapons/lasertrap.mdl"

function ENT:Initialize()
	if (CLIENT) then
		return
	end

	self:SetModel(DETPACK_MODEL)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self:SetUseType(SIMPLE_USE)
	self:SetHealth(50)
	self:SetTakeDamage(DAMAGE_YES)

	local physObj = self:GetPhysicsObject()

	if (IsValid(physObj)) then
		physObj:SetMass(9)
		physObj:EnableMotion(true)
		physObj:Wake()
	end
end

function ENT:ConfigurePlacement(mode, anchor, surfacePosition, surfaceNormal, faction)
	if (faction != "republic" and faction != "cis" and faction != "neutral") then
		return false
	end

	self.placementMode = mode
	self.anchorEntity = anchor
	self.detpackFaction = faction

	local physObj = self:GetPhysicsObject()

	if (surfacePosition and surfaceNormal) then
		self.ixDetpackSurfacePosition = surfacePosition
		self.ixDetpackSurfaceNormal = surfaceNormal:GetNormalized()

		if (IsValid(anchor)) then
			self.ixDetpackAnchorEffectPosition = anchor:WorldToLocal(
				surfacePosition + self.ixDetpackSurfaceNormal * 8
			)
		end
	end

	if (mode == "world") then
		self.ixDetpackAnchored = true

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end

		return true
	elseif (mode == "door" and IsValid(anchor)) then
		self.ixDetpackAnchored = true
		local position = self:GetPos()
		local angles = self:GetAngles()

		self:PhysicsDestroy()
		self:SetMoveType(MOVETYPE_NONE)
		self:SetSolid(SOLID_BBOX)
		self:SetParent(anchor)
		self:SetLocalPos(anchor:WorldToLocal(position))
		self:SetLocalAngles(anchor:WorldToLocalAngles(angles))

		return true
	elseif ((mode == "npc" or mode == "vehicle") and IsValid(anchor)) then
		self.ixDetpackAnchored = true
		local position = self:GetPos()
		local angles = self:GetAngles()

		self:PhysicsDestroy()
		self:SetMoveType(MOVETYPE_NONE)
		self:SetSolid(SOLID_BBOX)
		self:SetParent(anchor)
		self:SetLocalPos(anchor:WorldToLocal(position))
		self:SetLocalAngles(anchor:WorldToLocalAngles(angles))

		if (mode == "npc" and IsValid(self.placer)) then
			if (isfunction(anchor.AddEntityRelationship)) then
				anchor:AddEntityRelationship(self.placer, D_HT, 99)
			end

			if (isfunction(anchor.SetRelationshipMemory) and VJ
			and VJ.MEM_OVERRIDE_DISPOSITION) then
				anchor:SetRelationshipMemory(self.placer, VJ.MEM_OVERRIDE_DISPOSITION, D_HT)
			end

			if (isfunction(anchor.ForceSetEnemy)) then
				anchor:ForceSetEnemy(self.placer, true)
			elseif (isfunction(anchor.SetEnemy)) then
				anchor:SetEnemy(self.placer)

				if (isfunction(anchor.UpdateEnemyMemory)) then
					anchor:UpdateEnemyMemory(self.placer, self.placer:GetPos())
				end
			end
		end

		return true
	elseif ((mode == "prop" or mode == "container") and IsValid(anchor)) then
		self.ixDetpackConstraint = constraint.Weld(self, anchor, 0, 0, 0, 0, true, false)

		if (!IsValid(self.ixDetpackConstraint)) then
			return false
		end

		self.ixDetpackAnchored = true

		if (IsValid(physObj)) then
			physObj:Wake()
		end

		return true
	elseif (mode == "free") then
		self:SetCollisionGroup(COLLISION_GROUP_NONE)

		if (IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:Wake()
		end

		return true
	end

	return false
end

function ENT:OnTakeDamage(damageInfo)
	if (CLIENT or self.ixDetpackDetonated or self.ixDetpackDestroying) then
		return
	end

	if (damageInfo:IsDamageType(DMG_BLAST)) then
		self:Detonate(damageInfo:GetAttacker())
		return
	end

	self:SetHealth(self:Health() - damageInfo:GetDamage())

	if (self:Health() <= 0) then
		self.ixDetpackDestroying = true

		local position = self:LocalToWorld(self:OBBCenter())
		local effect = EffectData()
		effect:SetStart(position)
		effect:SetOrigin(position)
		effect:SetScale(3)
		self:EmitSound("physics/metal/metal_box_break1.wav")
		util.Effect("GlassImpact", effect)
		self:Remove()
	end
end

function ENT:CanRemoteDetonate(faction)
	if (self.ixDetpackDetonated or !self.detpackFaction) then
		return false
	end

	return faction == "neutral" or self.detpackFaction == "neutral"
		or faction == self.detpackFaction
end

function ENT:Detonate(attacker)
	if (CLIENT or self.ixDetpackDetonated) then
		return
	end

	self.ixDetpackDetonated = true
	self.ixDetpackDetonating = true

	local position = self:GetPos()
	local anchor = self.anchorEntity
	local mode = self.placementMode
	local effectPosition = position

	if (IsValid(anchor) and self.ixDetpackAnchorEffectPosition) then
		effectPosition = anchor:LocalToWorld(self.ixDetpackAnchorEffectPosition)
	elseif (mode == "world" and self.ixDetpackSurfacePosition and self.ixDetpackSurfaceNormal) then
		effectPosition = self.ixDetpackSurfacePosition + self.ixDetpackSurfaceNormal * 8
	end

	local finalAttacker = IsValid(attacker) and attacker or self
	if (mode == "npc" and IsValid(anchor)) then
		anchor:SetHealth(anchor:Health() - 250)
	elseif (mode == "vehicle" and IsValid(anchor)) then
		if (isfunction(anchor.GetHP) and isfunction(anchor.SetHP)) then
			anchor:SetHP(anchor:GetHP() - 500)
		elseif (isfunction(anchor.Health) and isfunction(anchor.SetHealth)) then
			anchor:SetHealth(anchor:Health() - 500)
		else
			ErrorNoHalt("[detpack] Cannot subtract vehicle health: health methods are unavailable.\n")
		end
	end

	util.BlastDamage(self, finalAttacker, position, 200, 250)
	util.ScreenShake(position, 5, 5, 0.5, 500)

	sound.Play("timebomb/exp.wav", effectPosition, 100, 100)
	sound.Play("timebomb/exp_add.wav", effectPosition, 100, 100)
	sound.Play("timebomb/exp_add_two.wav", effectPosition, 100, 100)

	local effectData = EffectData()
	effectData:SetStart(effectPosition)
	effectData:SetOrigin(effectPosition)
	effectData:SetScale(1.4)
	effectData:SetRadius(175)
	effectData:SetMagnitude(200)
	util.Effect("Explosion", effectData, true, true)
	util.Effect("HelicopterMegaBomb", effectData, true, true)

	self:Remove()
end

function ENT:OnRemove()
	if (IsValid(self.ixDetpackConstraint)) then
		self.ixDetpackConstraint:Remove()
	end
end

if (CLIENT) then
	function ENT:Draw()
		self:DrawModel()
	end
end
