ITEM.base = "base_consumable"
ITEM.name = "Food"
ITEM.category = "categoryFood"
ITEM.useTime = 0
ITEM.useSound = "sound/npc/barnacle/barnacle_crunch3.wav"

function ITEM:OnRegistered()
	self.functions.Use.name = "Съесть"
end
