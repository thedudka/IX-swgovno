local hilt = {}
hilt.PrintName = "Exposed Retribution"
hilt.Author = "SWTOR"
hilt.id = "Exposed Retribution"
hilt.mdl = "models/swtor/arsenic/lightsabers/retribution'sexposedlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 10),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) local blades = {}
		
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Exposed Reckoning"
hilt.Author = "SWTOR"
hilt.id = "Exposed Reckoning"
hilt.mdl = "models/swtor/arsenic/lightsabers/reckoning'sexposedlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -5), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) local blades = {}
		
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Tythian"
hilt.Author = "SWTOR"
hilt.id = "Tythian"
hilt.mdl = "models/swtor/arsenic/lightsabers/tythianlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -12), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1, 12),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) local blades = {}
		
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Unsealed Vengeance"
hilt.Author = "SWTOR"
hilt.id = "Unsealed Vengeance"
hilt.mdl = "models/swtor/arsenic/lightsabers/vengeance'sunsealedlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1, 8),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) local blades = {}
		
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Warden"
hilt.Author = "SWTOR"
hilt.id = "Warden"
hilt.mdl = "models/swtor/arsenic/lightsabers/warden'slightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1, 8),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) local blades = {}
		
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ziost Guardian"
hilt.Author = "SWTOR"
hilt.id = "Ziost Guardian"
hilt.mdl = "models/swtor/arsenic/lightsabers/ziostguardian'slightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1, 8),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) local blades = {}
		
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
LSCS:RegisterHilt( hilt )