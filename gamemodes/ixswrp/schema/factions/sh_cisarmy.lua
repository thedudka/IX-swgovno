FACTION.name = "CIS Army"
FACTION.description = "CIS army."
FACTION.color = Color(39, 13, 17)
FACTION.models = {
	"models/lt_c/sci_fi/humans/female_01.mdl",
	"models/lt_c/sci_fi/humans/female_02.mdl",
	"models/lt_c/sci_fi/humans/female_03.mdl",
	"models/lt_c/sci_fi/humans/female_04.mdl",
	"models/lt_c/sci_fi/humans/female_fang.mdl",
	"models/lt_c/sci_fi/humans/female_hawke.mdl",
	"models/lt_c/sci_fi/humans/female_wraith.mdl",
	"models/lt_c/sci_fi/humans/female_zoey.mdl",

	"models/lt_c/sci_fi/humans/male_09.mdl",
	"models/lt_c/sci_fi/humans/male_08.mdl",
	"models/lt_c/sci_fi/humans/male_07.mdl",
	"models/lt_c/sci_fi/humans/male_06.mdl",
	"models/lt_c/sci_fi/humans/male_05.mdl",
	"models/lt_c/sci_fi/humans/male_04.mdl",
	"models/lt_c/sci_fi/humans/male_03.mdl",
	"models/lt_c/sci_fi/humans/male_02.mdl",
	"models/lt_c/sci_fi/humans/male_01.mdl",
	"models/lt_c/sci_fi/humans/male_bill.mdl",
	"models/lt_c/sci_fi/humans/male_mp1.mdl",
	"models/lt_c/sci_fi/humans/male_louis.mdl",

	"models/star_wars_battlefront/sides/geo/geonosian.mdl",
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

FACTION_CIS = FACTION.index