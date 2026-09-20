PLUGIN.name = "long_desc"
PLUGIN.author = ""
PLUGIN.description = "Add long descriptions to the player."

ix.char.RegisterVar("description", {
    field = "description",
    typ = "string",
    default = "",
    index = 2,
    OnValidate = function(self, value, payload, client)
        value = string.Trim((tostring(value):gsub("\r\n", ""):gsub("\n", "")))

        local minLength = ix.config.Get("minDescriptionLength", 16)
        local maxLength = ix.config.Get("maxDescriptionLength", 512)

        local length = value:utf8len()

        if (length < minLength) then
            return false, "descMinLen", minLength
        elseif (length > maxLength) then
            return false, "Описание слишком большое! (Максимум " .. maxLength .. " букв.)"
        end

        return value
    end,
    OnDisplay = function(self, container, payload)
        local panel = container:Add("ixTextEntry")
        panel:Dock(TOP)
        panel:SetMultiline(true)
        panel:SetTall(80)
        panel:SetUpdateOnType(true)
        panel.OnValueChange = function(this, text)
            payload:Set("description", text)
        end

        return panel
    end
})