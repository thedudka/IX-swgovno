AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Time Bomb Charge"
ENT.Category = "Helix"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.bNoPersist = true
ENT.Holdable = true

local CHARGE_MODEL = "models/epsilon/cwa_furniture/misc/eps_seismic_charge.mdl"

function ENT:Initialize()
	if (CLIENT) then
		return
	end

	self:SetModel(CHARGE_MODEL)
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

function ENT:ConfigurePlacement(mode, anchor, surfacePosition, surfaceNormal)
	self.placementMode = mode
	self.anchorEntity = anchor

	local physObj = self:GetPhysicsObject()

	if (surfacePosition and surfaceNormal) then
		self.ixTimeBombSurfacePosition = surfacePosition
		self.ixTimeBombSurfaceNormal = surfaceNormal:GetNormalized()

		if (IsValid(anchor)) then
			self.ixTimeBombAnchorEffectPosition = anchor:WorldToLocal(
				surfacePosition + self.ixTimeBombSurfaceNormal * 8
			)
		end

		local mins, maxs = self:OBBMins(), self:OBBMaxs()
		local minDistance = math.huge

		for _, x in ipairs({mins.x, maxs.x}) do
			for _, y in ipairs({mins.y, maxs.y}) do
				for _, z in ipairs({mins.z, maxs.z}) do
					local corner = self:LocalToWorld(Vector(x, y, z))
					local distance = (corner - self:GetPos()):Dot(surfaceNormal)
					minDistance = math.min(minDistance, distance)
				end
			end
		end

		self:SetPos(surfacePosition + self.ixTimeBombSurfaceNormal * (-4 - minDistance))
	end

	if (mode == "world") then
		self.ixTimeBombAnchored = true

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end

		return true
	elseif (mode == "door" and IsValid(anchor)) then
		self.ixTimeBombAnchored = true
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
		self.ixTimeBombAnchored = true
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
		self.ixTimeBombConstraint = constraint.Weld(self, anchor, 0, 0, 0, 0, true, false)

		if (!IsValid(self.ixTimeBombConstraint)) then
			return false
		end

		self.ixTimeBombAnchored = true

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
	if (CLIENT or self.ixTimeBombDetonated or self.ixTimeBombDestroying) then
		return
	end

	if (damageInfo:IsDamageType(DMG_BLAST)) then
		local attacker = damageInfo:GetAttacker()

		if (IsValid(attacker)) then
			self.ixTimeBombAttacker = attacker
		end

		self:Detonate()
		return
	end

	self:SetHealth(self:Health() - damageInfo:GetDamage())

	if (self:Health() <= 0) then
		self.ixTimeBombDestroying = true

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

function ENT:Arm(delay, attacker)
	self.ixTimeBombAttacker = IsValid(attacker) and attacker or self.placer
	delay = self.placementMode == "npc" and 5 or delay
	self.ixTimeBombDetonationTime = CurTime() + delay
	self.ixTimeBombNextBeep = CurTime() + 1
	self:EmitSound("timebomb/tick.wav", 75)
	self:NextThink(CurTime() + 0.1)
end

function ENT:Think()
	if (CLIENT) then
		return
	end

	if (CurTime() >= (self.ixTimeBombDetonationTime or CurTime())) then
		self:Detonate()
		return
	end

	local timeRemaining = self.ixTimeBombDetonationTime - CurTime()

	if (!self.ixTimeBombFinalAlertPlayed and timeRemaining <= 1) then
		self.ixTimeBombFinalAlertPlayed = true
		self:EmitSound("timebomb/timerout.wav", 75)
	end

	if (CurTime() >= (self.ixTimeBombNextBeep or CurTime())) then
		self:EmitSound("timebomb/tick.wav", 75)
		self.ixTimeBombNextBeep = CurTime() + 1
	end

	self:NextThink(CurTime() + 0.1)
	return true
end

function ENT:Detonate()
	if (CLIENT) then
		return
	end

	if (self.ixTimeBombDetonated) then
		return
	end

	self.ixTimeBombDetonated = true

	local position = self:GetPos()
	local attacker = IsValid(self.ixTimeBombAttacker) and self.ixTimeBombAttacker or self
	local anchor = self.anchorEntity
	local mode = self.placementMode
	local damage = 250

	if (mode == "npc") then
		damage = 500
	elseif (mode == "vehicle") then
		damage = 1000
	end

	if (IsValid(anchor)) then
		if (mode == "container" and anchor:GetClass() == "ix_container") then
			anchor:SetLocked(false)
		elseif (mode == "door") then
			anchor:Fire("Unlock", "", 0)
			anchor:Fire("Open", "", 0.1)
		end
	end

	self.ixTimeBombDetonating = true
	util.BlastDamage(self, attacker, position, damage, 250)
	util.ScreenShake(position, 5, 5, 0.5, 500)

	local effectData = EffectData()
	local effectPosition = position

	if (IsValid(anchor) and self.ixTimeBombAnchorEffectPosition) then
		effectPosition = anchor:LocalToWorld(self.ixTimeBombAnchorEffectPosition)
	elseif (mode == "world" and self.ixTimeBombSurfacePosition and self.ixTimeBombSurfaceNormal) then
		effectPosition = self.ixTimeBombSurfacePosition + self.ixTimeBombSurfaceNormal * 8
	end

	sound.Play("timebomb/exp.wav", effectPosition, 100, 100)
	sound.Play("timebomb/exp_add.wav", effectPosition, 100, 100)
	sound.Play("timebomb/exp_add_two.wav", effectPosition, 100, 100)

	effectData:SetOrigin(effectPosition)
	effectData:SetScale(1.5)
	effectData:SetFlags(4)
	util.Effect("Explosion", effectData)

	self:Remove()
end

function ENT:OnRemove()
	if (IsValid(self.ixTimeBombConstraint)) then
		self.ixTimeBombConstraint:Remove()
	end
end

if (CLIENT) then
	function ENT:Draw()
		self:DrawModel()
	end
end
