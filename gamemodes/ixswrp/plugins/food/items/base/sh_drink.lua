ITEM.base = "base_consumable"
ITEM.name = "Drink"
ITEM.category = "categoryDrink"
ITEM.useTime = 0

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end
