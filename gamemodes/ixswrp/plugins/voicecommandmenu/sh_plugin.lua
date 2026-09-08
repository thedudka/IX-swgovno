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
    
		ix.chat.Send(client, "y", command.message)
	end)

	hook.Add("PlayerDisconnected", "ixVoiceCommandMenu.ClearCooldown", function(client)
		PLUGIN.nextCommandTime[client] = nil
	end)
end

// sound list here


sound.Add({
    name = "Clone_incoming",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/alert1.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/alert2.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/danger1.mp3",
    "vo_clonetropper/clone_incoming.wav",
}
})

sound.Add({
    name = "Clone_forward",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/combat5.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat6.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat9.mp3",
    "vo_clonetropper/clone_forward.wav",
}
})

sound.Add({
    name = "Clone_grenade",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 80,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted1.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted6.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted7.mp3",
}
})

sound.Add({
    name = "Clone_medic",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 80,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown3.mp3",
    "vo_clonetropper/clone_medic.wav",
}
})

sound.Add({
    name = "Clone_heal",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/healally1.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/healally2.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/healally3.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/healally4.mp3",
}
})

sound.Add({
    name = "Clone_supress",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing1.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing10.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing3.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing9.mp3",
}
})

sound.Add({
    name = "Clone_cheers",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy1.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy11.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy12.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy13.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy15.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy4.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy8.mp3",
}
})

sound.Add({
    name = "Clone_boo",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown4.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/mandown6.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/mandown7.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/mandown1.mp3",
}
})

sound.Add({
    name = "Clone_pride",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/combat10.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat11.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat15.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy2.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy9.mp3",
}
})

sound.Add({
    name = "droid_grenade",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"droidnoises/droid_grenade.wav",
}
})

sound.Add({
    name = "droid_medic",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"droidnoises/droid_medic.wav",
}
})

sound.Add({
    name = "droid_noise",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"droidnoises/droid_noise1.wav",
    "droidnoises/droid_noise2.wav",
    "droidnoises/droid_noise3.wav",
    "droidnoises/droid_noise4.wav",
    "droidnoises/droid_noise5.wav",

}
})

sound.Add({
    name = "mouse_noise",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"droidnoises/mouse1.wav",
    "droidnoises/mouse2.wav",
    "droidnoises/mouse3.wav",
}
})

sound.Add({
    name = "commander_breach",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/breach1.wav",
    "vo_clonetropper/commander/breach2.wav",
}
})

sound.Add({
    name = "commander_forward",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/forward1.wav",
    "vo_clonetropper/commander/forward2.wav",
    "vo_clonetropper/commander/forward3.wav",
    "vo_clonetropper/commander/forward4.wav",
}
})

sound.Add({
    name = "commander_follow",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/follow1.wav",
    "vo_clonetropper/commander/follow2.wav",
    "vo_clonetropper/commander/follow3.wav",
    "vo_clonetropper/commander/follow4.wav",
}
})

sound.Add({
    name = "commander_flank",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/flank1.wav",
    "vo_clonetropper/commander/forward4.wav",
}
})

sound.Add({
    name = "commander_hold",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/hold1.wav",
    "vo_clonetropper/commander/hold2.wav",
    "vo_clonetropper/commander/hold3.wav",
    "vo_clonetropper/commander/hold4.wav",
    "vo_clonetropper/commander/hold5.wav",
}
})

sound.Add({
    name = "commander_secure",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/secure1.wav",
    "vo_clonetropper/commander/hold1.wav",
    "vo_clonetropper/commander/hold4.wav",
}
})

sound.Add({
    name = "commander_eliminate",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/eliminate1.wav",
    "vo_clonetropper/commander/eliminate2.wav",
    "vo_clonetropper/commander/eliminate3.wav",
    "vo_clonetropper/commander/eliminate4.wav",
    "vo_clonetropper/commander/eliminate5.wav",
}
})

sound.Add({
    name = "commander_helpme",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/helpme1.wav",
    "vo_clonetropper/commander/helpme2.wav",
    "vo_clonetropper/commander/helpme3.wav",
    "vo_clonetropper/commander/helpme4.wav",
    "vo_clonetropper/commander/helpme5.wav",
    "vo_clonetropper/commander/helpme6.wav",
}
})

sound.Add({
    name = "commander_retreat",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/retreat1.wav",
    "vo_clonetropper/commander/retreat2.wav",
    "vo_clonetropper/commander/retreat3.wav",
}
})

// clone
resource.AddFile("sound/vo_clonetropper/clone_medic.wav")
resource.AddFile("sound/vo_clonetropper/clone_incoming.wav")
resource.AddFile("sound/vo_clonetropper/clone_forward.wav")
// droid
resource.AddFile("sound/droidnoises/droid_medic.wav")
resource.AddFile("sound/droidnoises/droid_grenade.wav")
resource.AddFile("sound/droidnoises/droid_noise1.wav")
resource.AddFile("sound/droidnoises/droid_noise2.wav")
resource.AddFile("sound/droidnoises/droid_noise3.wav")
resource.AddFile("sound/droidnoises/droid_noise4.wav")
resource.AddFile("sound/droidnoises/droid_noise5.wav")
resource.AddFile("sound/droidnoises/mouse1.wav")
resource.AddFile("sound/droidnoises/mouse2.wav")
resource.AddFile("sound/droidnoises/mouse3.wav")
// commander
resource.AddFile("sound/vo_clonetropper/commander/breach1.wav")
resource.AddFile("sound/vo_clonetropper/commander/breach2.wav")

resource.AddFile("sound/vo_clonetropper/commander/eliminate1.wav")
resource.AddFile("sound/vo_clonetropper/commander/eliminate2.wav")
resource.AddFile("sound/vo_clonetropper/commander/eliminate3.wav")
resource.AddFile("sound/vo_clonetropper/commander/eliminate4.wav")
resource.AddFile("sound/vo_clonetropper/commander/eliminate5.wav")

resource.AddFile("sound/vo_clonetropper/commander/flank1.wav")

resource.AddFile("sound/vo_clonetropper/commander/follow1.wav")
resource.AddFile("sound/vo_clonetropper/commander/follow2.wav")
resource.AddFile("sound/vo_clonetropper/commander/follow3.wav")
resource.AddFile("sound/vo_clonetropper/commander/follow4.wav")

resource.AddFile("sound/vo_clonetropper/commander/forward1.wav")
resource.AddFile("sound/vo_clonetropper/commander/forward2.wav")
resource.AddFile("sound/vo_clonetropper/commander/forward3.wav")
resource.AddFile("sound/vo_clonetropper/commander/forward4.wav")

resource.AddFile("sound/vo_clonetropper/commander/helpme1.wav")
resource.AddFile("sound/vo_clonetropper/commander/helpme2.wav")
resource.AddFile("sound/vo_clonetropper/commander/helpme3.wav")
resource.AddFile("sound/vo_clonetropper/commander/helpme4.wav")
resource.AddFile("sound/vo_clonetropper/commander/helpme5.wav")
resource.AddFile("sound/vo_clonetropper/commander/helpme6.wav")

resource.AddFile("sound/vo_clonetropper/commander/hold1.wav")
resource.AddFile("sound/vo_clonetropper/commander/hold2.wav")
resource.AddFile("sound/vo_clonetropper/commander/hold3.wav")
resource.AddFile("sound/vo_clonetropper/commander/hold4.wav")
resource.AddFile("sound/vo_clonetropper/commander/hold5.wav")

resource.AddFile("sound/vo_clonetropper/commander/retreat1.wav")
resource.AddFile("sound/vo_clonetropper/commander/retreat2.wav")
resource.AddFile("sound/vo_clonetropper/commander/retreat3.wav")

resource.AddFile("sound/vo_clonetropper/commander/secure1.wav")


ix.util.Include("cl_plugin.lua", "client")