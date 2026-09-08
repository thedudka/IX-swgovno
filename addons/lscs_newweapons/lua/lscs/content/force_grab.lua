local force = {}
force.PrintName = "Grab"
force.Author = "htvgamer1000"
force.Description = "Use the force to grab your target"
force.id = "grab"
force.OnClk =  function( ply, TIME )
    if not IsValid( ply.WindTarget ) then return end
    if ply.WindTarget:IsPlayer() and not ply.WindTarget:Alive() then ply.WindTarget = nil return end
    local vec = ( ( ply:EyePos() + ply:GetAimVector()*ply.WindDistance  ) - ply.WindTarget:GetPos() )
    local vec2 = ( ( ply:EyePos() + ply:GetAimVector()*2*ply.WindDistance  ) - ply.WindTarget:GetPos() )

    if ply.WindTarget:IsPlayer() or ply.WindTarget:IsNPC() then
        ply.WindTarget:SetLocalVelocity( vec*10 )
    else
        local phys = ply.WindTarget:GetPhysicsObject()
        phys:SetVelocity( vec*10 )
    end

    ply:lscsTakeForce( 1 )

    if ply:lscsGetForce() < 1 then
        local ed = EffectData()
        ed:SetOrigin( ply.WindTarget:GetPos() + Vector( 0, 0, 36 ) )
        ed:SetRadius( 128 )
        util.Effect( "rb655_force_repulse_out", ed, true, true )
        if ply.WindTarget:IsPlayer() then
            if timer.Exists("force_whirlwind_p1_" .. ply.WindTarget:SteamID64()) then
                timer.Remove("force_whirlwind_p1_" .. ply.WindTarget:SteamID64())
            end
            ply.WindTarget:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
        end
        ply.WindTarget = nil
    end

    if not ply:KeyReleased( IN_ATTACK2 ) then return end

    local ed = EffectData()
    ed:SetOrigin( ply.WindTarget:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )
    if ply.WindTarget:IsPlayer() or ply.WindTarget:IsNPC() then
        ply.WindTarget:SetLocalVelocity( vec2*10 )
    else
        local phys = ply.WindTarget:GetPhysicsObject()
        phys:SetVelocity( vec2*10 )
    end
    if ply.WindTarget:IsPlayer() then
        if timer.Exists("force_whirlwind_p1_" .. ply.WindTarget:SteamID64()) then
            timer.Remove("force_whirlwind_p1_" .. ply.WindTarget:SteamID64())
        end
        ply.WindTarget:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
    end
    ply.WindTarget = nil
end
force.StartUse = function( ply )
    if ply:lscsGetForce() < 1 then return end
    if IsValid( ply.WindTarget ) then return end
    local tr = util.TraceLine( util.GetPlayerTrace( ply ) )
    local dist = tr.HitPos:Distance( ply:GetPos() )
    if not tr.Entity then return end
    if tr.LFS then return end
    if string.match(tr.Entity:GetClass(), "_pod") then return end
    if dist >= 400 then return end
    ply.WindTarget = tr.Entity
    ply.WindDistance = dist

    return true
end
force.StopUse = function( ply )
    if not IsValid( ply.WindTarget ) then return end
    local ed = EffectData()
    ed:SetOrigin( ply.WindTarget:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )

    ply.WindTarget = nil
end
LSCS:RegisterForce( force )
