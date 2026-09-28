local PLUGIN = PLUGIN

PLUGIN.name = "Voice Command Menu"
PLUGIN.author = ""
PLUGIN.description = "Adds a Counter-Strike style voice command menu."

PLUGIN.netMessage = "ixVoiceCommandMenu.Execute"
PLUGIN.cooldown = 2
PLUGIN.commands = {
	[1] = {
		label = "МЕДИК!",
		messages = {"Медик, сюда!", "Нужен медик!", "Нужен санитар!", "Высылайте подмогу, медика!"}
	},
	[2] = {
		label = "ГРАНАТА!",
		messages = {"Граната, в укрытие!", "Берегись, граната!", "Ложись, граната!", "В укрытие!"}
	},
	[3] = {
		label = "Вперед-вперед!",
		messages = {"Вперед-вперед!", "Пошли-пошли!", "Продвигаемся, вперед!", "Бегом, марш!"}
	},
	[4] = {
		label = "Контакт!",
		messages = {"Контакт!", "Замечен противник!", "Враг в поле зрения!"}
	},
    [5] = {
		label = "Атаковать!",
		messages = {"Атакуйте противника!", "Уничтожьте их!", "Атакуем врага!"}
	},
    [6] = {
		label = "Боевой клич.",
		messages = {"Понеслась!", "В бой!", "Ни шагу назад!", "Зададим им жару!", "Раздавим их!", "Задавим их интеллектом!"}
	},
	[7] = {
		label = "Смотреть по сторонам!",
		messages = {"Смотрите по сторонам!", "Смотрите по флангам!", "Фокус на фланги!", "Они могут идти по флангам!"}
	},
	[8] = {
	    label = "Противник убит!",
		messages = {"Противник убит!", "Противник уничтожен!", "Враг уничтожен!", "Враг нейтрализован!", "Враг больше не представляет угрозы!"}
	},
	[9] = {
		label = "Прекратить огонь по своим!",
		messages = {"Отставить огонь по своим!", "Прекратите огонь по своим!", "Вы атакуете своих, отставить!", "Разуйте глаза, вы стреляете в своих!"}
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
	},
		[CLASS_LEADER] = {
		[1] = {label = "Идем на прорыв.", message = "Отделение, штурмовой порядок. Идем на прорыв."},
		[2] = {label = "Рассредоточиться, атаковать фланги.", message = "Врассыпную. Штурмуем с флангов."},
		[3] = {label = "Концентрировать огонь по цели.", message = "Концентрировать огонь на этой цели."},
		[4] = {label = "Удерживать позицию.", message = "Удерживать этот сектор."},
		[5] = {label = "Занять позицию.", message = "Окопаться здесь. Занять выгодные позиции и высоты."},
		[6] = {label = "Фланг пробит.", message = "Внимание отделение - фланг пробит."},
		[7] = {label = "Отступаем.", message = "Отделение - отступаем. Двигаемся к точке сбора."},
		[8] = {label = "Нужна помощь.", message = "Я спекся. Отделение - вернуть меня в строй."},
		[9] = {label = "Все за мной!", message = "Отставить маневры, отделение. Все за мной."}
	},
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
	},
	[CLASS_LEADER] = {
		[1] = {"commander_forward"},
		[2] = {"commander_flank"},
		[3] = {"commander_eliminate"},
		[4] = {"commander_hold"},
		[5] = {"commander_secure"},
		[6] = {"commander_breach"},
		[7] = {"commander_retreat"},
		[8] = {"commander_helpme"},
		[9] = {"commander_follow"}
	},
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
		[4] = {"Clone_incoming"},
		[5] = {"Clone_supress"},
        [6] = {"Clone_pride"},
		[7] = {"Clone_flank"},
		[8] = {"Clone_enemydown"},
        [9] = {"Clone_ff"},
	},
		[FACTION_COMMANDO] = {
		[1] = {"Clone_medic"},
		[2] = {"Clone_grenade"},
		[3] = {"Clone_forward"},
		[4] = {"Clone_incoming"},
		[5] = {"Clone_supress"},
        [6] = {"Clone_pride"},
		[7] = {"Clone_flank"},
		[8] = {"Clone_enemydown"},
        [9] = {"Clone_ff"},
	},
	[FACTION_ROBOT] = {
		[1] = {"droid_medic"},
		[2] = {"droid_grenade"},
		[3] = {"droid_noise"},
		[4] = {"droid_noise"},
		[5] = {"droid_noise"},
        [6] = {"droid_noise"},
        [7] = {"mouse_noise"},
        [8] = {"mouse_noise"},
        [9] = {"Robot_hurt"}
	},
		[FACTION_MERC] = {
		[1] = {"merc_medic"},
		[2] = {"merc_grenade"},
		[3] = {"merc_forward"},
		[4] = {"merc_incoming"},
		[5] = {"merc_incoming"},
        [6] = {"merc_forward"},
        [7] = {"merc_incoming"},
        [8] = {"merc_forward"},
        [9] = {"merc_grenade"}
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

		local chatMessage = command.message
		if command.messages and #command.messages > 0 then
			chatMessage = command.messages[math.random(#command.messages)]
		end

		if class == CLASS_CLONECOMMANDER or class == CLASS_LEADER then
			ix.chat.Send(client, "radio", chatMessage)
		else
			ix.chat.Send(client, "y", chatMessage)
		end
	end)

	hook.Add("PlayerDisconnected", "ixVoiceCommandMenu.ClearCooldown", function(client)
		PLUGIN.nextCommandTime[client] = nil
	end)
end
ix.util.Include("cl_plugin.lua", "client")