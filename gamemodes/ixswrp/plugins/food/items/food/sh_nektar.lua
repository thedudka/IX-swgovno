ITEM.base = "base_drink"
ITEM.name = "Нектар"
ITEM.model = "models/myproject/mesh_0705.mdl"
ITEM.description = "Алтуннский нектар в удобной бумажной упаковке с трубочкой. Густой и питательный."
ITEM.cost = 4
ITEM.category = "Еда"
ITEM.dUses = 4
ITEM.AddStam = 25
ITEM.AddHealth = 5
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end