local PLUGIN = PLUGIN

PLUGIN.name = "Disable TFA HUD option"
PLUGIN.description = "do what it does"
PLUGIN.author = "Yandex Alisa"

if CLIENT then
    ix.option.Add("disableTfaHud", ix.type.bool, true, {
        category = "Интерфейс",
        default = true,
        OnChanged = function(oldValue, value)
            RunConsoleCommand("cl_tfa_hud_enabled", value and "0" or "1")
        end
    })

    hook.Add("InitPostEntity", "ixSyncTfaHudOption", function()
        timer.Simple(1, function()
            local isDisabled = ix.option.Get("disableTfaHud", true)
            RunConsoleCommand("cl_tfa_hud_enabled", isDisabled and "0" or "1")
        end)
    end)
end