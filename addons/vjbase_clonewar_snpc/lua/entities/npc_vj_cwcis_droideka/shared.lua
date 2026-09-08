ENT.Base 			= "npc_vj_creature_base" -- Full list of bases is in the base, or go back to this link and read the list: https://saludos.sites.google.com/site/vrejgaming/makingvjbaseaddon
ENT.Type 			= "ai"
ENT.PrintName 		= ""
ENT.Author 			= "Helghast Loyalist"
ENT.Contact 		= "http://steamcommunity.com/profiles/76561198180831682/"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Confederacy of Independent Systems"
ENT.VJ_CW_IsDroideka = true
ENT.VJ_NPC_Class = {"CLASS_CIS"}

if CLIENT then
	VJ.AddKillIcon("npc_vj_cwcis_droideka", ENT.PrintName, VJ.KILLICON_DEFAULT)
end