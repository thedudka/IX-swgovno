local force = {}
force.PrintName = "Throw"
force.Author = "Blu-x92 / Luna"
force.Description = "Throw your Lightsaber"
force.id = "throw"
force.StartUse = function( ply )
	if ply:InVehicle() then return end

	local CurSWEP = ply:GetActiveWeapon()
	local SWEP = ply:GetWeapon( "weapon_lscs" )

	if IsValid( CurSWEP ) then
		if CurSWEP.LSCS then
			SWEP = CurSWEP
		end
	end

	if not IsValid( SWEP ) then return end
	if SWEP:IsBrokenSaber() then return end

	if (ply._lscsNextThrow or 0) > CurTime() then return end

	ply._lscsNextThrow = CurTime() + 1

	if IsValid( ply._lscsThrownSaber ) then
		if not ply._lscsThrownSaber.Returning then
			ply._lscsThrownSaber:ResetProgress()
			ply._lscsThrownSaber.Returning = true
		end
	else
		if ply:lscsGetForce() < 10 then return end

		if ply:GetActiveWeapon() ~= SWEP then
			ply:SelectWeapon( "weapon_lscs" )
		end

		LSCS:PlayVCDSequence( ply, "zombie_attack_02", 0.3 )

		local proj = ents.Create("lscs_projectile")
		proj:SetPos( ply:GetShootPos() - Vector(0,0,20) )
		proj:SetSWEP( SWEP )
		proj:Spawn()
		proj:Activate()

		ply:EmitSound("npc/zombie/claw_miss1.wav")

		SWEP:SetHoldType( "magic" )

		ply._lscsThrownSaber = proj
	end
end
force.StopUse = function( ply )
	if IsValid( ply._lscsThrownSaber ) then
		ply._lscsThrownSaber:ResetProgress()
		ply._lscsThrownSaber.Returning = true
	end
end

LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Jump"
force.Author = "Blu-x92 / Luna"
force.Description = "Force Assisted Jump"
force.id = "jump"
force.OnClk =  function( ply, TIME )
	if not ply:IsTrueForceUser() then return end
	
	if not ply._lscsAssistedJump then return end

	if ply:OnGround() then
		ply._lscsCanForceJump = true
		ply._lscsPlayedJumpSound = false
		ply._lscsJumpForceTaken = nil
	end

	local JUMP = ply:KeyDown( IN_JUMP ) and not ply:InVehicle()

	if JUMP then
		local wep = ply:GetActiveWeapon()
		if IsValid( wep ) and wep.LSCS then
			if wep:IsComboActive() then JUMP = false end
		end
	end

	if JUMP ~= ply._lscsOldJump then
		ply._lscsOldJump = JUMP
		if JUMP then
			ply._lscsJumpTime = TIME + 0.1
		else
			if not ply:OnGround() then
				ply._lscsCanForceJump = false
			end
		end
	end

	if JUMP and ply:lscsGetForce() > 0 and (ply._lscsJumpForceTaken or 0) < 35 and ply._lscsCanForceJump and (ply._lscsJumpTime or 0) < TIME and not ply:OnGround() then
		ply:lscsSuppressFalldamage( TIME + 5 )
		ply:SetVelocity( Vector(0,0,150) + Angle(0,ply:EyeAngles().y,0):Forward() * 5 )
		ply:lscsTakeForce( 4 )
		ply._lscsJumpForceTaken = ply._lscsJumpForceTaken and ply._lscsJumpForceTaken + 2.5 or 0

		if not ply._lscsPlayedJumpSound then
			ply._lscsPlayedJumpSound = true

			net.Start( "lscs_start_jump" )
			net.Send( ply )

			ply:EmitSound("lscs/force/jump.mp3")
		end
	end
end
force.Equip = function( ply ) ply._lscsAssistedJump = true end
force.UnEquip = function( ply ) ply._lscsAssistedJump = false end
force.StartUse = function( ply )
	if ply._lscsForceJumpTime then
		ply._lscsForceJumpTime = nil
	else
		if ply:InVehicle() then return end

		ply._lscsForceJumpTime = CurTime() + 2
	end
end
force.StopUse = function( ply )
	ply._lscsForceJumpTime = nil
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Jump II"
force.Author = "Valkorius"
force.Description = "Force Assisted Jump"
force.id = "jumpii"
force.OnClk =  function( ply, TIME )

	if not ply:IsTrueForceUser() then return end
	if not ply._lscsAssistedJump then return end

	if ply:OnGround() then
		ply._lscsCanForceJump = true
		ply._lscsPlayedJumpSound = false
		ply._lscsJumpForceTaken = nil
	end

	local JUMP = ply:KeyDown( IN_JUMP ) and not ply:InVehicle()

	if JUMP then
		local wep = ply:GetActiveWeapon()
		if IsValid( wep ) and wep.LSCS then
			if wep:IsComboActive() then JUMP = false end
		end
	end

	if JUMP ~= ply._lscsOldJump then
		ply._lscsOldJump = JUMP
		if JUMP then
			ply._lscsJumpTime = TIME + 0.1
		else
			if not ply:OnGround() then
				ply._lscsCanForceJump = false
			end
		end
	end

	if JUMP and ply:lscsGetForce() > 0 and (ply._lscsJumpForceTaken or 0) < 35 and ply._lscsCanForceJump and (ply._lscsJumpTime or 0) < TIME and not ply:OnGround() then
		ply:lscsSuppressFalldamage( TIME + 5 )
		ply:SetVelocity( Vector(0,0,150) + Angle(0,ply:EyeAngles().y,0):Forward() * 5 )
		ply:lscsTakeForce( 2.5 )
		ply._lscsJumpForceTaken = ply._lscsJumpForceTaken and ply._lscsJumpForceTaken + 2.5 or 0

		if not ply._lscsPlayedJumpSound then
			ply._lscsPlayedJumpSound = true

			net.Start( "lscs_start_jump" )
			net.Send( ply )

			ply:EmitSound("lscs/force/jump.mp3")
		end
	end
end
force.Equip = function( ply ) ply._lscsAssistedJump = true end
force.UnEquip = function( ply ) ply._lscsAssistedJump = false end
force.StartUse = function( ply )
	if ply._lscsForceJumpTime then
		ply._lscsForceJumpTime = nil
	else
		if ply:InVehicle() then return end

		ply._lscsForceJumpTime = CurTime() + 2
	end
end
force.StopUse = function( ply )
	ply._lscsForceJumpTime = nil
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Jump III"
force.Author = "Valkorius"
force.Description = "Force Assisted Jump"
force.id = "jumpiii"
force.OnClk =  function( ply, TIME )
	if not ply:IsTrueForceUser() then return end
	if not ply._lscsAssistedJump then return end

	if ply:OnGround() then
		ply._lscsCanForceJump = true
		ply._lscsPlayedJumpSound = false
		ply._lscsJumpForceTaken = nil
	end

	local JUMP = ply:KeyDown( IN_JUMP ) and not ply:InVehicle()

	if JUMP then
		local wep = ply:GetActiveWeapon()
		if IsValid( wep ) and wep.LSCS then
			if wep:IsComboActive() then JUMP = false end
		end
	end

	if JUMP ~= ply._lscsOldJump then
		ply._lscsOldJump = JUMP
		if JUMP then
			ply._lscsJumpTime = TIME + 0.1
		else
			if not ply:OnGround() then
				ply._lscsCanForceJump = false
			end
		end
	end

	if JUMP and ply:lscsGetForce() > 0 and (ply._lscsJumpForceTaken or 0) < 35 and ply._lscsCanForceJump and (ply._lscsJumpTime or 0) < TIME and not ply:OnGround() then
		ply:lscsSuppressFalldamage( TIME + 5 )
		ply:SetVelocity( Vector(0,0,150) + Angle(0,ply:EyeAngles().y,0):Forward() * 5 )
		ply:lscsTakeForce( 1.25 )
		ply._lscsJumpForceTaken = ply._lscsJumpForceTaken and ply._lscsJumpForceTaken + 2.5 or 0

		if not ply._lscsPlayedJumpSound then
			ply._lscsPlayedJumpSound = true

			net.Start( "lscs_start_jump" )
			net.Send( ply )

			ply:EmitSound("lscs/force/jump.mp3")
		end
	end
end
force.Equip = function( ply ) ply._lscsAssistedJump = true end
force.UnEquip = function( ply ) ply._lscsAssistedJump = false end
force.StartUse = function( ply )
	if ply._lscsForceJumpTime then
		ply._lscsForceJumpTime = nil
	else
		if ply:InVehicle() then return end

		ply._lscsForceJumpTime = CurTime() + 2
	end
end
force.StopUse = function( ply )
	ply._lscsForceJumpTime = nil
end
LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Push"
force.Author = "Blu-x92 / Luna"
force.Description = "Push things around"
force.id = "push"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 20 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/push.mp3")
	ply:lscsTakeForce( 10 ) --Push gücünün tükettiği force miktarı

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_item_throw", 0.5 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_push", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 800 ) ) do
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 30 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 800 then
				local Vel = Sub:GetNormalized() * 500 + Vector(0,0,50) -- +dan önceki sayı itilme mesafesini belirliyor. Vector içindeki sayılardan sonuncusu dikey yönü belirtir.

				LSCS:ForceApply( Ent, Vel, ply )
			end
		end
	end
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Push II"
force.Author = "Valkorius"
force.Description = "Push things around even more"
force.id = "pushii"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 20 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/push.mp3")
	ply:lscsTakeForce( 20 ) --Push gücünün tükettiği force miktarı

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_item_throw", 0.5 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_push", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 800 ) ) do
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 30 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 800 then
				local Vel = Sub:GetNormalized() * 1000 + Vector(0,0,50) -- +dan önceki sayı itilme mesafesini belirliyor. Vector içindeki sayılardan sonuncusu dikey yönü belirtir.

				LSCS:ForceApply( Ent, Vel, ply )
			end
		end
	end
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Push III"
force.Author = "Valkorius"
force.Description = "Push things around even even more"
force.id = "pushiii"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 20 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/push.mp3")
	ply:lscsTakeForce( 30 ) --Push gücünün tükettiği force miktarı

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_item_throw", 0.5 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_push", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 800 ) ) do
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 30 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 800 then
				local Vel = Sub:GetNormalized() * 2000 + Vector(0,0,50) -- +dan önceki sayı itilme mesafesini belirliyor. Vector içindeki sayılardan sonuncusu dikey yönü belirtir.

				LSCS:ForceApply( Ent, Vel, ply )
			end
		end
	end
end
LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Pull"
force.Author = "Blu-x92 / Luna"
force.Description = "Pull things towards yourself"
force.id = "pull"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 20 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/pull.mp3")
	ply:lscsTakeForce( 10 ) --Pullun aldığı force miktarı

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_becon", 0.8 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_pull", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 200 ) ) do --Çekme yarıçapı
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 20 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 800 then
				local Vel = -Sub:GetNormalized() * 500 + Vector(0,0,50) -- + dan önceki kısım çekme kudreti

				LSCS:ForceApply( Ent, Vel, ply )
			end
		end
	end
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Pull II"
force.Author = "Valkorius"
force.Description = "Pull things towards yourself even more"
force.id = "pullii"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 20 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/pull.mp3")
	ply:lscsTakeForce( 20 ) --Pullun aldığı force miktarı

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_becon", 0.8 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_pull", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 500 ) ) do --Çekme yarıçapı
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 20 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 800 then
				local Vel = -Sub:GetNormalized() * 750 + Vector(0,0,50) -- + dan önceki kısım çekme kudreti

				LSCS:ForceApply( Ent, Vel, ply )
			end
		end
	end
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Pull III"
force.Author = "Valkorius"
force.Description = "Pull things towards yourself even even more"
force.id = "pulliii"
force.StartUse = function( ply )
	if ply:lscsGetForce() < 20 then return end

	local Time = CurTime()

	local CanPush = (ply._lscsNextForce or 0) < Time

	if not CanPush then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/pull.mp3")
	ply:lscsTakeForce( 30 ) --Pullun aldığı force miktarı

	local AimVector = ply:GetAimVector()
	local MyPos = ply:GetShootPos()

	LSCS:PlayVCDSequence( ply, "gesture_becon", 0.8 )

	local effectdata = EffectData()
		effectdata:SetOrigin( MyPos )
		effectdata:SetNormal( AimVector )
		effectdata:SetEntity( ply )
	util.Effect( "force_pull", effectdata, true, true )

	for _, Ent in pairs( ents.FindInSphere( MyPos, 800 ) ) do --Çekme yarıçapı
		local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 20 then
			local Dist = Sub:Length()

			if IsValid( Ent ) and Dist < 800 then
				local Vel = -Sub:GetNormalized() * 1250 + Vector(0,0,50) -- + dan önceki kısım çekme kudreti

				LSCS:ForceApply( Ent, Vel, ply )
			end
		end
	end
end
LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Sense [Ultimate]"
force.Author = "Blu-x92 / Luna"
force.Description = "Augmented Vision. See through the lies of the Jedi and through walls"
force.id = "sense"
force.OnClk =  function( ply, TIME )
	if not ply:GetNWBool( "_lscsForceSenseUltimate", false ) then return end

	if not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply:SetNWBool( "_lscsForceSenseUltimate", false )
		return
	end

	ply:lscsTakeForce()

	if (ply._lscsSenseTime or 0) < TIME then
		ply:SetNWBool( "_lscsForceSenseUltimate", false )
	end
end
force.UnEquip = function( ply ) ply:SetNWBool( "_lscsForceSenseUltimate", false ) end
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 1

	if ply:GetNWBool( "_lscsForceSenseUltimate", false ) then
		ply:SetNWBool( "_lscsForceSenseUltimate", false )
	else
		if ply:lscsGetForce() >= 12 then
			ply:SetNWBool( "_lscsForceSenseUltimate", true )
			ply._lscsSenseTime = CurTime() + 20

			ply:lscsTakeForce( 12 )
			ply:EmitSound("lscs/force/sense.mp3")
		end
	end

end
LSCS:RegisterForce( force )




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
force.Description = "Heal yourself using the Force even more"
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
force.Description = "Heal yourself using the Force even even more"
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
force.PrintName = "Replenish"
force.Author = "Blu-x92 / Luna"
force.Description = "A Dark Side ability that regains Force from Health"
force.id = "replenish"
force.StartUse = function( ply )
	local Time = CurTime()

	if (ply._lscsNextForceReplenish or 0) > Time then return end

	ply._lscsNextForceReplenish = Time + 2

	local available = math.max( ply:Health() - 1, 0 )

	local need = ply:lscsGetMaxForce() - ply:lscsGetForce()

	if available > 1 then
		if need > 0 then
			local take = math.min( need, available, 50 )

			ply:SetHealth( ply:Health() - take )
			ply:lscsSetForce( math.min(ply:lscsGetForce() + take, ply:lscsGetMaxForce()) )

			ply:EmitSound("lscs/force/replenish.mp3")

			local effectdata = EffectData()
				effectdata:SetOrigin( ply:GetPos() )
				effectdata:SetEntity( ply )
			util.Effect( "force_replenish", effectdata, true, true )
		end
	else
		if need > 0 then
			ply:EmitSound("lscs/force/replenish.mp3")

			local d = DamageInfo()
			d:SetDamage( 1 )
			d:SetAttacker( ply )
			d:SetDamageType( DMG_DROWN ) 
			d:SetDamagePosition( ply:GetShootPos() )
			ply:TakeDamageInfo( d )
		end
	end
end
LSCS:RegisterForce( force )



local force = {}
force.PrintName = "Immunity"
force.Author = "Blu-x92 / Luna"
force.Description = "Incoming Force Power[Lightning, Push, Pull] attacks are absorbed and regain Force Points. Also gives a permanent immunity against push/pull as long your own Force Points are above 50% even when this Power is not activated."
force.id = "immunity"
force.OnClk =  function( ply, TIME )
	if not ply:GetNWBool( "_lscsForceProtect", false ) then return end

	if not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply:SetNWBool( "_lscsForceProtect", false )
		return
	end

	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_block_active", effectdata, true, true )

	ply:lscsTakeForce()

	if (ply._lscsBlockTime or 0) < TIME then
		ply:SetNWBool( "_lscsForceProtect", false )
	end
end
force.Equip = function( ply ) ply._lscsForceResistant = true end
force.UnEquip = function( ply ) ply._lscsForceResistant = nil ply:GetNWBool( "_lscsForceProtect", false ) end
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 1

	if ply:GetNWBool( "_lscsForceProtect", false ) then
		ply:SetNWBool( "_lscsForceProtect", false )
	else
		if ply:lscsGetForce() < 20 then return end

		ply:SetNWBool( "_lscsForceProtect", true )
		ply._lscsBlockTime = CurTime() + 20

		ply:EmitSound("lscs/force/protect.mp3")

		ply:lscsTakeForce( 20 )
	end

end
LSCS:RegisterForce( force )

local function ForceFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_lightning", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 5 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceJFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_judgement", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 2 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceJIIFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_judgementii", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 4 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceJIIIFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_judgementiii", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 6 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceLIFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_lightningi", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 3 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceLIIFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_lightningii", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 6 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceLIIIFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_lightningiii", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 10 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceLIVFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_lightningiv", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 15 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local function ForceLXFry( ply, TIME )
	local effectdata = EffectData()
		effectdata:SetOrigin( ply:GetPos() )
		effectdata:SetEntity( ply )
	util.Effect( "force_lightningx", effectdata, true, true )

	local MyPos = ply:GetShootPos()
	local AimVector = ply:GetAimVector()
	local Force = AimVector * 100

	for _, victim in pairs( ents.FindInSphere( MyPos, 700 ) ) do
		local TargetPos = victim.GetShootPos and victim:GetShootPos() or victim:GetPos()
		local Sub = TargetPos - MyPos
		local ToTarget = Sub:GetNormalized()

		if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 14 then
			if util.TraceLine( {start = MyPos,endpos = victim:LocalToWorld( victim:OBBCenter() ),mask = MASK_SHOT,filter = ply,} ).Entity ~= victim then continue end

			local Dist = Sub:Length()

			if IsValid( victim ) and Dist < 700 then
				if victim:IsPlayer() then
					if hook.Run( "LSCS:PlayerCanManipulate", ply, victim, true ) then continue end
				end

				if victim:GetClass() == "prop_ragdoll" then 
					victim:Fire("StartRagdollBoogie")

					if (victim._lscsBoogieTime or 0) < TIME then
						victim._lscsBoogieTime = TIME + 6

						for i = 1, 70 do
							if math.random(1,5) == 1 then continue end

							timer.Simple( i * 0.1, function()
								if not IsValid( victim ) then return end

								local effect = EffectData()
								effect:SetEntity( victim )
								effect:SetMagnitude(30)
								effect:SetScale(30)
								effect:SetRadius(30)
								util.Effect("TeslaHitBoxes", effect)
								victim:EmitSound("Weapon_StunStick.Activate")
							end )
						end
					end
				end

				local DMGtrace = util.TraceHull( {
					start = MyPos,
					endpos = MyPos + AimVector * 800,
					filter = ply,
					mins = Vector( -20, -20, -20 ),
					maxs = Vector( 20, 20, 20 ),
					mask = MASK_SHOT_HULL,
					filter = function( ent ) return ent == victim end
				} )

				local DmgSub = TargetPos - DMGtrace.HitPos
				local DmgPos = DMGtrace.HitPos + DmgSub:GetNormalized() * math.min(DmgSub:Length(),20) + VectorRand(-5,5)

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( 100 )
				dmginfo:SetAttacker( ply )
				dmginfo:SetInflictor( ply ) 
				dmginfo:SetDamageType( bit.bor( DMG_SHOCK, DMG_BULLET ) )
				dmginfo:SetDamagePosition( DmgPos )
				dmginfo:SetDamageForce( Force ) 
				victim:TakeDamageInfo( dmginfo )
			end
		end
	end
end

local force = {}
force.PrintName = "Lightning"
force.Author = "Blu-x92 / Luna"
force.Description = "A Dark Side ability that fires Lightning Bolts out of your Hand"
force.id = "lightning"
force.OnClk =  function( ply, TIME )
	if not ply._lscsLightningTime then return end

	ply:lscsTakeForce( 2 )

	ForceFry( ply, TIME )

	if ply._lscsLightningStartTime < TIME then
		LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
	end

	if ply._lscsLightningTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply._lscsLightningTime = nil
		ply._lscsLightningStartTime = nil
	end
end
force.Equip = function( ply ) end
force.UnEquip = function( ply ) end
force.StartUse = function( ply )
	local Time = CurTime()

	if (ply._lscsLightningTime or 0) > Time then
		ply._lscsLightningTime = nil
		ply._lscsLightningStartTime = nil

		return
	end

	if ply:lscsGetForce() < 10 then return end

	local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsLightningTime or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2

	ply:EmitSound("lscs/force/lightning.mp3")

	ply:lscsTakeForce( 5 )

	ForceFry( ply, Time )

	if not ply._lscsLightningTime then
		ply._lscsLightningTime = CurTime() + 3.5
		ply._lscsLightningStartTime = CurTime() + 0.15

		LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
	end
end
force.StopUse = function( ply )
	ply._lscsLightningTime = nil
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Judgement"
force.Author = "Kaan"
force.Description = "A Light Side ability that fires Lightning Bolts out of your Hand"
force.id = "judgementi"

force.OnClk =  function( ply, TIME )
    if not ply._lscsJudgementTime then return end

    ply:lscsTakeForce( 3 )

    ForceJFry( ply, TIME )

    if ply._lscsJudgementStartTime < TIME then
        LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
    end

    if ply._lscsJudgementTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
        ply._lscsJudgementTime = nil
        ply._lscsJudgementStartTime = nil
    end
end

force.Equip = function( ply ) end
force.UnEquip = function( ply ) end

force.StartUse = function( ply )
    local Time = CurTime()

    if (ply._lscsJudgementTime or 0) > Time then
        ply._lscsJudgementTime = nil
        ply._lscsJudgementStartTime = nil

        return
    end

    if ply:lscsGetForce() < 4 then return end

    local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsJudgementTime or 0) < Time

    if not CanDo then return end

    ply._lscsNextForce = Time + 2

    ply:EmitSound("lscs/force/lightning.mp3")

    ply:lscsTakeForce( 3 )

    ForceJFry( ply, Time )

    if not ply._lscsJudgementTime then
        ply._lscsJudgementTime = CurTime() + 3.5
        ply._lscsJudgementStartTime = CurTime() + 0.15

        LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
    end

    local trace = util.TraceLine( {
        start = ply:GetShootPos(),
        endpos = ply:GetShootPos() + ply:GetAimVector() * 800, 
        filter = ply
    } )

    if trace.Hit and trace.Entity:IsPlayer() then
        local targetPlayer = trace.Entity

        -- Stuns that bitch
        targetPlayer:SetMoveType(MOVETYPE_NONE)  -- Idk wtf I'm doing
        targetPlayer:Freeze(true)               

        -- Unfreeze the player after 3 seconds
        timer.Simple(3, function()
            if IsValid(targetPlayer) then
                targetPlayer:SetMoveType(MOVETYPE_WALK)
                targetPlayer:Freeze(false)
            end
        end)
        targetPlayer:EmitSound("lscs/force/lightninghit"..math.random(1,3)..".mp3")
    end
end

force.StopUse = function( ply )
    ply._lscsJudgementTime = nil
end

LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Judgement II"
force.Author = "Valkorius"
force.Description = "A light side ability that fires green lightning bolts out of your hand"
force.id = "judgementii"
force.OnClk =  function( ply, TIME )
	if not ply._lscsJudgementiiTime then return end

	ply:lscsTakeForce( 6 )

	ForceJIIFry( ply, TIME )

	if ply._lscsJudgementiiStartTime < TIME then
		LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
	end

	if ply._lscsJudgementiiTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply._lscsJudgementiiTime = nil
		ply._lscsJudgementiiStartTime = nil
	end
end
force.Equip = function( ply ) end
force.UnEquip = function( ply ) end
force.StartUse = function( ply )
	local Time = CurTime()

	if (ply._lscsJudgementiiTime or 0) > Time then
		ply._lscsJudgementiiTime = nil
		ply._lscsJudgementiiStartTime = nil

		return
	end

	if ply:lscsGetForce() < 10 then return end

	local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsJudgementiiTime or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2

	ply:EmitSound("lscs/force/lightning.mp3")

	ply:lscsTakeForce( 4 )

	ForceJIIFry( ply, Time )

	if not ply._lscsJudgementiiTime then
		ply._lscsJudgementiiTime = CurTime() + 3.5
		ply._lscsJudgementiiStartTime = CurTime() + 0.15

		LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
	end

    local trace = util.TraceLine({
        start = ply:GetShootPos(),
        endpos = ply:GetShootPos() + ply:GetAimVector() * 800, -- Lightning range
        filter = ply
    })

    if trace.Hit and trace.Entity:IsPlayer() then
        local targetPlayer = trace.Entity
        targetPlayer:SetMoveType(MOVETYPE_NONE)  
        targetPlayer:Freeze(true)               

        -- Unfreeze the bitch after 6 seconds
        timer.Simple(6, function()
            if IsValid(targetPlayer) then
                targetPlayer:SetMoveType(MOVETYPE_WALK)
                targetPlayer:Freeze(false)
            end
        end)
        targetPlayer:EmitSound("lscs/force/lightninghit"..math.random(1,3)..".mp3")
    end
end

force.StopUse = function( ply )
    ply._lscsJudgementiiTime = nil
end

LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Judgement III"
force.Author = "Valkorius"
force.Description = "A light side ability that fires cyan lightning bolts out of your hand III"
force.id = "judgementiii"

force.OnClk = function( ply, TIME )
    if not ply._lscsJudgementiiiTime then return end

    ply:lscsTakeForce( 8 )

    ForceJIIIFry( ply, TIME )

    if ply._lscsJudgementiiiStartTime < TIME then
        LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
    end

    if ply._lscsJudgementiiiTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
        ply._lscsJudgementiiiTime = nil
        ply._lscsJudgementiiiStartTime = nil
    end
end

force.Equip = function( ply ) end
force.UnEquip = function( ply ) end
force.StartUse = function( ply )
    local Time = CurTime()

    if (ply._lscsJudgementiiiTime or 0) > Time then
        ply._lscsJudgementiiiTime = nil
        ply._lscsJudgementiiiStartTime = nil
        return
    end

    if ply:lscsGetForce() < 10 then return end

    local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsJudgementiiiTime or 0) < Time
    if not CanDo then return end

    ply._lscsNextForce = Time + 2
    ply:EmitSound("lscs/force/lightning.mp3")

    ply:lscsTakeForce( 5 )
    ForceJIIIFry( ply, Time )

    if not ply._lscsJudgementiiiTime then
        ply._lscsJudgementiiiTime = CurTime() + 3.5
        ply._lscsJudgementiiiStartTime = CurTime() + 0.15
        LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
    end

    local trace = util.TraceLine({
        start = ply:GetShootPos(),
        endpos = ply:GetShootPos() + ply:GetAimVector() * 800, 
        filter = ply
    })

    if trace.Hit and trace.Entity:IsPlayer() then
        local targetPlayer = trace.Entity
        targetPlayer:SetMoveType(MOVETYPE_NONE)  
        targetPlayer:Freeze(true)                

        -- Unfreeze cunt after 9 sec
        timer.Simple(9, function()
            if IsValid(targetPlayer) then
                targetPlayer:SetMoveType(MOVETYPE_WALK)
                targetPlayer:Freeze(false)
            end
        end)
        targetPlayer:EmitSound("lscs/force/lightninghit"..math.random(1,3)..".mp3")
    end
end
force.StopUse = function( ply )
    ply._lscsJudgementiiiTime = nil
end
LSCS:RegisterForce( force )


local force = {}
force.PrintName = "Lightning II"
force.Author = "Valkorius"
force.Description = "Lightning II"
force.id = "Lightningii"
force.OnClk =  function( ply, TIME )
	if not ply._lscsLightningiiTime then return end

	ply:lscsTakeForce( 4 )

	ForceLIIFry( ply, TIME )

	if ply._lscsLightningiiStartTime < TIME then
		LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
	end

	if ply._lscsLightningiiTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply._lscsLightningiiTime = nil
		ply._lscsLightningiiStartTime = nil
	end
end
force.Equip = function( ply ) end
force.UnEquip = function( ply ) end
force.StartUse = function( ply )
	local Time = CurTime()

	if (ply._lscsLightningiiTime or 0) > Time then
		ply._lscsLightningiiTime = nil
		ply._lscsLightningiiStartTime = nil

		return
	end

	if ply:lscsGetForce() < 10 then return end

	local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsLightningiiTime or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2

	ply:EmitSound("lscs/force/lightning.mp3")

	ply:lscsTakeForce( 3 )

	ForceLIIFry( ply, Time )

	if not ply._lscsLightningiiTime then
		ply._lscsLightningiiTime = CurTime() + 3.5
		ply._lscsLightningiiStartTime = CurTime() + 0.15

		LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
	end
end
force.StopUse = function( ply )
	ply._lscsLightningiiTime = nil
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Lightning III"
force.Author = "Valkorius"
force.Description = "Lightning III"
force.id = "Lightningiii"
force.OnClk =  function( ply, TIME )
	if not ply._lscsLightningiiiTime then return end

	ply:lscsTakeForce( 3 )

	ForceLIIIFry( ply, TIME )

	if ply._lscsLightningiiiStartTime < TIME then
		LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
	end

	if ply._lscsLightningiiiTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply._lscsLightningiiiTime = nil
		ply._lscsLightningiiiStartTime = nil
	end
end
force.Equip = function( ply ) end
force.UnEquip = function( ply ) end
force.StartUse = function( ply )
	local Time = CurTime()

	if (ply._lscsLightningiiiTime or 0) > Time then
		ply._lscsLightningiiiTime = nil
		ply._lscsLightningiiiStartTime = nil

		return
	end

	if ply:lscsGetForce() < 10 then return end

	local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsLightningiiiTime or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2

	ply:EmitSound("lscs/force/lightning.mp3")

	ply:lscsTakeForce( 3 )

	ForceLIIIFry( ply, Time )

	if not ply._lscsLightningiiiTime then
		ply._lscsLightningiiiTime = CurTime() + 3.5
		ply._lscsLightningiiiStartTime = CurTime() + 0.15

		LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
	end
end
force.StopUse = function( ply )
	ply._lscsLightningiiiTime = nil
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Lightning IV"
force.Author = "Valkorius"
force.Description = "Lightning IV"
force.id = "Lightningiv"
force.OnClk =  function( ply, TIME )
	if not ply._lscsLightningivTime then return end

	ply:lscsTakeForce( 4 )

	ForceLIVFry( ply, TIME )

	if ply._lscsLightningivStartTime < TIME then
		LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
	end

	if ply._lscsLightningivTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply._lscsLightningivTime = nil
		ply._lscsLightningivStartTime = nil
	end
end
force.Equip = function( ply ) end
force.UnEquip = function( ply ) end
force.StartUse = function( ply )
	local Time = CurTime()

	if (ply._lscsLightningivTime or 0) > Time then
		ply._lscsLightningivTime = nil
		ply._lscsLightningivStartTime = nil

		return
	end

	if ply:lscsGetForce() < 10 then return end

	local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsLightningivTime or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 2

	ply:EmitSound("lscs/force/lightning.mp3")

	ply:lscsTakeForce( 4 )

	ForceLIVFry( ply, Time )

	if not ply._lscsLightningivTime then
		ply._lscsLightningivTime = CurTime() + 3.5
		ply._lscsLightningivStartTime = CurTime() + 0.15

		LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
	end
end
force.StopUse = function( ply )
	ply._lscsLightningivTime = nil
end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Lightning X"
force.Author = "Valkorius"
force.Description = "Lightning X"
force.id = "Lightningx"
force.OnClk =  function( ply, TIME )
	if not ply._lscsLightningxTime then return end

	ply:lscsTakeForce( 1 )

	ForceLXFry( ply, TIME )

	if ply._lscsLightningxStartTime < TIME then
		LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.7 )
	end

	if ply._lscsLightningxTime < TIME or ply:lscsGetForce() <= 0 or not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
		ply._lscsLightningxTime = nil
		ply._lscsLightningxStartTime = nil
	end
end
force.Equip = function( ply ) end
force.UnEquip = function( ply ) end
force.StartUse = function( ply )
	local Time = CurTime()

	if (ply._lscsLightningxTime or 0) > Time then
		ply._lscsLightningxTime = nil
		ply._lscsLightningxStartTime = nil

		return
	end

	if ply:lscsGetForce() < 10 then return end

	local CanDo = (ply._lscsNextForce or 0) < Time and (ply._lscsLightningxTime or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 1

	ply:EmitSound("lscs/force/lightning.mp3")

	ply:lscsTakeForce( 0 )

	ForceLXFry( ply, Time )

	if not ply._lscsLightningxTime then
		ply._lscsLightningxTime = CurTime() + 3.5
		ply._lscsLightningxStartTime = CurTime() + 0.15

		LSCS:PlayVCDSequence( ply, "gesture_signal_forward", 0.1 )
	end
end
force.StopUse = function( ply )
	ply._lscsLightningxTime = nil
end
LSCS:RegisterForce( force )

if SERVER then
	hook.Add( "LSCS:PlayerCanManipulate", "!!!lscs_forceblocking", function( ply, target_ent, ignore_passive )
		if not target_ent.IsPlayer or not target_ent:IsPlayer() then return end

		if target_ent:GetNWBool( "_lscsForceProtect", false ) then
			target_ent:lscsSetForce( math.min(target_ent:lscsGetForce() + 15, target_ent:lscsGetMaxForce()) )

			local effectdata = EffectData()
				effectdata:SetOrigin( target_ent:GetPos() )
				effectdata:SetEntity( target_ent )
			util.Effect( "force_block", effectdata, true, true )

			target_ent:EmitSound("lscs/force/block.mp3")
			LSCS:PlayVCDSequence( target_ent, "walk_magic" )

			return true
		end

		if ignore_passive then return end

		if target_ent._lscsForceResistant and target_ent:lscsGetForce() > 50 then
			LSCS:PlayVCDSequence( target_ent, "walk_magic" )

			return true
		end
	end )
else
	local zoom_mat = Material( "vgui/zoom" )
	local warp = Material("effects/tp_eyefx/tpeye3")

    -- Normal Sense
	hook.Add( "HUDPaint", "!lscs_senseoverlay", function()
		local ply = LocalPlayer()

		if not ply:GetNWBool( "_lscsForceSense", false ) then return end

		local X = ScrW()
		local Y = ScrH()

		surface.SetDrawColor( Color(255,255,255,255) )
		surface.SetMaterial( zoom_mat ) 
		surface.DrawTexturedRectRotated( X + X * 0.5, Y * 0.5, X, Y, 0 )
		surface.DrawTexturedRectRotated( X + X * 0.5, Y + Y * 0.5, Y, X, 270 )
		surface.DrawTexturedRectRotated( X * 0.5, Y * 0.5, Y, X, 90 )
		surface.DrawTexturedRectRotated( X * 0.5, Y + Y * 0.5, X, Y, 180 )
	
		surface.SetMaterial( warp ) 
		surface.DrawTexturedRect( 0, 0, X, Y )
	end )

    -- Advanced Sense
	hook.Add( "HUDPaint", "!lscs_senseoverlay_advanced", function()
		local ply = LocalPlayer()

		if not ply:GetNWBool( "_lscsForceSenseAdvanced", false ) then return end

		local X = ScrW()
		local Y = ScrH()

		surface.SetDrawColor( Color(255,255,255,255) )
		surface.SetMaterial( zoom_mat ) 
		surface.DrawTexturedRectRotated( X + X * 0.5, Y * 0.5, X, Y, 0 )
		surface.DrawTexturedRectRotated( X + X * 0.5, Y + Y * 0.5, Y, X, 270 )
		surface.DrawTexturedRectRotated( X * 0.5, Y * 0.5, Y, X, 90 )
		surface.DrawTexturedRectRotated( X * 0.5, Y + Y * 0.5, X, Y, 180 )
	
		surface.SetMaterial( warp ) 
		surface.DrawTexturedRect( 0, 0, X, Y )
	end )

    -- Mastered Sense
	hook.Add( "HUDPaint", "!lscs_senseoverlay_mastered", function()
		local ply = LocalPlayer()

		if not ply:GetNWBool( "_lscsForceSenseMastered", false ) then return end

		local X = ScrW()
		local Y = ScrH()

		surface.SetDrawColor( Color(255,255,255,255) )
		surface.SetMaterial( zoom_mat ) 
		surface.DrawTexturedRectRotated( X + X * 0.5, Y * 0.5, X, Y, 0 )
		surface.DrawTexturedRectRotated( X + X * 0.5, Y + Y * 0.5, Y, X, 270 )
		surface.DrawTexturedRectRotated( X * 0.5, Y * 0.5, Y, X, 90 )
		surface.DrawTexturedRectRotated( X * 0.5, Y + Y * 0.5, X, Y, 180 )
	
		surface.SetMaterial( warp ) 
		surface.DrawTexturedRect( 0, 0, X, Y )
	end )

	-- Ultimate Sense
	hook.Add("HUDPaint", "!lscs_senseoverlay_ultimate", function()
	    local ply = LocalPlayer()

	    if not ply:GetNWBool("_lscsForceSenseUltimate", false) then return end

	    local X = ScrW()
	    local Y = ScrH()

	    -- Red overlay material (zoom)
	    surface.SetDrawColor(Color(255, 0, 0, 255))
	    surface.SetMaterial(zoom_mat)
	    surface.DrawTexturedRectRotated(X + X * 0.5, Y * 0.5, X, Y, 0)
	    surface.DrawTexturedRectRotated(X + X * 0.5, Y + Y * 0.5, Y, X, 270)
	    surface.DrawTexturedRectRotated(X * 0.5, Y * 0.5, Y, X, 90)
	    surface.DrawTexturedRectRotated(X * 0.5, Y + Y * 0.5, X, Y, 180)

	    -- Warp effect material
	    surface.SetMaterial(warp)
	    surface.DrawTexturedRect(0, 0, X, Y)
	end)

	hook.Add( "HUDPaint", "!lscs_protectoverlay", function()
		local ply = LocalPlayer()

		if not ply:GetNWBool( "_lscsForceProtect", false ) then return end

		local X = ScrW()
		local Y = ScrH()
	
		surface.SetDrawColor(0, 127, 255, 25)
		surface.DrawRect( 0, 0, X, Y )
	end )

	
	local function StencilMagic( renderfunction, Col )
		render.SetStencilWriteMask( 0xFF )
		render.SetStencilTestMask( 0xFF )
		render.ClearStencil()

		render.SetStencilEnable( true )
		render.SetStencilReferenceValue( 1 )
		render.SetStencilCompareFunction( STENCIL_ALWAYS )
		render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
		render.SetStencilZFailOperation( STENCILOPERATION_REPLACE )

		renderfunction()

		render.SetStencilCompareFunction( STENCIL_EQUAL )
		render.ClearBuffersObeyStencil(Col.r, Col.g, Col.b, Col.a , false)

		render.SetStencilEnable( false )
	end

	-- Entity check function to avoid redundancy
	local function IsValidEntity(ent)
	    if not ent:IsNPC() and not ent:IsNextBot() and not ent:IsPlayer() then return false end
	    if not ent:Alive() or ent:Health() <= 0 then return false end
	    if ent:GetMoveType() == MOVETYPE_NONE then return false end
	    return true
	end

	-- Normal Sense
	hook.Add("PostDrawOpaqueRenderables", "!!!!lscs_playertrackerwallhack_sense", function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
	    if isDraw3DSkybox then return end

	    local ply = LocalPlayer()

	    if not ply:GetNWBool("_lscsForceSense", false) then return end

	    local maxDistance = 1000

	    StencilMagic(
	        function()
	            for _, ent in pairs(ents.GetAll()) do
	                if ent == ply then continue end
	                if not IsValidEntity(ent) then continue end

	                local distance = ply:GetPos():Distance(ent:GetPos())
	                if distance > maxDistance then continue end

	                ent:DrawModel()
	            end
	        end,
	        Color(194, 240, 255, 255) -- Blue shit
	    )
	end)

	-- Advanced Sense
	hook.Add("PostDrawOpaqueRenderables", "!!!!lscs_playertrackerwallhack_advanced", function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
	    if isDraw3DSkybox then return end

	    local ply = LocalPlayer()

	    if not ply:GetNWBool("_lscsForceSenseAdvanced", false) then return end

	    local maxDistance = 2000

	    StencilMagic(
	        function()
	            for _, ent in pairs(ents.GetAll()) do
	                if ent == ply then continue end
	                if not IsValidEntity(ent) then continue end

	                local distance = ply:GetPos():Distance(ent:GetPos())
	                if distance > maxDistance then continue end

	                ent:DrawModel()
	            end
	        end,
	        Color(194, 240, 255, 255) -- Blue shit
	    )
	end)

	-- Mastered Sense
	hook.Add("PostDrawOpaqueRenderables", "!!!!lscs_playertrackerwallhack_mastered", function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
	    if isDraw3DSkybox then return end

	    local ply = LocalPlayer()

	    if not ply:GetNWBool("_lscsForceSenseMastered", false) then return end

	    local maxDistance = 4000

	    StencilMagic(
	        function()
	            for _, ent in pairs(ents.GetAll()) do
	                if ent == ply then continue end
	                if not IsValidEntity(ent) then continue end

	                local distance = ply:GetPos():Distance(ent:GetPos())
	                if distance > maxDistance then continue end

	                ent:DrawModel()
	            end
	        end,
	        Color(194, 240, 255, 255) -- Blue shit
	    )
	end)

	-- Ultimate Sense
	hook.Add("PostDrawOpaqueRenderables", "!!!!lscs_playertrackerwallhack_ultimate", function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
	    if isDraw3DSkybox then return end

	    local ply = LocalPlayer()

	    if not ply:GetNWBool("_lscsForceSenseUltimate", false) then return end

	    local maxDistance = 6000

	    StencilMagic(
	        function()
	            for _, ent in pairs(ents.GetAll()) do
	                if ent == ply then continue end
	                if not IsValidEntity(ent) then continue end

	                local distance = ply:GetPos():Distance(ent:GetPos())
	                if distance > maxDistance then continue end

	                ent:DrawModel()
	            end
	        end,
	        Color(255, 255, 255, 255)  -- White color(of the wallhacks)
	    )
	end)
end