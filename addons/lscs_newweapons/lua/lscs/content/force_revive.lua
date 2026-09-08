local force = {}
force.PrintName = "Revive"
force.Author = "Wiz"
force.Description = "A powerful ability to revive a fallen ally by targeting their corpse."
force.id = "revive" -- lowercase only

force.StartUse = function(ply)
    if ply:lscsGetForce() < 100 then -- Require at least 100 force points
        ply:ChatPrint("Not enough force points to use Revive!")
        return
    end

    local trace = ply:GetEyeTrace() -- Get where the player is looking
    local targetEntity = trace.Entity -- The entity being aimed at

    if not IsValid(targetEntity) or not targetEntity:GetClass():find("ragdoll") then
        ply:ChatPrint("You must aim at a valid corpse to revive!")
        return
    end

    -- Debug: Check the ragdoll and its owner
    print("Target Entity: ", targetEntity)

    -- Check if the target is an NPC (bot created by the bot command)
    if targetEntity:IsNPC() then
        local npcClass = targetEntity:GetClass()
        if npcClass == "npc_combine_s" or npcClass == "npc_metropolice" then
            -- This is a bot created using the bot command (or other bot-like NPCs)
            if targetEntity:Health() <= 0 then
                ply:lscsTakeForce(100) -- Deduct 100 force points for reviving

                -- Revive the bot NPC (just set health to max and restore it)
                targetEntity:SetHealth(targetEntity:GetMaxHealth()) -- Set health to maximum
                targetEntity:SetPos(targetEntity:GetPos() + Vector(0, 0, 10)) -- Position the bot slightly above the ragdoll location

                -- Remove the ragdoll (bots don't have ragdolls in the same way, so this step may not be needed)
                targetEntity:Remove()

                -- Sound and effects
                ply:EmitSound("ambient/levels/labs/electric_explosion1.wav")
                local effectData = EffectData()
                effectData:SetOrigin(targetEntity:GetPos())
                util.Effect("cball_explode", effectData)

                ply:ChatPrint("Revived bot " .. targetEntity:GetClass() .. "!")
            else
                ply:ChatPrint("The targeted bot is not dead and cannot be revived.")
            end
            return
        end
    end

    -- For player-owned ragdolls (if they were previously a player)
    local targetPlayer = targetEntity:GetOwner()
    if IsValid(targetPlayer) and targetPlayer:IsPlayer() then
        -- Ensure the player is dead before reviving
        if targetPlayer:Health() <= 0 then
            ply:lscsTakeForce(20) -- Deduct 20 force points for reviving

            -- Revive the player
            targetPlayer:Spawn()
            targetPlayer:SetHealth(100) -- Set the revived player's health
            targetPlayer:SetPos(targetEntity:GetPos() + Vector(0, 0, 10)) -- Position the revived player at ragdoll's location

            -- Remove the ragdoll
            targetEntity:Remove()

            -- Sound and effects
            ply:EmitSound("ambient/levels/labs/electric_explosion1.wav")
            local effectData = EffectData()
            effectData:SetOrigin(targetPlayer:GetPos())
            util.Effect("cball_explode", effectData)

            ply:ChatPrint("Revived " .. targetPlayer:Nick() .. "!")
            targetPlayer:ChatPrint("You have been revived by " .. ply:Nick() .. "!")
        else
            ply:ChatPrint("The targeted corpse cannot be revived because the player is not dead.")
        end
    end
end

force.StopUse = function(ply)
    ply:ChatPrint("Revive power deactivated.")
end

LSCS:RegisterForce(force)