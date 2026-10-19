ENT.Base 			= "npc_vj_creature_base" -- List of all base types: https://github.com/DrVrej/VJ-Base/wiki/Base-Types
ENT.Type 			= "ai"
ENT.PrintName 		= ""
ENT.Author 			= "Helghast Loyalist"
ENT.Contact 		= "http://steamcommunity.com/profiles/76561198180831682/"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Galactic Republic"
ENT.VJ_NPC_Class = {"CLASS_REPUBLIC"}
ENT.VJ_ID_Turret = true

if CLIENT then
	VJ.AddKillIcon("npc_vj_cwrep_sentry_gun", ENT.PrintName, VJ.KILLICON_DEFAULT)
end