
local PLUGIN = PLUGIN

PLUGIN.name = "Custom Items Upgraded"
PLUGIN.author = "Gary Tate x Kub"
PLUGIN.description = "Enables staff members to create custom items."
PLUGIN.readme = [[
Enables staff members to create custom items.
]]

ix.util.Include("sv_creation.lua")
ix.util.Include("sv_templates.lua")
ix.util.Include("cl_menu.lua")

if (SERVER) then
	util.AddNetworkString("ixCustomItemOpenMenu")
	util.AddNetworkString("ixCustomItemConfirm")
	util.AddNetworkString("ixCustomItemTplListRequest")
	util.AddNetworkString("ixCustomItemTplListNames")
	util.AddNetworkString("ixCustomItemTplSave")
	util.AddNetworkString("ixCustomItemTplDelete")
	util.AddNetworkString("ixCustomItemTplLoadRequest")
	util.AddNetworkString("ixCustomItemTplLoadResponse")
end

ix.command.Add("CreateCustomItem", {
	description = "@cmdCreateCustomItem",
	superAdminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.string,
		ix.type.text
	},
	OnRun = function(self, client, name, model, description)
		client:GetCharacter():GetInventory():Add("customitem", 1, {
			name = name,
			model = model,
			description = description
		})
	end
})

ix.command.Add("CreateCustomItemUpgraded", {
	description = "@cmdCreateCustomItemUpgraded",
	adminOnly = true,
	OnRun = function(self, client)
		net.Start("ixCustomItemOpenMenu")
		net.Send(client)
	end
})
