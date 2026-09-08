local force = {}
force.PrintName = "Greater Pull"
force.Author = "Blu-x92 / Luna"
force.Description = "Pull things towards yourself"
force.id = "greaterpull"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 40 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/pull.mp3")
	ply:lscsTakeForce( 40 )

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_becon", 0.8 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_pull", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 1600 ) ) do
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 20 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 1600 then
				local Vel = -Sub:GetNormalized() * 2500 + Vector(0,0,50)

				LSCS:ForceApply( Ent, Vel, ply )
				if Ent:IsNPC() then
					Ent:TakeDamage( 500, ply, ply)
				end
			end
		end
	end
end
LSCS:RegisterForce( force )