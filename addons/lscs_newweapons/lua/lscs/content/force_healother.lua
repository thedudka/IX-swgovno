local force = {}

force.PrintName = "Heal Other"
force.Author = "Madminer2243 and Douglas"
force.Description = "Heal targeted player."
force.id = "sharedhealing" -- lowercase only

force.Equip = function(ply)
    print("Equipped Target Healing")
end

force.UnEquip = function(ply)
    print("Unequipped Target Healing")
end

-- Function to heal a player
local function HealPlayer(player, amount)
    local currentHealth = player:Health()
    local maxHealth = player:GetMaxHealth()
    local newHealth = math.min(currentHealth + amount, maxHealth)
    player:SetHealth(newHealth)
end

force.StartUse = function(ply)
    if ply:lscsGetForce() < 10 then
        return  -- Minimum force requirement not met
    end

    ply:lscsTakeForce(10)  -- Consume force points

    local target = ply:GetEyeTrace().Entity  -- Get the position where the player is aiming
    if not target == nil and target:IsPlayer() then
        HealPlayer(target,25)
        local effectdata = EffectData()
        effectdata:SetOrigin(target:GetPos())
        effectdata:SetEntity(target)
        util.Effect("force_heal", effectdata, true, true)
    end

    -- Emit sound effect for the lightning
    ply:EmitSound("ambient/energy/zap7.wav")
    -- Play animation or gesture
    LSCS:PlayVCDSequence(ply, "gesture_signal_halt", 0)
end

force.StopUse = function(ply)
    -- Called when the force power key is released
end

LSCS:RegisterForce(force)