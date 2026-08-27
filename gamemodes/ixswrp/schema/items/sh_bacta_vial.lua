
ITEM.name = "Бакта-капсула"
ITEM.model = Model("models/bf2/bacta.mdl")
ITEM.description = "Капсула с веществом Бактой, обладающая лечебными свойствами и способная на лечение средних ранений."
ITEM.category = "Medical"
ITEM.width = 1
ITEM.height = 2
ITEM.price = 40

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 40, client:GetMaxHealth()))
	end
}
