local force = {}
force.PrintName = "Repulse"
force.Author = "Solace"
force.Description = "Push everything away from you"
force.id = "repulse"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 20 then return end -- If you have less than 20 force, nothing happens

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 10
	
	RepulseCharge = 0 -- Defines a variable that shows up alot here. 
	
	function AddRepulseCharge() 
	
		if ply:lscsGetForce() < ( 20 ) then
			timer.Stop ( "ChargeTimer" ) -- Stops the loop if there isn't enough force left to fund it 
		return end
		
		if not ( timer.Exists( "ChargeTimer" ) ) then return end -- Checks to see if the timer exists 
		
		RepulseCharge = RepulseCharge + 1 -- Adds 1 to our charge variable
		
		ply:SetNWInt( "_RepulseCharge", RepulseCharge) -- makes the charge variable a network integer so it can be called across different scripts and between the server and client
		
		ply:EmitSound("lscs/force/repulse_charge.mp3", 100, 75 + ( RepulseCharge * 5 ) ) -- Emits the charging sound, changes the pitch as the charge variable increases
		
		local AimVector = ply:GetAimVector()
		local MyPos = ply:GetShootPos()
		
		timer.Simple( 0.5, function() -- a delay so that the take force and effect are ran in sync with the sound effect 
		ply:lscsTakeForce( 20 )
		local effectdata = EffectData()
			effectdata:SetOrigin( MyPos )
			effectdata:SetEntity( ply )
		util.Effect( "repulse_charge", effectdata, true, true ) end )
	end
	
	timer.Create( "ChargeTimer", 1, 0, AddRepulseCharge ) -- Actually creates the timer the entire previous function runs on
end
force.StopUse = function( ply )

	if RepulseCharge < 1 then return end -- If no charge has been built up, there's nothing to release.
	
	ply:EmitSound("lscs/force/push.mp3")

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_item_throw", 0.5 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetEntity( ply )
	util.Effect( "repulse", effectdata, true, true )
-- VVV Applies a pushing force to everything within a sphere that grows depending on how much charge has been built up VVV
	for _, Ent in pairs( ents.FindInSphere( MyPos, 100 * RepulseCharge ) ) do 
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		local Dist = Sub:Length()

		if IsValid( Ent ) and Dist < ( 100 * RepulseCharge ) then -- How far away something can be and still be pushed
			local Vel = Sub:GetNormalized() * 400 * RepulseCharge + Vector(0,0,50) -- How hard and what direction things are pushed 

			LSCS:ForceApply( Ent, Vel, ply )
		end
	end
	
	timer.Stop ( "ChargeTimer" ) -- Stops the charge timer
	RepulseCharge = 0 -- Resets the charge variable
	timer.Simple( 1, function() ply:SetNWInt( "_RepulseCharge", RepulseCharge) end) -- Delays resetting the network integer so the effects work correctly
end
LSCS:RegisterForce( force )