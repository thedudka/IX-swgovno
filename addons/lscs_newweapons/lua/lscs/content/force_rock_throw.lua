local force = {}
force.PrintName = "Telekinetic Assault"
force.Author = "Solace"
force.Description = "Throw a chunk of earth"
force.id = "sfrockthrow"
force.OnClk =  function( ply, TIME )
	if ply.HoldingRock then
		ply:lscsTakeForce()
	end
end
force.StartUse = function( ply )
	local Time = CurTime()
	
	ply._rock = nil
	ply._rockphys = nil
	ply.HoldingRock = false
	
	local CanThrow = (ply._lscsNextForce or 0) < Time
	if not CanThrow then return end
	
	if ply:lscsGetForce() < 40 then return end
	
	ply._lscsNextForce = Time + 3
	ply.HoldingRock = true

	ply:lscsTakeForce( 50 )
	ply:EmitSound("physics/concrete/boulder_impact_hard4.wav")
	LSCS:PlayVCDSequence( ply, "gesture_becon", 0.8 )
	
	ply._rock = ents.Create ("sf_rock")
	
	local v = ply:GetPos()
	v = v + ply:GetForward() * 50
	v = v + ply:GetRight() * 50
	v = v + ply:GetUp() * 20
	ply._rock:SetPos( v )
	
	ply._rock:SetAngles(Angle(math.Rand(0,180), math.Rand(0,180), math.Rand(0,180)))
	ply._rock:SetOwner(ply)
	ply._rock:Spawn()
	
	ply._rockphys = ply._rock:GetPhysicsObject()
	ply._rockphys:SetVelocity(Vector(0,0,500))
	
	timer.Simple(0.1, function() ply._rock:SetPos( v + Vector(0,0,60) ) end)
	
end
force.StopUse = function( ply )
	if ply._rock then
		ply:EmitSound("lscs/force/push.mp3")
		ply.HoldingRock = false
		ply._rock.DieTime = CurTime() + 5
		ply._rock.IsThrown = true
		local TargetPos = ply:GetEyeTrace().HitPos
		local Sub = (TargetPos-ply._rock:GetPos()):GetNormalized()
		ply._rockphys:SetVelocity((Sub * 2500) + Vector(0,0,200))
		ply._rockphys:EnableGravity( true )
		ply._rockphys:EnableDrag( true )
	end
end
LSCS:RegisterForce( force )