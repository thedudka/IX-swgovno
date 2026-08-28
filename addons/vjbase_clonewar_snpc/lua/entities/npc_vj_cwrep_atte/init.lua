AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vjsw/galacticrepublic/vehicles/ATTE.mdl" -- Leave empty if using more than one model
ENT.StartHealth = 3000
ENT.HullType = HULL_LARGE
ENT.VJ_ID_Boss = true
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.LimitChaseDistance = true -- Should it limit chasing when between certain distances? | true = Always limit | "OnlyRange" = Only limit if it's able to range attack
ENT.LimitChaseDistance_Min = 0 -- Min distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's min distance
ENT.LimitChaseDistance_Max = 3000 -- Max distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's max distance
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackMinDistance = 0 -- Min range attack distance
ENT.RangeAttackMaxDistance = 9000 -- This is how far away it can shoot
ENT.RangeAttackProjectiles = "obj_vj_cw_heavyrod_green" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = 0.5 -- How much time until the projectile code is ran?
ENT.RangeAttackExtraTimers = {0.7} -- Extra range attack timers, EX: {1, 1.4} | it will run the projectile code after the given amount of seconds
ENT.NextRangeAttackTime = VJ.SET(1.2,2.7) -- How much time until it can use a range attack?
ENT.RangeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the range attack animation?
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.Immune_Melee = true -- Immune to melee-type damage | Example: Crowbar, slash damages
ENT.Immune_Dissolve = true
ENT.Immune_Toxic = true
ENT.Immune_Bullet = true
ENT.AnimTbl_RangeAttack = false
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIE_GUTSHOT} -- Death Animations
ENT.DeathAnimationChance = 1 -- Put 1 if you want it to play the animation all the time
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
ENT.TurningSpeed = 1 -- How fast it can turn
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.PoseParameterLooking_TurningSpeed = 5 -- How fast does the parameter turn?
ENT.SoundTbl_Impact = false
ENT.VJ_ID_Healable = false
--ENT.PoseParameterLooking_Names = {pitch = {"aim_pitch","aiming_cannon_pitch"}, yaw = {"aim_yaw","aiming_cannon_yaw"}, roll = {}} -- Custom pose parameters to use, can put as many as needed

	-- ====== Sound File Paths ====== --
--ENT.SoundTbl_Death = {"vj_sw_clone_wars_era/snpcs/at-te/atst_crash1.mp3"}
--ENT.SoundTbl_Breath = {"vehicles/crane/crane_idle_loop3.wav"}
ENT.SoundTbl_FootStep = {"vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA02.wav","vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA03.wav","vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA04.wav","vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA05.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

ENT.BreathSoundLevel = 80
ENT.FootStepSoundLevel = 110
ENT.DeathSoundLevel = 100

ENT.ATTEMuzzleAttachRight = false
ENT.ATTEMuzzleAttachRight2 = false

--function ENT:RangeAttackCode_GetShootPos(TheProjectile)
--	return (self:GetEnemy():GetPos() - self:LocalToWorld(Vector(1,1)))*5 + self:GetUp()*-450
--end

function ENT:OnInput(key, activator, caller, data)
	if key == "SWBF_ATTE.Step" or key == "SWBF_ATAT.Step_FL" or key == "SWBF_ATAT.Step_BR" or key == "SWBF_ATAT.Step_FR" or key == "SWBF_ATAT.Step_BL" then
		self:FootStepSoundCode()
		util.ScreenShake(self:GetPos(), 14, 200, 0.6, 4500)
	elseif key == "SWBF_ATTE.Crash" then
		util.ScreenShake(self:GetPos(), 14, 200, 0.6, 1024)
	end
end

function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end

function ENT:Init() 

	self:SetCollisionBounds(Vector(-280,-85,0),Vector(320,85,320))
	
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
	self.IdleLoop:SetSoundLevel(100)
	self.IdleLoop:Play()
	self.IdleLoop:ChangeVolume(1)

	local gunnerChoice
	if GetConVar("vj_cw_attegunner"):GetInt() == 1 then
		gunnerChoice = "npc_vj_cwrep_501st_clonetrooper"
	elseif GetConVar("vj_cw_attegunner"):GetInt() == 2 then
		gunnerChoice = "npc_vj_cwrep_212th_clonetrooper"
	elseif GetConVar("vj_cw_attegunner"):GetInt() == 3 then
		gunnerChoice = "npc_vj_cwrep_327th_clonetrooper"
	elseif GetConVar("vj_cw_attegunner"):GetInt() == 4 then
		gunnerChoice = "npc_vj_cwrep_shock_clonetrooper"
	elseif GetConVar("vj_cw_attegunner"):GetInt() == 5 then
		gunnerChoice = "npc_vj_cwrep_galactic_marine"
	elseif GetConVar("vj_cw_attegunner"):GetInt() == 6 then
		gunnerChoice = "npc_vj_cwrep_phase1_clonetrooper"
	else
		gunnerChoice = "npc_vj_cwrep_clonetrooper"
	end
	local gunner = ents.Create(gunnerChoice)
	gunner:SetPos(self:GetAttachment(9).Pos)
	gunner:SetAngles(self:GetAttachment(9).Ang)
	gunner:SetOwner(self)
	gunner:SetParent(self, 9)
	gunner.MovementType = VJ_MOVETYPE_STATIONARY
	gunner.Weapon_Disabled = true
	gunner.CanTurnWhileStationary = false
	gunner.Weapon_UnarmedBehavior = false
	gunner.VJ_ID_Healable = false
	gunner.CanReceiveOrders = false
	gunner.CWIsGunner = true
	gunner.CWHasNoDeathAnim = true
	gunner.VJ_NPC_Class = self.VJ_NPC_Class
	gunner.PhysgunDisabled = true
	gunner:Spawn()
	gunner:Fire("SetParentAttachment", "Cannon_Seat")
	gunner:SetState(VJ_STATE_ONLY_ANIMATION_NOATTACK)
	self:DeleteOnRemove(gunner)
	self.gunner = gunner
	
end

function ENT:OnThinkActive()
	if (self:GetActivity() == ACT_TURN_LEFT or self:GetActivity() == ACT_TURN_RIGHT) && self:GetCycle() >= 0.95 then
		self:SetCycle(0.1)
	end
	
	if IsValid(self:GetEnemy()) then
		local angleDiff = math.abs(math.AngleDifference(self:GetForward():Angle().yaw, (self:GetEnemy():GetPos() - self:GetPos()):GetNormalized():Angle().yaw))
		self.enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
		if self.enemyDistance <= 3600 then
			if angleDiff <= 75 then
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

	if !IsValid(self:GetEnemy()) && self.ATTEMuzzleAttachRight2 == true then
		self.ATTEMuzzleAttachRight2 = false
	end

end

function ENT:OnThinkAttack(isAttacking, enemy)
	if !self.VJ_IsBeingControlled then
		local enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
		if enemyDistance <= 6000 then
			if IsValid(self:GetEnemy()) && IsValid(self.gunner) && self.EnemyData.Visible && CurTime() > self.NextBlasterFire then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.32,1,function()
					if IsValid(self:GetEnemy()) && !self.Dead then
						self:FireTurret()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
			self.NextBlasterFire = CurTime() + math.Rand(3,4.5)
			end
		end
	end
end

function ENT:FireTurret() 
	self:PlayAnim("vjges_shoot_main_cannon", false)
	local projectile = ents.Create("obj_vj_cw_heavyrod_blue")
	projectile:SetPos(self:GetAttachment(self:LookupAttachment("MGun")).Pos)
	projectile:SetAngles(self:GetAngles())
	projectile:SetOwner(self)
	projectile:Spawn()
	projectile:Activate()

	if IsValid(self:GetEnemy()) and IsValid(projectile:GetPhysicsObject()) then
		projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), projectile:GetOwner():GetEnemy(), "Line", projectile:GetPos(), 1, 2000))
		projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
	end
	
    VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/at-te/topfire.wav",95)
	
	local muzzlelight = ents.Create("light_dynamic")
	muzzlelight:SetKeyValue("brightness", "4")
	muzzlelight:SetKeyValue("distance", "220")
	muzzlelight:Fire("Color", "0 63 255")
	muzzlelight:SetLocalAngles(self:GetAngles())
	muzzlelight:Spawn()
	muzzlelight:Activate()
	muzzlelight:SetParent(self)
	muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("MGun")).Pos)
	muzzlelight:Fire("Kill", "", 0.07)
	self:DeleteOnRemove(muzzlelight)
	
	local muzzleflash = ents.Create("env_sprite")
	muzzleflash:SetKeyValue("model","vj_base/sprites/glow.vmt")
	muzzleflash:SetKeyValue("scale","3")
	muzzleflash:SetKeyValue("rendermode","5")
	muzzleflash:SetKeyValue("rendercolor", "0 63 255")
	muzzleflash:Spawn()
	muzzleflash:SetParent(self)
	muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("MGun")).Pos)
	muzzleflash:Fire("Kill","",0.07)
	self:DeleteOnRemove(muzzleflash)
end

function ENT:OnRangeAttack(status, enemy) 
	if status == "Init" then
		self.ATTEMuzzleAttachRight = true
		timer.Create("PlayFireAnim" .. self:EntIndex(),1.5,1,function() 
			self:PlayAnim("vjges_fire")
		end)
		timer.Create("muzzleLeftTimer" .. self:EntIndex(),0.6,1,function() 
			if self.ATTEMuzzleAttachRight == true then
				self.ATTEMuzzleAttachRight = false
			end
		end)
		if self.ATTEMuzzleAttachRight2 == false then
			self.ATTEMuzzleAttachRight2 = true
		elseif self.ATTEMuzzleAttachRight2 == true then
			self.ATTEMuzzleAttachRight2 = false
		end
	end
end

function ENT:OnRangeAttackExecute(status, enemy, projectile) 
    if status == "PostSpawn" then
		if IsValid(projectile) && IsValid(projectile:GetOwner()) then
			if IsValid(projectile:GetPhysicsObject()) && IsValid(projectile:GetOwner():GetEnemy()) then
				projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), enemy, "Line", projectile:GetPos(), 1, 2000))
				projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
			end
		end
		
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/at-te/frontfire.wav",95)

		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness", "4")
		muzzlelight:SetKeyValue("distance", "220")
		muzzlelight:Fire("Color", "33 255 0")
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		if self.ATTEMuzzleAttachRight2 == true then
			if self.ATTEMuzzleAttachRight == true then
				muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("FGunR1")).Pos + self:GetAttachment(self:LookupAttachment("FGunR1")).Ang:Forward() * 15)
			else
				muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("FGunL1")).Pos + self:GetAttachment(self:LookupAttachment("FGunL1")).Ang:Forward() * 15)
			end
		else
			if self.ATTEMuzzleAttachRight == true then
				muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("FGunR2")).Pos + self:GetAttachment(self:LookupAttachment("FGunR2")).Ang:Forward() * 15)
			else
				muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("FGunL2")).Pos + self:GetAttachment(self:LookupAttachment("FGunL2")).Ang:Forward() * 15)
			end
		end
		muzzlelight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(muzzlelight)
		
		local muzzleflash = ents.Create("env_sprite")
		muzzleflash:SetKeyValue("model","vj_base/sprites/glow.vmt")
		muzzleflash:SetKeyValue("scale","3")
		muzzleflash:SetKeyValue("rendermode","5")
		muzzleflash:SetKeyValue("rendercolor", "33 255 0")
		muzzleflash:Spawn()
		muzzleflash:SetParent(self)
		if self.ATTEMuzzleAttachRight2 == true then
			if self.ATTEMuzzleAttachRight == true then
				muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("FGunR1")).Pos + self:GetAttachment(self:LookupAttachment("FGunR1")).Ang:Forward() * 15)
			else
				muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("FGunL1")).Pos + self:GetAttachment(self:LookupAttachment("FGunL1")).Ang:Forward() * 15)
			end
		else
			if self.ATTEMuzzleAttachRight == true then
				muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("FGunR2")).Pos + self:GetAttachment(self:LookupAttachment("FGunR2")).Ang:Forward() * 15)
			else
				muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("FGunL2")).Pos + self:GetAttachment(self:LookupAttachment("FGunL2")).Ang:Forward() * 15)
			end
		end
		muzzleflash:Fire("Kill","",0.07)
		self:DeleteOnRemove(muzzleflash)
	end
end

function ENT:RangeAttackProjPos(projectile)
	if self.ATTEMuzzleAttachRight2 == true then
		if self.ATTEMuzzleAttachRight == true then
			return self:GetAttachment(self:LookupAttachment("FGunR1")).Pos -- Attachment example
		else	
			return self:GetAttachment(self:LookupAttachment("FGunL1")).Pos -- Attachment example
		end
	else
		if self.ATTEMuzzleAttachRight == true then
			return self:GetAttachment(self:LookupAttachment("FGunR2")).Pos -- Attachment example
		else	
			return self:GetAttachment(self:LookupAttachment("FGunL2")).Pos -- Attachment example
		end
	end

end

function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		ParticleEffectAttach("smoke_burning_engine_01",PATTACH_POINT_FOLLOW,self,10)
		--VJ_EmitSound(self,"vj_sw_clone_wars_era/snpcs/at-te/atst_crash1.mp3",100,100)
		
		timer.Simple( 3, function() if IsValid(self) then
			VJ_EmitSound(self,"vj_sw_clone_wars_era/snpcs/at-xt/atst_fall.mp3",100,100)
		end end)
		
		--timer.Simple( 5.685, function() if IsValid(self) then if IsValid(self.gunner) then self.gunner:TakeDamage(9999999999999999999999999) end end end)
		
		timer.Simple( 5.7, function() if IsValid(self) then
			if IsValid(self.gunner) then self.gunner:TakeDamage(9999999999999999999999999) end
			ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(-90,0,0), self)
			ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(90,0,0), self)
			ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(0,-90,0), self)
			ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(0,90,0), self)
			--ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(0,0,-90), self)
			--ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(0,0,90), self)
			--ParticleEffectAttach("doi_mortar_explosion", PATTACH_POINT_FOLLOW, self, 3)
			VJ.EmitSound(self, "VJ.Explosion")
			VJ.EmitSound(self,"ambient/explosions/explode_2.wav",95)
			util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
			util.BlastDamage(self, self, self:GetPos(), 300, 60)
		end end)
		
		timer.Simple( 5.8, function() if IsValid(self) then self:Remove() end end)
		
		timer.Simple( 1, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*250 + self:GetUp()*200 + self:GetRight()*-80)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)

		timer.Simple( 2, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*250 + self:GetUp()*200 + self:GetRight()*80)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
		timer.Simple( 3, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*100 + self:GetUp()*250 + self:GetRight()*70)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
		timer.Simple( 3.5, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*100 + self:GetUp()*200 + self:GetRight()*-100)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
	end
end

function ENT:CustomOnRemove()
	self.IdleLoop:Stop()
	self:StopSound("vj_sw_clone_wars_era/snpcs/at-xt/atst_fall.mp3")
	timer.Remove("blasterFireTime" .. self:EntIndex())
	timer.Remove("muzzleLeftTimer" .. self:EntIndex())
	timer.Remove("PlayFireAnim" .. self:EntIndex())
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/