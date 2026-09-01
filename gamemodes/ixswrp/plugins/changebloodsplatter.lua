local PLUGIN = PLUGIN or {}
PLUGIN.name = "Change blood splatter"
PLUGIN.author = ""
PLUGIN.description = "Change blood splatters for sparks (for robots)"

if SERVER then
    util.AddNetworkString("ixDroidBloodParticle")

    -- Disable native blood decals entirely for droids
    local function ApplyDroidBloodColor(client)
        if not IsValid(client) then return end
        local character = client:GetCharacter()
        
        if character and character:IsDroid() then
            -- DONT_BLEED (-1) stops engine red blood decals & sounds
            client:SetBloodColor(DONT_BLEED)
        else
            client:SetBloodColor(BLOOD_COLOR_RED)
        end
    end

    hook.Add("PlayerSpawn", "ixDroidBloodSpawn", ApplyDroidBloodColor)
    hook.Add("OnCharacterLoaded", "ixDroidBloodLoad", function(client, character)
        ApplyDroidBloodColor(client)
    end)

    -- Trigger custom minor spark particles without native red splatters
    hook.Add("EntityTakeDamage", "ixDroidBloodFX", function(target, dmginfo)
        if not IsValid(target) or not target:IsPlayer() then return end
        
        local character = target:GetCharacter()
        if not character or !character:IsDroid() then return end

        -- Intercept physical damage types
        if dmginfo:IsDamageType(DMG_BULLET) or dmginfo:IsDamageType(DMG_BLAST) or dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) then
            local damagePos = dmginfo:GetDamagePosition()
            
            if damagePos == Vector(0, 0, 0) then
                damagePos = target:WorldSpaceCenter()
            end

            net.Start("ixDroidBloodParticle")
                net.WriteVector(damagePos)
                net.WriteVector(dmginfo:GetDamageForce():GetNormalized())
            net.SendPVS(damagePos)
        end
    end)

else
    -- Client-side small, compact spark effect
    net.Receive("ixDroidBloodParticle", function()
        local pos = net.ReadVector()
        local dir = net.ReadVector()

        -- Small burst of sparks
        local spark = EffectData()
        spark:SetOrigin(pos)
        spark:SetNormal(dir)
        spark:SetMagnitude(1) -- Reduced from 3
        spark:SetScale(0.3)   -- Reduced from 1.5
        spark:SetRadius(2)    -- Reduced from 8
        util.Effect("Sparks", spark)
    end)
end