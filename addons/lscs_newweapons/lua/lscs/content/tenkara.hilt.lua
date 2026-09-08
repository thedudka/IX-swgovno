local hilt = {}
hilt.PrintName = "Vethar Trident"
hilt.Author = "Dreamplay"
hilt.id = "eri"
hilt.mdl = "models/dreamplay/vethar_trident_hilt/custom_vethar_trident_hilt.mdl"
hilt.info = {
    ParentData = {
        ["RH"] = {
            bone = "ValveBiped.Bip01_R_Hand",
            pos = Vector(3, -2, 0),
            ang = Angle(-90, -90, -90),
        },
        ["LH"] = {
            bone = "ValveBiped.Bip01_L_Hand",
            pos = Vector(3, -1, 0),
            ang = Angle(90, 90, 90),
        },
    },
    GetBladePos = function( ent ) 
        local blades = {
            [1] = {
                pos = ent:LocalToWorld( Vector(-30,-1,1) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
	   [2] = {
                pos = ent:LocalToWorld( Vector(-30,-1,3.95) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
       [3] = {
                pos = ent:LocalToWorld( Vector(-30,-1,-3) ),
                dir = ent:LocalToWorldAngles( Angle(90,180,0) ):Up(),
            },
        }

        return blades
    end,
}
LSCS:RegisterHilt( hilt )