local PLUGIN = PLUGIN

PLUGIN.name = "Custom footsteps"
PLUGIN.author = "dudka"
PLUGIN.description = "Adding footstep custom sound based on faction and surface types."

local surfaceSoundsClone = {
    [MAT_CONCRETE] = "Clonetropper_footstep_conc",
    [MAT_METAL]    = "Clonetropper_footstep_metal2",
    [MAT_WOOD]     = "Clonetropper_footstep_wood",
    [MAT_GRATE]    = "Clonetropper_footstep_metalgrate",
    [MAT_GLASS]    = "Clonetropper_footstep_glass",
    [MAT_SNOW]     = "footstep_snow",
    [MAT_PLASTIC]  = "Clonetropper_footstep_conc",
    [MAT_DIRT]     = "Clonetropper_footstep_dirt",
    [MAT_TILE]     = "Clonetropper_footstep_conc",
    [MAT_VENT]     = "Clonetropper_footstep_vent",
    [MAT_SLOSH]    = "Clonetropper_footstep_water", 
    [MAT_SAND]     = "Clonetropper_footstep_sand",
    [MAT_GRASS]    = "Clonetropper_footstep_grass",
    [MAT_DEFAULT]  = "clonefootsteps_example"
}

local gearSounds = {
    "footsteps_clonetropper/gear_run01.wav",
    "footsteps_clonetropper/gear_run02.wav",
    "footsteps_clonetropper/gear_run03.wav",
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

    if faction == FACTION_CLONE then
    ply:EmitSound(gearSounds[math.random(#gearSounds)], volume * 0.4, 75, 0.2, CHAN_ITEM)

        local customSound
        if tr.Hit then
            customSound = surfaceSoundsClone[tr.MatType]
        end

        if customSound then
            ply:EmitSound(customSound, volume, 100, 1.0, CHAN_BODY)
        end
        return true
    
    end

    if faction == FACTION_JEDI then
        
        local customSound
        if tr.Hit then
            customSound = surfaceSoundsClone[tr.MatType]
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
    if faction1 == FACTION_JEDI or faction1 == FACTION_CLONE then return end

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
