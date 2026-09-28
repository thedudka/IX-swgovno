local PLUGIN = PLUGIN

PLUGIN.name = "Custom footsteps"
PLUGIN.author = ""
PLUGIN.description = "Adding footstep custom sound based on faction and surface types."

local surfaceSoundsDefault = {
    [MAT_CONCRETE] = "Standard_footstep_conc",
    [MAT_METAL]    = "Standard_footstep_metal2",
    [MAT_WOOD]     = "Standard_footstep_wood",
    [MAT_GRATE]    = "Standard_footstep_metalgrate",
    [MAT_GLASS]    = "Standard_footstep_glass",
    [MAT_SNOW]     = "footstep_snow",
    [MAT_PLASTIC]  = "Standard_footstep_conc",
    [MAT_DIRT]     = "Standard_footstep_dirt",
    [MAT_TILE]     = "Standard_footstep_conc",
    [MAT_VENT]     = "Standard_footstep_vent",
    [MAT_SLOSH]    = "Standard_footstep_water", 
    [MAT_SAND]     = "Standard_footstep_sand",
    [MAT_GRASS]    = "Standard_footstep_grass",
    [MAT_DEFAULT]  = "clonefootsteps_example"
}

local surfaceSoundsRobot = {
    [MAT_CONCRETE] = "Droid_footstep_conc",
    [MAT_METAL]    = "Droid_footstep_metal",
    [MAT_WOOD]     = "Droid_footstep_wood",
    [MAT_GRATE]    = "Droid_footstep_metal",
    [MAT_GLASS]    = "Droid_footstep_conc",
    [MAT_SNOW]     = "footstep_snow",
    [MAT_PLASTIC]  = "Droid_footstep_conc",
    [MAT_DIRT]     = "Droid_footstep_grass",
    [MAT_TILE]     = "Droid_footstep_conc",
    [MAT_VENT]     = "Droid_footstep_metal",
    [MAT_SLOSH]    = "Standard_footstep_water", 
    [MAT_SAND]     = "Droid_footstep_sand",
    [MAT_GRASS]    = "Droid_footstep_grass",
    [MAT_DEFAULT]  = "clonefootsteps_example"
}

local surfaceSoundsFauna = {
    [MAT_CONCRETE] = "fauna_footstep",
    [MAT_METAL]    = "fauna_footstep",
    [MAT_WOOD]     = "fauna_footstep",
    [MAT_GRATE]    = "fauna_footstep",
    [MAT_GLASS]    = "fauna_footstep",
    [MAT_SNOW]     = "footstep_snow",
    [MAT_PLASTIC]  = "fauna_footstep",
    [MAT_DIRT]     = "fauna_footstep",
    [MAT_TILE]     = "fauna_footstep",
    [MAT_VENT]     = "fauna_footstep",
    [MAT_SLOSH]    = "fauna_footstep", 
    [MAT_SAND]     = "fauna_footstep",
    [MAT_GRASS]    = "fauna_footstep",
    [MAT_DEFAULT]  = "clonefootsteps_example"
}

local gearSounds = {
    "footsteps_clonetropper/gear_run01.wav",
    "footsteps_clonetropper/gear_run02.wav",
    "footsteps_clonetropper/gear_run03.wav",
}

local gearSoundsRobot = {"footsteps_robot/robot_step1.wav",
"footsteps_robot/robot_step2.wav",
"footsteps_robot/robot_step3.wav",
"footsteps_robot/robot_step4.wav",
"footsteps_robot/robot_step5.wav",
"footsteps_robot/robot_step6.wav",
}



hook.Add("PlayerFootstep", "SurfaceCustomFootsteps", function(ply, pos, foot, sound, volume, rf)
    local tr = util.TraceLine({
        start = pos,
        endpos = pos - Vector(0, 0, 10),
        filter = ply
    })
    local char = ply:GetCharacter()
     if not char then return end
    local faction = char:GetFaction()

    if (char:IsClone() or char:IsCommando()) then
    ply:EmitSound(gearSounds[math.random(#gearSounds)], volume * 0.4, 75, 0.2, CHAN_ITEM)

        local customSound
        if tr.Hit then
            customSound = surfaceSoundsDefault[tr.MatType]
        end

        if customSound then
            ply:EmitSound(customSound, volume, 100, 1.0, CHAN_BODY)
        end
        return true
    
    end

    if faction == FACTION_ROBOT then
    ply:EmitSound(gearSoundsRobot[math.random(#gearSoundsRobot)], volume * 0.4, 75, 0.2, CHAN_ITEM)

        local customSound
        if tr.Hit then
            customSound = surfaceSoundsRobot[tr.MatType]
        end

        if customSound then
            ply:EmitSound(customSound, volume, 100, 1.0, CHAN_BODY)
        end
        return true
    
    end

    if faction == FACTION_DROID then
        
        local customSound
        if tr.Hit then
            customSound = surfaceSoundsRobot[tr.MatType]
        end

        if customSound then
            ply:EmitSound(customSound, volume, 100, 1.0, CHAN_BODY)
        end
        return true
    
    end

        if ply:IsTrueForceUser() or faction == FACTION_REPUBLIC or faction == FACTION_CIS then
        
        local customSound
        if tr.Hit then
            customSound = surfaceSoundsDefault[tr.MatType]
        end

        if customSound then
            ply:EmitSound(customSound, volume, 100, 1.0, CHAN_BODY)
        end
        return true
    
    end

        if faction == FACTION_FAUNA then
        
        local customSound
        if tr.Hit then
            customSound = surfaceSoundsFauna[tr.MatType]
        end

        if customSound then
            ply:EmitSound(customSound, volume, 100, 1.0, CHAN_BODY)
        end
        return true
    
    end
    
    
end)

local nextSound = {}

hook.Add("PlayerPostThink", "CheckLadderSound", function(ply)
    if not IsValid(ply) or not ply:Alive() then return end

    local charl = ply:GetCharacter()
     if not charl then return end
    local factionl = charl:GetFaction()
    if faction1 == FACTION_JEDI or faction1 == FACTION_CLONE or faction1 == FACTION_COMMANDO or faction1 == FACTION_SITH then return end

    if ply:GetMoveType() == MOVETYPE_LADDER then
        local vel = ply:GetVelocity():Length()
        
        if vel > 20 then
            local time = CurTime()
            nextSound[ply] = nextSound[ply] or 0
            
            if nextSound[ply] < time then
                ply:EmitSound("footstep_ladder")
                nextSound[ply] = time + 0.5 
            end
        end
    end
end)

sound.Add({
    name = "clonefootsteps_example",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 80,
    pitch = {85, 130},
    sound = {"npc/footsteps/hardboot_generic1.wav", 
	"npc/footsteps/hardboot_generic2.wav", 
	"npc/footsteps/hardboot_generic3.wav", 
	"npc/footsteps/hardboot_generic4.wav", 
	"npc/footsteps/hardboot_generic5.wav", 
	"npc/footsteps/hardboot_generic6.wav"}
})

sound.Add({
    name = "robot_footstep_gear",
    channel = CHAN_BODY,
    volume = 0.4,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_robot/robot_step1.wav",
"footsteps_robot/robot_step2.wav",
"footsteps_robot/robot_step3.wav",
"footsteps_robot/robot_step4.wav",
"footsteps_robot/robot_step5.wav",
"footsteps_robot/robot_step6.wav",
}
})

sound.Add({
    name = "fauna_footstep",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 80,
    pitch = {85, 130},
    sound = {"npc/antlion/foot1.wav", 
	"npc/antlion/foot2.wav", 
	"npc/antlion/foot3.wav", 
	"npc/antlion/foot4.wav", }
})

sound.Add({
    name = "Standard_footstep_wood",
    channel = CHAN_BODY,
    volume = 0.4,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_wood01.wav",
    "footsteps_clonetropper/footstep_wood02.wav",
    "footsteps_clonetropper/footstep_wood03.wav",}
})

sound.Add({
    name = "Standard_footstep_conc",
    channel = CHAN_BODY,
    volume = 0.4,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_conc01.wav",
    "footsteps_clonetropper/footstep_conc02.wav",
    "footsteps_clonetropper/footstep_conc03.wav",
    "footsteps_clonetropper/footstep_conc04.wav",
    "footsteps_clonetropper/footstep_conc05.wav",
    "footsteps_clonetropper/footstep_conc06.wav",}
})

sound.Add({
    name = "Standard_footstep_metalgrate",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_metalgrate01.wav",
    "footsteps_clonetropper/footstep_metalgrate02.wav",
    "footsteps_clonetropper/footstep_metalgrate03.wav",}
})

sound.Add({
    name = "Clonetropper_gearrun",
    channel = CHAN_BODY,
    volume = 1,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/gear_run01.wav",
    "footsteps_clonetropper/gear_run02.wav",
    "footsteps_clonetropper/gear_run03.wav",}
})

sound.Add({
    name = "Standard_footstep_metal",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_metal01.wav",
    "footsteps_clonetropper/footstep_metal02.wav",
    "footsteps_clonetropper/footstep_metal03.wav",
}
})

sound.Add({
    name = "footstep_snow",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"player/footsteps/snow1.wav",
    "player/footsteps/snow2.wav",
    "player/footsteps/snow3.wav",
    "player/footsteps/snow4.wav",
}
})

sound.Add({
    name = "footstep_ladder",
    channel = CHAN_BODY,
    volume = 0.6,
    level = 70,
    pitch = 100,
    sound = {"player/footsteps/ladder1.wav",
    "player/footsteps/ladder2.wav",
    "player/footsteps/ladder3.wav",
    "player/footsteps/ladder4.wav",
}
})

sound.Add({
    name = "Standard_footstep_metal2",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_metal2_01.wav",
    "footsteps_clonetropper/footstep_metal2_02.wav",
    "footsteps_clonetropper/footstep_metal2_03.wav",
}
})

sound.Add({
    name = "Standard_footstep_sand",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_sand01.wav",
    "footsteps_clonetropper/footstep_sand02.wav",
    "footsteps_clonetropper/footstep_sand03.wav",
}
})

sound.Add({
    name = "Standard_footstep_dirt",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_dirt01.wav",
    "footsteps_clonetropper/footstep_dirt02.wav",
    "footsteps_clonetropper/footstep_dirt03.wav",
}
})

sound.Add({
    name = "Standard_footstep_grass",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_grass01.wav",
    "footsteps_clonetropper/footstep_grass02.wav",
    "footsteps_clonetropper/footstep_grass03.wav",
}
})

sound.Add({
    name = "Standard_footstep_glass",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_glass01.wav",
    "footsteps_clonetropper/footstep_glass02.wav",
    "footsteps_clonetropper/footstep_glass03.wav",
}
})

sound.Add({
    name = "Standard_footstep_water",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_water01.wav",
    "footsteps_clonetropper/footstep_water02.wav",
    "footsteps_clonetropper/footstep_water03.wav",
}
})

sound.Add({
    name = "Standard_footstep_vent",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_clonetropper/footstep_vent01.wav",
    "footsteps_clonetropper/footstep_vent02.wav",
    "footsteps_clonetropper/footstep_vent03.wav",
}
})

sound.Add({
    name = "Droid_footstep_conc",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_droid/droid_footsteps_conc1.wav",
    "footsteps_droid/droid_footsteps_conc2.wav",
    "footsteps_droid/droid_footsteps_conc3.wav",
    "footsteps_droid/droid_footsteps_conc4.wav",
    "footsteps_droid/droid_footsteps_conc5.wav",
}
})

sound.Add({
    name = "Droid_footstep_metal",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_droid/droid_footsteps_metal1.wav",
    "footsteps_droid/droid_footsteps_metal2.wav",
    "footsteps_droid/droid_footsteps_metal3.wav",
    "footsteps_droid/droid_footsteps_metal4.wav",
    "footsteps_droid/droid_footsteps_metal5.wav",
}
})

sound.Add({
    name = "Droid_footstep_sand",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_droid/droid_footsteps_sand1.wav",
    "footsteps_droid/droid_footsteps_sand2.wav",
    "footsteps_droid/droid_footsteps_sand3.wav",
}
})

sound.Add({
    name = "Droid_footstep_grass",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_droid/droid_footsteps_grass1.wav",
    "footsteps_droid/droid_footsteps_grass2.wav",
    "footsteps_droid/droid_footsteps_grass3.wav",
    "footsteps_droid/droid_footsteps_grass4.wav",
    "footsteps_droid/droid_footsteps_grass5.wav",
}
})

sound.Add({
    name = "Droid_footstep_wood",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 70,
    pitch = {85, 130},
    sound = {"footsteps_droid/droid_footsteps_wood1.wav",
    "footsteps_droid/droid_footsteps_wood2.wav",
}
})