local PLUGIN = PLUGIN

PLUGIN.name = "Secondary Voice Command Menu"
PLUGIN.author = ""
PLUGIN.description = "A secondary voice command menu triggered by F2."

PLUGIN.netMessage = "ixSecondaryVoiceMenu.Execute"
PLUGIN.cooldown = 2

PLUGIN.commands = {
	[1] = {
	label = "Я помогу тебе.",
	messages = {"Я помогу тебе, солдат.", "Держись, я помогу тебе.", "Помощь тебе не помешает, солдат.", "Помощь уже тут, солдат."}
	},
    [2] = {
	label = "Негативная реплика.",
	messages = {"Это не к добру.", "Дело дрянь.", "Все хуже, чем я думал.", "Надеюсь, это не наш конец!", "О нет...", "Твою..."}
	},
    [3] = {
	label = "Позитивная реплика.",
	messages = {"Да, вот так!", "Отлично!", "Так держать!", "Легче легкого!", "Так это и делается!", "Нам они не помеха!", "Давай, удиви меня!", "Превосходно!"}
	},
	[4] = {
	label = "Да.",
	messages = {"Да.", "Так точно.", "Да, сэр."}
	},
	[5] = {
	label = "Нет.",
	messages = {"Нет.", "Никак нет.", "Нет, сэр."}
	},
	[6] = {
	label = "Назад!",
	messages = {"Отходим!", "Назад, уходим.", "Назад-назад!", "Нужно отойти назад!", "Нужно наступать в обратную сторону!", "Уходим!"}
	},
	[7] = {
	label = "Держать позицию.",
	messages = {"Удерживаем эту позицию.", "Стоп, держим эту точку.", "Держим эту точку.", "Удерживаем эту точку", "Удерживаем позицию."}
	},
	[8] = {
	label = "Рассредоточиться.",
	messages = {"Рассредоточиться!", "В разные стороны!", "Нам нужно рассредоточиться.", "Нужно держаться друг от друга."}
	},
	[9] = {
	label = "Собраться вместе.",
	messages = {"Держаться вместе.", "Держать группу!", "Не разделяемся, идем вместе!", "Двигаемся без одиночек, нужно собраться."}
	},
}

PLUGIN.classCommands = {
	[CLASS_CLONECOMMANDER] = {
		[1] = {label = "Мне нужен медик!", message = "Мне нужен медик, отделение!"},
		[2] = {label = "Подлечитесь.", message = "Подлечитесь, отделение."},
		[3] = {label = "Реанимировать отряд.", message = "Поднимите на ноги раненых бойцов, отделение."},
		[4] = {label = "Доложить статус.", message = "Отделение, доложите статус."},
		[5] = {label = "Штурм и зачистка.", message = "Штурмовать и зачищать вперед, отделение!"},
		[6] = {label = "Негативная реплика.", messages = {"Все еще хуже, чем я думал!", "Все идет не по плану!", "Что может быть еще хуже?", "Так дела уж точно не делаются...", "Нас тут выносят!", "Высылайте мешки для трупов..."}},
		[7] = {label = "Позитивная реплика.", messages = {"Вот так и действует дисциплинированный отряд!", "Мы раздавим их, отряд!", "У них нет ни единого шанса против нас!", "Единственное, что ты должен чувствовать, стреляя в кого-то - это отдачу.", "Один против всех этих тварей... Хм, у них нет шансов.", "Прямо как в симуляции!"}},
		[8] = {label = "Так точно.", message = "Так точно."},
		[9] = {label = "Никак нет.", message = "Никак нет."},
	}
}

PLUGIN.classSounds = {
	[CLASS_CLONECOMMANDER] = {
		[1] = {"commander_medic"},
		[2] = {"commander_healup"},
		[3] = {"commander_revive"},
		[4] = {"commander_report"},
		[5] = {"commander_enter"},
		[6] = {"commander_negative"},
		[7] = {"commander_positive"},
		[8] = {"commander_yes"},
		[9] = {"commander_no"},
	}
}

PLUGIN.factionSounds = {
	[FACTION_CLONE] = {
		[1] = {"Clone_heal"},
		[2] = {"Clone_boo"},
		[3] = {"Clone_cheers"},
		[4] = {"Clone_yes"},
		[5] = {"Clone_no"},
        [6] = {"Clone_retreat"},
        [7] = {"Clone_hold"},
        [8] = {"Clone_spread"},
        [9] = {"Clone_pile"}
	},
	[FACTION_ROBOT] = {
		[1] = {"mouse_noise"},
		[2] = {"Robot_hurt"},
		[3] = {"mouse_noise"},
		[4] = {"mouse_noise"},
		[5] = {"Robot_hurt"},
        [6] = {"droid_noise"},
        [7] = {"droid_noise"},
        [8] = {"droid_noise"},
        [9] = {"droid_noise"}
	},
		[FACTION_MERC] = {
		[1] = {"merc_ramble"},
		[2] = {"merc_grenade"},
		[3] = {"merc_ramble"},
		[4] = {"merc_incoming"},
		[5] = {"merc_incoming"},
        [6] = {"merc_forward"},
        [7] = {"merc_ramble"},
        [8] = {"merc_medic"},
        [9] = {"merc_forward"}
	}
}

function PLUGIN:GetCommands(client)
	local character = IsValid(client) and client:GetCharacter()
	local class = character and character:GetClass()

	return self.classCommands[class] or self.commands
end

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

		if class == CLASS_CLONECOMMANDER then
			ix.chat.Send(client, "radio", chatMessage)
		else
			ix.chat.Send(client, "ic", chatMessage)
		end
	end)

	hook.Add("PlayerDisconnected", "ixSecondaryVoiceMenu.ClearCooldown", function(client)
		PLUGIN.nextCommandTime[client] = nil
	end)
end

ix.util.Include("cl_plugin.lua", "client")