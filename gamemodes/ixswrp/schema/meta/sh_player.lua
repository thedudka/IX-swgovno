local playerMeta = FindMetaTable("Player")

function playerMeta:IsCombine()
	local faction = self:Team()
	return faction == FACTION_MPF or faction == FACTION_OTA
end

function playerMeta:IsRepublic()
	local faction = self:Team()
	return faction == FACTION_CLONE or faction == FACTION_JEDI
end

function playerMeta:IsForceUser()
	local faction = self:Team()
	return faction == FACTION_JEDI or faction == FACTION_SITH
end

function playerMeta:IsFFA()
	local faction = self:Team()
	return faction == FACTION_SITH or faction == FACTION_FAUNA
end

function playerMeta:IsDroid()
	local faction = self:Team()
	return faction == FACTION_DROID or faction == FACTION_ROBOT
end

function playerMeta:IsNeutral()
	local faction = self:Team()
	return faction == FACTION_NEUTRAL
end

function playerMeta:IsClone()
	local faction = self:Team()
	return faction == FACTION_CLONE or faction == FACTION_MERC
end

function playerMeta:IsCIS()
	local faction = self:Team()
	return faction == FACTION_DROID or faction == FACTION_CIS
end

function playerMeta:IsEventFaction()
	local faction = self:Team()
	return faction == FACTION_CIS or faction == FACTION_NEUTRAL
end

function playerMeta:IsDispatch()
	local name = self:Name()
	local faction = self:Team()
	local bStatus = faction == FACTION_OTA

	if (!bStatus) then
		for k, v in ipairs({ "SCN", "DvL", "SeC" }) do
			if (Schema:IsCombineRank(name, v)) then
				bStatus = true

				break
			end
		end
	end

	return bStatus
end
