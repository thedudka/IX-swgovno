ENT.Base 			= "npc_vj_creature_base"
ENT.Type 			= "ai"
ENT.PrintName 		= ""
ENT.Author 			= "Helghast Loyalist"
ENT.Contact 		= "http://steamcommunity.com/profiles/76561198180831682/"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Confederacy of Independent Systems"
ENT.VJ_CW_IsSuperBattleDroid = true

if CLIENT then
	VJ.AddKillIcon("npc_vj_cwcis_super_battle_droid", ENT.PrintName, VJ.KILLICON_DEFAULT)
end