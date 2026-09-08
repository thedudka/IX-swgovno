local force = {}
force.PrintName = "Drain Life Essense"
force.Author = "Midnight"
force.Description = "A Dark Side ability that drains a target's health to restore your own."
force.id = "drain"
force.StartUse = function(ply)
    local Time = CurTime()

    if (ply._lscsNextForceReplenish or 0) > Time then return end
    ply._lscsNextForceReplenish = Time + 2

    local tr = util.TraceLine({
        start = ply:GetShootPos(),
        endpos = ply:GetShootPos() + ply:GetAimVector() * 500, -- That number defines how far away someone can be before this shit don't work
        filter = ply
    }) -- I copied and pasted this from another force power lmao

    local target = tr.Entity

   
    if IsValid(target) and target:IsPlayer() and target:Health() > 0 then -- Ima be real I had help with this
        if ply:lscsGetForce() < 10 then return end -- Erm that number changes how much force someone NEEDS to use the power
        ply:lscsTakeForce(10) -- Real shit idk how much I should make this cost
        local damage = 25  -- If you change that funny number you can make it damage people more
        local heal = math.min(damage, target:Health()) -- It takes that funny number up there and slaps it onto your health, unless you have max health, then it doesn't work.

        local d = DamageInfo() -- DAMAGEDAMAGEAMDAMGEM
        d:SetDamage(damage)
        d:SetAttacker(ply)
        d:SetInflictor(ply)
        d:SetDamageType(DMG_DROWN) 
        d:SetDamagePosition(target:GetPos())
        target:TakeDamageInfo(d)

        ply:SetHealth(math.min(ply:Health() + heal, ply:GetMaxHealth()))

        ply:EmitSound("lscs/force/drain.mp3") -- The fuck am I doing
        target:EmitSound("lscs/force/drain.mp3")

        LSCS:PlayVCDSequence( ply, "gesture_becon", 0.8 )

        local effectdata = EffectData() -- Funny effect I stole from replenish
        effectdata:SetOrigin(ply:GetPos())
        effectdata:SetEntity(ply)
        util.Effect("force_replenish", effectdata, true, true)

        -- This does the same thing as that^ except to the person you're looking at
        local targetEffect = EffectData()
        targetEffect:SetOrigin(target:GetPos())
        targetEffect:SetEntity(target)
        util.Effect("force_replenish", targetEffect, true, true)
    else -- Ngl I had a plan but I forgot the plan
    end
end

LSCS:RegisterForce(force)

local force = {}
force.PrintName = "Life Steal"
force.Author = "Midnight"
force.Description = "A Dark Side ability that continuously drains a target's health, while restoring your own."
force.id = "lifesteal"

-- AHHHHHHHH
local function DrainTarget(ply, target)
    if not IsValid(target) or not target:IsPlayer() then return end

    local damage = 5  -- Change this if you want to up the damage
    local heal = math.min(damage, target:Health())

    local d = DamageInfo()
    d:SetDamage(damage)
    d:SetAttacker(ply)
    d:SetInflictor(ply)
    d:SetDamageType(DMG_DROWN)
    d:SetDamagePosition(target:GetPos())
    target:TakeDamageInfo(d)

    ply:SetHealth(math.min(ply:Health() + heal, ply:GetMaxHealth()))

    ply:EmitSound("lscs/force/drain.mp3")
    target:EmitSound("lscs/force/drain.mp3")

    local effectdata = EffectData() -- user bitch
    effectdata:SetOrigin(ply:GetPos())
    effectdata:SetEntity(ply)
    util.Effect("force_replenish", effectdata, true, true)

    local targetEffect = EffectData() -- Targeted bitch
    targetEffect:SetOrigin(target:GetPos())
    targetEffect:SetEntity(target)
    util.Effect("force_replenish", targetEffect, true, true)
end

force.OnClk = function(ply, TIME)
    if not ply._lscsLifeStealTime then return end

    -- This makes sure the bitch has enough force
    if ply:lscsGetForce() < 1 then
        ply._lscsLifeStealTime = nil
        ply._lscsLifeStealStartTime = nil
        return
    end

    ply:lscsTakeForce(1) -- YEAH IT COSTS 1 SO WHAT?

    if ply._lscsLifeStealStartTime < TIME then
        LSCS:PlayVCDSequence(ply, "gesture_becon", 0.8)
    end

    local tr = util.TraceLine({
        start = ply:GetShootPos(),
        endpos = ply:GetShootPos() + ply:GetAimVector() * 500,
        filter = ply
    })

    local target = tr.Entity

    if IsValid(target) and target:IsPlayer() and target:Health() > 0 then
        DrainTarget(ply, target)
    else
        ply._lscsLifeStealTime = nil
        ply._lscsLifeStealStartTime = nil
    end
end

force.Equip = function(ply) end
force.UnEquip = function(ply) end

force.StartUse = function(ply)
    local Time = CurTime()

    -- COOLDOWN or smth I forgot
    if (ply._lscsLifeStealTime or 0) > Time then
        ply._lscsLifeStealTime = nil
        ply._lscsLifeStealStartTime = nil
        return
    end

    -- Check if the player has enough Force to activate
    if ply:lscsGetForce() < 10 then return end

    local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsLifeStealTime or 0) < Time
    if not CanDo then return end

    ply._lscsNextForce = Time + 2  -- Cooldown between uses

    ply:EmitSound("lscs/force/drain.mp3")

    -- Lmao the fee to use the power yep
    ply:lscsTakeForce(10)

    if not ply._lscsLifeStealTime then
        ply._lscsLifeStealTime = CurTime() + 3.5  -- Duration of effect
        ply._lscsLifeStealStartTime = CurTime() + 0.15

        LSCS:PlayVCDSequence(ply, "gesture_signal_forward", 0.1)
    end
end

force.StopUse = function(ply)
    ply._lscsLifeStealTime = nil
    ply._lscsLifeStealStartTime = nil
end

LSCS:RegisterForce(force)
