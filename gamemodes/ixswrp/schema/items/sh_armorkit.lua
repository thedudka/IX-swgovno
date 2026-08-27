ITEM.name = "Комплект с бронепластинами"
ITEM.model = Model("models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_footlocker_panel.mdl")
ITEM.description = "Комплект бронепластин с системой автоматической установки, позволяющий в кратчайшие сроки восстановить любую броню."
ITEM.category = "Medical"
ITEM.width = 2
ITEM.height = 2
ITEM.price = 40

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		client:SetArmor(math.min(client:Armor() + 100, 100))
	end
}