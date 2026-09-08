local force = {}
force.PrintName = "Purify"
force.Author = "Douglas"
force.Description = "A Light Side ability that fires healing lightning bolts out of your hand"
force.id = "purifytest1"  -- Updated ID to purifytest1

-- Define the function to heal the target player upon impact
local function HealTargetPlayer(ply, target)
    if not IsValid(target) or not target:IsPlayer() then return end

    local need = target:GetMaxHealth() - target:Health()
    if need > 0 then
        local newHealth = math.Clamp(target:Health() + 20, 0, target:GetMaxHealth())  -- Adjust healing amount as needed
        target:SetHealth(newHealth)

        local effectdata = EffectData()
        effectdata:SetOrigin(ply:GetPos())
        effectdata:SetEntity(ply)
        util.Effect("force_judgementii", effectdata, true, true)  -- Visual effect for healing
    end
end

force.OnClk = function(ply, TIME)
    if not ply._lscspurifytest1Time then return end  -- Updated to _lscspurifytest1Time

    ply:lscsTakeForce(6)  -- Deduct force points

    -- Assuming ForceJIIFry function is used for impact logic
    -- ForceJIIFry(ply, TIME)

    if ply._lscspurifytest1StartTime < TIME then
        LSCS:PlayVCDSequence(ply, "gesture_item_give", 0.7)  -- Example gesture or animation
    end

    -- Check if the healing time is up or conditions are no longer met
    if ply._lscspurifytest1Time < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
        ply._lscspurifytest1Time = nil
        ply._lscspurifytest1StartTime = nil
    else
        -- Detect and heal the player the ability is aiming at
        local aimPos = ply:GetEyeTrace().HitPos
        local entities = ents.FindInSphere(aimPos, 50)  -- Adjust the radius as needed

        for _, ent in pairs(entities) do
            if ent:IsPlayer() and ent ~= ply then
                HealTargetPlayer(ply, ent)
            end
        end
    end
end

force.Equip = function(ply) end
force.UnEquip = function(ply) end

force.StartUse = function(ply)
    local Time = CurTime()

    if (ply._lscspurifytest1Time or 0) > Time then
        ply._lscspurifytest1Time = nil
        ply._lscspurifytest1StartTime = nil
        return
    end

    if ply:lscsGetForce() < 10 then return end  -- Minimum force requirement

    local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscspurifytest1Time or 0) < Time
    if not CanDo then return end

    ply._lscsNextForce = Time + 2  -- Cooldown

    ply:EmitSound("lscs/force/lightning.mp3")  -- Sound effect

    ply:lscsTakeForce(0.1)  -- Deduct force points

    -- Assuming ForceJIIFry function is used for impact logic
    -- ForceJIIFry(ply, Time)

    if not ply._lscspurifytest1Time then
        ply._lscspurifytest1Time = CurTime() + 3.5  -- Duration of healing effect
        ply._lscspurifytest1StartTime = CurTime() + 0.15

        LSCS:PlayVCDSequence(ply, "gesture_signal_forward", 0.1)  -- Example gesture or animation
    end
end

force.StopUse = function(ply)
    ply._lscspurifytest1Time = nil
    ply._lscspurifytest1StartTime = nil
end

LSCS:RegisterForce(force)