local PLAYER = FindMetaTable("Player")

function PLAYER:IsCritical()
	return self:GetNetVar("critical", false)
end

function PLAYER:InCriticalState()
	return self:IsCritical()
end

function PLAYER:GetCriticalBlood()
	local value = self:GetNetVar("criticalBlood", 300)
	local character = self:GetCharacter()

	if character and character:GetBlood() ~= nil then
		return character:GetBlood()
	end

	return value
end

function PLAYER:SetCriticalBlood(value)
	local blood = math.Clamp(math.Round(value or 300), 0, 300)
	local character = self:GetCharacter()

	self:SetNetVar("criticalBlood", blood)

	if character then
		character:SetBlood(blood)
	end
end

function PLAYER:SetCriticalState(state)
	local character = self:GetCharacter()

	if not character then
		return
	end

	if state then
		if self:IsCritical() then
			return
		end

		self:SetNetVar("critical", true)
		character:SetData("critical", true)
		self.ixCriticalPosition = self:GetPos()
		self:SetCriticalBlood(300)
		self:SetHealth(1)
		self:SetArmor(0)
		self:AddFlags(FL_NOTARGET)
		self:SetNoTarget(true)

		local deathSound = hook.Run("GetPlayerDeathSound", self)
		if (isstring(deathSound) and deathSound ~= "") then
			self:EmitSound(deathSound)
		else
			self:EmitSound("physics/flesh/flesh_impact_bullet1.wav")
		end

		if IsValid(self.ixRagdoll) then
			self.ixRagdoll:Remove()
		end

		self:SetAction("@critical", 999999)
		self:SetRagdolled(true, 999999, 999999)

		self:SetNoDraw(true)
		self:SetNotSolid(false)
		self:SetCollisionGroup(COLLISION_GROUP_PLAYER)
		self:SetCustomCollisionCheck(true)

		if IsValid(self.ixRagdoll) then
			self.ixRagdoll:SetNotSolid(false)
			self.ixRagdoll:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		end

		self:SetLocalVar("knocked", true)
		self:SetMoveType(MOVETYPE_OBSERVER)
		return
	end

	self:SetNetVar("critical", nil)
	self:SetNetVar("criticalBlood", 300)
	self:RemoveFlags(FL_NOTARGET)
	self:SetNoTarget(false)
	character:SetData("critical", nil)
	character:SetBlood(300)

	if IsValid(self.ixRagdoll) then
		self.ixRagdoll:SetNotSolid(false)
		self.ixRagdoll:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		self:SetRagdolled(false)
	end

	self:SetNotSolid(false)
	self:SetCollisionGroup(COLLISION_GROUP_PLAYER)
	self:ResetHull()
	self:SetMoveType(MOVETYPE_WALK)
	self:SetHealth(50)
	self:SetArmor(0)
	self:SetLocalVar("knocked", false)

	if self.ixCriticalPosition then
		self:SetPos(self.ixCriticalPosition)
	end

	self.ixCriticalPosition = nil
end

hook.Add("ShouldCollide", "ixCriticalPlayerCollision", function(entityA, entityB)
	if not IsValid(entityA) or not IsValid(entityB) then
		return
	end

	if entityA:IsPlayer() and entityB:IsPlayer() then
		if entityA:IsCritical() or entityB:IsCritical() then
			return false
		end
	end
end)
