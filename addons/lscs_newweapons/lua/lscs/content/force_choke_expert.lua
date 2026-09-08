local force = {}
force.PrintName = "Choke [Expert]"
force.Author = "htvgamer1000"
force.Description = "Use the force to choke your target out quickly"
force.id = "choke2"
force.OnClk =  function( ply, TIME )
    if not IsValid( ply.Choke2Target ) then return end
    if ply.Choke2Target:IsPlayer() and not ply.Choke2Target:Alive() then ply.Choke2Target = nil return end
    local vec = ( ( ply:EyePos() + ply:GetAimVector()*ply.Choke2Distance  ) - ply.Choke2Target:GetPos() )
    local vec2 = ( ( ply:EyePos() + ply:GetAimVector()*2*ply.Choke2Distance  ) - ply.Choke2Target:GetPos() )

    if ply.Choke2Target:IsPlayer() or ply.Choke2Target:IsNPC() then
        ply.Choke2Target:SetLocalVelocity( vec*10 )
        local dmg = DamageInfo()
        dmg:SetDamage( 40 ) --0.21
        dmg:SetDamageType( DMG_CRUSH )
        dmg:SetAttacker( ply )
        dmg:SetInflictor( ply )
        ply.Choke2Target:TakeDamageInfo( dmg )
        LSCS:PlayVCDSequence( ply, "wos_cast_choke", 0.5 )
    else
        local phys = ply.Choke2Target:GetPhysicsObject()
        phys:SetVelocity( vec*10 )
    end

    ply:lscsTakeForce( 1 )

    if ply:lscsGetForce() < 1 then
        local ed = EffectData()
        ed:SetOrigin( ply.Choke2Target:GetPos() + Vector( 0, 0, 36 ) )
        ed:SetRadius( 128 )
        util.Effect( "rb655_force_repulse_out", ed, true, true )
        if ply.Choke2Target:IsPlayer() then
            if timer.Exists("force_whirlwind_p1_" .. ply.Choke2Target:SteamID64()) then
                timer.Remove("force_whirlwind_p1_" .. ply.Choke2Target:SteamID64())
            end
            ply.Choke2Target:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
        end
        ply.Choke2Target = nil
    end

    if not ply:KeyReleased( IN_ATTACK2 ) then return end

    local ed = EffectData()
    ed:SetOrigin( ply.Choke2Target:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )
    if ply.Choke2Target:IsPlayer() or ply.Choke2Target:IsNPC() then
        ply.Choke2Target:SetLocalVelocity( vec2*10 )
    else
        local phys = ply.Choke2Target:GetPhysicsObject()
        phys:SetVelocity( vec2*10 )
    end
    if ply.Choke2Target:IsPlayer() then
        if timer.Exists("force_whirlwind_p1_" .. ply.Choke2Target:SteamID64()) then
            timer.Remove("force_whirlwind_p1_" .. ply.Choke2Target:SteamID64())
        end
        ply.Choke2Target:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
    end
    ply.Choke2Target = nil
end
force.StartUse = function( ply )
    if ply:lscsGetForce() < 1 then return end
    if IsValid( ply.Choke2Target ) then return end
    local tr = util.TraceLine( util.GetPlayerTrace( ply ) )
    local dist = tr.HitPos:Distance( ply:GetPos() )
    if not tr.Entity then return end
    if tr.LFS then return end
    if string.match(tr.Entity:GetClass(), "_pod") then return end
    if dist >= 400 then return end
    ply.Choke2Target = tr.Entity
    ply.Choke2Distance = dist

    LSCS:PlayVCDSequence( ply, "wos_cast_choke", 0.5 )
    ply:EmitSound("lscs/force/chokestart.mp3")

    return true
end
force.StopUse = function( ply )
    if not IsValid( ply.Choke2Target ) then return end
    local ed = EffectData()
    ed:SetOrigin( ply.Choke2Target:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )

    ply.Choke2Target = nil
end
LSCS:RegisterForce( force )
