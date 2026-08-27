local PLUGIN = PLUGIN



PLUGIN.lastDamageTypes = PLUGIN.lastDamageTypes or {}

local function pickRandom(list)
    if not istable(list) or #list == 0 then
        return nil
    end

    return list[math.random(1, #list)]
end

function PLUGIN:GetFactionSound(client, category)
    if not IsValid(client) then
        return nil
    end

    local character = client:GetCharacter()
    if not character then
        return nil
    end

    local faction = character:GetFaction()
    if not faction then
        return nil
    end

    local sounds = PLUGIN.soundSets[faction]
    if not sounds or not sounds[category] then
        return nil
    end

    return pickRandom(sounds[category])
end

hook.Add("EntityTakeDamage", "ixFactionBasedDamageSoundType", function(entity, damageInfo)
    if IsValid(entity) and entity:IsPlayer() then
        PLUGIN.lastDamageTypes[entity] = damageInfo:GetDamageType()
    end
end)

hook.Add("GetPlayerPainSound", "ixFactionBasedPainSound", function(client)
    if not IsValid(client) then return nil end

    local damageType = PLUGIN.lastDamageTypes[client]
    PLUGIN.lastDamageTypes[client] = nil

    if client:WaterLevel() >= 3 then
        return PLUGIN:GetFactionSound(client, "drown") or PLUGIN:GetFactionSound(client, "hurt")
    end

    if damageType and bit.band(damageType, DMG_BURN) ~= 0 then
        return PLUGIN:GetFactionSound(client, "burn") or PLUGIN:GetFactionSound(client, "hurt")
    end

    return PLUGIN:GetFactionSound(client, "hurt")
end)

hook.Add("GetPlayerDeathSound", "ixFactionBasedDeathSound", function(client)
    if not IsValid(client) then return nil end

    local damageType = PLUGIN.lastDamageTypes[client]
    PLUGIN.lastDamageTypes[client] = nil

    if client:WaterLevel() >= 3 then
        return PLUGIN:GetFactionSound(client, "drown") or PLUGIN:GetFactionSound(client, "death")
    end

    if damageType and bit.band(damageType, DMG_BURN) ~= 0 then
        return PLUGIN:GetFactionSound(client, "burnDeath") or PLUGIN:GetFactionSound(client, "death")
    end

    return PLUGIN:GetFactionSound(client, "death")
end)