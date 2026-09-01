FACTION.name = "Neutral"
FACTION.description = "Neutral species."
FACTION.color = Color(218, 215, 53)
FACTION.models = {
	"models/player/cheddar/swtor/droids/worker_droid.mdl",
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

FACTION_NEUTRAL = FACTION.index