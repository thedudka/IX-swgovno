FACTION.name = "Republic Commando"
FACTION.description = "Elite special forces of the Republic."
FACTION.color = Color(3, 107, 3)
FACTION.models = {
"models/vjsw/galacticrepublic/clones/clone_commando.mdl",
"models/vjsw/galacticrepublic/clones/clone_commando_mp_a.mdl",
"models/vjsw/galacticrepublic/clones/clone_commando_mp_b.mdl",
"models/vjsw/galacticrepublic/clones/clone_commando_mp_c.mdl",
"models/vjsw/galacticrepublic/clones/clone_commando_mp_d.mdl",
}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

FACTION_COMMANDO = FACTION.index

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()

	inventory:Add("handheld_radio", 1)
end