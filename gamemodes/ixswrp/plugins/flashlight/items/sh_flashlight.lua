ITEM.name = "Фонарик"
ITEM.model = Model("models/sw_battlefront/props/flashlight/flashlight.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Стандартный осветительный модуль, оснащенный системой крепления на шлем."
ITEM.category = "categoryTools"

ITEM:Hook("drop", function(item)
	item.player:Flashlight(false)
end)
