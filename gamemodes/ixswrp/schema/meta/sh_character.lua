
local CHAR = ix.meta.character

function CHAR:IsCombine()
	local faction = self:GetFaction()
	return faction == FACTION_MPF or faction == FACTION_OTA
end

function CHAR:IsRepublic()
	local faction = self:GetFaction()
	return faction == FACTION_CLONE or faction == FACTION_JEDI
end

function CHAR:IsFFA()
	local faction = self:GetFaction()
	return faction == FACTION_FAUNA
end

function CHAR:IsNeutral()
	local faction = self:GetFaction()
	return faction == FACTION_NEUTRAL
end

function CHAR:IsEventFaction()
	local faction = self:GetFaction()
	return faction == FACTION_CIS or faction == FACTION_NEUTRAL
end

function CHAR:IsCIS()
	local faction = self:GetFaction()
	return faction == FACTION_DROID or faction == FACTION_CIS or faction == FACTION_SITH
end

function CHAR:IsDroid()
	local faction = self:GetFaction()
	return faction == FACTION_DROID or faction == FACTION_ROBOT
end

function CHAR:IsClone()
	local faction = self:GetFaction()
	return faction == FACTION_CLONE or faction == FACTION_MERC
end

function CHAR:IsForceUser()
	local faction = self:GetFaction()
	return faction == FACTION_JEDI or faction == FACTION_SITH or faction == FACTION_ROBOT or faction == FACTION_DROID
end

function CHAR:IsTrueForceUser()
	local faction = self:GetFaction()
	return faction == FACTION_JEDI or faction == FACTION_SITH
end