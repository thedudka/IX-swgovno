ITEM.base = "base_drink"
ITEM.name = "Кактусовый пульке"
ITEM.model = "models/myproject/mesh_0706.mdl"
ITEM.description = "Питательная жидкость из кактусов, производимая на Мос Айсли. Горькая на вкус, но утоляет жажду очень хорошо."
ITEM.cost = 4
ITEM.dUses = 3
ITEM.AddStam = 50
ITEM.AddHealth = 0
ITEM.rarity = 1
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.category = "Еда"

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end
