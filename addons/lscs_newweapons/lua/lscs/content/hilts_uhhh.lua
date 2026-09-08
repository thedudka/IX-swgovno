toCreate = { -- dont remove
	["Maul"] = {
		mdl = "models/weapons/starwars/w_maul_saber_staff_hilt.mdl",
		pData = {
			["RHpos"] = Vector(3.75, -1.5, 0),
			["RHang"] = Angle(-90, -90, -90),
			["LHpos"] = Vector(3.75, -1, 0),
			["LHang"] = Angle(90, 90, 90),
		},
	}, -- Maul is default example for needing to edit pos / ang, most dont need it. 
	["Borthtwin"] = {	
		mdl = "models/zhrom/borth-twin/borth-twin.mdl",
	},
	["Dani"] = {
		mdl = "models/zhrom/dani/dani.mdl",
	},
	["Dante"] = {
		mdl = "models/zhrom/dante/dante.mdl",
	},
	["Noble Pike"] = {
		mdl = "models/zhrom/donation1/donation1.mdl",
	},
	["Warrior Pike"] = {
		mdl = "models/zhrom/donation2/donation2.mdl",
	},
	["Criss Cross"] = {
		mdl = "models/zhrom/donation3/donation3.mdl",
	},
	["Jesus Pike"] = {
		mdl = "models/zhrom/donation4/donation4.mdl",
	},
	["Pristine Staff"] = {
		mdl = "models/zhrom/donation7/donation7.mdl",
	},
	["Mysterious"] = {
		mdl = "models/zhrom/lightsaber4/lightsaber4.mdl",
	},
	["Punisher"] = {
		mdl = "models/zhrom/the grand saber/the grand saber.mdl",
	},
	["Theo"] = {
		mdl = "models/zhrom/theo/theo.mdl",
	},
	["Trident"] = {
		mdl = "models/zhrom/trident/trident.mdl",
	},
	["Twinsaber"] = {
		mdl = "models/zhrom/twinsaber/twinsaber.mdl",
	},
	["Wooden Staff"] = {
		mdl = "models/wos/lct/weapons/lightsabers/wooden_staff.mdl",
	},
	["Karn Staff"] = {
		mdl = "models/wos/lct/weapons/lightsabers/karn_staff_hilt.mdl",
	},
	["Gold Snake"] = {
		mdl = "models/wos/lct/weapons/lightsabers/gold_snake_hilt.mdl",
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