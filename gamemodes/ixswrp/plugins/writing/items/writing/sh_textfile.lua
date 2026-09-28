
local PLUGIN = PLUGIN

ITEM.name = "Переносной текстовый диск"
ITEM.description = "Диск с хранящейся на ней текстовой информацией с возможностью его редактировать или показывать при нажатии. %s."
ITEM.price = 2
ITEM.model = Model("models/lordtrilobite/starwars/props/imp_datatape.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Текст"
ITEM.classes = {CLASS_EOW}
ITEM.business = true
ITEM.bAllowMultiCharacterInteraction = true

function ITEM:GetDescription()
	return self:GetData("owner", 0) == 0
		and string.format(self.description, "На данный момент пуст")
		or string.format(self.description, "Содержит сообщение")
end

function ITEM:SetText(text, character)
	text = tostring(text):sub(1, PLUGIN.maxLength)

	self:SetData("text", text, false, false, true)
	self:SetData("owner", character and character:GetID() or 0)
end

ITEM.functions.View = {
	name = "Осмотреть",
	OnRun = function(item)
		netstream.Start(item.player, "ixViewPaper", item:GetID(), item:GetData("text", ""), 0)
		return false
	end,

	OnCanRun = function(item)
		local owner = item:GetData("owner", 0)

		return owner != 0
	end
}

ITEM.functions.Edit = {
	name = "Редактировать",
	OnRun = function(item)
		netstream.Start(item.player, "ixViewPaper", item:GetID(), item:GetData("text", ""), 1)
		return false
	end,

	OnCanRun = function(item)
		local owner = item:GetData("owner", 0)

		return owner == 0 or owner == item.player:GetCharacter():GetID() and item:GetData("text", "") == ""
	end
}

ITEM.functions.take.OnCanRun = function(item)
	local owner = item:GetData("owner", 0)

	return IsValid(item.entity) and (owner == 0 or owner == item.player:GetCharacter():GetID())
end
