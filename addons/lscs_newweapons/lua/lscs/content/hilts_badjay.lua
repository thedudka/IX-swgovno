local hilt = {}
hilt.PrintName = "Bandit Hilt1"
hilt.Author = "BadJay707"
hilt.id = "bandit1"
hilt.mdl = "models/plo/cwa/sabers/bandit_saber1.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1.3, -7),
            ang = Angle(-90,0,0),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1.8, -0.5, -0.1) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Bandit Hilt2"
hilt.Author = "BadJay707"
hilt.id = "bandit2"
hilt.mdl = "models/plo/cwa/sabers/bandit_saber2.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 100, 0),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1.3, -7),
            ang = Angle(-90,0,0),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1.8, -0.4, -0.1) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Bandit Hilt3"
hilt.Author = "BadJay707"
hilt.id = "bandit3"
hilt.mdl = "models/plo/cwa/sabers/bandit_saber3.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1.3, -7),
            ang = Angle(-90,0,0),
		},
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1.8, -0.5, -0.1) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(1,-0.5,1.1) ),
                dir = ent:LocalToWorldAngles( Angle(-50,0,0) ):Up(),
		length_multiplier = 0.15,
		width_multiplier = 0.3,
            },
            [3] = {
                pos = ent:LocalToWorld( Vector(1,-0.5,-1.35) ),
                dir = ent:LocalToWorldAngles( Angle(-130,0,0) ):Up(),
		length_multiplier = 0.15,
		width_multiplier = 0.3,
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Electrostaff"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "electrostaff"
hilt.mdl = "models/plo/cwa/melee/electro_staff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.65, -1.05, -10),
            ang = Angle(-90,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 10),
            ang = Angle(90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-20,-0.9,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Magnaguard Electrostaff"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "magnastaff"
hilt.mdl = "models/plo/cwa/melee/magna_staff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.65, -1.05, 3),
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
                pos = ent:LocalToWorld( Vector(-20,-0.9,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	        [2] = {
                pos = ent:LocalToWorld( Vector(29,-0.9,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Mandalorian Royal Staff"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "mandostaff"
hilt.mdl = "models/plo/cwa/melee/mandalorian_royal_staff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.65, -1.05, 3),
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
                pos = ent:LocalToWorld( Vector(-20,-0.9,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(29,-0.9,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Savage Spear"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "savagespear"
hilt.mdl = "models/plo/cwa/melee/savage_spear.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.2, -2.5, -14.7),
            ang = Angle(-90,180,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -2.5, 14.7),
            ang = Angle(90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-10,-0.9,1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Skreeji Pike"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "skreejipike"
hilt.mdl = "models/plo/cwa/melee/skreeji_pike.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.2, -2.5, -14.7),
            ang = Angle(-90,180,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -2.5, 14.7),
            ang = Angle(90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-17,-0.9,5) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Spear"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "spear"
hilt.mdl = "models/plo/cwa/melee/spear.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.2, -2.5, -0.1),
            ang = Angle(90,180,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.2, 0, -0.1),
            ang = Angle(-90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-1,0.4) ),
                dir = ent:LocalToWorldAngles( Angle(-90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Sycthe"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "sycthe"
hilt.mdl = "models/plo/cwa/melee/sycthe.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.2, -2.5, -4),
            ang = Angle(-90,180,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.2, 0, 4),
            ang = Angle(90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-36,-0.5,-5) ),
                dir = ent:LocalToWorldAngles( Angle(360,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Tusken Gaffi"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "tuskengaffi"
hilt.mdl = "models/plo/cwa/melee/tusken_gaffi.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.2, -1.3, -6),
            ang = Angle(-90,180,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.3, 14.7),
            ang = Angle(90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-13,-0.9,2.5) ),
                dir = ent:LocalToWorldAngles( Angle(370,180,0) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(25.5,-0.9,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },           
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Force Pike"
hilt.Author = "BadJay707"
hilt.Spawnable = false
hilt.id = "forcepike"
hilt.mdl = "models/plo/cwa/melee/force_pike.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.2, -0.5, -14.7),
            ang = Angle(90,0,0),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -0.5, 14.7),
            ang = Angle(-90,0,0),
        },
    },
    GetBladePos = function( ent ) 
               local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-7.5,-0.9,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )