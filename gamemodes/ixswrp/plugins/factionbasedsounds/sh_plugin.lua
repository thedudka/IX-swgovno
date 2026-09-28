local PLUGIN = PLUGIN

PLUGIN.name = "Faction Based Sounds"
PLUGIN.author = ""
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
    
    [FACTION_SITH] = {
        hurt = {""},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {""},
        burnDeath = {""}
    },
    [FACTION_CIS] = {
        hurt = {""},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {""},
        burnDeath = {""}
    },
    [FACTION_REPUBLIC] = {
        hurt = {""},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {""},
        burnDeath = {""}
    },
    [FACTION_JEDI] = {
        hurt = {""},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {""},
        burnDeath = {""}
    },

    [FACTION_DROID] = {
        hurt = {"Droid_hurt"},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {"Droid_death"},
        burnDeath = {"Droid_death"}
    },
    [FACTION_ROBOT] = {
        hurt = {"Robot_hurt"},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {"Robot_death"},
        burnDeath = {""}
    },
    [FACTION_FAUNA] = {
        hurt = {""},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {""},
        burnDeath = {""}
    },
    [FACTION_MERC] = {
        hurt = {"merc_hurt"},
        burn = {"hurt_burn"},
        drown = {"hurt_drown"},
        death = {"merc_death"},
        burnDeath = {"merc_death"}
    },
}

sound.Add({
    name = "merc_hurt",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = {95, 105},
    sound = {"hurtdeath_merc/merc_hurt01.wav",
    "hurtdeath_merc/merc_hurt02.wav",
    "hurtdeath_merc/merc_hurt03.wav",
    "hurtdeath_merc/merc_hurt04.wav",
    "hurtdeath_merc/merc_hurt05.wav",
    "hurtdeath_merc/merc_hurt06.wav",
}
})

sound.Add({
    name = "merc_death",
    channel = CHAN_VOICE,
    volume = 1.1,
    level = 85,
    pitch = 100,
    sound = {"hurtdeath_merc/merc_death01.wav",
    "hurtdeath_merc/merc_hurt06.wav",
}
})

sound.Add({
    name = "Robot_hurt",
    channel = CHAN_VOICE,
    volume = 0.9,
    level = 75,
    pitch = {95, 105},
    sound = {"hurtdeath_robot/robot_hurt1.wav",
    "hurtdeath_robot/robot_hurt2.wav",
    "hurtdeath_robot/robot_hurt3.wav",
    "hurtdeath_robot/robot_hurt4.wav",
}
})

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
    name = "Robot_death",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"hurtdeath_robot/robot_death1.wav",
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
    name = "Droid_death",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = {95, 105},
    sound = {"hurtdeath_droid/droiddeath_01.wav",
    "hurtdeath_droid/droiddeath_02.wav",
    "hurtdeath_droid/droiddeath_03.wav"
}
})

sound.Add({
    name = "Droid_hurt",
    channel = CHAN_VOICE,
    volume = 0.9,
    level = 75,
    pitch = {95, 105},
    sound = {"hurtdeath_droid/droidhurt_01.wav",
    "hurtdeath_droid/droidhurt_02.wav",
    "hurtdeath_droid/droidhurt_03.wav",
    "hurtdeath_droid/droidhurt_04.wav",
    "hurtdeath_droid/droidhurt_05.wav",
    "hurtdeath_droid/droidhurt_06.wav"
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

ix.util.Include("sv_plugin.lua")