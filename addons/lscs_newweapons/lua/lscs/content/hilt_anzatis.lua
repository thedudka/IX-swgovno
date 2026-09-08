toCreate = { -- dont remove
	["Scourgekeeper Staff"] = {
		mdl = "models/anzati/lightsabers/dragon_staff.mdl",
		pData = {
			["RHpos"] = Vector(3.75, -1.5, 0),
			["RHang"] = Angle(-90, -90, -90),
			["LHpos"] = Vector(3.75, -1, 0),
			["LHang"] = Angle(90, 90, 90),
		},
	}, -- That is default example for needing to edit pos / ang, most dont need it. 
	["Thingy Ma-jig"] = {
		mdl = "models/anzati/lightsabers/e.mdl",
	},
	["Malgus"] = {
		mdl = "models/anzati/lightsabers/new_malgus_simple.mdl",
	},
	["Rubix Cube"] = {
		mdl = "models/anzati/lightsabers/rubix_cube.mdl",
	},
	["Slayer"] = {
		mdl = "models/anzati/lightsabers/slayer_simple.mdl",
	},
	["Tulak"] = {
		mdl = "models/anzati/lightsabers/tulak_simple.mdl",
	},
} -- dont remove


local Author = "Midnight" -- Feel free to change i dont care
local Usum = "1"
for k,v in pairs(toCreate) do
	local hilt = {}
	hilt.PrintName = k or Usum -- avoid conflict if someone fucks it up
	hilt.Author = Author
	hilt.id = k or Usum -- as said above
	hilt.mdl = v.mdl or "models/lscs/weapons/katarn.mdl" -- as said above
	hilt.info = {
		ParentData = {
			["RH"] = {
				bone = "ValveBiped.Bip01_R_Hand",
				pos = Vector(3.75, -1.5, -6.5), -- RightHandpos if needs editing.
				ang = Angle(-90, -90, -90), -- RightHandang if needs editing
			},
			["LH"] = {
				bone = "ValveBiped.Bip01_L_Hand",
				pos = Vector(3.75, -1, 6.5), -- same for left
				ang = Angle(90, 90, 90),
			},
		},
		GetBladePos = function( ent ) 

			local blades = {}
		
			for k,v in ipairs(ent:GetAttachments()) do -- loop through attachments credit to rubat
				if string.StartWith(v.name, "blade") then -- Waiting for string.StartsWith (Only on dev branch as of 28/01)
					table.insert(blades, {pos = ent:GetAttachment(v.id).Pos, dir = ent:GetAttachment(v.id).Ang:Forward()}) -- chad status
				end
				if string.StartWith(v.name, "quillon") then
					table.insert(blades, {pos = ent:GetAttachment(v.id).Pos, dir = ent:GetAttachment(v.id).Ang:Forward(), length_multiplier = 0.15,})
				end
			end
		
			return blades
		end,
	}
	print("registered " .. k)
	
	if v.pData then
		hilt.info.ParentData["RH"].pos = v.pData["RHpos"]
		hilt.info.ParentData["RH"].ang = v.pData["RHang"]
		
		hilt.info.ParentData["LH"].pos = v.pData["LHpos"]
		hilt.info.ParentData["LH"].ang = v.pData["LHang"]
	end
	LSCS:RegisterHilt( hilt ) -- register the hilt
	Usum = Usum .. "1"
	
	
	
end
print("Extra Sabers Loaded - You're welcome. And this took like an hour total effort.")