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

local DESTROYED_VEHICLE_CLASSES = {
	lvs_dwarfdroidcis = true,
	lvs_flamedwarf = true,
	lvs_flamerdwarf = true,
	lvs_fakehover_aat = true,
	lvs_fakehover_iftx = true,
	lvs_starfighter_arc170 = true,
	lvs_starfighter_droidtrifighter = true,
	lvs_starfighter_n1 = true,
	lvs_starfighter_vulturedroid = true,
	lvs_starfighter_vwing = true,
	lvs_starfighter_vulturedroid_blue = true,
	lvs_starfighter_vulturedroid_mineguild = true,
	lvs_starfighter_vulturedroid_techno = true,
	lvs_fakehover_barc = true,
    lvs_fakehover_barc_medical = true,
	lvs_starfighter_vulturedroid_cis = true,
	lvs_turret_aa_red = true,
	lvs_turret_ai_red = true,
	lvs_turret_av_red = true,
	lvs_turret_aa = true,
	lvs_turret_ai = true,
	lvs_turret_av = true,
	lvs_cis_ltl = true,
}

local HALF_HEALTH_VEHICLE_CLASSES = {
	lvs_repulsorlift_gunship = true,
	lvs_repulsorlift_dropship = true,
	lvs_basilisk_kotor = true,
	lvs_cis_htl
}

local DISABLED_WALKER_TARGET_CLASSES = {
	lvs_walker_atte_rear = true,
	lvs_walker_hsd_leg = true,
	lvs_walker_hsd = true
}

local function destroyLVSVehicle(vehicle, attacker, inflictor)
	if (!IsValid(vehicle) or !isfunction(vehicle.GetHP) or !isfunction(vehicle.SetHP)
		or !isfunction(vehicle.IsDestroyed) or !isfunction(vehicle.SetDestroyed)
		or !isfunction(vehicle.ClearPDS) or !isfunction(vehicle.PreExplode)
		or !isfunction(vehicle.Explode)) then
		ErrorNoHalt("[timebomb] Cannot destroy LVS vehicle: required damage-system methods are unavailable.\n")
		return
	end

	if (vehicle:IsDestroyed()) then
		return
	end

	vehicle:SetHP(0)
	vehicle.FinalAttacker = attacker
	vehicle.FinalInflictor = inflictor
	vehicle:SetDestroyed(false)
	vehicle:ClearPDS()

	local explodeTime = vehicle:PreExplode(
		math.Clamp((vehicle:GetVelocity():Length() - 200) / 200, 1.5, 16)
	)

	timer.Simple(explodeTime, function()
		if (IsValid(vehicle)) then
			vehicle:Explode()
		end
	end)
end

local function disableWalkerTarget(target)
	local walker = target

	if (target:GetClass() != "lvs_walker_hsd") then
		if (!isfunction(target.GetBase)) then
			ErrorNoHalt("[timebomb] Walker component does not expose its base vehicle.\n")
			return
		end

		walker = target:GetBase()
	end

	if (!IsValid(walker) or !isfunction(walker.BecomeRagdoll)) then
		ErrorNoHalt("[timebomb] Walker target has no valid ragdoll-capable vehicle.\n")
		return
	end

	if (isfunction(walker.GetIsRagdoll) and walker:GetIsRagdoll()) then
		return
	end

	walker:BecomeRagdoll()
end

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
	local damage = 300

	if (mode == "npc") then
		damage = 300
	elseif (mode == "door") then
		damage = 150
	end

	if (IsValid(anchor)) then
		if (mode == "container" and anchor:GetClass() == "ix_container") then
			anchor:SetLocked(false)
		elseif (mode == "door") then
			anchor:Fire("Unlock", "", 0)
			anchor:Fire("Open", "", 0.1)
		end
	end

	if (mode == "npc" and IsValid(anchor)) then
		anchor:SetHealth(anchor:Health() - 2000)
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

	if (mode == "vehicle" and IsValid(anchor)) then
		local vehicleClass = anchor:GetClass()

		timer.Simple(0, function()
			if (!IsValid(anchor)) then
				return
			end

			if (DISABLED_WALKER_TARGET_CLASSES[vehicleClass]) then
				disableWalkerTarget(anchor)
			end

			if (DESTROYED_VEHICLE_CLASSES[vehicleClass]) then
				destroyLVSVehicle(anchor, attacker, self)
			elseif (HALF_HEALTH_VEHICLE_CLASSES[vehicleClass]
				and isfunction(anchor.GetHP) and isfunction(anchor.SetHP)
				and (!isfunction(anchor.IsDestroyed) or !anchor:IsDestroyed())) then
				anchor:SetHP(anchor:GetHP() * 0.5)
			end
		end)
	end

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
