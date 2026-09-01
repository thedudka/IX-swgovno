FACTION.name = "Droid"
FACTION.description = "Typical droid that stands with the Republic."
FACTION.color = Color(7, 112, 112)
FACTION.models = {
"models/player/cheddar/swtor/droids/purification_droid.mdl",
"models/player/cheddar/swtor/droids/bodyguard_droid.mdl",
"models/player/cheddar/swtor/droids/enforcer_droid.mdl",
"models/player/cheddar/swtor/droids/heavy_assault_droid.mdl",
"models/player/cheddar/swtor/droids/hunter_droid.mdl",
"models/player/cheddar/swtor/droids/slicer_droid.mdl",
"models/player/cheddar/swtor/droids/temple_guardian_droid.mdl", 
"models/player/cheddar/swtor/droids/welder_droid.mdl",
"models/player/cheddar/swtor/droids/worker_droid.mdl"

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

FACTION_ROBOT = FACTION.index