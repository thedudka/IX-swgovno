FACTION.name = "Droid"
FACTION.description = "A CIS droid."
FACTION.color = Color(161, 0, 13)
FACTION.models = {
"models/vjsw/confederacyofindependentsystems/battle_droid.mdl",
"models/vjsw/confederacyofindependentsystems/battle_droid_assassin.mdl",
"models/vjsw/confederacyofindependentsystems/battle_droid_commander.mdl",
"models/vjsw/confederacyofindependentsystems/battle_droid_engineer.mdl",
"models/vjsw/confederacyofindependentsystems/battle_droid_rocketeer.mdl",
}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

FACTION.npcRelations = {
	["npc_turret_floor"] = D_NU,
	["npc_combine_camera"] = D_NU,
	["npc_turret_ceiling"] = D_NU,
	["npc_rollermine"] = D_NU,
	["npc_helicopter"] = D_NU,
	["npc_combinegunship"] = D_NU,
	["npc_strider"] = D_NU,
	["npc_vj_cwcis_battle_droid_assasin"] = D_LI,
	["npc_vj_cwcis_battle_droid_engineer"] = D_LI,
	["npc_vj_cwcis_battle_droid_rocketeer"] = D_LI,
	["npc_vj_cwcis_battle_droid_commando"] = D_LI,
	["npc_vj_cwcis_super_battle_droid"] = D_LI,
	["npc_vj_cwcis_magna_guard"] = D_LI,
	["npc_vj_cwcis_sentry_gun"] = D_LI,
	["npc_vj_cwcis_droideka"] = D_LI,
	["npc_vj_cwcis_advanced_dwarf_spider_droid"] = D_LI,
	["npc_vj_cwcis_homing_spider_droid"] = D_LI,
	["npc_vj_cwcis_dwarf_spider_droid"] = D_LI,
	["npc_hunter"] = D_NU,
	["npc_manhack"] = D_LI
}

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

FACTION_DROID = FACTION.index