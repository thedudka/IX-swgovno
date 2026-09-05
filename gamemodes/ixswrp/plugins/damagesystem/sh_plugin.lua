local PLUGIN = PLUGIN

PLUGIN.name = "Critical System"
PLUGIN.author = ""
PLUGIN.description = "Simple critical system."

ix.char.RegisterVar("blood", {
	field = "blood",
	fieldType = ix.type.number,
	default = 300,
	isLocal = true,
	bNoDisplay = true
})

ix.util.Include("meta/sh_critical.lua")
ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_plugin.lua")
