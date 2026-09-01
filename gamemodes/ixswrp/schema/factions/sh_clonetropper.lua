FACTION.name = "Clonetropper"
FACTION.description = "A clonetropper fighting for the Galactic Republic."
FACTION.color = Color(58, 125, 248)
FACTION.models = {
	"models/vjsw/galacticrepublic/clones/phase1_clonetrooper.mdl",
}
FACTION.isDefault = true
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

FACTION_CLONE = FACTION.index