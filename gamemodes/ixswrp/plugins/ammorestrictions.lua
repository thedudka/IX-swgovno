local PLUGIN = PLUGIN or {}

PLUGIN.name = "Ammo restriction"
PLUGIN.author = ""
PLUGIN.description = "Restricts ammo to certain amount."

ix.config.Add("maxammo", 500, "Максимальное количество переносимых боеприпасов.", nil, {
    data = {min = 0, max = 9999},
    category = "Characters"
})

if (SERVER) then
    function PLUGIN:PlayerAmmoChanged(client, ammoID, oldCount, newCount)
        local maxAmmo = ix.config.Get("maxammo", 1000)
        if (newCount > maxAmmo) then
            client:SetAmmo(maxAmmo, ammoID)
            client:Notify("Вы не можете переносить больше боеприпасов!")
        end
    end
end