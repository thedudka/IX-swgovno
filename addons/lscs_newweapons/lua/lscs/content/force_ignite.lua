local force = {}
force.PrintName = "Ignite"
force.Author = "UCCROW"
force.Description = "Ignites a target using the Force."
force.id = "ignite" -- lowercase only
--force.Spawnable = false  -- uncomment to unlist in q-menu

--[[ 
-- adds a hook to Think with 0.1 second interval. Only uncomment if needed
force.OnClk = function(ply, TIME)
    print(TIME)
end
]]

force.Equip = function(ply)
    print("Ignite Force Power equipped!")
end

force.UnEquip = function(ply)
    print("Ignite Force Power unequipped!")
end

force.StartUse = function(ply)
    if ply:lscsGetForce() < 50 then return end -- Check if the player has enough Force points

    local target = FindTargetInView(ply, 200) -- We set a view range of 200 units

    if not IsValid(target) or (not target:IsPlayer() and not target:IsNPC()) then return end -- Exit if no valid target is found or the target is neither a player nor an NPC

    ply:lscsTakeForce(50) -- Deduct Force points required to use the power

    ply:EmitSound("npc/combine_gunship/ping_search.wav") -- Play sound effect

    LSCS:PlayVCDSequence(ply, "wos_jedi_forceblast", 0.7) -- Play an animation

    BurnTarget(target) -- Call the function that performs the burning of the target

    -- Example of using particle system for visual effect
    local effectData = EffectData()
    effectData:SetStart(ply:GetPos()) -- Set the effect's starting point to the main player's location
    effectData:SetOrigin(target:GetPos()) -- Make the effect go to the target's location
    effectData:SetScale(1)
    effectData:SetEntity(ply) -- Set the entity that the effect is linked to as the main player
    util.Effect("corvinus_ignite_effect", effectData)
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

-- Function to ignite the target (player or NPC)
function BurnTarget(target)
    if IsValid(target) then
        local igniteDuration = 5 -- Duration the target will burn
        local damagePerSecond = 2 -- Amount of damage dealt per second

        if not target:IsOnFire() then
            target:Ignite(igniteDuration, 0) -- Ignite the target for the specified duration

            timer.Create("fireDamageTimer_" .. target:EntIndex(), 1, igniteDuration, function()
                if IsValid(target) and target:IsOnFire() then
                    target:TakeDamage(damagePerSecond, game.GetWorld(), game.GetWorld())
                else
                    timer.Remove("fireDamageTimer_" .. target:EntIndex())
                end
            end)
        end
    end
end

force.StopUse = function(ply)
    -- Called when the force power key is released
end

LSCS:RegisterForce(force)
