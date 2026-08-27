ITEM.name = "Бронепластина"
ITEM.model = Model("models/lordtrilobite/starwars/props/imp_datatape.mdl")
ITEM.description = "Бронепластина с магнитами и авто-сверлами, способная привариваться к броне за секунду."
ITEM.category = "Medical"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 40

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		client:SetArmor(math.min(client:Armor() + 30, 100))
	end
}
