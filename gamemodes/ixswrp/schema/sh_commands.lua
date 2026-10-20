do
	local COMMAND = {}
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		if (!client:IsRestricted()) then
			ix.chat.Send(client, "dispatch", message)
		else
			return "@notNow"
		end
	end

	ix.command.Add("Dispatch", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local radios = character:GetInventory():GetItemsByUniqueID("handheld_radio", true)
		local item

		for k, v in ipairs(radios) do
			if (v:GetData("enabled", false)) then
				item = v
				break
			end
		end

		if (item) then
			if (!client:IsRestricted()) then
				ix.chat.Send(client, "radio", message)
				ix.chat.Send(client, "radio_eavesdrop", message)
			else
				return "Вы не можете этого сделать!"
			end
		elseif (#radios > 0) then
			return "Датапад не включен."
		else
			return "Вам нужен датапад."
		end
	end

	ix.command.Add("Radio", COMMAND)
	ix.command.Add("radio", COMMAND)
	ix.command.Add("r", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.number

	function COMMAND:OnRun(client, frequency)
		local character = client:GetCharacter()
		local inventory = character:GetInventory()
		local itemTable = inventory:HasItem("handheld_radio")

		if (itemTable) then
			if (string.find(frequency, "^%d%d%d%.%d$")) then
				character:SetData("frequency", frequency)
				itemTable:SetData("frequency", frequency)

				client:Notify(string.format("Вы изменили частоту на %s.", frequency))
			end
		end
	end

	ix.command.Add("SetFreq", COMMAND)
end

do
	COMMAND = {
		description = "/event в радиусе обычного чата.",
		arguments = ix.type.text,
		superAdminOnly = true
	}

	function COMMAND:OnRun(client, text)
		ix.chat.Send(client, "localevent", text)
	end

	ix.command.Add("LocalEvent", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local inventory = character:GetInventory()

		if (inventory:HasItem("request_device") or client:IsCombine() or client:Team() == FACTION_ADMIN) then
			if (!client:IsRestricted()) then
				Schema:AddCombineDisplayMessage("@cRequest")

				ix.chat.Send(client, "request", message)
				ix.chat.Send(client, "request_eavesdrop", message)
			else
				return "@notNow"
			end
		else
			return "@needRequestDevice"
		end
	end

	ix.command.Add("Request", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		if (!client:IsRestricted()) then
			ix.chat.Send(client, "broadcast", message)
		else
			return "@notNow"
		end
	end

	ix.command.Add("Broadcast", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.adminOnly = true
	COMMAND.arguments = {
		ix.type.character,
		ix.type.text
	}

	function COMMAND:OnRun(client, target, permit)
		local itemTable = ix.item.Get("permit_" .. permit:lower())

		if (itemTable) then
			target:GetInventory():Add(itemTable.uniqueID)
		end
	end

	ix.command.Add("PermitGive", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.adminOnly = true
	COMMAND.arguments = {
		ix.type.character,
		ix.type.text
	}
	COMMAND.syntax = "<string name> <string permit>"

	function COMMAND:OnRun(client, target, permit)
		local inventory = target:GetInventory()
		local itemTable = inventory:HasItem("permit_" .. permit:lower())

		if (itemTable) then
			inventory:Remove(itemTable.id)
		end
	end

	ix.command.Add("PermitTake", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.character

	function COMMAND:OnRun(client, target)
		local targetClient = target:GetPlayer()

		if (!hook.Run("CanPlayerViewData", client, targetClient)) then
			return "@cantViewData"
		end

		netstream.Start(client, "ViewData", targetClient, target:GetData("cid") or false, target:GetData("combineData"))
	end

	ix.command.Add("ViewData", COMMAND)
end

do
	local COMMAND = {}

	function COMMAND:OnRun(client, arguments)
		if (!hook.Run("CanPlayerViewObjectives", client)) then
			return "@noPerm"
		end

		netstream.Start(client, "ViewObjectives", Schema.CombineObjectives)
	end

	ix.command.Add("ViewObjectives", COMMAND)
end

do
	local COMMAND = {}

	function COMMAND:OnRun(client, arguments)
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:IsRestricted()) then
			if (!client:IsRestricted()) then
				Schema:SearchPlayer(client, target)
			else
				return "@notNow"
			end
		end
	end

	ix.command.Add("CharSearch", COMMAND)
end

ix.command.Add("Untie", {
	description = "Развязать другого игрока, если обычное освобождение не работает.",
	arguments = {
		ix.type.player
	},
	OnRun = function(self, client, target)
		if (!IsValid(target) or !target:IsPlayer() or target == client) then
			return "Укажите другого игрока."
		end

		if (!target:IsRestricted()) then
			return "Этот игрок не связан."
		end

		target:SetRestricted(false)
		target:SetNetVar("tying")
		target:SetNetVar("untying")
		target:SetAction(false)
		target:Notify("Вас развязали.")
		client:Notify("Вы развязали игрока.")
	end
})

	ix.command.Add("CharRevive", {
		description = "Позволяет поднять игрока, если он в критическом состоянии.",
		superAdminOnly = true,
	arguments = {
		ix.type.player
	},
	OnRun = function(self, client, target)
		if (!IsValid(target) or !target:IsPlayer()) then
			return false
		end

		if (!target:IsCritical()) then
			client:Notify("Игрок не в критическом состоянии!")
			return false
		end

		target:SetCriticalState(false)
		target:SetHealth(100)
		target:SetArmor(0)
		target:Notify("Вы были возрождены силами за пределами вашего понимания.")
		client:Notify("Вы возродили " .. target:Name() .. ".")
	end
})

ix.command.Add("CharCrit", {
	description = "Позволяет перевести игрока в критическое состояние.",
	superAdminOnly = true,
	arguments = {
		ix.type.player
	},
	OnRun = function(self, client, target)
		if (!IsValid(target) or !target:IsPlayer()) then
			return false
		end

		if (target:IsCritical()) then
			client:Notify("Игрок уже в критическом состоянии!")
			return false
		end
        
		target:SetCriticalState(true)
		target:SetCriticalBlood(300)
		target:SetHealth(1)
		target:SetArmor(0)
		target:Notify("Вас что-то ранило.")
		client:Notify("Вы перевели в критическое состояние " .. target:Name() .. ".")
	end
})

ix.command.Add("CharDrunk", {
    description = "Заставляет персонажа испытывать максимальный эффект опьянения.",
    superAdminOnly = true,
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, target)	
        target:SetDrunk(99)
		client:Notify("" .. target:GetName() .. " пьян.")
        
        local targetPlayer = target:GetPlayer()
        if (IsValid(targetPlayer)) then
            targetPlayer.ixNextDrunkSpeak = nil
        end
    end
})

ix.command.Add("CharSober", {
    description = "Обнуляет уровень опьянения персонажа.",
    superAdminOnly = true,
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, target)
        target:SetDrunk(0)
		client:Notify("Вы заставили протрезветь " .. target:GetName() .. ".")
        
        local targetPlayer = target:GetPlayer()
        if (IsValid(targetPlayer)) then
            targetPlayer.ixNextDrunkSpeak = nil
            targetPlayer:Notify("Вы мгновенно протрезвели.")
            
            if (targetPlayer:IsRagdolled()) then
                targetPlayer:SetRagdolled(false)
            end
        end
    end
})

ix.command.Add("CharRagdoll", {
	description = "Позволяет персонажа отправить в рэгдолл.",
	arguments = {ix.type.player, ix.type.number},
	superAdminOnly = true,
	OnRun = function(self, client, target, time)
		if (!target:Alive() or target:GetMoveType() == MOVETYPE_NOCLIP or target:GetNetVar("forcedSequence")) then
			return "@notNow"
		end

		if (time and time > 0) then
			time = math.Clamp(time, 1, 60)
		end

		if (target:IsCritical()) then
			client:Notify("Игрок в критическом состоянии!")
		end

		if (!IsValid(target.ixRagdoll) and !target:IsCritical()) then
			target:SetRagdolled(true, time)
			target:Notify("Вас что-то вырубило.")
		end
	end
})

ix.command.Add("CharSlay", {
	description = "Позволяет добить игрока, если он в критическом состоянии.",
	superAdminOnly = true,
	arguments = {
		ix.type.player
	},
	OnRun = function(self, client, target)
		if (!IsValid(target) or !target:IsPlayer()) then
			return false
		end

		if (!target:IsCritical()) then
			client:Notify("Игрок не в критическом состоянии!")
			return false
		end

		target:SetCriticalBlood(0)
		target:SetHealth(0)
		target:Kill()
		target:Notify("Вас что-то добило.")
		client:Notify("Вы добили " .. target:Name() .. ".")
	end
})

ix.command.Add("OpenForceMenu", {
	description = "@openforcemenu",
	OnCheckAccess = function(self, client)
		return client:IsForceUser()
	end,
	OnRun = function(self, client)
		client:ConCommand("lscs_openmenu")
	end
})

ix.command.Add("AdminForceMenu", {
	description = ".",
	superAdminOnly = true,
	OnRun = function(self, client)
		client:ConCommand("lscs_openmenu")
	end
})

ix.command.Add("Helmet", {
	description = "Переключает интерфейс на экране шлема.",
	OnCheckAccess = function(self, client)
		return client:IsClone()
	end,
	OnRun = function(self, client)
		client:Say("!helmet")
	end
})

ix.command.Add("Visor", {
	description = "Переключает интерфейс на экране шлема.",
	OnCheckAccess = function(self, client)
		return client:IsClone()
	end,
	OnRun = function(self, client)
		client:Say("!helmet")
	end
})

ix.command.Add("DroidHudEnable", {
	description = "Включает интерфейс дроида.",
	OnCheckAccess = function(self, client)
		return client:IsDroid()
	end,
	OnRun = function(self, client)
		client:ConCommand("SyntHud_enabled 1")
		client:ChatPrint("HUD включен.")
	end
})

ix.command.Add("DroidHudDisable", {
	description = "Отключает интерфейс дроида.",
	OnCheckAccess = function(self, client)
		return client:IsDroid()
	end,
	OnRun = function(self, client)
		client:ConCommand("SyntHud_enabled 0")
		client:ChatPrint("HUD отключен.")
	end
})

do
	COMMAND = {
		description = "Позволяет ослепить игрока на выбранное время.",
		arguments = {
			ix.type.player,
			ix.type.number,
			ix.type.number
		},
		superAdminOnly = true
	}

	function COMMAND:OnRun(client, target, speed, time)
		target:ScreenFade(SCREENFADE.OUT, color_black, speed, time)
	end

	ix.command.Add("PlyBlind", COMMAND)
end

ix.command.Add("PlyBlindAll", {
	description = "Позволяет ослепить всех, кроме администраторов.",
	arguments = {
		ix.type.number,
		ix.type.number
	},
	superAdminOnly = true,
	OnRun = function(self, client, speed, time)
		for _, target in ipairs(player.GetAll()) do
			if (!target:IsAdmin() and !target:IsSuperAdmin()) then
				target:ScreenFade(SCREENFADE.OUT, color_black, speed, time)
			end
		end
	end
})