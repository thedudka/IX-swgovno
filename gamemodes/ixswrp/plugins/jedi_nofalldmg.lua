local PLUGIN = PLUGIN

PLUGIN.name = "Jedi no fall dmg"
PLUGIN.author = "somebody"
PLUGIN.description = ""

hook.Add("EntityTakeDamage", "BlockForceUserFallDamage", function(target, dmginfo)
    if target:IsPlayer() and dmginfo:IsDamageType(DMG_FALL) then
        if target:IsTrueForceUser() then
            dmginfo:SetDamage(0)
            return true
        end
    end
end)