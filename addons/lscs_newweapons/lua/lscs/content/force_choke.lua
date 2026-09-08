local force = {}
force.PrintName = "Choke"
force.Author = "htvgamer1000"
force.Description = "Use the force to choke your target"
force.id = "choke"
force.OnClk =  function( ply, TIME )
    if not IsValid( ply.ChokeTarget ) then return end
    if ply.ChokeTarget:IsPlayer() and not ply.ChokeTarget:Alive() then ply.ChokeTarget = nil return end
    local vec = ( ( ply:EyePos() + ply:GetAimVector()*ply.ChokeDistance  ) - ply.ChokeTarget:GetPos() )
    local vec2 = ( ( ply:EyePos() + ply:GetAimVector()*2*ply.ChokeDistance  ) - ply.ChokeTarget:GetPos() )

    if ply.ChokeTarget:IsPlayer() or ply.ChokeTarget:IsNPC() then
        ply.ChokeTarget:SetLocalVelocity( vec*10 )
        local dmg = DamageInfo()
        dmg:SetDamage( 5 ) --0.21
        dmg:SetDamageType( DMG_CRUSH )
        dmg:SetAttacker( ply )
        dmg:SetInflictor( ply )
        ply.ChokeTarget:TakeDamageInfo( dmg )
        LSCS:PlayVCDSequence( ply, "wos_cast_choke", 0.5 )
    else
        local phys = ply.ChokeTarget:GetPhysicsObject()
        phys:SetVelocity( vec*10 )
    end

    ply:lscsTakeForce( 1 )

    if ply:lscsGetForce() < 1 then
        local ed = EffectData()
        ed:SetOrigin( ply.ChokeTarget:GetPos() + Vector( 0, 0, 36 ) )
        ed:SetRadius( 128 )
        util.Effect( "rb655_force_repulse_out", ed, true, true )
        if ply.ChokeTarget:IsPlayer() then
            if timer.Exists("force_whirlwind_p1_" .. ply.ChokeTarget:SteamID64()) then
                timer.Remove("force_whirlwind_p1_" .. ply.ChokeTarget:SteamID64())
            end
            ply.ChokeTarget:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
        end
        ply.ChokeTarget = nil
    end

    if not ply:KeyReleased( IN_ATTACK2 ) then return end

    local ed = EffectData()
    ed:SetOrigin( ply.ChokeTarget:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )
    if ply.ChokeTarget:IsPlayer() or ply.ChokeTarget:IsNPC() then
        ply.ChokeTarget:SetLocalVelocity( vec2*10 )
    else
        local phys = ply.ChokeTarget:GetPhysicsObject()
        phys:SetVelocity( vec2*10 )
    end
    if ply.ChokeTarget:IsPlayer() then
        if timer.Exists("force_whirlwind_p1_" .. ply.ChokeTarget:SteamID64()) then
            timer.Remove("force_whirlwind_p1_" .. ply.ChokeTarget:SteamID64())
        end
        ply.ChokeTarget:SetNW2Float( "wOS_Hates_Devs.WhirlwindCooldown", CurTime() + 5 )
    end
    ply.ChokeTarget = nil
end
force.StartUse = function( ply )
    if ply:lscsGetForce() < 1 then return end
    if IsValid( ply.ChokeTarget ) then return end
    local tr = util.TraceLine( util.GetPlayerTrace( ply ) )
    local dist = tr.HitPos:Distance( ply:GetPos() )
    if not tr.Entity then return end
    if tr.LFS then return end
    if string.match(tr.Entity:GetClass(), "_pod") then return end
    if dist >= 400 then return end
    ply.ChokeTarget = tr.Entity
    ply.ChokeDistance = dist

    LSCS:PlayVCDSequence( ply, "wos_cast_choke", 0.5 )
    ply:EmitSound("lscs/force/chokestart.mp3")

    return true
end
force.StopUse = function( ply )
    if not IsValid( ply.ChokeTarget ) then return end
    local ed = EffectData()
    ed:SetOrigin( ply.ChokeTarget:GetPos() + Vector( 0, 0, 36 ) )
    ed:SetRadius( 128 )
    util.Effect( "rb655_force_repulse_out", ed, true, true )

    ply.ChokeTarget = nil
end
LSCS:RegisterForce( force )
