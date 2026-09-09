local PLUGIN = PLUGIN or {}
PLUGIN.name = "Change blood splatter"
PLUGIN.author = ""
PLUGIN.description = "Change blood splatters for sparks (for robots)"

if SERVER then
    util.AddNetworkString("ixDroidBloodParticle")

    local function ApplyDroidBloodColor(client)
        if not IsValid(client) then return end
        local character = client:GetCharacter()
        
        if character and character:IsDroid() then
            client:SetBloodColor(DONT_BLEED)
        else
            client:SetBloodColor(BLOOD_COLOR_RED)
        end
    end

    hook.Add("PlayerSpawn", "ixDroidBloodSpawn", ApplyDroidBloodColor)
    hook.Add("OnCharacterLoaded", "ixDroidBloodLoad", function(client, character)
        ApplyDroidBloodColor(client)
    end)

    
    hook.Add("EntityTakeDamage", "ixDroidBloodFX", function(target, dmginfo)
        if not IsValid(target) or not target:IsPlayer() then return end
        
        local character = target:GetCharacter()
        if not character or !character:IsDroid() then return end

        
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
    net.Receive("ixDroidBloodParticle", function()
        local pos = net.ReadVector()
        local dir = net.ReadVector()

        local spark = EffectData()
        spark:SetOrigin(pos)
        spark:SetNormal(dir)
        spark:SetMagnitude(1) 
        spark:SetScale(0.3)   
        spark:SetRadius(2)    
        util.Effect("Sparks", spark)
    end)
end