FACTION.name = "Clonetropper"
FACTION.description = "A clonetropper fighting for the Galactic Republic."
FACTION.color = Color(60, 50, 150)
FACTION.models = {
	"models/vjsw/galacticrepublic/clones/clonetrooper.mdl",
	"models/vjsw/galacticrepublic/clones/deltasquad/sev.mdl",
	"models/vjsw/galacticrepublic/clones/deltasquad/scorch.mdl",
	"models/vjsw/galacticrepublic/clones/deltasquad/fixer.mdl",
	"models/vjsw/galacticrepublic/clones/deltasquad/boss.mdl",
	"models/vjsw/galacticrepublic/clones/212th_clonetrooper.mdl",
	"models/vjsw/galacticrepublic/clones/clone_commando.mdl",
}
FACTION.isDefault = true
FACTION.isGloballyRecognized = true

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