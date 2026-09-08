local hilt = {}
hilt.PrintName = "Agamemnon Insolence"
hilt.Author = "Midnight"
hilt.id = "agamemnon"
hilt.mdl = "models/wos/lct/weapons/lightsabers/agamemnon_insolence.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 6),
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
hilt.PrintName = "Trisaber"
hilt.Author = "Midnight"
hilt.id = "Trisaber"
hilt.mdl = "models/anzati/lightsabers/trisaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1.5, -4), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1.5, 4),
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
hilt.PrintName = "Ancient Vibrosword"
hilt.Author = "Midnight"
hilt.id = "ancientvibro"
hilt.mdl = "models/anzati/lightsabers/vibrosword.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, -4, -5), -- up or down | Left(-) and right | backward or forward(-)
            ang = Angle(180, 0, 90), -- I HATE LUA I HATE LUA I HATE LUA
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.5, 0.5, 5),
            ang = Angle(0, 180, 90),
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
hilt.PrintName = "Aztec"
hilt.Author = "Midnight"
hilt.id = "Aztec"
hilt.mdl = "models/anzati/lightsabers/osnova.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.75, -0.5, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.75, -3, 0),
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
hilt.PrintName = "Crimson Reforged"
hilt.Author = "Midnight"
hilt.id = "Crimson Reforged"
hilt.mdl = "models/anzati/lightsabers/revan_b.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.6, -0.3, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.6, -3, 0),
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
hilt.PrintName = "Scrapped Forager"
hilt.Author = "Midnight"
hilt.id = "Scrapped Forager"
hilt.mdl = "models/anzati/lightsabers/revan_a.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -110),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5, -4, 0),
            ang = Angle(90, 90, 110),
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
hilt.PrintName = "Croc"
hilt.Author = "Midnight"
hilt.id = "croc"
hilt.mdl = "models/wos/lct/weapons/lightsabers/croc_estrella.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -3, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -20),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -1, 10),
            ang = Angle(90, 90, 210),
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
hilt.PrintName = "Cyclops Deception"
hilt.Author = "Midnight"
hilt.id = "cyclops"
hilt.mdl = "models/wos/lct/weapons/lightsabers/cyclops_deception.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2.5, -9), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 9),
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
hilt.PrintName = "Guardstaff"
hilt.Author = "Midnight"
hilt.id = "guardstaff"
hilt.mdl = "models/wos/lct/weapons/lightsabers/guardstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(1, -5, 5), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(1, 2, -5),
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
hilt.PrintName = "Hanzo"
hilt.Author = "Midnight"
hilt.id = "hanzo"
hilt.mdl = "models/wos/lct/weapons/lightsabers/hanzo_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1.5, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1, 10),
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
hilt.PrintName = "Helen Betrayal"
hilt.Author = "Midnight"
hilt.id = "helen"
hilt.mdl = "models/wos/lct/weapons/lightsabers/helen_betrayal.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.2, -2, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -2.2, 10),
            ang = Angle(90, -90, 90),
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
hilt.PrintName = "Blood Ritual Saberstaff"
hilt.Author = "Midnight"
hilt.id = "juzastaff"
hilt.mdl = "models/wos/lct/weapons/lightsabers/custom_juza_double.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, 0, 8),
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
hilt.PrintName = "Blood Ritual"
hilt.Author = "Midnight"
hilt.id = "juza"
hilt.mdl = "models/wos/lct/weapons/lightsabers/custom_juza_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -7), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, 0, 7),
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
hilt.PrintName = "Valkyrie Saberstaff"
hilt.Author = "Midnight"
hilt.id = "valkstaff"
hilt.mdl = "models/wos/lct/weapons/lightsabers/custom_whiskey_double.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, -0.5, 8),
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
hilt.PrintName = "Valkyrie"
hilt.Author = "Midnight"
hilt.id = "valk"
hilt.mdl = "models/wos/lct/weapons/lightsabers/custom_whiskey_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, -0.5, 10),
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
hilt.PrintName = "Jedi Archivist"
hilt.Author = "Midnight"
hilt.id = "jediarchivist"
hilt.mdl = "models/wos/lct/weapons/lightsabers/j_archivist.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.75, -2.5, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -2, 10),
            ang = Angle(90, 90, -90),
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
hilt.PrintName = "Sith Archivist"
hilt.Author = "Midnight"
hilt.id = "sitharchivist"
hilt.mdl = "models/wos/lct/weapons/lightsabers/s_archivist.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.75, -2.5, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -2, 10),
            ang = Angle(90, 90, -90),
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
hilt.PrintName = "Keyblade"
hilt.Author = "Midnight"
hilt.id = "keyblade"
hilt.mdl = "models/wos/lct/weapons/lightsabers/keyblade.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -3, -9), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1.5, 9),
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
hilt.PrintName = "Longclaw"
hilt.Author = "Midnight"
hilt.id = "longclaw"
hilt.mdl = "models/wos/lct/weapons/lightsabers/longclaw.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, -5), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, 5),
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
hilt.PrintName = "Peryite"
hilt.Author = "Midnight"
hilt.id = "meliodas"
hilt.mdl = "models/wos/lct/weapons/lightsabers/meliodas_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -3.1, -5), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, 90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5, -3.1, 5),
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
hilt.PrintName = "Pandora"
hilt.Author = "Midnight"
hilt.id = "pandora"
hilt.mdl = "models/wos/lct/weapons/lightsabers/pandora_plunder_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -3, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 10),
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
hilt.PrintName = "Queen's Web"
hilt.Author = "Midnight"
hilt.id = "queenweb"
hilt.mdl = "models/wos/lct/weapons/lightsabers/queen_web_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -1.5, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, -1.5, 0),
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
hilt.PrintName = "Theo Saberstaff"
hilt.Author = "Midnight"
hilt.id = "theodual"
hilt.mdl = "models/wos/lct/weapons/lightsabers/theo_dual.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -1.5, -15), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -2, 15),
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
hilt.PrintName = "Treant's Guard"
hilt.Author = "Midnight"
hilt.id = "Treant's Guard"
hilt.mdl = "models/anzati/nabbypike2/nabbypike2.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1.5, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1.5, 6),
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
hilt.PrintName = "Sacred Treasure"
hilt.Author = "Midnight"
hilt.id = "sacredtreasure"
hilt.mdl = "models/wos/lct/weapons/lightsabers/sacred_treasure_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -9), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -1, 9),
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
hilt.PrintName = "Uchigatana"
hilt.Author = "Midnight"
hilt.id = "uchigatana"
hilt.mdl = "models/wos/lct/weapons/lightsabers/uchigatana.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.8, -2.5, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.8, -1, 10),
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
hilt.PrintName = "Uchigatana"
hilt.Author = "Midnight"
hilt.id = "uchigatana"
hilt.mdl = "models/wos/lct/weapons/lightsabers/uchigatana.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.8, -2.5, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.8, -1, 10),
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

--[[ LSCS:RegisterHilt( hilt )local hilt = {}
hilt.PrintName = "Umbrella"
hilt.Author = "Anzati"
hilt.id = "Umbrella"
hilt.mdl = "models/lightsabers/expgamer/expgamer_umbrella.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1, -10), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1, 10),
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
LSCS:RegisterHilt( hilt ) ]]--

local hilt = {}
hilt.PrintName = "Consular's Mender"
hilt.Author = "Midnight"
hilt.id = "consularsmender"
hilt.mdl = "models/wos/lct/weapons/lightsabers/consularsmender.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1.5, -1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1.5, 1),
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
hilt.PrintName = "Crow's Bane"
hilt.Author = "Midnight"
hilt.id = "grenth"
hilt.mdl = "models/wos/lct/weapons/lightsabers/darthgrenth.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -1.5, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -1.5, 8),
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
hilt.PrintName = "Crow's Bane Saberstaff"
hilt.Author = "Midnight"
hilt.id = "grenthstaff"
hilt.mdl = "models/wos/lct/weapons/lightsabers/darthgrenthdual.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -1.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -1.5, 2),
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
hilt.PrintName = "Gold Deceiver Saberstaff"
hilt.Author = "Midnight"
hilt.id = "deceiverstaff"
hilt.mdl = "models/wos/lct/weapons/lightsabers/deciver_gold_dual.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -2.5, -9), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -2.5, 9),
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
hilt.PrintName = "Gold Deceiver"
hilt.Author = "Midnight"
hilt.id = "deceiver"
hilt.mdl = "models/wos/lct/weapons/lightsabers/deciver_gold_single.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -1.5, -1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -1.5, 1),
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
hilt.PrintName = "Kopavi Saberstaff"
hilt.Author = "Midnight"
hilt.id = "kopavistaff"
hilt.mdl = "models/wos/lct/weapons/lightsabers/kopavi_a.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, -1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, 1),
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
hilt.PrintName = "Kopavi"
hilt.Author = "Midnight"
hilt.id = "kopavi"
hilt.mdl = "models/wos/lct/weapons/lightsabers/kopavi_half.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, -1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, -1),
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
hilt.PrintName = "Gold Kopavi Saberstaff"
hilt.Author = "Midnight"
hilt.id = "gkopavistaff"
hilt.mdl = "models/wos/lct/weapons/lightsabers/kopavi_gold_dual.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, -1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, 1),
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
hilt.PrintName = "Gold Kopavi"
hilt.Author = "Midnight"
hilt.id = "gkopavi"
hilt.mdl = "models/wos/lct/weapons/lightsabers/kopavi_gold_single.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, -1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, -1),
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
hilt.PrintName = "Tulak Saberstaff"
hilt.Author = "Anzati"
hilt.id = "Tulak Saberstaff"
hilt.mdl = "models/anzati/lightsabers/tulak_double.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, -13), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, 13),
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
hilt.PrintName = "Woven Blade"
hilt.Author = "Midnight"
hilt.id = "woveng"
hilt.mdl = "models/anzati/lightsabers/talon_green.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3, 0),
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
hilt.PrintName = "Woven Blade Pure"
hilt.Author = "Midnight"
hilt.id = "wovenp"
hilt.mdl = "models/anzati/lightsabers/talon_red.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3, 0),
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
hilt.PrintName = "Woven Blade Balanced"
hilt.Author = "Midnight"
hilt.id = "wovenw"
hilt.mdl = "models/anzati/lightsabers/talon_blue.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3, 0),
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
hilt.PrintName = "Magic"
hilt.Author = "Midnight"
hilt.id = "magicuh"
hilt.mdl = "models/anzati/sgn/lightsabers/blackcat_magichilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(20, 45, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, 90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(20, -45, 0),
            ang = Angle(90, -90, 90),
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
hilt.PrintName = "Crusader"
hilt.Author = "Midnight"
hilt.id = "crusader"
hilt.mdl = "models/anzati/crusader/crusader.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 0),
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
hilt.PrintName = "Eviscerator"
hilt.Author = "Midnight"
hilt.id = "eviscerator"
hilt.mdl = "models/anzati/beasttamer/beasttamer.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 0),
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
hilt.PrintName = "Sabertooth"
hilt.Author = "Midnight"
hilt.id = "sabertooth"
hilt.mdl = "models/anzati/sgn/lightsabers/devestator.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -4, 6),
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
hilt.PrintName = "Renboga Staff"
hilt.Author = "Midnight"
hilt.id = "renboga"
hilt.mdl = "models/anzati/sgn/lightsabers/dijonhilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5, 1, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5, -3, 0),
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
hilt.PrintName = "Rey Staff"
hilt.Author = "Midnight"
hilt.id = "Rey Staff"
hilt.mdl = "models/anzati/lightsabers/rey_staff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5, 1, 6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5, -3, -6),
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
hilt.PrintName = "Hyperion"
hilt.Author = "Midnight"
hilt.id = "hyperion"
hilt.mdl = "models/anzati/tau_1.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.5, 0),
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
hilt.PrintName = "Lyon"
hilt.Author = "Midnight"
hilt.id = "lyon"
hilt.mdl = "models/anzati/lightsabers/lyon.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3, 2),
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
hilt.PrintName = "Necromancer's Staff"
hilt.Author = "Midnight"
hilt.id = "hydro"
hilt.mdl = "models/anzati/sgn/lightsabers/hydro_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, 0, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.5, -3, 2),
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
hilt.PrintName = "Fatebringer"
hilt.Author = "Midnight"
hilt.id = "kanye"
hilt.mdl = "models/anzati/sgn/lightsabers/kanye_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, 0.8, -1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.6, -3, 1),
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
hilt.PrintName = "Krayt"
hilt.Author = "Midnight"
hilt.id = "krayt"
hilt.mdl = "models/anzati/sgn/lightsabers/krayt_single.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.5, -3, 2),
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
hilt.PrintName = "Krayt Saberstaff"
hilt.Author = "Midnight"
hilt.id = "krayts"
hilt.mdl = "models/anzati/sgn/lightsabers/krayt_double.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, 0.5, -1.5), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.5, -3, 1.5),
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
hilt.PrintName = "Priest"
hilt.Author = "Midnight"
hilt.id = "priest"
hilt.mdl = "models/anzati/jesus/jesus.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 0),
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
hilt.PrintName = "Beskar Gauntlet"
hilt.Author = "Midnight"
hilt.id = "beskar"
hilt.mdl = "models/anzati/lightsabers/yellowheart.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -3, -2), -- up and down | Left and right | up on and down in hand
            ang = Angle(90, 45, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -3, -2),
            ang = Angle(90, 45, -90),
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
hilt.PrintName = "Artifact"
hilt.Author = "Midnight"
hilt.id = "artifact"
hilt.mdl = "models/anzati/39.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6.5, 0, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6.5, -4, 2),
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
hilt.PrintName = "Clockwork"
hilt.Author = "Midnight"
hilt.id = "clockwork"
hilt.mdl = "models/anzati/arn_1.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, -3), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -4, 2.5),
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
hilt.PrintName = "Champion"
hilt.Author = "Midnight"
hilt.id = "mtx8"
hilt.mdl = "models/anzati/mtx_8.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, 0.5), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -4, 0.5),
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
hilt.PrintName = "Keeper of the Vault"
hilt.Author = "Midnight"
hilt.id = "vaultkeeper"
hilt.mdl = "models/anzati/lightsabers/blue_gray.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.5, 0),
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
hilt.PrintName = "Corvax"
hilt.Author = "Midnight"
hilt.id = "corvax"
hilt.mdl = "models/anzati/lightsabers/corvax.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0, 1), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.5, -1),
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
hilt.PrintName = "The Dark King"
hilt.Author = "Midnight"
hilt.id = "darkking"
hilt.mdl = "models/anzati/lightsabers/darkking.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1.5, 2),
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
hilt.PrintName = "Maw"
hilt.Author = "Midnight"
hilt.id = "maw"
hilt.mdl = "models/anzati/lightsabers/maw.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5, 1, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5, -3, 2),
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
hilt.PrintName = "Ogara Pike"
hilt.Author = "Midnight"
hilt.id = "ogara"
hilt.mdl = "models/anzati/lightsabers/ogarapike.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, 1, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.5, -3, 0),
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
hilt.PrintName = "Dragon Skull"
hilt.Author = "Midnight"
hilt.id = "Dragon Skull"
hilt.mdl = "models/zyon/misc/dragon.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -1, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -2, 6),
            ang = Angle(90, 90, -90),
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
hilt.PrintName = "Elegant Guardian"
hilt.Author = "Midnight"
hilt.id = "elegantblue"
hilt.mdl = "models/anzati/sgn/lightsabers/elegant_blue.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.2, 2),
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
hilt.PrintName = "Elegant Consular"
hilt.Author = "Midnight"
hilt.id = "elegantgreen"
hilt.mdl = "models/anzati/sgn/lightsabers/elegant_green.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.2, 2),
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
hilt.PrintName = "Elegant Sentinel"
hilt.Author = "Midnight"
hilt.id = "elegantorange"
hilt.mdl = "models/anzati/sgn/lightsabers/elegant_orange.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.2, 2),
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
hilt.PrintName = "Elegant Balanced"
hilt.Author = "Midnight"
hilt.id = "elegantpurple"
hilt.mdl = "models/anzati/sgn/lightsabers/elegant_purple.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.2, 2),
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
hilt.PrintName = "Elegant Sith"
hilt.Author = "Midnight"
hilt.id = "elegantred"
hilt.mdl = "models/anzati/sgn/lightsabers/elegant_red.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.2, 2),
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
hilt.PrintName = "Elegant Pure"
hilt.Author = "Midnight"
hilt.id = "elegantwhite"
hilt.mdl = "models/anzati/sgn/lightsabers/elegant_white.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.2, 2),
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
hilt.PrintName = "Elegant Templeguard"
hilt.Author = "Midnight"
hilt.id = "elegantyellow"
hilt.mdl = "models/anzati/sgn/lightsabers/elegant_yellow.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(6, 0.5, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(6, -3.2, 2),
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
hilt.PrintName = "Malgus Saberstaff"
hilt.Author = "Anzati"
hilt.id = "Malgus Saberstaff"
hilt.mdl = "models/anzati/lightsabers/new_malgus_double.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -2, 0), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -2, 0),
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
hilt.PrintName = "Eizen Axe Saberstaff"
hilt.Author = "Dreamplay"
hilt.id = "Eizen Axe Saberstaff"
hilt.mdl = "models/dreamplay/eizen_axe_double_hilt/custom_eizen_axe_double_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -7), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 7),
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
hilt.PrintName = "Eizen Axe"
hilt.Author = "Dreamplay"
hilt.id = "Eizen Axe"
hilt.mdl = "models/dreamplay/eizen_axe_hilt/custom_eizen_axe_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -7), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 7),
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
hilt.PrintName = "Logir"
hilt.Author = "Dreamplay"
hilt.id = "Logir"
hilt.mdl = "models/dreamplay/ganchy_modern_hilt/custom_ganchy_modern_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -9), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 9),
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
hilt.PrintName = "Vortund"
hilt.Author = "Dreamplay"
hilt.id = "Vortund"
hilt.mdl = "models/dreamplay/ganchy_modern_double_hilt/custom_ganchy_modern_double_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -9), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 9),
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
hilt.PrintName = "Neutral Blade"
hilt.Author = "Dreamplay"
hilt.id = "Neutral Blade"
hilt.mdl = "models/dreamplay/dwayne_commando_hilt/custom_dwayne_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 8),
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
hilt.PrintName = "Neutral Saberstaff"
hilt.Author = "Dreamplay"
hilt.id = "Neutral Saberstaff"
hilt.mdl = "models/dreamplay/dwayne_commando_double_hilt/custom_dwayne_double_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 8),
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
hilt.PrintName = "Tranquility"
hilt.Author = "Dreamplay"
hilt.id = "Tranquility"
hilt.mdl = "models/dreamplay/hydrofusions_tranquility_hilt/custom_hydrofusions_tranquility_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, 0, 8),
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
hilt.PrintName = "Revan Triedge"
hilt.Author = "Dreamplay"
hilt.id = "Revan Triedge"
hilt.mdl = "models/dreamplay/revan_triedge_hilt/custom_revan_triedge_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2, -2, -8), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2, -0.5, 8),
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
hilt.PrintName = "Scourgekeeper"
hilt.Author = "Anzati"
hilt.id = "Scourgekeeper"
hilt.mdl = "models/anzati/dragon/dragon.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -2, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -2, 6),
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
hilt.PrintName = "Silver Rune"
hilt.Author = "Zyon"
hilt.id = "Silver Rune"
hilt.mdl = "models/zyon/misc/sapphire.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -3, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1, 6),
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
hilt.PrintName = "Unstable Vented"
hilt.Author = "Zyon"
hilt.id = "Unstable Vented"
hilt.mdl = "models/zyon/swtor/unstable_vented.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 6),
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
hilt.PrintName = "Vaylin"
hilt.Author = "Zyon"
hilt.id = "Vaylin"
hilt.mdl = "models/zyon/swtor/vaylin.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 6),
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
hilt.PrintName = "Winged"
hilt.Author = "Zyon"
hilt.id = "Winged"
hilt.mdl = "models/zyon/misc/winged.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -6), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 6),
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
hilt.PrintName = "Slayer Saberstaff"
hilt.Author = "Anzati"
hilt.id = "Slayer Saberstaff"
hilt.mdl = "models/anzati/lightsabers/slayer.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1.5, -12.5), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1.5, 12.5),
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