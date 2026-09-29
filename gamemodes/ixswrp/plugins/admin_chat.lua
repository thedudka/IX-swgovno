PLUGIN.name = "Admin Chat"
PLUGIN.author = ""
PLUGIN.description = "Adds an admin chat accessible via the 'A' flag."

ix.flag.Add("A", "Доступ в админ-чат.")

ix.chat.Register("adminchat", {
    format = "%s: %s",
    prefix = {"/a"},
    
    OnGetColor = function(self, speaker, text)
        return Color(0, 196, 255)
    end,
    
    CanHear = function(self, speaker, listener)
        local character = listener:GetCharacter()
        return character and character:HasFlags("A") or false
    end,
    
    CanSay = function(self, speaker, text)
        local character = speaker:GetCharacter()
        if not character or not character:HasFlags("A") then
            speaker:Notify("У вас нет доступа в этот чат. Напишите в @ если хотите связаться с админами.")
            return false
        end

        return true
    end,
    
    OnChatAdd = function(self, speaker, text)
        local icon = Material(hook.Run("GetPlayerIcon", speaker) or "icon16/user.png")
        local steamName = (speaker.AnonSteamName and speaker:AnonSteamName()) and ("(" .. speaker:AnonSteamName() .. ") ") or ""
        
        chat.AddText(
            icon, 
            Color(255, 215, 0), "[А] ", 
            Color(128, 0, 255, 255), steamName .. speaker:Name(), 
            Color(255, 255, 255), ": " .. text
        )
    end
})