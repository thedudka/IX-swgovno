local PLUGIN = PLUGIN

PLUGIN.name = "Prop Kill Protection"
PLUGIN.author = ""
PLUGIN.description = ""

if SERVER then
    function PLUGIN:EntityTakeDamage(entity, damageInfo)
        local curTime = CurTime()
        local inflictor = damageInfo:GetInflictor()
        local attacker = damageInfo:GetAttacker()

        if IsValid(inflictor) then
            local class = inflictor:GetClass()
            if class == "prop_physics" or class == "prop_physics_multiplayer" or class == "ix_item" then
                damageInfo:SetDamage(0)
                return true
            end
        end

        if ((IsValid(inflictor) and inflictor.ixDamageImmunity and inflictor.ixDamageImmunity > curTime and not inflictor:IsVehicle())
        or (IsValid(attacker) and attacker.ixDamageImmunity and attacker.ixDamageImmunity > curTime)) then
            entity.ixDamageImmunity = curTime + 1
            damageInfo:SetDamage(0)
            return true
        end

        if (IsValid(attacker) and attacker:GetClass() == "worldspawn" and entity.ixDamageImmunity and entity.ixDamageImmunity > curTime) then
            damageInfo:SetDamage(0)
            return true
        end

        if ((IsValid(inflictor) and inflictor.ixHeldOwner) or (IsValid(attacker) and attacker.ixHeldOwner)) then
            damageInfo:SetDamage(0)
            return true
        end
    end

    function PLUGIN:InitPostEntity()
        timer.Simple(10, function()
            for _, v in ipairs(ents.FindByClass("prop_physics")) do
                if not v:MapCreationID() then continue end

                local phys = v:GetPhysicsObject()

                if IsValid(phys) then
                    phys:EnableMotion(false)
                end
            end
        end)
    end
end