local PLUGIN = PLUGIN

PLUGIN.name = "Faction Based Sounds"
PLUGIN.author = "dudka"
PLUGIN.description = "Playing based on faction hurt and death sounds."

// сюда добавлять звуки

PLUGIN.soundSets = {
    [FACTION_CLONE] = {
        hurt = {"Clonetropper_hurt"},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {"Clonetropper_death"},
        burnDeath = {"Clonetropper_death"}
    },

     [FACTION_JEDI] = {
        hurt = {"hurt_default"},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {"death_default"},
        burnDeath = {"death_default"}
    },
}

sound.Add({
    name = "Clonetropper_death",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"hurtdeath_clonetropper/clone_death01.wav",
    "hurtdeath_clonetropper/clone_death02.wav",
    "hurtdeath_clonetropper/clone_death03.wav"
}
})

sound.Add({
    name = "Clonetropper_hurt",
    channel = CHAN_VOICE,
    volume = 0.9,
    level = 75,
    pitch = {95, 105},
    sound = {"hurtdeath_clonetropper/clone_hurt01.wav",
    "hurtdeath_clonetropper/clone_hurt02.wav",
    "hurtdeath_clonetropper/clone_hurt03.wav"
}
})

sound.Add({
    name = "hurt_drown",
    channel = CHAN_VOICE,
    volume = 0.9,
    level = 75,
    pitch = {95, 105},
    sound = {"player/pl_drown1.wav",
    "player/pl_drown2.wav",
    "player/pl_drown3.wav"
}
})

sound.Add({
    name = "hurt_burn",
    channel = CHAN_VOICE,
    volume = 0.9,
    level = 75,
    pitch = {95, 105},
    sound = {"player/pl_burnpain1.wav",
    "player/pl_burnpain2.wav",
    "player/pl_burnpain3.wav"
}
})

sound.Add({
    name = "hurt_default",
    channel = CHAN_VOICE,
    volume = 0.9,
    level = 75,
    pitch = {95, 105},
    sound = {"vo/npc/barney/ba_pain01.wav",
    "vo/npc/barney/ba_pain02.wav",
    "vo/npc/barney/ba_pain03.wav"
}
})

sound.Add({
    name = "death_default",
    channel = CHAN_VOICE,
    volume = 0.9,
    level = 75,
    pitch = {95, 105},
    sound = {"vo/npc/barney/ba_pain08.wav",
}
})

resource.AddFile("sound/hurtdeath_clonetropper/clone_death01.wav")
resource.AddFile("sound/hurtdeath_clonetropper/clone_death02.wav")
resource.AddFile("sound/hurtdeath_clonetropper/clone_death03.wav")

resource.AddFile("sound/hurtdeath_clonetropper/clone_hurt01.wav")
resource.AddFile("sound/hurtdeath_clonetropper/clone_hurt02.wav")
resource.AddFile("sound/hurtdeath_clonetropper/clone_hurt03.wav")

ix.util.Include("sv_plugin.lua")