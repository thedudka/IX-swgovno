
local CHAR = ix.meta.character

function CHAR:IsCombine()
	local faction = self:GetFaction()
	return faction == FACTION_MPF or faction == FACTION_OTA
end

function CHAR:IsClone()
	local faction = self:GetFaction()
	return faction == FACTION_CLONE
end

function CHAR:IsForceUser()
	local faction = self:GetFaction()
	return faction == FACTION_JEDI
end