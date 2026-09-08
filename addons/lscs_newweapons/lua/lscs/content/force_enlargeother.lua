local force = {}
force.PrintName = "Enlarge Other"
force.Author = "Midnight"
force.Description = "Enlarge your target using the force. Just cause."
force.id = "enlargeother" -- lowercase only

force.StartUse = function(ply)
    if ply:lscsGetForce() < 10 then return end -- Check if the player has enough Force points

    -- Perform a trace to find the target
    local tr = ply:GetEyeTrace()
    local target = tr.Entity

    -- Ensure the target is a valid player or NPC
    if IsValid(target) and (target:IsPlayer() or target:IsNPC()) then
        ply:lscsTakeForce(10) -- Deduct Force points required to use the power

        target:SetModelScale(1.5, 1) -- Scaling or smth
        ply:EmitSound("npc/combine_gunship/ping_search.wav") -- Play sound effect
        LSCS:PlayVCDSequence(ply, "gesture_signal_halt", 0) -- Play animation

        -- Optional: Reset the target's scale after 10 seconds
        timer.Create("ResetModelScale_" .. target:EntIndex(), 10, 1, function()
            if IsValid(target) then
                target:SetModelScale(1, 1) -- Reset to normal size
            end
        end)
    end
end

force.StopUse = function(ply)
    -- Called when the force power key is released
end

LSCS:RegisterForce(force)
