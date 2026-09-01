FACTION.name = "Republic Forces"
FACTION.description = "Republic forces."
FACTION.color = Color(8, 235, 121)
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

FACTION_REPUBLIC = FACTION.index