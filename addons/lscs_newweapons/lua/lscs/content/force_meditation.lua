local force = {}
force.PrintName = "Meditate [Basic]"
force.Author = "Storm"
force.Description = "Recover your force through meditation"
force.id = "meditate"
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 1

	local available = ply:lscsGetForce()
	local need = ply:lscsGetMaxForce() - ply:lscsGetForce()

	if need > 0 and available >= 5 then
		local take = math.min( need, available, 25 )

		
		ply:SetHealth( math.min(ply:Health() + take ) )
		ply:lscsSetForce( math.min(ply:lscsGetForce() + take, ply:lscsGetMaxForce()) )

		LSCS:PlayVCDSequence( ply, "force_meditate", 0.01 )
		ply:ConCommand("+reload")
		timer.Simple(0.05, function()
		if ply:Health() > 1 and IsValid(ply) then
		ply:Freeze( true )
		end
	
		
		timer.Simple(2.01, function()
		if ply:Health() > 1 and IsValid(ply) then
		ply:Freeze( false )
		else
		ply:Freeze( false )
		end
ply:ConCommand("-reload")
end)
end)

		ply:lscsSetTimedMove( 1, CurTime(), 0.3, Vector(-1,1,0) )

	end
end
LSCS:RegisterForce( force )



local force = {}
force.PrintName = "Meditate [Advanced]"
force.Author = "Storm"
force.Description = "Recover your force through meditation"
force.id = "meditateii"
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2

	local available = ply:lscsGetForce()
	local need = ply:lscsGetMaxForce() - ply:lscsGetForce()

	if need > 0 and available >= 5 then
		local take = math.min( need, available, 25 )

		
		ply:SetHealth( math.min(ply:Health() + take ) )
		ply:lscsSetForce( math.min(ply:lscsGetForce() + take, ply:lscsGetMaxForce()) )

		LSCS:PlayVCDSequence( ply, "force_meditate")
		ply:ConCommand("+reload")
		timer.Simple(0.05, function()
		if ply:Health() > 1 and IsValid(ply) then
		ply:Freeze( true )
		end
	
		
		timer.Simple(2.01, function()
		if ply:Health() > 1 and IsValid(ply) then
		ply:Freeze( false )
		else
		ply:Freeze( false )
		end
ply:ConCommand("-reload")
end)
end)

		ply:lscsSetTimedMove( 1, CurTime(), 0.3, Vector(-1,1,0) )

	end
end
LSCS:RegisterForce( force )