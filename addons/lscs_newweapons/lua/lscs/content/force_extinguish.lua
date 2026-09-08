local force = {}
force.PrintName = "Extinguish"
force.Author = "Midnight"
force.Description = "Extinguishes a burning target using the Force."
force.id = "extinguish" -- lowercase only
--force.Spawnable = false  -- uncomment to unlist in q-menu

force.StartUse = function(ply)
    if ply:lscsGetForce() < 20 then return end -- Check if the player has enough Force points (30 in this case)

    local target = FindTargetInView(ply, 200) -- We set a view range of 200 units

    if not IsValid(target) or (not target:IsPlayer() and not target:IsNPC()) or not target:IsOnFire() then return end -- Exit if no valid target or the target isn't burning

    ply:lscsTakeForce(20) -- Deduct Force points required to use the power

    --ply:EmitSound("vehicles/Airboat/pontoon_fast_water_loop1.wav") -- Play extinguishing sound

    LSCS:PlayVCDSequence(ply, "wos_jedi_forceblast", 0.7) 

    ExtinguishTarget(target)

    -- Example of using a particle system for visual effect
    local effectData = EffectData()
    effectData:SetStart(ply:GetPos()) -- Set the effect's starting point to the main player's location
    effectData:SetOrigin(target:GetPos()) -- Make the effect go to the target's location
    effectData:SetScale(1)
    effectData:SetEntity(ply) -- Set the entity that the effect is linked to as the main player
    util.Effect("extinguish_effect", effectData) -- Replace with an appropriate extinguishing effect
end

-- Function to find a target (player or NPC) in view within a specific distance
function FindTargetInView(ply, distance)
    local trace = util.TraceLine({
        start = ply:EyePos(),
        endpos = ply:EyePos() + ply:GetAimVector() * distance,
        filter = function(ent) return (ent:IsPlayer() or ent:IsNPC()) and ent ~= ply end
    })

    return trace.Entity
end

-- Function to extinguish a burning target (player or NPC)
function ExtinguishTarget(target)
    if IsValid(target) and target:IsOnFire() then
        target:Extinguish() -- Stop the fire effect on the target
        print("Extinguished target: " .. tostring(target))
    end
end

force.StopUse = function(ply)
    -- Called when the force power key is released
end

LSCS:RegisterForce(force)
