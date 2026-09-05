local PLUGIN = PLUGIN

hook.Add("EntityTakeDamage", "ixCriticalDamageState", function(target, damageInfo)
	if not IsValid(target) or not target:IsPlayer() or not target:Alive() then
		return
	end

	local damage = math.max(damageInfo:GetDamage(), 0)
	local attacker = damageInfo:GetAttacker()

	if target:IsCritical() then
		if damage > 0 and IsValid(attacker) and attacker:IsPlayer() then
			local remaining = math.max(target:GetCriticalBlood() - damage, 0)
			target:SetCriticalBlood(remaining)
			damageInfo:SetDamage(0)

			if remaining <= 0 then
				target:Kill()
				return true
			end
		end

		return true
	end

	if damage > 0 and target:Health() > 0 and target:Health() - damage <= 1 then
		damageInfo:SetDamage(0)
		target:SetCriticalState(true)
		return true
	end
end)

hook.Add("EntityRelationship", "ixCriticalNPCIgnore", function(entity, target)
	if IsValid(entity) and entity:IsNPC() and IsValid(target) and target:IsPlayer() and target:IsCritical() then
		return D_NOSCHEDULE
	end
end)

hook.Add("PlayerCanBeTargeted", "ixCriticalTargetIgnore", function(target, attacker)
	if IsValid(target) and target:IsPlayer() and target:IsCritical() then
		return false
	end
end)

hook.Add("PlayerInitialSpawn", "ixCriticalInitialize", function(client)
	if IsValid(client.ixRagdoll) then
		client.ixRagdoll:Remove()
		client.ixRagdoll = nil
	end

	client:SetNetVar("critical", nil)
	client:SetNetVar("criticalBlood", 300)
	client:SetHealth(50)
	client:SetArmor(0)
	client:SetNoDraw(false)
	client:SetNotSolid(false)
	client:SetCollisionGroup(COLLISION_GROUP_PLAYER)
	client:ResetHull()
	client:SetLocalVar("knocked", false)
end)

hook.Add("OnCharacterCreated", "ixCriticalCreateReset", function(client, character)
	if client then
		if IsValid(client.ixRagdoll) then
			client.ixRagdoll:Remove()
			client.ixRagdoll = nil
		end

		client:SetNetVar("critical", nil)
		client:SetNetVar("criticalBlood", 300)
		client:SetHealth(50)
		client:SetArmor(0)
		client:SetNoDraw(false)
		client:SetNotSolid(false)
		client:SetCollisionGroup(COLLISION_GROUP_PLAYER)
		client:ResetHull()
		client:SetLocalVar("knocked", false)
	end

	if character then
		character:SetBlood(300)
	end
end)

hook.Add("PlayerSpawn", "ixCriticalSpawnReset", function(client)
	if IsValid(client.ixRagdoll) then
		client.ixRagdoll:Remove()
		client.ixRagdoll = nil
	end

	client:SetNetVar("critical", nil)
	client:SetNetVar("criticalBlood", 300)
	client:SetHealth(50)
	client:SetArmor(0)
	client:SetNoDraw(false)
	client:SetNotSolid(false)
	client:SetCollisionGroup(COLLISION_GROUP_PLAYER)
	client:ResetHull()
	client:SetLocalVar("knocked", false)

	if client:GetCharacter() then
		client:GetCharacter():SetBlood(300)
	end
end)

hook.Add("PlayerDeath", "ixCriticalDeathCleanup", function(client)
	if not IsValid(client) then
		return
	end

	local wasCritical = client:IsCritical()

	if IsValid(client.ixRagdoll) then
		client.ixRagdoll:Remove()
		client.ixRagdoll = nil
	end

	if wasCritical then
		client:SetNetVar("critical", nil)
		client:SetNetVar("criticalBlood", 300)
		client:SetNoDraw(true)
		client:SetNotSolid(true)
		client:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
		client:ResetHull()
		client:SetLocalVar("knocked", false)
		return
	end
end)
