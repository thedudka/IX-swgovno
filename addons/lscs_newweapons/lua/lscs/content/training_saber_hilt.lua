local hilt = {}
hilt.PrintName = "Training Saber"
hilt.Author = "Colt"
hilt.Spawnable = false -- special case, not spawnable from menu
hilt.id = "colttrainingsaber"
hilt.mdl = "models/swtor/weapons/electroblade_low03_a01.mdl"
hilt.info = {
	ParentData = { -- allows you to modify how the model is attached to the player. "RH" = Right Hand,  "LH" = Left Hand
		["RH"] = {
			bone = "ValveBiped.Bip01_R_Hand",
			pos = Vector(3.5, -1.5, -8),
			ang = Angle(-90, 0, 10),
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
				pos = ent:LocalToWorld( Vector(3.5, -1.5, 1) ),
				dir = ent:LocalToWorldAngles( Angle(-90, 0, 10) ):Up(),
			},
		}
		return blades
	end,
}
LSCS:RegisterHilt( hilt ) -- register it to the system. This will also register a new entity