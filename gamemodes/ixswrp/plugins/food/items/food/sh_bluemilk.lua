ITEM.base = "base_drink"
ITEM.name = "Голубое молоко"
ITEM.model = "models/food/blue_milk.mdl"
ITEM.description = "Стакан молока голубого цвета, производимое млекопитающим Бантой. Очень распространено во всей Галактике."
ITEM.category = "Еда"
ITEM.cost = 4
ITEM.dUses = 2
ITEM.AddStam = 40
ITEM.AddHealth = 0
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end