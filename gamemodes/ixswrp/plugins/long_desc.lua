PLUGIN.name = "long_desc"
PLUGIN.author = ""
PLUGIN.description = "Add long descriptions to the player."

ix.char.RegisterVar("description", {
    field = "description",
    typ = "string",
    default = "",
    index = 2,
    OnValidate = function(self, value, payload, client)
        -- Sanitize the input by removing newlines and trimming whitespace
        value = string.Trim((tostring(value):gsub("\r\n", ""):gsub("\n", "")))

        local minLength = ix.config.Get("minDescriptionLength", 16)
        local maxLength = ix.config.Get("maxDescriptionLength", 512)

        local length = value:utf8len()

        if (length < minLength) then
            -- Fallback to default Helix minimum length translation
            return false, "descMinLen", minLength
        elseif (length > maxLength) then
            -- Custom error message for exceeding the max limit
            return false, "Your character description is too long! (Max " .. maxLength .. " characters)"
        end

        -- Return the sanitized value so it saves properly in the database
        return value
    end,
    -- (Optional) If you want the character creation UI to support multi-line text for longer descriptions:
    OnDisplay = function(self, container, payload)
        local panel = container:Add("ixTextEntry")
        panel:Dock(TOP)
        panel:SetMultiline(true)
        panel:SetTall(80) -- Adjust height for easier reading
        panel:SetUpdateOnType(true)
        panel.OnValueChange = function(this, text)
            payload:Set("description", text)
        end

        return panel
    end
})