toCreate = { -- dont remove
	["Staffcross Guardian"] = {
		mdl = "models/anzati/sgn/lightsabers/staffcross_blue.mdl",
	},
	["Staffcross Consular"] = {
		mdl = "models/anzati/sgn/lightsabers/staffcross_green.mdl",
	},
	["Staffcross Sentinel"] = {
		mdl = "models/anzati/sgn/lightsabers/staffcross_orange.mdl",
	},
	["Staffcross Balanced"] = {
		mdl = "models/anzati/sgn/lightsabers/staffcross_purple.mdl",
	},
	["Staffcross Sith"] = {
		mdl = "models/anzati/sgn/lightsabers/staffcross_red.mdl",
	},
	["Staffcross Pure"] = {
		mdl = "models/anzati/sgn/lightsabers/staffcross_white.mdl",
	},
	["Staffcross Templeguard"] = {
		mdl = "models/anzati/sgn/lightsabers/staffcross_yellow.mdl",
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
				pos = Vector(6, 0, -2), -- RightHandpos if needs editing.
				ang = Angle(-90, -90, -90), -- RightHandang if needs editing
			},
			["LH"] = {
				bone = "ValveBiped.Bip01_L_Hand",
				pos = Vector(6, -4, 2), -- same for left
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