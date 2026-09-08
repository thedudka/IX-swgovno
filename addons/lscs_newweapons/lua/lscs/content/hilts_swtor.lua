toCreate = { -- dont remove
	["Antique Socorro [Dorn]"] = {
		mdl = "models/swtor/arsenic/lightsabers/antiquesocorrolightsaberdorn.mdl",
		pData = {
			["RHpos"] = Vector(3.75, -1.5, 0),
			["RHang"] = Angle(-90, -90, -90),
			["LHpos"] = Vector(3.75, -1, 0),
			["LHang"] = Angle(90, 90, 90),
		},
	}, -- That is default example for needing to edit pos / ang, most dont need it. 
	["Antique Socorro [Aurek]"] = {
		mdl = "models/swtor/arsenic/lightsabers/antiquesocorrolightsabercresh.mdl",
	},
	["Arakyd"] = {
		mdl = "models/swtor/arsenic/lightsabers/arakydsaber.mdl",
	},
	["Ardent Defender"] = {
		mdl = "models/swtor/arsenic/lightsabers/ardentdefender'slightsaber.mdl",
	},
	["Ashara"] = {
		mdl = "models/swtor/arsenic/lightsabers/ashara'slightsaber.mdl",
	},
	["Challenger"] = {
		mdl = "models/swtor/arsenic/lightsabers/challenger'slightsaber.mdl",
	},
	["Chrysopaz"] = {
		mdl = "models/swtor/arsenic/lightsabers/chrysopazlightsaber.mdl",
	},
	["Corusca"] = {
		mdl = "models/swtor/arsenic/lightsabers/coruscalightsaber.mdl",
	},
	["Defender"] = {
		mdl = "models/swtor/arsenic/lightsabers/defender'slightsaber.mdl",
	},
	["Derelict"] = {
		mdl = "models/swtor/arsenic/lightsabers/derelictlightsaber.mdl",
	},
	["Dragonpearl"] = {
		mdl = "models/swtor/arsenic/lightsabers/dragonpearllightsaber.mdl",
	},
	["Eternal Commander"] = {
		mdl = "models/swtor/arsenic/lightsabers/eternalcommandermk-4lightsaber.mdl",
	},
	["Exarch 2"] = {
		mdl = "models/swtor/arsenic/lightsabers/exarch'smk-2lightsaber.mdl",
	},
	["Executioner"] = {
		mdl = "models/swtor/arsenic/lightsabers/executioner'slightsaber.mdl",
	},
	["Fearless Retaliator"] = {
		mdl = "models/swtor/arsenic/lightsabers/fearlessretaliator'slightsaber.mdl",
	},
	["Frontier Hunter"] = {
		mdl = "models/swtor/arsenic/lightsabers/frontierhunter'slightsaber.mdl",
	},
	["Iokath"] = {
		mdl = "models/swtor/arsenic/lightsabers/geminimk-4lightsaber.mdl",
	},
	["Hiridu"] = {
		mdl = "models/swtor/arsenic/lightsabers/hiridulightsaber.mdl",
	},
	["Inscrutable"] = {
		mdl = "models/swtor/arsenic/lightsabers/inscrutablelightsaber.mdl",
	},
	["Instigator"] = {
		mdl = "models/swtor/arsenic/lightsabers/instigator'slightsaber.mdl",
	},
	["Mytag"] = {
		mdl = "models/swtor/arsenic/lightsabers/mytaglightsaber.mdl",
	},
	["Nova"] = {
		mdl = "models/swtor/arsenic/lightsabers/novalightsaber.mdl",
	},
	["Outlander"] = {
		mdl = "models/swtor/arsenic/lightsabers/outlanderlightsaber.mdl",
	},
	["Outlander 2"] = {
		mdl = "models/swtor/arsenic/lightsabers/outlanderlightsaber2.mdl",
	},
	["Overseer"] = {
		mdl = "models/swtor/arsenic/lightsabers/overseer'slightsaber.mdl",
	},
	["Pitiless Raider"] = {
		mdl = "models/swtor/arsenic/lightsabers/pitilessraiderlightsaber.mdl",
	},
	["Praetorian"] = {
		mdl = "models/swtor/arsenic/lightsabers/praetorian'slightsaber.mdl",
	},
	["Prismatic"] = {
		mdl = "models/swtor/arsenic/lightsabers/prismaticlightsaber.mdl",
	},
	["Revanite 2"] = {
		mdl = "models/swtor/arsenic/lightsabers/revanite'smk-1lightsaber.mdl",
	},
	["Righteous Prime"] = {
		mdl = "models/swtor/arsenic/lightsabers/righteousprimevallightsaber.mdl",
	},
	["Satele Shan"] = {
		mdl = "models/swtor/arsenic/lightsabers/sateleshan'ssparringlightsaber.mdl",
	},
	["Stronghold Defender"] = {
		mdl = "models/swtor/arsenic/lightsabers/strongholddefender'slightsaber.mdl",
	},
	["Thermal"] = {
		mdl = "models/swtor/arsenic/lightsabers/thermallightsabermk-3.mdl",
	},
	["Thexan"] = {
		mdl = "models/swtor/arsenic/lightsabers/thexan'slightsaber.mdl",
	},
	["Tythonian"] = {
		mdl = "models/swtor/arsenic/lightsabers/tythonianforce-master'slightsaber.mdl",
	},
	["Vindicator"] = {
		mdl = "models/swtor/arsenic/lightsabers/vindicator'slightsaber.mdl",
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