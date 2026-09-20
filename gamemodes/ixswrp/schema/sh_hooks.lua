
function Schema:CanPlayerUseBusiness(client, uniqueID)
	if (client:Team() == FACTION_CITIZEN) then
		local itemTable = ix.item.list[uniqueID]

		if (itemTable) then
			if (itemTable.permit) then
				local character = client:GetCharacter()
				local inventory = character:GetInventory()

				if (!inventory:HasItem("permit_"..itemTable.permit)) then
					return false
				end
			elseif (itemTable.base ~= "base_permit") then
				return false
			end
		end
	end
end

-- called when the client wants to view the combine data for the given target
function Schema:CanPlayerViewData(client, target)
	return client:IsCombine() and (!target:IsCombine() and target:Team() != FACTION_ADMIN)
end

-- called when the client wants to edit the combine data for the given target
function Schema:CanPlayerEditData(client, target)
	return client:IsCombine() and (!target:IsCombine() and target:Team() != FACTION_ADMIN)
end

function Schema:CanPlayerViewObjectives(client)
	return client:IsCombine()
end

function Schema:CanPlayerEditObjectives(client)
	if (!client:IsCombine() or !client:GetCharacter()) then
		return false
	end

	local bCanEdit = false
	local name = client:GetCharacter():GetName()

	for k, v in ipairs({"OfC", "EpU", "DvL", "SeC"}) do
		if (self:IsCombineRank(name, v)) then
			bCanEdit = true
			break
		end
	end

	return bCanEdit
end

function Schema:CanDrive()
	return false
end

function Schema:InitializedChatClasses()
	local meColor = Color(150, 180, 120, 255)
	-- long-range action
	ix.chat.Register("mel", {
		format = "**** %s %s",
		color = meColor,
		CanHear = ix.config.Get("chatRange", 280) * 6,
		prefix = {"/MeL", "/ActionLong"},
		description = "Выполнить действие в большом радиусе.",
		deadCanChat = true,
		indicator = "chatPerforming"
	})

	ix.chat.Register("me", {
		format = "*** %s %s",
		color = meColor,
		CanHear = ix.config.Get("chatRange", 280) * 2,
		prefix = {"/Me", "/Action"},
		description = "Выполнить действие.",
		deadCanChat = true,
		indicator = "chatPerforming"
	})

	-- close action
	ix.chat.Register("mec", {
		format = "** %s %s",
		color = meColor,
		prefix = {"/MeC", "/ActionClose"},
		description = "Выполнить действие в малом радиусе.",
		CanHear = ix.config.Get("chatRange", 280) * 0.33,
		deadCanChat = true,
		indicator = "chatPerforming"
	})

	-- direct action
	ix.chat.Register("med", {
		format = "* %s %s",
		color = meColor,
		prefix = {"/MeD", "/ActionDirect"},
		description = "Выполнить действие напрямую игроку.",
		indicator = "chatPerforming",
		CanHear = function(class, speaker, listener)
			local entity = speaker:GetEyeTraceNoCursor().Entity

			if (speaker == listener and (!IsValid(entity) or !entity:IsPlayer())) then
				speaker:NotifyLocalized("Вам нужно смотреть на персонажа.")
				return false
			end

			return speaker == listener or listener == entity
		end
	})

	local itColor = Color(90, 170, 190, 255)
	-- long-range area action
	ix.chat.Register("itl", {
		prefix = "/ItL",
		description = "Описать окружение в большом радусе.",
		deadCanChat = true,
		CanHear = ix.config.Get("chatRange", 280) * 6,
		indicator = "chatPerforming",
		OnChatAdd = function(class, speaker, text)
			chat.AddText(itColor, "**** " .. text)
		end
	})

	-- close area action
	ix.chat.Register("it", {
		prefix = {"/It"},
		description = "Описать окружение.",
		indicator = "chatPerforming",
		deadCanChat = true,
		CanHear = ix.config.Get("chatRange", 280) * 2,
		OnChatAdd = function(self, speaker, text)
			chat.AddText(itColor, "*** "..text)
		end,
	})

	ix.chat.Register("itc", {
		prefix = "/ItC",
		description = "Описать окружение в малом радусе.",
		deadCanChat = true,
		CanHear = ix.config.Get("chatRange", 280) * 0.33,
		indicator = "chatPerforming",
		OnChatAdd = function(class, speaker, text)
			chat.AddText(itColor, "** " .. text)
		end
	})

	-- direct area action
	ix.chat.Register("Описать окружение напрямую игроку.", {
		prefix = "/ItD",
		description = "@cmdItD",
		indicator = "chatPerforming",
		CanHear = function(class, speaker, listener)
			local entity = speaker:GetEyeTraceNoCursor().Entity

			if (speaker == listener and (!IsValid(entity) or !entity:IsPlayer())) then
				speaker:NotifyLocalized("Вам нужно смотреть на персонажа.")
				return false
			end

			return speaker == listener or listener == entity
		end,
		OnChatAdd = function(class, speaker, text)
			chat.AddText(itColor, "* " .. text)
		end
	})

	ix.chat.Register("localevent", {
		CanHear = (ix.config.Get("chatRange", 280) * 2),
		OnChatAdd = function(self, speaker, text)
			chat.AddText(Color(255, 150, 0), text)
		end,
	})
end
