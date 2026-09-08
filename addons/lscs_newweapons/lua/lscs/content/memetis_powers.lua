local force = {}
force.PrintName = "Boulder Throw"
force.Author = "Memeti"
force.Description = "Lob a boulder at your foe"
force.id = "boulderthrow"
force.Cooldown = 30
force.StartUse = function( ply )
    if ply:lscsGetForce() < 40 then return end -- do we have enough force points ?
    local Time = CurTime()
    if not ply.ConfirmBoulder or ply.ConfirmBoulder < CurTime() then
        ply.ConfirmBoulder = CurTime() + 5
        ply:ChatPrint("Activate again to confirm boulder throw.")
        return
    end
    ply.ConfirmBoulder = nil

	ply:lscsTakeForce( 40 ) -- take amount of force we need
    
	LSCS:PlayVCDSequence( ply, "gesture_signal_halt", 0 ) -- play animation
    
    local ent = ents.Create( "boulder" )
    ent:SetPos( ply:EyePos() + (ply:GetAimVector() * 60) )
    ent:SetAngles( ply:EyeAngles() )
    ent:Spawn()
    ent:SetOwner( ply )

    local phys = ent:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:SetVelocity( ply:GetAimVector() * 1200 )
    end

    return true
end
LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Whirlwind"
force.Author = "Memeti"
force.Description = "Use the force to lift your target"
force.id = "whirlwind"
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


local force = {}
force.PrintName = "Cloak"
force.Author = "Memeti"
force.Description = "Shroud yourself in the force"
force.id = "cloak" -- lowercase only
-- force.Spawnable = false  -- uncomment to unlist in q-menu
force.Cooldown = 10 -- cooldown in seconds

force.OnClk =  function( ply, TIME )
    if not ply:GetNWBool("IsCloaked", false) then return end
    if not ply.LSCS_Cloak then return end
    if ply:lscsGetForce() < 0.2 then ply:EndCloak() return end
    ply:lscsTakeForce( 1.5 )
end

force.StartUse = function( ply )
    if ply:lscsGetForce() < 1 then return end
    if ply:GetNWBool("IsCloaked", false) then
        ply.LSCS_Cloak = false
        ply:EndCloak()
        return
    end
    ply:SetNWBool("IsCloaked", true)
    ply.LSCS_Cloak = true

    return true
end

force.StopUse = function( ply )
	return
end

LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Cloak II"
force.Author = "Valkorius"
force.Description = "Shroud yourself in the force for longer"
force.id = "cloakii" -- lowercase only
-- force.Spawnable = false  -- uncomment to unlist in q-menu
force.Cooldown = 10 -- cooldown in seconds

force.OnClk =  function( ply, TIME )
    if not ply:GetNWBool("IsCloaked", false) then return end
    if not ply.LSCS_Cloakii then return end
    if ply:lscsGetForce() < 0.2 then ply:EndCloak() return end
    ply:lscsTakeForce( .75 )
end

force.StartUse = function( ply )
    if ply:lscsGetForce() < 1 then return end
    if ply:GetNWBool("IsCloaked", false) then
        ply.LSCS_Cloakii = false
        ply:EndCloak()
        return
    end
    ply:SetNWBool("IsCloaked", true)
    ply.LSCS_Cloakii = true

    return true
end

force.StopUse = function( ply )
	return
end

LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Cloak III"
force.Author = "Valkorius"
force.Description = "Shroud yourself in the force for even longer"
force.id = "cloakiii" -- lowercase only
-- force.Spawnable = false  -- uncomment to unlist in q-menu
force.Cooldown = 10 -- cooldown in seconds

force.OnClk =  function( ply, TIME )
    if not ply:GetNWBool("IsCloaked", false) then return end
    if not ply.LSCS_Cloakiii then return end
    if ply:lscsGetForce() < 0.2 then ply:EndCloak() return end
    ply:lscsTakeForce( 0.4 )
end

force.StartUse = function( ply )
    if ply:lscsGetForce() < 1 then return end
    if ply:GetNWBool("IsCloaked", false) then
        ply.LSCS_Cloakiii = false
        ply:EndCloak()
        return
    end
    ply:SetNWBool("IsCloaked", true)
    ply.LSCS_Cloakiii = true

    return true
end

force.StopUse = function( ply )
	return
end

LSCS:RegisterForce( force )


local function EndAdrenaline(ply)
    if not ply.lscs_adrenaline then return end
    ply:SetRunSpeed(ply:GetRunSpeed() - 200)
    ply.lscs_adrenaline = false
end
local force = {}
force.PrintName = "Adrenaline"
force.Author = "UCCROW"
force.Description = "Speed yourself up with the force"
force.id = "adrenaline" -- lowercase only
-- force.Spawnable = false  -- uncomment to unlist in q-menu
force.Cooldown = 10 -- cooldown in seconds

force.OnClk =  function( ply, TIME )
    if not ply.lscs_adrenaline then return end
    if ply:lscsGetForce() < 1 then EndAdrenaline(ply) return end
    ply:lscsTakeForce(2)
end

force.StartUse = function( ply )
    if ply.lscs_adrenaline then return end
    ply.lscs_adrenaline = true
    ply:SetRunSpeed(ply:GetRunSpeed() + 200)

    return true
end

force.StopUse = function( ply )
    if not ply.lscs_adrenaline then return end
	ply.lscs_adrenaline = false
    ply:SetRunSpeed(ply:GetRunSpeed() - 200)
end

LSCS:RegisterForce( force )

local function EndAdrenalineii(ply)
    if not ply.lscs_adrenalineii then return end
    ply:SetRunSpeed(ply:GetRunSpeed() - 400)
    ply.lscs_adrenalineii = false
end
local force = {}
force.PrintName = "Adrenaline II"
force.Author = "Valkorius"
force.Description = "Speed yourself up with the force even more"
force.id = "adrenalineii" -- lowercase only
-- force.Spawnable = false  -- uncomment to unlist in q-menu
force.Cooldown = 10 -- cooldown in seconds

force.OnClk =  function( ply, TIME )
    if not ply.lscs_adrenalineii then return end
    if ply:lscsGetForce() < 1 then EndAdrenalineii(ply) return end
    ply:lscsTakeForce(2)
end

force.StartUse = function( ply )
    if ply.lscs_adrenalineii then return end
    ply.lscs_adrenalineii = true
    ply:SetRunSpeed(ply:GetRunSpeed() + 400)

    return true
end

force.StopUse = function( ply )
    if not ply.lscs_adrenalineii then return end
	ply.lscs_adrenalineii = false
    ply:SetRunSpeed(ply:GetRunSpeed() - 400)
end

LSCS:RegisterForce( force )

local function EndAdrenalineiii(ply)
    if not ply.lscs_adrenalineiii then return end
    ply:SetRunSpeed(ply:GetRunSpeed() - 600)
    ply.lscs_adrenalineiii = false
end
local force = {}
force.PrintName = "Adrenaline III"
force.Author = "Valkorius"
force.Description = "Speed yourself up with the force even even more"
force.id = "adrenalineiii" -- lowercase only
-- force.Spawnable = false  -- uncomment to unlist in q-menu
force.Cooldown = 10 -- cooldown in seconds

force.OnClk =  function( ply, TIME )
    if not ply.lscs_adrenalineiii then return end
    if ply:lscsGetForce() < 1 then EndAdrenalineiii(ply) return end
    ply:lscsTakeForce(2)
end

force.StartUse = function( ply )
    if ply.lscs_adrenalineiii then return end
    ply.lscs_adrenalineiii = true
    ply:SetRunSpeed(ply:GetRunSpeed() + 600)

    return true
end

force.StopUse = function( ply )
    if not ply.lscs_adrenalineiii then return end
	ply.lscs_adrenalineiii = false
    ply:SetRunSpeed(ply:GetRunSpeed() - 600)
end

LSCS:RegisterForce( force )

local function EndAdrenalineiiii(ply)
    if not ply.lscs_adrenalineiiii then return end
    ply:SetRunSpeed(ply:GetRunSpeed() - 600)
    ply.lscs_adrenalineiii = false
end
local force = {}
force.PrintName = "Shadowstep"
force.Author = "Valkorius"
force.Description = "Shh nothing to see here."
force.id = "adrenalineiiii" -- lowercase only
-- force.Spawnable = false  -- uncomment to unlist in q-menu
force.Cooldown = 10 -- cooldown in seconds

force.OnClk =  function( ply, TIME )
    if not ply.lscs_adrenalineiiii then return end
    if ply:lscsGetForce() < 1 then EndAdrenalineiiii(ply) return end
    ply:lscsTakeForce(0.1)
end

force.StartUse = function( ply )
    if ply.lscs_adrenalineiiii then return end
    ply.lscs_adrenalineiiii = true
    ply:SetRunSpeed(ply:GetRunSpeed() + 600)

    return true
end

force.StopUse = function( ply )
    if not ply.lscs_adrenalineiiii then return end
	ply.lscs_adrenalineiiii = false
    ply:SetRunSpeed(ply:GetRunSpeed() - 600)
end

LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Better Heal"
force.Author = "Memeti"
force.Description = "Heal yourself using the Force at suspicious speeds"
force.id = "betterheal"
force.Cooldown = 2
force.StartUse = function( ply )
	local available = ply:lscsGetForce()
	local need = ply:GetMaxHealth() - ply:Health()
    local MaxHeal = ply:GetMaxHealth() * 0.2

	if need > 0 and available >= 5 then
		local take = math.min( need, available, MaxHeal )
        local ForceUse = math.Round((take / MaxHeal)*10)
		ply:lscsTakeForce( ForceUse )
		ply:SetHealth( math.min(ply:Health() + take ) )

		ply:EmitSound("lscs/force/heal.mp3")

		local effectdata = EffectData()
			effectdata:SetOrigin( ply:GetPos() )
			effectdata:SetEntity( ply )
		util.Effect( "force_heal", effectdata, true, true )

        return true
	end

    return false
end
LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Greater Heal"
force.Author = "Midnight"
force.Description = "Heal yourself using the Force within seconds"
force.id = "greaterheal"
force.Cooldown = 20
force.StartUse = function( ply )
	local available = ply:lscsGetForce()
	local need = ply:GetMaxHealth() - ply:Health()
    local MaxHeal = ply:GetMaxHealth() * 20

	if need > 0 and available >= 5 then
		local take = math.min( need, available, MaxHeal )
        local ForceUse = math.Round((take / MaxHeal)*10)
		ply:lscsTakeForce( ForceUse )
		ply:SetHealth( math.min(ply:Health() + take ) )

		ply:EmitSound("lscs/force/heal.mp3")

		local effectdata = EffectData()
			effectdata:SetOrigin( ply:GetPos() )
			effectdata:SetEntity( ply )
		util.Effect( "force_heal", effectdata, true, true )

        return true
	end

    return false
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Grand Heal"
force.Author = "Midnight"
force.Description = "Fully recover yourself with the force"
force.id = "grandheal"
force.Cooldown = 60
force.StartUse = function( ply )
	local available = ply:lscsGetForce()
	local need = ply:GetMaxHealth() - ply:Health()
    local MaxHeal = ply:GetMaxHealth() * 5000

	if need > 0 and available >= 5 then
		local take = math.min( need, available, MaxHeal )
        local ForceUse = math.Round((take / MaxHeal)*10)
		ply:lscsTakeForce( ForceUse )
		ply:SetHealth( math.min(ply:Health() + take ) )

		ply:EmitSound("lscs/force/heal.mp3")

		local effectdata = EffectData()
			effectdata:SetOrigin( ply:GetPos() )
			effectdata:SetEntity( ply )
		util.Effect( "force_heal", effectdata, true, true )

        return true
	end

    return false
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Teleport"
force.Author = "Memeti"
force.Description = "Transmit yourself to a location using the Force"
force.id = "teleport"
force.Cooldown = 2
force.StartUse = function( ply )
    local forceuse = 20
    if ply:lscsGetForce() < forceuse then return end

    local speed = 4000;
    local bFoundEdge = false;

    ply:SetNW2Float("wOS.ShowBlink", 0 );

    local hullTrace = util.TraceHull({
        start = ply:EyePos(),
        endpos = ply:EyePos() + ply:EyeAngles():Forward() * 1500,
        filter = ply,
        mins = Vector(-16, -16, 0),
        maxs = Vector(16, 16, 9)
    });

    local groundTrace = util.TraceEntity({
        start = hullTrace.HitPos + Vector(0, 0, 1),
        endpos = hullTrace.HitPos - (ply:EyePos() - ply:GetPos()),
        filter = ply
    }, ply);

    local edgeTrace;

    if (hullTrace.Hit and hullTrace.HitNormal.z <= 0) then
        local ledgeForward = Angle(0, hullTrace.HitNormal:Angle().y, 0):Forward();
        edgeTrace = util.TraceEntity({
            start = hullTrace.HitPos - ledgeForward * 33 + Vector(0, 0, 40),
            endpos = hullTrace.HitPos - ledgeForward * 33,
            filter = ply
        }, ply);

        if (edgeTrace.Hit and !edgeTrace.AllSolid) then
            local clearTrace = util.TraceHull({
                start = hullTrace.HitPos,
                endpos = hullTrace.HitPos + Vector(0, 0, 35),
                mins = Vector(-16, -16, 0),
                maxs = Vector(16, 16, 1),
                filter = ply
            });

            bFoundEdge = !clearTrace.Hit;
        end;
    end;

    if (!bFoundEdge and groundTrace.AllSolid) then
        return;
    end;

    local endPos = ( bFoundEdge and edgeTrace.HitPos ) or groundTrace.HitPos;

    ply:SetPos( endPos )
    ply:EmitSound("blink/exit" .. math.random(1, 2) .. ".wav");

    ply:lscsTakeForce( forceuse )

    return true
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Rebuke"
force.Author = "Memeti"
force.Description = "Strengthen your resolve and reflect a percentage of damage back to the attacker"
force.id = "rebuke"
force.Cooldown = 10
force.StartUse = function( ply )
    local forceuse = 20
	local CanDo = ply:lscsGetForce() >= forceuse
	if not CanDo then return end

	ply:SetNWFloat("lscs_rebuke", CurTime() + 10)
    ply:lscsTakeForce( forceuse )

    return true
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Group Heal"
force.Author = "Apollo"
force.Description = "Mend the injuries of your nearby allies"
force.id = "groupheal"
force.Cooldown = 10
force.StartUse = function( ply )
    local forceuse = 60
    local CanDo = ply:lscsGetForce() >= forceuse
	if not CanDo then return end

    for k,v in ipairs(ents.FindInSphere(ply:GetPos(), 150)) do
        if not IsValid(v) or not v:IsPlayer() or not v:Alive() then continue end
        v:SetHealth(math.min(v:Health() + v:GetMaxHealth()*0.4, v:GetMaxHealth()))
        local effectdata = EffectData()
			effectdata:SetOrigin( v:GetPos() )
			effectdata:SetEntity( v )
		util.Effect( "force_heal", effectdata, true, true )
    end
    local ent = ents.Create("pfx4_0b")
    local stopvfx = 1.5
    ent:SetPos(ply:GetPos())
    ent:SetOwner(ply)
    ent:SetParent(ply)
    ent:Spawn()
    timer.Simple(stopvfx, function()
        if not IsValid(ent) then return end
        SafeRemoveEntity(ent)
    end)

    ply:lscsTakeForce( forceuse )

    return true
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Wave"
force.Author = "Apollo"
force.Description = "Create a ripple in the force to repel and damage your opponents"
force.id = "forcewave"
force.Cooldown = 5
force.StartUse = function( ply )
    local forceuse = 40
    local CanDo = ply:lscsGetForce() >= forceuse
    if not CanDo then return end

    for k,v in ipairs(ents.FindInCone(ply:GetPos(), ply:GetAimVector(), 250, 0.5)) do
        if not IsValid(v) then continue end
        v:TakeDamage(75, ply, ply)
        local plypos = ply:GetPos()
        local vpos = v:GetPos()
        local dir = (vpos - plypos)
        local dist = dir:LengthSqr()
        dir:Normalize()
        local maxforce = 300
        local pushforce = math.max(maxforce / dist, 1)
        v:SetVelocity((dir + Vector(0,0,0.4)) * pushforce)
    end

    ply:lscsTakeForce( forceuse )

    return true
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Blind"
force.Author = "Memeti"
force.Description = "Enter your opponent's mind and blind them for a short time"
force.id = "blind"
force.Cooldown = 15
force.StartUse = function( ply )
    local forceuse = 80
    local CanDo = ply:lscsGetForce() >= forceuse
    if not CanDo then return end

    for k, v in ipairs(ents.FindInSphere(ply:GetPos(), 200)) do
        if not IsValid(v) or not v:IsPlayer() or not v:Alive() or v == ply then continue end
        v:ScreenFade(SCREENFADE.OUT, Color(0, 0, 0, 255), 0.5, 10)
    end

    ply:lscsTakeForce( forceuse )

    return true
end
LSCS:RegisterForce( force )