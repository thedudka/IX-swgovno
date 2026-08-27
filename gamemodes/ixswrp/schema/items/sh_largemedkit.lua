
ITEM.name = "Медицинский набор"
ITEM.model = Model("models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_footlocker_screen.mdl")
ITEM.description = "Большой медицинский набор, способный вылечить в условиях боевых действий очень тяжелые раны."
ITEM.category = "Medical"
ITEM.price = 65
ITEM.width = 2
ITEM.height = 2

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 80, 100))
	end
}
