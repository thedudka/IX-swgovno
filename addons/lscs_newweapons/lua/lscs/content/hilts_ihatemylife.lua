local hilt = {}
hilt.PrintName = "Vader Hilt"
hilt.Author = "Rubat"
hilt.id = "vaderhilt"
hilt.mdl = "models/sgg/starwars/weapons/w_vader_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Vader Hilt{Reverse}"
hilt.Author = "Rubat"
hilt.id = "vaderhiltr"
hilt.mdl = "models/sgg/starwars/weapons/w_vader_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Obi Wan EP 1 Hilt"
hilt.Author = "Rubat"
hilt.id = "obi1"
hilt.mdl = "models/sgg/starwars/weapons/w_obiwan_ep1_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Obi Wan EP 1 Hilt{Reverse}"
hilt.Author = "Rubat"
hilt.id = "obi1r"
hilt.mdl = "models/sgg/starwars/weapons/w_obiwan_ep1_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Anakin EP 2 Hilt"
hilt.Author = "Rubat"
hilt.id = "ani1"
hilt.mdl = "models/sgg/starwars/weapons/w_anakin_ep2_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )


local hilt = {}
hilt.PrintName = "Mauls Broken Hilt"
hilt.Author = "Rubat"
hilt.id = "maulb"
hilt.mdl = "models/sgg/starwars/weapons/w_maul_saber_half_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Mauls Broken Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "maulbr"
hilt.mdl = "models/sgg/starwars/weapons/w_maul_saber_half_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Anakin EP 2 Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "ani1r"
hilt.mdl = "models/sgg/starwars/weapons/w_anakin_ep2_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Anakin EP 3 Hilt"
hilt.Author = "Rubat"
hilt.id = "ani2"
hilt.mdl = "models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Anakin EP 3 Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "ani2r"
hilt.mdl = "models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Lukes Hilt"
hilt.Author = "Rubat"
hilt.id = "luke"
hilt.mdl = "models/sgg/starwars/weapons/w_luke_ep6_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Lukes Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "luker"
hilt.mdl = "models/sgg/starwars/weapons/w_luke_ep6_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Common Jedi Saber Hilt"
hilt.Author = "Rubat"
hilt.id = "common"
hilt.mdl = "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Common Jedi Saber Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "commonr"
hilt.mdl = "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Mace Windu Hilt"
hilt.Author = "Rubat"
hilt.id = "mace"
hilt.mdl = "models/sgg/starwars/weapons/w_mace_windu_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Mace Windu Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "macer"
hilt.mdl = "models/sgg/starwars/weapons/w_mace_windu_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Obi Wan EP 3 Hilt"
hilt.Author = "Rubat"
hilt.id = "obi2"
hilt.mdl = "models/sgg/starwars/weapons/w_obiwan_ep3_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Obi Wan EP 3 Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "obi2r"
hilt.mdl = "models/sgg/starwars/weapons/w_obiwan_ep3_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Qui Gon Jins Hilt"
hilt.Author = "Rubat"
hilt.id = "qui"
hilt.mdl = "models/sgg/starwars/weapons/w_quigon_gin_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Qui Gon Jins Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "quir"
hilt.mdl = "models/sgg/starwars/weapons/w_quigon_gin_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Darth Sidious's Hilt"
hilt.Author = "Rubat"
hilt.id = "sidious"
hilt.mdl = "models/sgg/starwars/weapons/w_sidious_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Darth Sidious's Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "sidiousr"
hilt.mdl = "models/sgg/starwars/weapons/w_sidious_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Yoda's Hilt"
hilt.Author = "Rubat"
hilt.id = "yoda"
hilt.mdl = "models/sgg/starwars/weapons/w_yoda_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Yoda's Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "yodar"
hilt.mdl = "models/sgg/starwars/weapons/w_yoda_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 5),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -2.5, -5),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dooku Hilt"
hilt.Author = "Rubat"
hilt.id = "dooku"
hilt.mdl = "models/weapons/starwars/w_dooku_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Maul Staff Hilt"
hilt.Author = "Rubat"
hilt.id = "maulstaff"
hilt.mdl = "models/weapons/starwars/w_maul_saber_staff_hilt.mdl"
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Kylo Hilt"
hilt.Author = "Rubat"
hilt.id = "kylo"
hilt.mdl = "models/weapons/starwars/w_kr_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -2),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 2),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Kylo Hilt Reverse"
hilt.Author = "Rubat"
hilt.id = "kylor"
hilt.mdl = "models/weapons/starwars/w_kr_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -1.5, 0),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Tempted Apprentice"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor1"
hilt.mdl = "models/swtor/arsenic/lightsabers/temptedapprentice'slightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Rishi"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor2"
hilt.mdl = "models/swtor/arsenic/lightsabers/rishi'slightsabermk-1.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Unstable Peacemaker"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor3"
hilt.mdl = "models/swtor/arsenic/lightsabers/unstablepeacemaker'slightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Rishi [No Handle]"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor4"
hilt.mdl = "models/swtor/arsenic/lightsabers/senyatirall'slightsaber-companion.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Defiant Technographer"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor5"
hilt.mdl = "models/swtor/arsenic/lightsabers/defianttechnographer'sshoto.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Defiant Vented"
hilt.Author = "Zyon"
hilt.id = "Defiant Vented"
hilt.mdl = "models/zyon/swtor/defiant_vented.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -2.5, -7),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -0.5, 7),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Grantek"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor6"
hilt.mdl = "models/swtor/arsenic/lightsabers/grantekf11-dlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Attenuated"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor7"
hilt.mdl = "models/swtor/arsenic/lightsabers/blademaster'sattenuatedlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ice Jewel"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor8"
hilt.mdl = "models/swtor/arsenic/lightsabers/ice-jewellightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Diabolist"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor9"
hilt.mdl = "models/swtor/arsenic/lightsabers/diabolistlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Revanite"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor10"
hilt.mdl = "models/swtor/arsenic/lightsabers/revanite'smk-2lightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dauntless Avenger"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor11"
hilt.mdl = "models/swtor/arsenic/lightsabers/dauntlessavenger'slightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Blademaster"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor12"
hilt.mdl = "models/swtor/arsenic/lightsabers/artusianlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Exarch"
hilt.Author = "ArsenicBeast"
hilt.id = "swtor13"
hilt.mdl = "models/swtor/arsenic/lightsabers/exarch'smk-1lightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(0,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Corp Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors1"
hilt.mdl = "models/swtor/arsenic/lightsabers/adascorppolesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -14),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 14),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.5,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(25,-0.7,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Descendent's Heirloom"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors2"
hilt.mdl = "models/swtor/arsenic/lightsabers/descendant'sheirloomdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -18),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -2, 18),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.5,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(32.5,-0.7,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Defiant Technographer Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors3"
hilt.mdl = "models/swtor/arsenic/lightsabers/defianttechnographer'sdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -13),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 13),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.5,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(25,-0.7,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Defiant Vented Saberstaff"
hilt.Author = "Zyon"
hilt.id = "Defiant Vented Saberstaff"
hilt.mdl = "models/zyon/swtor/defiant_vented_dual.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.75, -2.5, -3.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.75, -1, 3.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Warmaster Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors4"
hilt.mdl = "models/swtor/arsenic/lightsabers/warmaster'sdoublebladedlightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -13),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 13),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Vigorous Battler Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors5"
hilt.mdl = "models/swtor/arsenic/lightsabers/vigorousbattlerdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -19),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 19),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Rishi Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors6"
hilt.mdl = "models/swtor/arsenic/lightsabers/rishi'smk-1polesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -17),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 17),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(2,-0.5,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(32.5,-0.7,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Antique Socorro Saberstaff [Aurek]"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors7"
hilt.mdl = "models/swtor/arsenic/lightsabers/antiquesocorrosaberstaffaurek.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Antique Socorro Saberstaff [Dorn]"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors8"
hilt.mdl = "models/swtor/arsenic/lightsabers/antiquesocorrosaberstaffdorn.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ardent Defender Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors9"
hilt.mdl = "models/swtor/arsenic/lightsabers/ardentdefender'sdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Attuned Forcelord"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors10"
hilt.mdl = "models/swtor/arsenic/lightsabers/attunedforcelord'ssaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -17),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 17),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Attenuated Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors11"
hilt.mdl = "models/swtor/arsenic/lightsabers/blademaster'sattenuatedsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Bubble Blade"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors12"
hilt.mdl = "models/swtor/arsenic/lightsabers/artusiansaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -13),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 13),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Chrysopaz Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors13"
hilt.mdl = "models/swtor/arsenic/lightsabers/chrysopazsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Conqueror Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors14"
hilt.mdl = "models/swtor/arsenic/lightsabers/conqueror'ssaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -13.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 13.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Corusca Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors15"
hilt.mdl = "models/swtor/arsenic/lightsabers/coruscasaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Derelict Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors16"
hilt.mdl = "models/swtor/arsenic/lightsabers/derelictsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Dragonpearl Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors17"
hilt.mdl = "models/swtor/arsenic/lightsabers/dragonpearlsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Elegant Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors18"
hilt.mdl = "models/swtor/arsenic/lightsabers/elegantmodifieddoublebladedsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Etched Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors19"
hilt.mdl = "models/swtor/arsenic/lightsabers/etchedduelerdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Eternal Commander Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors20"
hilt.mdl = "models/swtor/arsenic/lightsabers/eternalcommandermk-14saberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Exposed Reckoning Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors21"
hilt.mdl = "models/swtor/arsenic/lightsabers/reckoning'sexposedsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -10),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 10),
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
hilt.PrintName = "Exposed Retribution Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors22"
hilt.mdl = "models/swtor/arsenic/lightsabers/retribution'sexposedsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -17),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 17),
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
hilt.PrintName = "Exquisite Champion Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors23"
hilt.mdl = "models/swtor/arsenic/lightsabers/exquisitechampiondualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Fearless Retaliator Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors24"
hilt.mdl = "models/swtor/arsenic/lightsabers/fearlessretaliator'ssaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Frontier Hunter Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors25"
hilt.mdl = "models/swtor/arsenic/lightsabers/frontierhunter'sdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Grantek Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors26"
hilt.mdl = "models/swtor/arsenic/lightsabers/grantekf11-ddualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Herald Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors27"
hilt.mdl = "models/swtor/arsenic/lightsabers/herald'spolesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -14),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 14),
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
hilt.PrintName = "Hermit Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors28"
hilt.mdl = "models/swtor/arsenic/lightsabers/hermit'spolesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -14),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 14),
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
hilt.PrintName = "Hiridu Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors29"
hilt.mdl = "models/swtor/arsenic/lightsabers/hiridusaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -18),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 18),
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
hilt.PrintName = "Indomitable Vanquisher Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors30"
hilt.mdl = "models/swtor/arsenic/lightsabers/indomitablevanquisher'ssaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Inscrutable Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors31"
hilt.mdl = "models/swtor/arsenic/lightsabers/inscrutabledualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -13),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 13),
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
hilt.PrintName = "Iokath Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors32"
hilt.mdl = "models/swtor/arsenic/lightsabers/iokathmk-4saberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -16),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 16),
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
hilt.PrintName = "Occultist Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors33"
hilt.mdl = "models/swtor/arsenic/lightsabers/occultists'polesabermk1.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Outlander Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors34"
hilt.mdl = "models/swtor/arsenic/lightsabers/outlanderpolesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Outlander Saberstaff 2"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors35"
hilt.mdl = "models/swtor/arsenic/lightsabers/outlanderpolesaber2.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Prophet Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors36"
hilt.mdl = "models/swtor/arsenic/lightsabers/prophet'sstarforgeddualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -11),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 11),
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
hilt.PrintName = "Redeemer Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors37"
hilt.mdl = "models/swtor/arsenic/lightsabers/redeemer'sstarforgeddualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Revanite Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors38"
hilt.mdl = "models/swtor/arsenic/lightsabers/revanite'smk-2polesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Revanite Saberstaff 2"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors39"
hilt.mdl = "models/swtor/arsenic/lightsabers/revanite'smk-1polesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Satele Shan Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors40"
hilt.mdl = "models/swtor/arsenic/lightsabers/sateleshan'sdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -19),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 19),
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
hilt.PrintName = "Stronghold Defender Sabestaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors41"
hilt.mdl = "models/swtor/arsenic/lightsabers/strongholddefender'ssaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Tempted Apprentice Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors42"
hilt.mdl = "models/swtor/arsenic/lightsabers/temptedapprentice'sdualsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -12),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 12),
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
hilt.PrintName = "Unsealed Serenity Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors43"
hilt.mdl = "models/swtor/arsenic/lightsabers/serenity'sunsealedsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Unsealed Vengeance Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors44"
hilt.mdl = "models/swtor/arsenic/lightsabers/vengeance'sunsealedsaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -16),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 16),
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
hilt.PrintName = "Vindicator Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors45"
hilt.mdl = "models/swtor/arsenic/lightsabers/vindicator'ssaberstaff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -12),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 12),
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
hilt.PrintName = "Wanderer"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors46"
hilt.mdl = "models/swtor/arsenic/lightsabers/custom-builtdoublebladedsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Zakuulan Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors47"
hilt.mdl = "models/swtor/arsenic/lightsabers/zakuulan'smk-1polesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Zakuulan Saberstaff 2"
hilt.Author = "ArsenicBeast"
hilt.id = "swtors48"
hilt.mdl = "models/swtor/arsenic/lightsabers/zakuulan'smk-2polesaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Dark Reverie Saberstaff"
hilt.Author = "ArsenicBeast"
hilt.id = "darkreverie"
hilt.mdl = "models/swtor/arsenic/lightsabers/darkreveriedoublebladedsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
hilt.PrintName = "Jedi Academy 1"
hilt.Author = "Captain Charles"
hilt.id = "ja1"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_9_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 8),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 2"
hilt.Author = "Captain Charles"
hilt.id = "ja2"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_7_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 8),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 3"
hilt.Author = "Captain Charles"
hilt.id = "ja3"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_6_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -9),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 9),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 4"
hilt.Author = "Captain Charles"
hilt.id = "ja4"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_5_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -9),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 9),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 5"
hilt.Author = "Captain Charles"
hilt.id = "ja5"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_4_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -7),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 7),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 6"
hilt.Author = "Captain Charles"
hilt.id = "ja6"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_3_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 8),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 7"
hilt.Author = "Captain Charles"
hilt.id = "ja7"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_1_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 8"
hilt.Author = "Captain Charles"
hilt.id = "ja8"
hilt.mdl = "models/sgg/starwars/weapons/w_reborn_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -10),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 10),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy 9"
hilt.Author = "Captain Charles"
hilt.id = "ja9"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_2_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -2, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(1,-0.6,-0.1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy Staff 1"
hilt.Author = "ArsenicBeast"
hilt.id = "jas1"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_dual_1_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy Staff 2"
hilt.Author = "ArsenicBeast"
hilt.id = "jas2"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_dual_2_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy Staff 3"
hilt.Author = "ArsenicBeast"
hilt.id = "jas3"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_dual_3_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy Staff 4"
hilt.Author = "ArsenicBeast"
hilt.id = "jas4"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_dual_4_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Jedi Academy Staff 5"
hilt.Author = "ArsenicBeast"
hilt.id = "jas5"
hilt.mdl = "models/sgg/starwars/weapons/w_saber_dual_5_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 0),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Days"
hilt.Author = "Zhrom"
hilt.id = "zhrom"
hilt.mdl = "models/zhrom/days/days.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Knowledge Seeker"
hilt.Author = "Zhrom"
hilt.id = "zhrom2"
hilt.mdl = "models/zhrom/the knowledge seeker/the knowledge seeker.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Crimson Reaper"
hilt.Author = "Zhrom"
hilt.id = "zhrom3"
hilt.mdl = "models/zhrom/unknown/unknown.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Royal Blade"
hilt.Author = "Zhrom"
hilt.id = "zhrom4"
hilt.mdl = "models/zhrom/lightsaber3/lightsaber3.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -9),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 9),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Dark Wanderer"
hilt.Author = "Zhrom"
hilt.id = "zhrom5"
hilt.mdl = "models/zhrom/lightsaber/lightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Sanguine Blade"
hilt.Author = "Zyon"
hilt.id = "The Sanguine Blade"
hilt.mdl = "models/zyon/misc/vampire_slayer.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Templar"
hilt.Author = "Zyon"
hilt.id = "Templar"
hilt.mdl = "models/zyon/misc/templar.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Tarnux"
hilt.Author = "Zyon"
hilt.id = "Tarnux"
hilt.mdl = "models/zyon/swtor/tarnux.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -0.5, -8),
            ang = Angle(-90, -90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Tarnux Saberstaff"
hilt.Author = "Zyon"
hilt.id = "Tarnux Saberstaff"
hilt.mdl = "models/zyon/swtor/tarnux_dual.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -0.5, -10),
            ang = Angle(-90, -90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 10),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Tarnux Staff"
hilt.Author = "Zyon"
hilt.id = "Tarnux Staff"
hilt.mdl = "models/zyon/swtor/tarnux_staff.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -0.5, -10),
            ang = Angle(-90, -90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -0.5, 10),
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
LSCS:RegisterHilt( hilt )


local hilt = {}
hilt.PrintName = "The Ringed Hilt"
hilt.Author = "Zhrom"
hilt.id = "zhrom6"
hilt.mdl = "models/zhrom/lightsaber2/lightsaber2.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -6.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 6.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Golden Snake Pike"
hilt.Author = "ArsenicBeast"
hilt.id = "zhromgoldsnake"
hilt.mdl = "models/zhrom/snake/snake.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -12),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Green Snakes Pike"
hilt.Author = "ArsenicBeast"
hilt.id = "zhromgreensnake"
hilt.mdl = "models/zhrom/snake2/snake2.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -12),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "The Pike"
hilt.Author = "ArsenicBeast"
hilt.id = "zhrompike3"
hilt.mdl = "models/zhrom/pike/pike.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Slim Dwarf Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber1"
hilt.mdl = "models/wos/lct/weapons/lightsabers/dwarf_saber_duel_slim_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dwarf Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber2"
hilt.mdl = "models/wos/lct/weapons/lightsabers/dwarf_saber_duel_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dwarf"
hilt.Author = "Octavius"
hilt.id = "Dwarf"
hilt.mdl = "models/wos/lct/weapons/lightsabers/dwarf_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.75, -2.5, -5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.75, -2.5, 5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Gold Snake Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber3"
hilt.mdl = "models/wos/lct/weapons/lightsabers/gold_snake_duel_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dragon Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber4"
hilt.mdl = "models/wos/lct/weapons/lightsabers/dragon_saber_duel_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.5, -1.5, -15),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.5, -1, 15),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dragon Saber"
hilt.Author = "Octavius"
hilt.id = "Dragon Saber"
hilt.mdl = "models/wos/lct/weapons/lightsabers/dragon_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -2, -5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -2, 5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Old Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber5"
hilt.mdl = "models/wos/lct/weapons/lightsabers/old_saber_duel.mdl"
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Blade Weaver Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber6"
hilt.mdl = "models/wos/lct/weapons/lightsabers/blue_blade_weaver_duel_hilt.mdl"
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Blade Weaver"
hilt.Author = "Octavius"
hilt.id = "fsaber7"
hilt.mdl = "models/wos/lct/weapons/lightsabers/blue_blade_weaver_hilt.mdl"
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ancient Dragon"
hilt.Author = "Octavius"
hilt.id = "fsaber8"
hilt.mdl = "models/wos/lct/weapons/lightsabers/ancient_dragon_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.75, -1, -4),
            ang = Angle(-90, 10, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.75, -3, 4),
            ang = Angle(90, -10, 90),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ancient Dragon Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber9"
hilt.mdl = "models/wos/lct/weapons/lightsabers/ancient_dragon_duel_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1, -2),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 2),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Woven"
hilt.Author = "Octavius"
hilt.id = "fsaber10"
hilt.mdl = "models/wos/lct/weapons/lightsabers/wooden_duel.mdl"
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
                pos = ent:LocalToWorld( Vector(-10,-0.05,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(10,-0.05,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,-180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Bone Antlers Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber11"
hilt.mdl = "models/wos/lct/weapons/lightsabers/bone_saber_duel_antlers_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1, -14),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 14),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Bone Saberstaff"
hilt.Author = "Octavius"
hilt.id = "fsaber12"
hilt.mdl = "models/wos/lct/weapons/lightsabers/bone_saber_duel_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1, -14),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 14),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Bone Saber"
hilt.Author = "Octavius"
hilt.id = "Bone Saber"
hilt.mdl = "models/wos/lct/weapons/lightsabers/bone_saber_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -8),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 8),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ahsoka's First Hilt"
hilt.Author = "Midnight"
hilt.id = "hiltahsoka"
hilt.mdl = "models/saber_ashoka1/saber_ashoka1.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -1),
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -1),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-6.5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,0,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ahsoka's First Hilt{Reverse}"
hilt.Author = "Midnight"
hilt.id = "reversehiltahsoka"
hilt.mdl = "models/saber_ashoka1/saber_ashoka1.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.1, -1.25, 2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.1, -1.25, -2),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-6.5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,0,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Byph Hilt"
hilt.Author = "InGame"
hilt.id = "hiltbyph"
hilt.mdl = "models/saber_byph/saber_byph.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.1, -1.25, -2), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.1, -1.25, 2),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-6.5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Byph Hilt - Reverse"
hilt.Author = "InGame"
hilt.id = "reversehiltbyph"
hilt.mdl = "models/saber_byph/saber_byph.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, 2),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1.5, -2),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-6.5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(-90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )


local hilt = {}
hilt.PrintName = "Crystal Hilt"
hilt.Author = "InGame"
hilt.id = "hiltcrystal"
hilt.mdl = "models/saber_crystal/saber_crystal.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.1, -1.25, -4), -- into palm direction | Left and right | up on and down in hand
            ang = Angle(90, 90, 90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.1, -1.25, 4),
            ang = Angle(-90, -90, -90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-6.5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,0,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )


local hilt = {}
hilt.PrintName = "Crystal Hilt - Reverse"
hilt.Author = "InGame"
hilt.id = "reversehiltcrystal"
hilt.mdl = "models/saber_crystal/saber_crystal.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.1, -1.5, 3),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.1, -1.5, -3),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-6.5,0,0) ),
                dir = ent:LocalToWorldAngles( Angle(90,0,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Ashla"
hilt.Author = "InGame"
hilt.id = "ashla"
hilt.mdl = "models/zyon/swtor/ashla.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.75, -2, -8.5), 
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.75, -1.5, 8.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Bogan"
hilt.Author = "InGame"
hilt.id = "bogan"
hilt.mdl = "models/zyon/swtor/bogan_d.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.75, -2, -8.5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.75, -1.5, 8.5),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Battlerager"
hilt.Author = "InGame"
hilt.id = "Battlerager"
hilt.mdl = "models/zhrom/dylanxd/dylanxd.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(4, -1.5, -13),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(4, -1.5, 13),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Cartel"
hilt.Author = "InGame"
hilt.id = "Cartel"
hilt.mdl = "models/swtor/arsenic/lightsabers/senyatirall'slightsaber-cartel.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -13),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3.75, -1, 13),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Conqueror"
hilt.Author = "InGame"
hilt.id = "Conqueror"
hilt.mdl = "models/swtor/arsenic/lightsabers/conqueror'slightsaber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3.75, -1.5, -5),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.75, -1.5, 5),
            ang = Angle(90, 90, -90),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Dawnbreaker"
hilt.Author = "InGame"
hilt.id = "Dawnbreaker"
hilt.mdl = "models/zyon/misc/dawnbreaker.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(2.5, -2, -6),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(2.5, -1, 6),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Old Saber"
hilt.Author = "InGame"
hilt.id = "Old Saber"
hilt.mdl = "models/wos/lct/weapons/lightsabers/old_saber.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -2, -4),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -2, 4),
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
LSCS:RegisterHilt( hilt )

local hilt = {}
hilt.PrintName = "Precise Insurgent"
hilt.Author = "Zyon"
hilt.id = "Precise Insurgent"
hilt.mdl = "models/zyon/swtor/precise_insurgent.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -2, -4),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, 0, 4),
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
LSCS:RegisterHilt( hilt )