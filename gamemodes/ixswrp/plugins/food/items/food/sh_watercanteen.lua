ITEM.base = "base_drink"
ITEM.name = "Фляжка с водой"
ITEM.model = "models/food/canteen.mdl"
ITEM.description = "Стандартная фляжка в которой налита вода. При марш-бросках это лучший способ утолить не только жажду, но и получить запас сил.  "
ITEM.cost = 4
ITEM.dUses = 5
ITEM.AddStam = 35
ITEM.AddHealth = 0
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.category = "Еда"

function ITEM:OnRegistered()
	self.functions.Use.name = "Выпить"
end
