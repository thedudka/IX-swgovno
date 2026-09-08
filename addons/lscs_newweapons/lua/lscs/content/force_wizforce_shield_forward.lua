local force = {}
force.PrintName = "Force Barrier - Wall"
force.Author = "Wiz"
force.Description = "Create a wall of protection from the force."
force.id = "wizbarrierwall" -- lowercase only
--force.Spawnable = false  -- uncomment to unlist in q-menu

force.Equip = function( ply )
    print("Force Barrier - Wall equipped")
end

force.UnEquip = function( ply )
    print("Force Barrier - Wall unequipped :(")
end

force.StartUse = function( ply )
    if ply:lscsGetForce() < 40 then return end -- do we have enough force points?

    ply:lscsTakeForce( 10 ) -- take amount of force we need

    ply:EmitSound("npc/combine_gunship/ping_search.wav")

    LSCS:PlayVCDSequence( ply, "wos_cast_lightning", 0 ) -- play

    local animationTime = 0

    -- Increment animation time
    animationTime = animationTime + FrameTime()

    -- Loop the animation every 1.5 seconds
    if animationTime >= 1.5 then
        animationTime = 0
        LSCS:PlayVCDSequence( ply, "gesture_signal_halt", 0 )
    end

    -- Check if the player already has a force prop
    if IsValid(ply.forceProp) then return end

    -- Check if the player is in a vehicle
    if ply:InVehicle() then
        return -- Don't create the force prop if the player is in a vehicle
    end

    -- Create a think hook to continuously update the prop's position and rotation
    hook.Add("Think", "UpdateForceProp_" .. ply:UserID(), function()
        -- If the player is out of force points, stop the power and remove the prop
        if ply:lscsGetForce() <= 0 then
            -- Stop the power
            force.StopUse(ply)
            return
        end

        if not IsValid(ply) or ply:InVehicle() then
            hook.Remove("Think", "UpdateForceProp_" .. ply:UserID())
            -- Remove the force prop if the player is in a vehicle
            if IsValid(ply.forceProp) then
                hook.Remove("ShouldCollide", "ForcePropCollision_" .. ply.forceProp:EntIndex())
                ply.forceProp:Remove()
                ply.forceProp = nil
            end
            return
        end

        -- Get player's eye position and angles
        local eyePos = ply:GetPos() + Vector(0, 0, 0) -- Adjust for player's standing eye level
        local eyeAngles = ply:EyeAngles()

        -- Calculate the position to spawn the prop (in front of the player's hull by 100 units)
        local spawnPos = eyePos + eyeAngles:Forward() * 0 -- 100 units in front of the player

        -- Define the prop model
        local propModel = "models/lscs/barrierwall.mdl"

        -- Spawn or update the prop
        if not IsValid(ply.forceProp) then
            -- Spawn the prop
            local prop = ents.Create("prop_physics")
            if not IsValid(prop) then return end

            prop:SetModel(propModel)
            prop:SetModelScale(1)
            prop:SetMaterial("lscs/nanosword/sword3")
            prop:SetColor(Color(255, 255, 255, 12))
            prop:SetRenderMode(RENDERMODE_TRANSCOLOR)
            prop:SetPos(spawnPos)
            prop:Spawn()
            prop:Activate()
            prop:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER) -- Set collision group
            prop:SetCustomCollisionCheck(true) -- Enable custom collision checks

            -- Store the prop in the player's data
            ply.forceProp = prop

            -- Custom collision behavior (existing behavior)
            hook.Add("ShouldCollide", "ForcePropCollision_" .. prop:EntIndex(), function(ent1, ent2)
                if ent1 == prop or ent2 == prop then
                    local projectile = ent1:IsPlayer() or ent2:IsPlayer()
                    return not projectile -- Allow projectiles to pass through
                end
                return true
            end)

            -- Detect when the force prop takes damage from projectiles or bullets
            hook.Add("EntityTakeDamage", "ForcePropDamage_" .. prop:EntIndex(), function(ent, dmginfo)
                if ent == prop then
                    local attacker = dmginfo:GetAttacker()

                    -- Check if the attacker is an NPC or a projectile (e.g., bullet)
                    if attacker:IsNPC() then
                        -- Reduce force points when an NPC shoots at the prop
                        if ply:lscsGetForce() > 0 then
                            ply:lscsTakeForce(1) -- Take 1 force point
                            ply:EmitSound("npc/combine_gunship/ping_search.wav", 50 , 55 ,.5) -- Sound feedback
                            print(ply:GetName() .. " lost 1 force point!")
                        end
                    end
                end
            end)
        else
            -- Update the position of the prop
            ply.forceProp:SetPos(Vector(spawnPos.x, spawnPos.y, eyePos.z)) -- Set Z position to eye level

            -- Calculate the desired rotation based on the player's view direction
            local newAngles = Angle(0, eyeAngles.y + 180, 0)

            -- Apply the rotation to the prop
            ply.forceProp:SetAngles(newAngles)
        end
    end)
end

force.StopUse = function( ply )
    -- Remove the prop when the force power key is released or force runs out
    if IsValid(ply.forceProp) then
        hook.Remove("ShouldCollide", "ForcePropCollision_" .. ply.forceProp:EntIndex())
        hook.Remove("EntityTakeDamage", "ForcePropDamage_" .. ply.forceProp:EntIndex())
        ply.forceProp:Remove()
        ply.forceProp = nil
    end

    -- Remove the think hook
    hook.Remove("Think", "UpdateForceProp_" .. ply:UserID())

    -- Check if the player is in a vehicle and stop force power
    if ply:InVehicle() then
        -- Stop any additional actions or force power
        return
    end
end

LSCS:RegisterForce( force )
