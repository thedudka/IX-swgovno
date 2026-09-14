ITEM.base = "base_drink"
ITEM.name = "Таблетки-стимуляторы"
ITEM.model = "models/drugs/pillbottle_krypton.mdl"
ITEM.description = "Данный препарат был разработан для солдат с целью предоставить им энергитическую кратковременную бодрость. При применении, субъект испытывает прилив сил, что позволяет сделать решающий бросок в критической ситуации."
ITEM.cost = 4
ITEM.dUses = 3
ITEM.AddStam = 75
ITEM.AddHealth = 0
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end