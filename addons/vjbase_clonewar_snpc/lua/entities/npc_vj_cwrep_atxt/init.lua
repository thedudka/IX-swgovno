AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vjsw/galacticrepublic/vehicles/ATXT.mdl" -- Leave empty if using more than one model
ENT.StartHealth = 500
ENT.HullType = HULL_LARGE
ENT.VJ_ID_Boss = true
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.LimitChaseDistance = true -- Should it limit chasing when between certain distances? | true = Always limit | "OnlyRange" = Only limit if it's able to range attack
ENT.LimitChaseDistance_Min = 0 -- Min distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's min distance
ENT.LimitChaseDistance_Max = 1600 -- Max distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's max distance
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackMinDistance = 0 -- Min range attack distance
ENT.RangeAttackMaxDistance = 9000 -- This is how far away it can shoot
ENT.RangeAttackProjectiles = "obj_vj_cw_heavyrod_blue" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = VJ.SET(2.2,3.5) -- How much time until it can use a range attack?
ENT.RangeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the range attack animation?
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.Immune_Melee = true -- Immune to melee-type damage | Example: Crowbar, slash damages
ENT.Immune_Dissolve = true
ENT.Immune_Toxic = true
ENT.Immune_Bullet = true
ENT.AnimTbl_RangeAttack = {"vjges_fire"}
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIE_GUTSHOT} -- Death Animations
ENT.DeathAnimationChance = 1 -- Put 1 if you want it to play the animation all the time
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
ENT.TurningSpeed = 5 -- How fast it can turn
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.PoseParameterLooking_TurningSpeed = 5 -- How fast does the parameter turn?
ENT.SoundTbl_Impact = false
ENT.VJ_ID_Healable = false

	-- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {"vj_sw_clone_wars_era/snpcs/at-xt/atxtstep1.wav","vj_sw_clone_wars_era/snpcs/at-xt/atxtstep2.wav","vj_sw_clone_wars_era/snpcs/at-xt/atxtstep3.wav","vj_sw_clone_wars_era/snpcs/at-xt/atxtstep4.wav","vj_sw_clone_wars_era/snpcs/at-xt/atxtstep5.wav","vj_sw_clone_wars_era/snpcs/at-xt/atxtstep6.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

ENT.BreathSoundLevel = 80
ENT.FootStepSoundLevel = 100
ENT.DeathSoundLevel = 100

ENT.ATXTMuzzleAttachLeft = false
ENT.ATXTMuzzleAttachRight2 = true

--function ENT:RangeAttackCode_GetShootPos(TheProjectile)
--	return (self:GetEnemy():GetPos() - self:LocalToWorld(Vector(1,1)))*5 + self:GetUp()*-450
--end

function ENT:OnInput(key, activator, caller, data)
	if key == "SWBF_ATXT.Step" then
		self:FootStepSoundCode()
		util.ScreenShake(self:GetPos(), 14, 200, 0.6, 3024)
	elseif key == "SWBF_ATXT.Crash" then
		util.ScreenShake(self:GetPos(), 14, 200, 0.6, 3024)
	elseif key == "SWBF_ATXT.Fire" then
		self:ExecuteRangeAttack()
	elseif key == "SWBF_ATXT.MuzzleLeft" then
		self.ATXTMuzzleAttachLeft = false
	elseif key == "SWBF_ATXT.MuzzleRight" then
		self.ATXTMuzzleAttachLeft = true
	elseif key == "SWBF_ATXT.FireMortar" then
		if IsValid(self:GetEnemy()) && !self.Dead then
			self:FireMortar()
		end
	elseif key == "SWBF_ATXT.MortarMuzzleRight" then
		self.ATXTMuzzleAttachRight2 = false
	elseif key == "SWBF_ATXT.MortarMuzzleLeft" then
		self.ATXTMuzzleAttachRight2 = true
	end
end

function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end

function ENT:Init() 

	self:SetCollisionBounds(Vector(88, 88, 350),Vector(-88, -88, 0))
	
	if GetConVar("vj_cw_galaticrepublic_hostile"):GetInt() < 1 then
		self.VJ_NPC_Class = {"CLASS_GALACTIC_REPUBLIC","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
		self.FriendsWithAllPlayerAllies = true -- Should this NPC be friends with other player allies?
	else
		self.VJ_NPC_Class = {"CLASS_GALACTIC_REPUBLIC"} -- NPCs with the same class with be allied to each other
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
		self.FriendsWithAllPlayerAllies = true -- Should this NPC be friends with other player allies?
	end
	
	self.NextBlasterFire = 0
	
	self.IdleLoop = CreateSound(self,"vehicles/crane/crane_idle_loop3.wav")
	self.IdleLoop:SetSoundLevel(80)
	self.IdleLoop:Play()
	self.IdleLoop:ChangeVolume(1)
	
end

function ENT:OnThinkActive()
	if (self:GetActivity() == ACT_TURN_LEFT or self:GetActivity() == ACT_TURN_RIGHT) && self:GetCycle() >= 0.95 then
		self:SetCycle(0.1)
	end
	
	if IsValid(self:GetEnemy()) then
		local angleDiff = math.abs(math.AngleDifference(self:GetForward():Angle().yaw, (self:GetEnemy():GetPos() - self:GetPos()):GetNormalized():Angle().yaw))
		self.enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
		if self.enemyDistance <= 1600 then
			if angleDiff <= 90 then
				self:SetMaxYawSpeed(0)
			else
				self:SetMaxYawSpeed(self.TurningSpeed)
			end
		else 
			self:SetMaxYawSpeed(self.TurningSpeed)
		end
    else
		self:SetMaxYawSpeed(self.TurningSpeed)
	end
end

function ENT:OnThinkAttack(isAttacking, enemy)
	if !self.VJ_IsBeingControlled then
		local enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
		if enemyDistance >= 1000 && enemyDistance <= 9000 then
			if IsValid(self:GetEnemy()) && CurTime() > self.NextBlasterFire && self.EnemyData.Visible then
				if IsValid(self:GetEnemy()) && !self.Dead then
					timer.Simple( 1.5, function() if IsValid(self) && !self.Dead then self:PlayAnim("vjges_fire_heavy", false) end end)
				else
					self.NextBlasterFire = CurTime() +1
				end	
			self.NextBlasterFire = CurTime() + math.Rand(4,5.5)
			end
		end
	end
end

function ENT:FireMortar() 
		local projectile = ents.Create("obj_vj_cw_atxtprotonmortar")
		if self.ATXTMuzzleAttachRight2 == true then
			projectile:SetPos(self:GetAttachment(self:LookupAttachment("Gun_R")).Pos)
		else
			projectile:SetPos(self:GetAttachment(self:LookupAttachment("Gun_L")).Pos)
		end
		projectile:SetAngles(self:GetAngles())
		projectile:SetOwner(self)
		projectile:Spawn()
		projectile:Activate()

		if IsValid(self:GetEnemy()) and IsValid(projectile:GetPhysicsObject()) then
			projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", projectile:GetPos(), 1, 0))
			projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
		end
		
		if self.ATXTMuzzleAttachRight2 == true then
			ParticleEffectAttach("hcea_t25r_muzzle",PATTACH_POINT_FOLLOW,self,5)
		else
			ParticleEffectAttach("hcea_t25r_muzzle",PATTACH_POINT_FOLLOW,self,4)
		end
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/at-xt/mortarfire.wav",95, self:VJ_DecideSoundPitch(100, 110))
		
		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness", "4")
		muzzlelight:SetKeyValue("distance", "120")
		muzzlelight:Fire("Color", "0 63 255")
		if self.ATXTMuzzleAttachRight2 == true then
			muzzlelight:SetPos(self:GetAttachment(5).Pos)
		else
			muzzlelight:SetPos(self:GetAttachment(4).Pos)
		end
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		muzzlelight:Fire("TurnOn", "", 0)
		muzzlelight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(muzzlelight)
end

function ENT:OnRangeAttackExecute(status, enemy, projectile) 
	if status == "PostSpawn" then

		if IsValid(projectile) && IsValid(projectile:GetOwner()) then
			if IsValid(projectile:GetPhysicsObject()) && IsValid(projectile:GetOwner():GetEnemy()) then
				projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), enemy, "Line", projectile:GetPos(), 1, 2000))
				projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
			end
		end

		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/at-xt/ATSTfire3.wav",95)

		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness", "4")
		muzzlelight:SetKeyValue("distance", "220")
		muzzlelight:Fire("Color", "0 63 255")
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		if self.ATXTMuzzleAttachLeft == true then
			muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("muzzle_L")).Pos + self:GetAttachment(self:LookupAttachment("muzzle_L")).Ang:Forward() * 15)
		else
			muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("muzzle_R")).Pos + self:GetAttachment(self:LookupAttachment("muzzle_R")).Ang:Forward() * 15)
		end
		muzzlelight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(muzzlelight)
		
		local muzzleflash = ents.Create("env_sprite")
		muzzleflash:SetKeyValue("model","vj_base/sprites/glow.vmt")
		muzzleflash:SetKeyValue("scale","3")
		muzzleflash:SetKeyValue("rendermode","5")
		muzzleflash:SetKeyValue("rendercolor", "0 63 255")
		muzzleflash:Spawn()
		muzzleflash:SetParent(self)
		if self.ATXTMuzzleAttachLeft == true then
			muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("muzzle_L")).Pos + self:GetAttachment(self:LookupAttachment("muzzle_L")).Ang:Forward() * 15)
		else
			muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("muzzle_R")).Pos + self:GetAttachment(self:LookupAttachment("muzzle_R")).Ang:Forward() * 15)
		end
		muzzleflash:Fire("Kill","",0.07)
		self:DeleteOnRemove(muzzleflash)
		
		--if self.ATXTMuzzleAttachLeft == true then
		--	self:PlayAnim("vjges_fire_1")
		--else
		--	self:PlayAnim("vjges_fire_2")
		--end
	end
end

function ENT:RangeAttackProjVel(projectile)
	return self:GetForward()*400
end

function ENT:RangeAttackProjPos(projectile)
	if self.ATXTMuzzleAttachLeft == true then
		return self:GetAttachment(self:LookupAttachment("muzzle_l")).Pos -- Attachment example
	else	
		return self:GetAttachment(self:LookupAttachment("muzzle_R")).Pos -- Attachment example
	end
end

function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		ParticleEffectAttach("smoke_burning_engine_01",PATTACH_POINT_FOLLOW,self,1)
		
		timer.Simple( 2.1, function() if IsValid(self) then VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/at-xt/atst_fall.mp3",85,100) end end)
		
		timer.Simple( 5, function() if IsValid(self) then
			ParticleEffectAttach("bo3_panzer_explosion", PATTACH_POINT_FOLLOW, self, 1)
			ParticleEffectAttach("doi_mortar_explosion", PATTACH_POINT_FOLLOW, self, 1)
			VJ.EmitSound(self, "VJ.Explosion")
			util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
			util.BlastDamage(self, self, self:GetPos(), 300, 60)
		end end)
		
		timer.Simple( 5.09, function() if IsValid(self) then self:Remove() end end)
	end
end

function ENT:CustomOnRemove()
	self.IdleLoop:Stop()
	self:StopSound("vj_sw_clone_wars_era/snpcs/at-xt/atst_fall.mp3")
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/