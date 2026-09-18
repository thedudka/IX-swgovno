local PLUGIN = PLUGIN

PLUGIN.name = "Gravity and Fall Dmg Changer"
PLUGIN.author = ""
PLUGIN.description = ""

ix.config.Add("Отключить урон при падении", false, "Если включено, игроки больше не получают урона от падения (звук остается).", nil, {
    category = "Gravity"
})

ix.config.Add("Сила гравитации", 600, "Определяет силу гравитации через sv_gravity (стандарт 600).", function(oldValue, newValue)
    if SERVER then
        RunConsoleCommand("sv_gravity", tostring(newValue))
    end
end, {
    data = { min = 0, max = 999 },
    category = "Gravity"
})

function PLUGIN:InitializedPlugins()
    if SERVER then
        RunConsoleCommand("sv_gravity", tostring(ix.config.Get("Gravity", 600)))
    end
end

function PLUGIN:EntityTakeDamage(target, dmginfo)
    if target:IsPlayer() and dmginfo:IsDamageType(DMG_FALL) then
        if ix.config.Get("Отключить урон при падении", false) then
            dmginfo:SetDamage(0)
            return true
        end
    end
end