local PLUGIN = PLUGIN

PLUGIN.name = "Custom footsteps"
PLUGIN.author = "dudka"
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



hook.Add("PlayerFootstep", "SurfaceCustomFootsteps", function(ply, pos, foot, sound, volume, rf)
    local tr = util.TraceLine({
        start = pos,
        endpos = pos - Vector(0, 0, 10),
        filter = ply
    })
    local char = ply:GetCharacter()
     if not char then return end
    local faction = char:GetFaction()

    if char:IsClone() then
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

    if char:IsDroid() then
        
        local customSound
        if tr.Hit then
            customSound = surfaceSoundsRobot[tr.MatType]
        end

        if customSound then
            ply:EmitSound(customSound, volume, 100, 1.0, CHAN_BODY)
        end
        return true
    
    end

        if char:IsForceUser() or char:IsEventFaction() then
        
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
