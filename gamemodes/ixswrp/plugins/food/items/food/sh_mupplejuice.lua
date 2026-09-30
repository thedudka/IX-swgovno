ITEM.base = "base_drink"
ITEM.name = "Маппловый сок"
ITEM.model = "models/myproject/mesh_0704.mdl"
ITEM.description = "Бутыль мапплового розового сока. Неизвестно, какое он отношение имеет к одноименным животным, но напиток освежает."
ITEM.category = "Еда"
ITEM.cost = 4
ITEM.dUses = 3
ITEM.AddStam = 35
ITEM.AddHealth = 3
ITEM.rarity = 2
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end