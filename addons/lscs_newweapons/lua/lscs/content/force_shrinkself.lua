local force = {}
force.PrintName = "Shrink Self"
force.Author = "Midnight"
force.Description = "Shrink yourself by using the Force!"
force.id = "shrink"

force.StartUse = function(ply)
    if ply:lscsGetForce() < 10 then return end -- Check if the player has enough Force points

    ply:lscsTakeForce(10) -- Deduct Force points required to use the power

    ply:SetModelScale(0.5, 1) -- Scale the player's model down to 50%
    ply:EmitSound("npc/combine_gunship/ping_search.wav") -- Play sound effect
    LSCS:PlayVCDSequence(ply, "gesture_signal_halt", 0) -- Play animation

    -- Optional: Reset the player's scale after 10 seconds
    timer.Create("ResetModelScale_" .. ply:EntIndex(), 10, 1, function()
        if IsValid(ply) then
            ply:SetModelScale(1, 1) -- Reset to normal size
        end
    end)
end

force.StopUse = function(ply)
    -- Called when the force power key is released
    -- In this case, nothing is needed here
end

LSCS:RegisterForce(force)
