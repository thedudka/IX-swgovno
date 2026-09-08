local function endBarrier(ply)
	ply._lscsBarrierTime = nil
	hook.Add( "EntityTakeDamage", "EntityDamageExample", function( target, dmginfo )
		if target == ply then
			dmginfo:ScaleDamage( 1 )
		else return end
	end)
	ply._lscsForceBarrier = false
	ply._SfBarrierTime = nil
end

local force = {}
force.PrintName = "Barrier"
force.Author = "Solace"
force.Description = "Protect yourself from incoming damage."
force.id = "sfbarrier"
force.OnClk =  function( ply, TIME )
	if not ply._lscsForceBarrier then return end
	
	ply:lscsTakeForce()
	
	hook.Add( "EntityTakeDamage", "EntityDamageExample", function( target, dmginfo )
		if target == ply then
			print(target)
			dmginfo:ScaleDamage( 0.2 )
		else return end
	end)
	
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_barrier", effectdata, true, true )
	
	if ply._SfBarrierTime < CurTime() then endBarrier(ply) end
	if not ply:Alive() then endBarrier(ply) end
end
force.StartUse = function( ply )
	local Time = CurTime()

	local CanBarrier = (ply._lscsNextForce or 0) < Time
	if not CanBarrier then return end

	ply._lscsNextForce = Time + 10
	
	if ply:lscsGetForce() < 50 then return end
			
	ply._lscsForceBarrier = true
	ply._SfBarrierTime = CurTime() + 10

	ply:lscsTakeForce( 50 )
	ply:EmitSound("lscs/force/protect.mp3")
end
force.StopUse = function( ply )
end
LSCS:RegisterForce( force )