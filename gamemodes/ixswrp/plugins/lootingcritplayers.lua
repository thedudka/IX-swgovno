PLUGIN.name = "Critical State Looting"
PLUGIN.author = "Server"
PLUGIN.description = "Allows players to loot characters who are in a critical state."

if SERVER then
    function PLUGIN:KeyPress(client, key)
        -- Check if the player is pressing the USE key (E)
        if key == IN_USE then
            local trace = client:GetEyeTraceNoCursor()
            local target = trace.Entity

            -- Ensure we have a valid target within interacting distance (~100 units)
            if not IsValid(target) or client:GetPos():DistToSqr(target:GetPos()) > 10000 then 
                return 
            end

            local targetPlayer = target

            -- If the target is a ragdoll, map it back to the player entity.
            -- When a player is critical, they are usually ragdolled.
            if target:GetClass() == "prop_ragdoll" and IsValid(target.ixPlayer) then
                targetPlayer = target.ixPlayer
            end

            -- Ensure the target is a valid player and is currently in the critical state[cite: 11]
            if IsValid(targetPlayer) and targetPlayer:IsPlayer() and targetPlayer:IsCritical() then
                
                -- Prevent the client from spamming the interaction or starting multiple actions
                if client:GetAction() ~= "" then 
                    return 
                end

                -- Start a 5-second progress bar for the looting action
                client:SetAction("Обыск...", 5, function()
                    -- Re-verify conditions after the timer finishes in case the player moved, died, or revived
                    if IsValid(targetPlayer) and targetPlayer:IsCritical() and client:GetPos():DistToSqr(targetPlayer:GetPos()) <= 10000 then
                        local character = targetPlayer:GetCharacter()
                        
                        if character then
                            local inventory = character:GetInventory()
                            local name = character:GetName()

                            -- Open the inventory UI for the looting client[cite: 12]
                            ix.storage.Open(client, inventory, {
                                entity = targetPlayer,
                                name = name,
                                searchTime = 0
                            })
                        end
                    end
                end)
            end
        end
    end
end