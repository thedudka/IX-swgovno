local PLUGIN = PLUGIN

PLUGIN.name = "Dot fix"
PLUGIN.description = "the fucking net_message . what is this even do?"
PLUGIN.author = ""

local function EnforceConsoleFilter(ply)
    timer.Simple(5, function()
        if IsValid(ply) then
            ply:ConCommand("con_filter_enable 1")
            ply:ConCommand("con_filter_text_out .")
        end
    end)
end

hook.Add("PlayerInitialSpawn", "EnforceClientConsoleFilter", EnforceConsoleFilter)