local hilt = {}
hilt.PrintName = "Grand Inquisitor"
hilt.Author = "Miller"
hilt.id = "inq"
hilt.mdl = "models/star/venator/inqusitor_saber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 0),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Inquisitor Saberstaff"
hilt.Author = "Miller"
hilt.id = "inqdouble"
hilt.mdl = "models/wos/icypineapple/inquisitor_saber_double/inquisitor_saber_double.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 0),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Inquisitor Single"
hilt.Author = "Miller"
hilt.id = "inqsingle"
hilt.mdl = "models/wos/icypineapple/inquisitor_saber/inquisitor_saber_single.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 0),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Electrostaff"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "staffel"
hilt.mdl = "models/tfa/comm/gg/prp_magna_guard_weapon_season4.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(90,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-30,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(30,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Purge Electrostaff"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "purgestaff"
hilt.mdl = "models/anzati/lightsabers/electrostaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, -3, 0),
            ang = Angle(90,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.5, -3.5, 0),
            ang = Angle(90,0,0),
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
hilt.PrintName = "Electrohammer"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "elechammer"
hilt.mdl = "models/anzati/lightsabers/hammer.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(5.5, 0, 28),
            ang = Angle(-90,-90,-90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(5.5, -3, -28),
            ang = Angle(90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-55,2,5) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(-55,2,1) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
	   [3] = {
                pos = ent:LocalToWorld( Vector(-46,2,1) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
	   [4] = { -- Top blade
                pos = ent:LocalToWorld( Vector(-80,2,-5) ),
                dir = ent:LocalToWorldAngles( Angle(0,-180,0) ):Up(),
            },
	   [5] = { -- Blade at the top
                pos = ent:LocalToWorld( Vector(-70,2,5) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [6] = {
                pos = ent:LocalToWorld( Vector(-64,2,5) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [7] = {
                pos = ent:LocalToWorld( Vector(-37,2,1) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
	   [8] = {
                pos = ent:LocalToWorld( Vector(-29,2,1) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
	   [9] = {
                pos = ent:LocalToWorld( Vector(-21,2,1) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
	   [10] = {
                pos = ent:LocalToWorld( Vector(-12,2,1) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Riot Baton"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "riotbaton"
hilt.mdl = "models/anzati/lightsabers/riotbaton.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(90,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(90,0,0),
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
hilt.PrintName = "VibroSword"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "vibrosword1"
hilt.mdl = "models/red menace/fallenorder/props/purgetrooper/dagger.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, 0),
            ang = Angle(180,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, 0),
            ang = Angle(0,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,0,5) ),
                dir = ent:LocalToWorldAngles( Angle(0,0,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )



local hilt = {}
hilt.PrintName = "VibroSword Reverse"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "vibrosword2"
hilt.mdl = "models/red menace/fallenorder/props/purgetrooper/dagger.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, 0),
            ang = Angle(0,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1.5, 0),
            ang = Angle(180,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,0,5) ),
                dir = ent:LocalToWorldAngles( Angle(0,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )


local hilt = {}
hilt.PrintName = "VibroBat"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "vibrobat"
hilt.mdl = "models/jajoff/sps/cgicum/vibrobaseball.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, 0, -6),
            ang = Angle(270,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, 0, -6),
            ang = Angle(270,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-25,-2,0.5) ),
                dir = ent:LocalToWorldAngles( Angle(270,0,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )


local hilt = {}
hilt.PrintName = "Vibro Katana"
hilt.Author = "Miller"
hilt.Spawnable = false
hilt.id = "vibrokatana"
hilt.mdl = "models/jajoff/sps/cgicum/vibrokatana.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -2, -6),
            ang = Angle(270,270,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -2, -6),
            ang = Angle(270,270,0),
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