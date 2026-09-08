local force = {}
force.PrintName = "Heal"
force.Author = "Blu-x92 / Luna"
force.Description = "Heal yourself using the Force"
force.id = "heal"
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2
	

	local available = ply:lscsGetForce()
	local need = ply:GetMaxHealth() - ply:Health()

	if need > 0 and available >= 5 then
		local take = math.min( need, available, 25 )

		ply:lscsTakeForce( take )
		ply:SetHealth( math.min(ply:Health() + take ) )

		ply:EmitSound("lscs/force/heal.mp3")

		local effectdata = EffectData()
			effectdata:SetOrigin( ply:GetPos() )
			effectdata:SetEntity( ply )
		util.Effect( "force_heal", effectdata, true, true )
	end
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Heal II"
force.Author = "Valkorius"
force.Description = "Heal yourself using the Force"
force.id = "healii"
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2
	

	local available = ply:lscsGetForce()
	local need = ply:GetMaxHealth() - ply:Health()

	if need > 0 and available >= 5 then
		local take = math.min( need, available, 40 )

		ply:lscsTakeForce( take )
		ply:SetHealth( math.min(ply:Health() + take ) )

		ply:EmitSound("lscs/force/heal.mp3")

		local effectdata = EffectData()
			effectdata:SetOrigin( ply:GetPos() )
			effectdata:SetEntity( ply )
		util.Effect( "force_heal", effectdata, true, true )
	end
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Heal III"
force.Author = "Valkorius"
force.Description = "Heal yourself using the Force"
force.id = "healiii"
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2
	

	local available = ply:lscsGetForce()
	local need = ply:GetMaxHealth() - ply:Health()

	if need > 0 and available >= 5 then
		local take = math.min( need, available, 55 )

		ply:lscsTakeForce( take )
		ply:SetHealth( math.min(ply:Health() + take ) )

		ply:EmitSound("lscs/force/heal.mp3")

		local effectdata = EffectData()
			effectdata:SetOrigin( ply:GetPos() )
			effectdata:SetEntity( ply )
		util.Effect( "force_heal", effectdata, true, true )
	end
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Mass Heal"
force.Author = "Solace"
force.Description = "Heal a group using the Force"
force.id = "massheal"
local function ForceMassHeal( ply, TIME )
	local MyPos = ply:GetShootPos()
	for _, nEntity in pairs( ents.FindInSphere( MyPos, 200 ) ) do -- Are you in a certain distance?
		
		if nEntity:IsPlayer() then -- Are you a player?
			local need = nEntity:GetMaxHealth() - nEntity:Health() -- Do you actually need healing?
			if need > 0 then
				nEntity:SetHealth( math.Clamp( nEntity:Health() + 10, 0, nEntity:GetMaxHealth() ) ) --Increases their health by 5 but does not go past their max HP
				ply:lscsTakeForce(5) -- Costs 5 force
				local effectdata = EffectData()
					effectdata:SetOrigin( nEntity:GetPos() )
					effectdata:SetEntity( nEntity )
				util.Effect( "force_heal", effectdata, true, true )
			end
		end
	end
end
force.OnClk =  function( ply, TIME )
	if not ply._lscsMassHealTime then return end -- Stops healing after a certain amount of time (Defined on line 48)
	
	ForceMassHeal( ply, TIME )
	
	if ply._lscsMassHealTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply._lscsMassHealTime = nil
	end
end
force.StartUse = function( ply )

	local Time = CurTime()
	
	if ply:lscsGetForce() < 10 then return end -- Need at least 10 force

	local CanDo = (ply._lscsNextForce or 0) < Time
	if not CanDo then return end

	ply._lscsNextForce = Time + 2 -- Cooldown
		
	ForceMassHeal( ply, TIME )
	
	ply:EmitSound("lscs/force/heal.mp3")
	
	if not ply._lscsMassHealTime then
		ply._lscsMassHealTime = CurTime() + 5 -- Only lets you heal for 3.5 seconds at a time
	end
end
force.StopUse = function( ply )
	ply._lscsMassHealTime = nil
end
LSCS:RegisterForce( force )