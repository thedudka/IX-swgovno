local PLUGIN = PLUGIN

PLUGIN.name = "VO list"
PLUGIN.author = ""
PLUGIN.description = "VO list."

sound.Add({
    name = "merc_medic",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"mercnoises/medic01.wav",
    "mercnoises/medic02.wav",
}
})

sound.Add({
    name = "merc_grenade",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"mercnoises/grenade01.wav",
    "mercnoises/grenade02.wav",
}
})

sound.Add({
    name = "merc_forward",
    channel = CHAN_VOICE,
    volume = 1,
    level = 75,
    pitch = 100,
    sound = {"mercnoises/forward01.wav",
    "mercnoises/attack01.wav",
    "mercnoises/attack02.wav",
    "mercnoises/attack03.wav",
}
})

sound.Add({
    name = "merc_ramble",
    channel = CHAN_VOICE,
    volume = 1,
    level = 75,
    pitch = 100,
    sound = {"mercnoises/ramble01.wav",
"mercnoises/ramble02.wav",
"mercnoises/ramble03.wav",
"mercnoises/ramble04.wav",
"mercnoises/ramble05.wav",
"mercnoises/ramble06.wav",
}
})

sound.Add({
    name = "merc_incoming",
    channel = CHAN_VOICE,
    volume = 1,
    level = 75,
    pitch = 100,
    sound = {"mercnoises/contact01.wav",
    "mercnoises/attack02.wav",
    "mercnoises/grenade02.wav",
}
})

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
    name = "Clone_ff",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire1.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire2.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire3.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire5.mp3",
}
})

sound.Add({
    name = "Clone_enemydown",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy14.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy7.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy9.mp3",
}
})

sound.Add({
    name = "Clone_flank",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vj_sw_clone_wars_era/snpcs/clonetrooper/combat18.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat2.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat3.mp3",
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat4.mp3",
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
    "vo_clonetropper/negative01.wav",
    "vo_clonetropper/negative02.wav"
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
    "vj_sw_clone_wars_era/snpcs/clonetrooper/combat14.mp3",
}
})

sound.Add({
    name = "Clone_retreat",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vo_clonetropper/retreat01.wav",
    "vo_clonetropper/retreat02.wav",
}
})

sound.Add({
    name = "Clone_pile",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vo_clonetropper/paleup01.wav",
    "vo_clonetropper/paleup02.wav",
}
})

sound.Add({
    name = "Clone_spread",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vo_clonetropper/spread01.wav",
    "vo_clonetropper/spread02.wav",
}
})

sound.Add({
    name = "Clone_hold",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vo_clonetropper/hold01.wav",
    "vo_clonetropper/hold02.wav",
    "vo_clonetropper/hold03.wav",
}
})

sound.Add({
    name = "Clone_yes",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vo_clonetropper/yes01.wav",
    "vo_clonetropper/yes02.wav",
    "vo_clonetropper/yes03.wav",
    "vo_clonetropper/yes04.wav",
}
})

sound.Add({
    name = "Clone_no",
    channel = CHAN_VOICE,
    volume = 0.8,
    level = 70,
    pitch = 100,
    sound = {"vo_clonetropper/no01.wav",
    "vo_clonetropper/no02.wav",
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

sound.Add({
    name = "commander_medic",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/medic1.wav",
    "vo_clonetropper/commander/medic2.wav",
    "vo_clonetropper/commander/medic3.wav",
    "vo_clonetropper/commander/medic4.wav",
}
})

sound.Add({
    name = "commander_healup",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/healup1.wav",
    "vo_clonetropper/commander/healup2.wav",
    "vo_clonetropper/commander/healup3.wav",
    "vo_clonetropper/commander/healup4.wav",
    "vo_clonetropper/commander/healup5.wav",
    "vo_clonetropper/commander/healup6.wav",
}
})

sound.Add({
    name = "commander_revive",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/revive1.wav",
    "vo_clonetropper/commander/revive2.wav",
    "vo_clonetropper/commander/revive3.wav",
    "vo_clonetropper/commander/revive4.wav",
    "vo_clonetropper/commander/revive5.wav",
    "vo_clonetropper/commander/revive6.wav",
}
})

sound.Add({
    name = "commander_report",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/report1.wav",
    "vo_clonetropper/commander/report2.wav",
    "vo_clonetropper/commander/report3.wav",
    "vo_clonetropper/commander/report4.wav",
    "vo_clonetropper/commander/report5.wav",
}
})

sound.Add({
    name = "commander_enter",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/enter1.wav",
    "vo_clonetropper/commander/enter2.wav",
    "vo_clonetropper/commander/enter3.wav",
    "vo_clonetropper/commander/enter4.wav",
    "vo_clonetropper/commander/enter5.wav",
    "vo_clonetropper/commander/enter6.wav",
}
})

sound.Add({
    name = "commander_positive",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/positive1.wav",
    "vo_clonetropper/commander/positive2.wav",
    "vo_clonetropper/commander/positive3.wav",
    "vo_clonetropper/commander/positive4.wav",
    "vo_clonetropper/commander/positive5.wav",
}
})

sound.Add({
    name = "commander_negative",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/negative1.wav",
    "vo_clonetropper/commander/negative2.wav",
    "vo_clonetropper/commander/negative3.wav",
    "vo_clonetropper/commander/negative4.wav",
    "vo_clonetropper/commander/negative5.wav",
    "vo_clonetropper/commander/negative6.wav",
    "vo_clonetropper/commander/negative7.wav",
}
})

sound.Add({
    name = "commander_yes",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/yes1.wav",
    "vo_clonetropper/commander/yes2.wav",
    "vo_clonetropper/commander/yes3.wav",
    "vo_clonetropper/commander/yes4.wav",

}
})

sound.Add({
    name = "commander_no",
    channel = CHAN_VOICE,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = {"vo_clonetropper/commander/no1.wav",
    "vo_clonetropper/commander/no2.wav",
}
})


resource.AddFile("sound/vo_clonetropper/clone_medic.wav")
resource.AddFile("sound/vo_clonetropper/clone_incoming.wav")
resource.AddFile("sound/vo_clonetropper/clone_forward.wav")

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


resource.AddFile("sound/mercnoises/attack01.wav")
resource.AddFile("sound/mercnoises/attack02.wav")
resource.AddFile("sound/mercnoises/attack03.wav")

resource.AddFile("sound/mercnoises/ramble01.wav")
resource.AddFile("sound/mercnoises/ramble02.wav")
resource.AddFile("sound/mercnoises/ramble03.wav")
resource.AddFile("sound/mercnoises/ramble04.wav")
resource.AddFile("sound/mercnoises/ramble05.wav")
resource.AddFile("sound/mercnoises/ramble06.wav")

resource.AddFile("sound/mercnoises/medic01.wav")
resource.AddFile("sound/mercnoises/medic02.wav")
resource.AddFile("sound/mercnoises/grenade01.wav")
resource.AddFile("sound/mercnoises/grenade02.wav")

resource.AddFile("sound/mercnoises/forward01.wav")
resource.AddFile("sound/mercnoises/contact01.wav")

resource.AddFile("sound/vo_clonetropper/commander/secure1.wav")

resource.AddFile("sound/vo_clonetropper/negative01.wav")
resource.AddFile("sound/vo_clonetropper/negative02.wav")

resource.AddFile("sound/vo_clonetropper/no01.wav")
resource.AddFile("sound/vo_clonetropper/no02.wav")
resource.AddFile("sound/vo_clonetropper/yes01.wav")
resource.AddFile("sound/vo_clonetropper/yes02.wav")
resource.AddFile("sound/vo_clonetropper/yes03.wav")
resource.AddFile("sound/vo_clonetropper/yes04.wav")

resource.AddFile("sound/vo_clonetropper/spread01.wav")
resource.AddFile("sound/vo_clonetropper/spread02.wav")
resource.AddFile("sound/vo_clonetropper/paleup01.wav")
resource.AddFile("sound/vo_clonetropper/paleup02.wav")
resource.AddFile("sound/vo_clonetropper/hold01.wav")
resource.AddFile("sound/vo_clonetropper/hold02.wav")
resource.AddFile("sound/vo_clonetropper/hold03.wav")
resource.AddFile("sound/vo_clonetropper/retreat01.wav")
resource.AddFile("sound/vo_clonetropper/retreat02.wav")

resource.AddFile("sound/vo_clonetropper/commander/enter1.wav")
resource.AddFile("sound/vo_clonetropper/commander/enter2.wav")
resource.AddFile("sound/vo_clonetropper/commander/enter3.wav")
resource.AddFile("sound/vo_clonetropper/commander/enter4.wav")
resource.AddFile("sound/vo_clonetropper/commander/enter5.wav")
resource.AddFile("sound/vo_clonetropper/commander/enter6.wav")

resource.AddFile("sound/vo_clonetropper/commander/healup1.wav")
resource.AddFile("sound/vo_clonetropper/commander/healup2.wav")
resource.AddFile("sound/vo_clonetropper/commander/healup3.wav")
resource.AddFile("sound/vo_clonetropper/commander/healup4.wav")
resource.AddFile("sound/vo_clonetropper/commander/healup5.wav")
resource.AddFile("sound/vo_clonetropper/commander/healup6.wav")

resource.AddFile("sound/vo_clonetropper/commander/medic1.wav")
resource.AddFile("sound/vo_clonetropper/commander/medic2.wav")
resource.AddFile("sound/vo_clonetropper/commander/medic3.wav")
resource.AddFile("sound/vo_clonetropper/commander/medic4.wav")

resource.AddFile("sound/vo_clonetropper/commander/negative1.wav")
resource.AddFile("sound/vo_clonetropper/commander/negative2.wav")
resource.AddFile("sound/vo_clonetropper/commander/negative3.wav")
resource.AddFile("sound/vo_clonetropper/commander/negative4.wav")
resource.AddFile("sound/vo_clonetropper/commander/negative5.wav")
resource.AddFile("sound/vo_clonetropper/commander/negative6.wav")
resource.AddFile("sound/vo_clonetropper/commander/negative7.wav")

resource.AddFile("sound/vo_clonetropper/commander/positive1.wav")
resource.AddFile("sound/vo_clonetropper/commander/positive2.wav")
resource.AddFile("sound/vo_clonetropper/commander/positive3.wav")
resource.AddFile("sound/vo_clonetropper/commander/positive4.wav")
resource.AddFile("sound/vo_clonetropper/commander/positive5.wav")

resource.AddFile("sound/vo_clonetropper/commander/report1.wav")
resource.AddFile("sound/vo_clonetropper/commander/report2.wav")
resource.AddFile("sound/vo_clonetropper/commander/report3.wav")
resource.AddFile("sound/vo_clonetropper/commander/report4.wav")
resource.AddFile("sound/vo_clonetropper/commander/report5.wav")

resource.AddFile("sound/vo_clonetropper/commander/revive1.wav")
resource.AddFile("sound/vo_clonetropper/commander/revive2.wav")
resource.AddFile("sound/vo_clonetropper/commander/revive3.wav")
resource.AddFile("sound/vo_clonetropper/commander/revive4.wav")
resource.AddFile("sound/vo_clonetropper/commander/revive5.wav")
resource.AddFile("sound/vo_clonetropper/commander/revive6.wav")

resource.AddFile("sound/vo_clonetropper/commander/no1.wav")
resource.AddFile("sound/vo_clonetropper/commander/no2.wav")
resource.AddFile("sound/vo_clonetropper/commander/yes1.wav")
resource.AddFile("sound/vo_clonetropper/commander/yes2.wav")
resource.AddFile("sound/vo_clonetropper/commander/yes3.wav")
resource.AddFile("sound/vo_clonetropper/commander/yes4.wav")


