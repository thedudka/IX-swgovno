local hilt = {}
hilt.PrintName = "Aayla Secura"
hilt.Author = "Ink"
hilt.id = "aayla"
hilt.mdl = "models/aayla_secura/aayla_secura_hilt.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 7),
			ang = Angle(90, -7, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, 0, 0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Aayla Secura{Reverse}"
hilt.Author = "Ink"
hilt.id = "aaylareverse"
hilt.mdl = "models/aayla_secura/aayla_secura_hilt.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, 7),
			ang = Angle(90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, 0, 0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Adi Gallia"
hilt.Author = "Ink"
hilt.id = "gallia"
hilt.mdl = "models/plo/cwa/sabers/adi_gallia.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 7),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -0, 0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Adi Gallia{Reverse}"
hilt.Author = "Ink"
hilt.id = "galliareverse"
hilt.mdl = "models/plo/cwa/sabers/adi_gallia.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, 7),
			ang = Angle(90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, -7),
			ang = Angle(-90, 0, 10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, 0, 0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ahsoka's Second Hilt"
hilt.Author = "Ink"
hilt.id = "ahsoka"
hilt.mdl = "models/plo/cwa/sabers/ahsoka_saber.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 7),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2.5, -0.5, 0) ),
                dir = ent:LocalToWorldAngles( Angle(-90, 0, 0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ahsoka's Second Hilt{Reverse}'"
hilt.Author = "Ink"
hilt.id = "ahsokareverse"
hilt.mdl = "models/plo/cwa/sabers/reverseahsoka.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, 7),
			ang = Angle(90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1.8, 0, -0.37) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Barriss Offee"
hilt.Author = "Ink"
hilt.id = "barriss"
hilt.mdl = "models/plo/cwa/sabers/barriss_saber.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1.3, 7),
			ang = Angle(90, 7, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.5, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -10, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Barriss Offee{Reverse}"
hilt.Author = "Ink"
hilt.id = "barrissreverse"
hilt.mdl = "models/plo/cwa/sabers/barriss_saber.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, 7),
			ang = Angle(90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.5, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -10, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dooku"
hilt.Author = "Ink"
hilt.id = "dooku"
hilt.mdl = "models/plo/cwa/sabers/count_dooku.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(4.25, -1.5, 1),
			ang = Angle(8, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Eeth"
hilt.Author = "Ink"
hilt.id = "eeth"
hilt.mdl = "models/plo/cwa/sabers/eeth_koth.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1.3, 7),
			ang = Angle(90, -7, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ganodi"
hilt.Author = "Ink"
hilt.id = "ganodi"
hilt.mdl = "models/plo/cwa/sabers/ganodi.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 7),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Gungi"
hilt.Author = "Ink"
hilt.id = "gungi"
hilt.mdl = "models/plo/cwa/sabers/gungi.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -8),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jocasta"
hilt.Author = "Ink"
hilt.id = "jocasta"
hilt.mdl = "models/plo/cwa/sabers/jocastanu.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Kenobi"
hilt.Author = "Ink"
hilt.id = "kenobi"
hilt.mdl = "models/plo/cwa/sabers/obi_wan_kenobi.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Kitfisto"
hilt.Author = "Ink"
hilt.id = "kitfisto"
hilt.mdl = "models/plo/cwa/sabers/kitfisto.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Kyle Katarn"
hilt.Author = "Ink"
hilt.id = "kylekatarn"
hilt.mdl = "models/plo/cwa/sabers/kyle_katarn.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Low Quality Luke Skywalker"
hilt.Author = "Ink"
hilt.id = "luke2"
hilt.mdl = "models/plo/cwa/sabers/luke_skywalker.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Luminara"
hilt.Author = "Ink"
hilt.id = "luminara"
hilt.mdl = "models/plo/cwa/sabers/luminara.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Maul Double Hilt"
hilt.Author = "Ink"
hilt.id = "mauldouble"
hilt.mdl = "models/plo/cwa/sabers/maul_double_blade.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
	GetBladePos = function( ent )
			local blades = {
			[1] = {
                pos = ent:LocalToWorld( Vector(-5, -0.4, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(17, -0.4, 0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },	
		}
			return blades
	end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Maul"
hilt.Author = "Ink"
hilt.id = "maul"
hilt.mdl = "models/plo/cwa/sabers/darthmaul.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Mundi"
hilt.Author = "Ink"
hilt.id = "mundi"
hilt.mdl = "models/plo/cwa/sabers/ki_adi_mundi.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Plo"
hilt.Author = "Ink"
hilt.id = "plo"
hilt.mdl = "models/plo/cwa/sabers/plo_k.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Quinlan Vos"
hilt.Author = "Ink"
hilt.id = "quinlan"
hilt.mdl = "models/plo/cwa/sabers/quinlan_vos.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Saesee Tiin"
hilt.Author = "Ink"
hilt.id = "saeseetiin"
hilt.mdl = "models/plo/cwa/sabers/saeseetiin.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Savage Hilt"
hilt.Author = "Ink"
hilt.id = "savage"
hilt.mdl = "models/plo/cwa/sabers/savage_hilt.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -6),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 6),
			ang = Angle(90, 0, -10),
		},
	},
	GetBladePos = function( ent )
			local blades = {
			[1] = {
                pos = ent:LocalToWorld( Vector(-5, -0.4, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(17, -0.4, 0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },	
		}
			return blades
	end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Shaak Ti"
hilt.Author = "Ink"
hilt.id = "shaakti"
hilt.mdl = "models/plo/cwa/sabers/shaakti.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Shaak Ti - Reverse"
hilt.Author = "Ink"
hilt.id = "shaaktir"
hilt.mdl = "models/plo/cwa/sabers/shaakti.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, -8),
			ang = Angle(-90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ventress"
hilt.Author = "Ink"
hilt.id = "ventress"
hilt.mdl = "models/plo/cwa/sabers/ventress.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -2, -7),
			ang = Angle(-90, 170, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Windu"
hilt.Author = "Ink"
hilt.id = "windu"
hilt.mdl = "models/plo/cwa/sabers/mace_windu.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Yoda"
hilt.Author = "Ink"
hilt.id = "yoda1"
hilt.mdl = "models/plo/cwa/sabers/grand_master_yoda.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1, -6),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1, 6),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Exile"
hilt.Author = "Ink"
hilt.id = "exile"
hilt.mdl = "models/plo/cwa/sabers/exile.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -9),
			ang = Angle(-90, 0, 110),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.2, -1, 9),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Felucia 1"
hilt.Author = "Ink"
hilt.id = "felucia1"
hilt.mdl = "models/plo/cwa/sabers/felucia1.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -2, 7),
			ang = Angle(90, -180, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Felucia 2"
hilt.Author = "Ink"
hilt.id = "felucia2"
hilt.mdl = "models/plo/cwa/sabers/felucia2.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -2, 7),
			ang = Angle(90, -180, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Forked"
hilt.Author = "Ink"
hilt.id = "forked"
hilt.mdl = "models/plo/cwa/sabers/forked.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1, 7),
			ang = Angle(90, -7, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Gungan"
hilt.Author = "Ink"
hilt.id = "gungan"
hilt.mdl = "models/plo/cwa/sabers/gungan.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -9),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 9),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Kashyyyk"
hilt.Author = "Ink"
hilt.id = "kashyyyk"
hilt.mdl = "models/plo/cwa/sabers/kashyyyk.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 150, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Katana"
hilt.Author = "Ink"
hilt.id = "katana"
hilt.mdl = "models/plo/cwa/sabers/katana_saber.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Katooni"
hilt.Author = "Ink"
hilt.id = "katooni"
hilt.mdl = "models/plo/cwa/sabers/katooni.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Lightside Affiliation"
hilt.Author = "Ink"
hilt.id = "lightside"
hilt.mdl = "models/plo/cwa/sabers/lightsideaffiliation.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -1.3, 8),
			ang = Angle(90, -170, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Nelona Hilt"
hilt.Author = "Ink"
hilt.id = "nelona"
hilt.mdl = "models/plo/cwa/sabers/nelona.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
	GetBladePos = function( ent )
			local blades = {
			[1] = {
                pos = ent:LocalToWorld( Vector(-5, -0.4, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(17, -0.4, 0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },	
		}
			return blades
	end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Petro"
hilt.Author = "Ink"
hilt.id = "pretro"
hilt.mdl = "models/plo/cwa/sabers/petro.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Pulsating Blue"
hilt.Author = "Ink"
hilt.id = "pulsatingblue"
hilt.mdl = "models/plo/cwa/sabers/pulsatingblue.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Pulsating"
hilt.Author = "Ink"
hilt.id = "pulsating"
hilt.mdl = "models/plo/cwa/sabers/pulsating.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Samurai"
hilt.Author = "Ink"
hilt.id = "samurai"
hilt.mdl = "models/plo/cwa/sabers/samurai.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 170, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Sparkling"
hilt.Author = "Ink"
hilt.id = "sparkling"
hilt.mdl = "models/plo/cwa/sabers/sparklingcrystal.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Spiralling"
hilt.Author = "Ink"
hilt.id = "spiralling"
hilt.mdl = "models/plo/cwa/sabers/spiralling.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Survivor"
hilt.Author = "Ink"
hilt.id = "survivor"
hilt.mdl = "models/plo/cwa/sabers/survivor_saber.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Talz"
hilt.Author = "Ink"
hilt.id = "talz"
hilt.mdl = "models/plo/cwa/sabers/talz.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Training"
hilt.Author = "Ink"
hilt.id = "training"
hilt.mdl = "models/plo/cwa/sabers/training.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Unstable"
hilt.Author = "Ink"
hilt.id = "unstable"
hilt.mdl = "models/plo/cwa/sabers/unstable.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Zatt"
hilt.Author = "Ink"
hilt.id = "zatt"
hilt.mdl = "models/plo/cwa/sabers/zatt.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Zebra"
hilt.Author = "Ink"
hilt.id = "zebra"
hilt.mdl = "models/plo/cwa/sabers/zebra.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 8),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dark Force Phase 1"
hilt.Author = "Ink"
hilt.id = "darkforce1"
hilt.mdl = "models/plo/cwa/sabers/darkforcephase1.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 7),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dark Forces"
hilt.Author = "Ink"
hilt.id = "darkforces"
hilt.mdl = "models/plo/cwa/sabers/dark_forces_double.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 7),
			ang = Angle(90, 0, -10),
		},
	},
	GetBladePos = function( ent )
			local blades = {
			[1] = {
                pos = ent:LocalToWorld( Vector(-5, -0.4, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(17, -0.4, 0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },	
		}
			return blades
	end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dark Force Phase 2"
hilt.Author = "Ink"
hilt.id = "darkforce2"
hilt.mdl = "models/plo/cwa/sabers/darkforcephase2.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 7),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dark Knight Phase 1"
hilt.Author = "Ink"
hilt.id = "darkknight1"
hilt.mdl = "models/plo/cwa/sabers/darkknight1.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 7),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dark Knight Phase 2"
hilt.Author = "Ink"
hilt.id = "darkknight2"
hilt.mdl = "models/plo/cwa/sabers/darkknight2.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -7),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 7),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Darksaber Ancient"
hilt.Author = "Ink"
hilt.id = "darksaberancient"
hilt.mdl = "models/plo/cwa/sabers/darksaber_ancient.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -9),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 9),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Darksaber Golden"
hilt.Author = "Ink"
hilt.id = "darksabergolden"
hilt.mdl = "models/plo/cwa/sabers/darksaber_golden.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -9),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 9),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Darksaber"
hilt.Author = "Ink"
hilt.id = "darksaber"
hilt.mdl = "models/plo/cwa/sabers/darksaber.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -9),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3.5, -1.3, 9),
			ang = Angle(90, 0, -10),
		},
	},
GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2, -0.7, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Sith Afiiliate Hilt"
hilt.Author = "Ink"
hilt.id = "sithaffliate"
hilt.mdl = "models/plo/cwa/sabers/sith_affiliate.mdl"
hilt.info = {
	ParentData = {
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3, -1.3, -6),
			ang = Angle(-90, 7, 10),
		},
		["LH"] = {
			bone = "ValveBiped.Bip01_L_Hand",
			pos = Vector(3, -0.5, 6),
			ang = Angle(90, 0, -10),
		},
	},
	GetBladePos = function( ent )
			local blades = {
			[1] = {
                pos = ent:LocalToWorld( Vector(-5, -0.4, -0.2) ),
                dir = ent:LocalToWorldAngles( Angle(-90, -7, 10) ):Up(),
            },
            [2] = {
                pos = ent:LocalToWorld( Vector(17, -0.4, 0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },	
		}
			return blades
	end,
}
LSCS:RegisterHilt( hilt )