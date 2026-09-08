local hilt = {}
hilt.PrintName = "Gold Gauntlet"
hilt.Author = "Zhrom"
hilt.id = "Gold Gauntlet"
hilt.mdl = "models/zhrom/donation gauntlet/donation gauntlet.mdl"
hilt.info = {
    ParentData = {	
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -7), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, -7),
            ang = Angle(-90, -90, -90),
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
hilt.PrintName = "Silver Gauntlet"
hilt.Author = "Zhrom"
hilt.id = "Silver Gauntlet"
hilt.mdl = "models/zhrom/gauntlet/gauntlet.mdl"
hilt.info = {
    ParentData = {	
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -7), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, -7),
            ang = Angle(-90, -90, -90),
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
