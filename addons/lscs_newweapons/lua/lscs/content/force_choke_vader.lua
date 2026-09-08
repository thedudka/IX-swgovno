local force = {}
force.PrintName = "Sleep"
force.Author = "htvgamer1000"
force.Description = "Use the force to put your target to sleep"
force.id = "chokev"
force.OnClk =  function( ply, TIME )
    if not IsValid( ply.ChokevTarget ) then return end
    if ply.ChokevTarget:IsPlayer() and not ply.ChokevTarget:Alive() then ply.ChokevTarget = nil return end
    local vec = ( ( ply:EyePos() + ply:GetAimVector()*ply.ChokevDistance  ) - ply.ChokevTarget:GetPos() )
    local vec2 = ( ( ply:EyePos() + ply:GetAimVector()*2*ply.ChokevDistance  ) - ply.ChokevTarget:GetPos() )

    if ply.ChokevTarget:IsPlayer() or ply.ChokevTarget:IsNPC() then
        ply.ChokevTarget:SetLocalVelocity( vec*10 )
        local dmg = DamageInfo()
        dmg:SetDamage( 100 ) --0.21
        dmg:SetDamageType( DMG_CRUSH )
        dmg:SetAttacker( ply )
        dmg:SetInflictor( ply )
        ply.ChokevTarget:TakeDamageInfo( dmg )
        LSCS:PlayVCDSequence( ply, "wos_cast_choke", 0.5 )
    else
        local phys = ply.ChokevTarget:GetPhysicsObject()
        phys:SetVelocity( vec*10 )
    end

    ply:lscsTakeForce( 1 )

    if ply:lscsGetForce() < 1 then
        local ed = EffectData()
        ed:SetOrigin( ply.ChokevTarget:GetPos() + Vector( 0, 0, 36 ) )
        ed:SetRadius( 128 )
        util.Effect( "rb655_force_repulse_out", ed, true, true )
        if ply.ChokevTarget:IsPlayer() then
            if timer.Exists("force_whirlwind_p1_" .. ply.ChokevTarget:SteamID64()) then
                timer.Remove("force_whirlwind_p1_" .. ply.ChokevTarget:SteamID64())
            end
            ply.ChokevTarget:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
        end
        ply.ChokevTarget = nil
    end

    if not ply:KeyReleased( IN_ATTACK2 ) then return end

    local ed = EffectData()
    ed:SetOrigin( ply.ChokevTarget:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )
    if ply.ChokevTarget:IsPlayer() or ply.ChokevTarget:IsNPC() then
        ply.ChokevTarget:SetLocalVelocity( vec2*10 )
    else
        local phys = ply.ChokevTarget:GetPhysicsObject()
        phys:SetVelocity( vec2*10 )
    end
    if ply.ChokevTarget:IsPlayer() then
        if timer.Exists("force_whirlwind_p1_" .. ply.ChokevTarget:SteamID64()) then
            timer.Remove("force_whirlwind_p1_" .. ply.ChokevTarget:SteamID64())
        end
        ply.ChokevTarget:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
    end
    ply.ChokevTarget = nil
end
force.StartUse = function( ply )
    if ply:lscsGetForce() < 1 then return end
    if IsValid( ply.ChokevTarget ) then return end
    local tr = util.TraceLine( util.GetPlayerTrace( ply ) )
    local dist = tr.HitPos:Distance( ply:GetPos() )
    if not tr.Entity then return end
    if tr.LFS then return end
    if string.match(tr.Entity:GetClass(), "_pod") then return end
    if dist >= 400 then return end
    ply.ChokevTarget = tr.Entity
    ply.ChokevDistance = dist

    LSCS:PlayVCDSequence( ply, "wos_cast_choke", 0.5 )
    ply:EmitSound("lscs/force/chokestart.mp3")

    return true
end
force.StopUse = function( ply )
    if not IsValid( ply.ChokevTarget ) then return end
    local ed = EffectData()
    ed:SetOrigin( ply.ChokevTarget:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )

    ply.ChokevTarget = nil
end
LSCS:RegisterForce( force )
