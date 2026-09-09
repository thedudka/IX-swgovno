local PLUGIN = PLUGIN

PLUGIN.name = "Voice Command Menu"
PLUGIN.author = ""
PLUGIN.description = "Adds a Counter-Strike style voice command menu."

PLUGIN.netMessage = "ixVoiceCommandMenu.Execute"
PLUGIN.cooldown = 2
PLUGIN.commands = {
	[1] = {
		label = "МЕДИК!",
		message = "Медик, сюда!"
	},
	[2] = {
		label = "ГРАНАТА!",
		message = "Граната, в укрытие!"
	},
	[3] = {
		label = "Вперед-вперед!",
		message = "Вперед-вперед!"
	},
	[4] = {
		label = "Я помогу тебе.",
		message = "Я помогу тебе, солдат."
	},
	[5] = {
		label = "Контакт!",
		message = "Контакт!"
	},
    [6] = {
		label = "Атаковать!",
		message = "Атакуйте противника!"
	},
    [7] = {
		label = "Негативная реплика.",
		message = "Это не к добру."
	},
    [8] = {
		label = "Позитивная реплика.",
		message = "Да, вот так!"
	},
    [9] = {
		label = "Боевой клич.",
		message = "В атаку!"
	},
}

PLUGIN.classCommands = {
	[CLASS_CLONECOMMANDER] = {
		[1] = {label = "Идем на прорыв.", message = "Отделение, штурмовой порядок. Идем на прорыв."},
		[2] = {label = "Рассредоточиться, атаковать фланги.", message = "Врассыпную. Штурмуем с флангов."},
		[3] = {label = "Концентрировать огонь по цели.", message = "Концентрировать огонь на этой цели."},
		[4] = {label = "Удерживать позицию.", message = "Удерживать этот сектор."},
		[5] = {label = "Занять позицию.", message = "Окопаться здесь. Занять выгодные позиции и высоты."},
		[6] = {label = "Фланг пробит.", message = "Внимание отделение - фланг пробит."},
		[7] = {label = "Отступаем.", message = "Отделение - отступаем. Двигаемся к точке сбора."},
		[8] = {label = "Нужна помощь.", message = "Я спекся. Отделение - вернуть меня в строй."},
		[9] = {label = "Все за мной!", message = "Отставить маневры, отделение. Все за мной."}
	}
}

PLUGIN.classSounds = {
	[CLASS_CLONECOMMANDER] = {
		[1] = {"commander_forward"},
		[2] = {"commander_flank"},
		[3] = {"commander_eliminate"},
		[4] = {"commander_hold"},
		[5] = {"commander_secure"},
		[6] = {"commander_breach"},
		[7] = {"commander_retreat"},
		[8] = {"commander_helpme"},
		[9] = {"commander_follow"}
	}
}

function PLUGIN:GetCommands(client)
	local character = IsValid(client) and client:GetCharacter()
	local class = character and character:GetClass()

	return self.classCommands[class] or self.commands
end

PLUGIN.factionSounds = {
	[FACTION_CLONE] = {
		[1] = {"Clone_medic"},
		[2] = {"Clone_grenade"},
		[3] = {"Clone_forward"},
		[4] = {"Clone_heal"},
		[5] = {"Clone_incoming"},
        [6] = {"Clone_supress"},
        [7] = {"Clone_boo"},
        [8] = {"Clone_cheers"},
        [9] = {"Clone_pride"}
	},
	[FACTION_ROBOT] = {
		[1] = {"droid_medic"},
		[2] = {"droid_grenade"},
		[3] = {"droid_noise"},
		[4] = {"mouse_noise"},
		[5] = {"droid_noise"},
        [6] = {"droid_noise"},
        [7] = {"Robot_hurt"},
        [8] = {"mouse_noise"},
        [9] = {"Robot_death"}
	}
}

if SERVER then
	util.AddNetworkString(PLUGIN.netMessage)
	PLUGIN.nextCommandTime = {}

	net.Receive(PLUGIN.netMessage, function(_, client)
		local number = net.ReadUInt(4)
		local commands = PLUGIN:GetCommands(client)
		local command = commands[number]
		local currentTime = CurTime()

		if not command or not IsValid(client) or not client:Alive() then
			return
		end

		if (PLUGIN.nextCommandTime[client] or 0) > currentTime then
			return
		end

		PLUGIN.nextCommandTime[client] = currentTime + PLUGIN.cooldown

		local factionSounds = PLUGIN.factionSounds[client:Team()]
		local character = client:GetCharacter()
		local class = character and character:GetClass()
		local classSounds = PLUGIN.classSounds[class]
		local sounds = classSounds and classSounds[number] or (factionSounds and factionSounds[number])
		if sounds and #sounds > 0 then
			client:EmitSound(sounds[math.random(#sounds)], 75, 100)
		end

        if class == CLASS_CLONECOMMANDER then
        ix.chat.Send(client, "radio", command.message)
		else
        ix.chat.Send(client, "y", command.message)
        end
	end)

	hook.Add("PlayerDisconnected", "ixVoiceCommandMenu.ClearCooldown", function(client)
		PLUGIN.nextCommandTime[client] = nil
	end)
end

ix.util.Include("cl_plugin.lua", "client")