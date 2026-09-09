local PLUGIN = PLUGIN

PLUGIN.name = "Sprint LowHP Locker"
PLUGIN.author = ""
PLUGIN.description = "IF HP BELOW 33 YOU CANT RUN"

function PLUGIN:SetupMove(client, mv, cmd)
    if not IsValid(client) or not client:Alive() then return end

    local walkSpeed = ix.config.Get("walkSpeed")
    local normalRunSpeed = ix.config.Get("runSpeed")

    local targetRunSpeed = (client:Health() <= 33) and walkSpeed or normalRunSpeed

    if client:GetRunSpeed() ~= targetRunSpeed then
        client:SetRunSpeed(targetRunSpeed)
    end
end