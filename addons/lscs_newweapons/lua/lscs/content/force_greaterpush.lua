local force = {}
force.PrintName = "Greater Push"
force.Author = "Solace"
force.Description = "Push things around, but more"
force.id = "greaterpush"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 40 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/push.mp3")
	ply:lscsTakeForce( 40 )

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_item_throw", 0.5 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_push", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 1600 ) ) do
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 30 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 1600 then
				local Vel = Sub:GetNormalized() * 2500 + Vector(0,0,50)

				LSCS:ForceApply( Ent, Vel, ply )	
				if Ent:IsNPC() then
					Ent:TakeDamage( 500, ply, ply)
				end
			end
		end
	end
end
LSCS:RegisterForce( force )