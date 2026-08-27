
ITEM.name = "Аптечка"
ITEM.model = Model("models/props/starwars/weapons/detpack.mdl")
ITEM.description = "Стандартная полевая аптечка, способная вылечить малые раны."
ITEM.category = "Medical"
ITEM.price = 18

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 20, 100))
	end
}
