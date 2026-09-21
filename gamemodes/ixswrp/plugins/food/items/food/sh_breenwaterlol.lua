ITEM.base = "base_drink"
ITEM.name = "Содовая вода"
ITEM.model = "models/props_junk/PopCan01a.mdl"
ITEM.description = "Банка содовой воды корпорации Брин Индастриз®, которая заключила контракт с Республикой на поставку данной продукции подразделениям клонов. Качество оставляет желать лучшего."
ITEM.cost = 4
ITEM.dUses = 3
ITEM.AddStam = 15
ITEM.AddHealth = 0
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.category = "Еда"

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end
