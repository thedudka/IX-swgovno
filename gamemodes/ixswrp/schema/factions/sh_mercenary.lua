FACTION.name = "Mercenary"
FACTION.description = "A mercenary that fights for the Republic, because they have more money, then CIS."
FACTION.color = Color(133, 219, 21)
FACTION.models = {
	"models/player/estrella/shae_vizla.mdl",
}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

	inventory:Add("suitcase", 1)
	inventory:Add("cid", 1, {
		name = character:GetName(),
		id = id
	})
end

FACTION_MERC = FACTION.index