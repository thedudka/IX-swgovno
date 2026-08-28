AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.VJ_NPC_Class = {"CLASS_CIS"}
ENT.Model = {"models/vjsw/confederacyofindependentsystems/Droideka.mdl"} -- Leave empty if using more than one model
ENT.StartHealth = 150
ENT.FootStepSoundLevel = 80
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_RangeAttack = false -- Animations to play when it range attacks | false = Don't play an animation
ENT.RangeAttackMinDistance = 0 -- Min distance an enemy must be to initiate a range attack
ENT.RangeAttackMaxDistance = 1100 -- Max distance an enemy must be to initiate a range attack
ENT.TimeUntilRangeAttackProjectileRelease = 0 -- How much time until the projectile is thrown? | false = Make the attack event-based
ENT.NextRangeAttackTime = 0.16 -- How much time until it can use a range attack? | number = Specific time | VJ.SET = Randomized between the 2 numbers
ENT.LimitChaseDistance = true -- Should it limit chasing when between certain distances? | true = Always limit | "OnlyRange" = Only limit if it's able to range attack
ENT.LimitChaseDistance_Min = 0 -- Min distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's min distance
ENT.LimitChaseDistance_Max = "UseRangeDistance" -- Max distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's max distance
ENT.HasDeathAnimation = true
ENT.DeathAnimationChance = 1
ENT.AnimTbl_Death = {"vjseq_Death"}
ENT.EntitiesToNoCollide = {"sent_vj_cw_droidekashield"} -- Set to a table of entity class names for it to not collide with otherwise leave it to false

ENT.DroidekaHasSpawned = false
ENT.DroidekaRightFire = false
ENT.DroidekaIsRolling = false
ENT.DroidekaShieldDestroyed = false
ENT.DroidekaBlasterSpread = 0.03
ENT.DroidekaShieldRegenerateTime = 0

ENT.SoundTbl_FootStep = {
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep1.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep2.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep3.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep4.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep5.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep6.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep7.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep8.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep9.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/droidekastep10.wav"}

ENT.SoundTbl_Impact = false

function ENT:Init()
	if GetConVar("vj_cw_cis_friendly"):GetInt() > 0 then
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
	else
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
	end
	
	self.RollLoop = CreateSound(self,"vj_sw_clone_wars_era/snpcs/droideka/drd_GEN_droideka_roll_lp.wav")
	self.RollLoop:SetSoundLevel(80)
	self.RollLoop:ChangeVolume(1)
	
	self:CreateShield()
	self.DroidekaHasSpawned = true

	
	local fireEntL1 = ents.Create("prop_dynamic")
	fireEntL1:SetModel("models/props_junk/watermelon01_chunk02c.mdl") 
	fireEntL1:SetLocalPos(self:GetPos())
	fireEntL1:SetOwner(self)
	fireEntL1:SetParent(self)
	fireEntL1:Fire("SetParentAttachment","MuzzleL1")
	fireEntL1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	fireEntL1:Spawn()
	fireEntL1:Activate()
	fireEntL1:SetNoDraw(true)
	fireEntL1:DrawShadow(false)
	fireEntL1:SetSolid(SOLID_NONE)
	self:DeleteOnRemove(fireEntL1)
	
	local fireEntL2 = ents.Create("prop_dynamic")
	fireEntL2:SetModel("models/props_junk/watermelon01_chunk02c.mdl") 
	fireEntL2:SetLocalPos(self:GetPos())
	fireEntL2:SetOwner(self)
	fireEntL2:SetParent(self)
	fireEntL2:Fire("SetParentAttachment","MuzzleL2")
	fireEntL2:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	fireEntL2:Spawn()
	fireEntL2:Activate()
	fireEntL2:SetNoDraw(true)
	fireEntL2:DrawShadow(false)
	fireEntL2:SetSolid(SOLID_NONE)
	self:DeleteOnRemove(fireEntL2)
	
	local fireEntR1 = ents.Create("prop_dynamic")
	fireEntR1:SetModel("models/props_junk/watermelon01_chunk02c.mdl") 
	fireEntR1:SetLocalPos(self:GetPos())
	fireEntR1:SetOwner(self)
	fireEntR1:SetParent(self)
	fireEntR1:Fire("SetParentAttachment","MuzzleR1")
	fireEntR1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	fireEntR1:Spawn()
	fireEntR1:Activate()
	fireEntR1:SetNoDraw(true)
	fireEntR1:DrawShadow(false)
	fireEntR1:SetSolid(SOLID_NONE)
	self:DeleteOnRemove(fireEntR1)
	
	local fireEntR2 = ents.Create("prop_dynamic")
	fireEntR2:SetModel("models/props_junk/watermelon01_chunk02c.mdl") 
	fireEntR2:SetLocalPos(self:GetPos())
	fireEntR2:SetOwner(self)
	fireEntR2:SetParent(self)
	fireEntR2:Fire("SetParentAttachment","MuzzleR2")
	fireEntR2:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	fireEntR2:Spawn()
	fireEntR2:Activate()
	fireEntR2:SetNoDraw(true)
	fireEntR2:DrawShadow(false)
	fireEntR2:SetSolid(SOLID_NONE)
	self:DeleteOnRemove(fireEntR2)
	
	self.FireEntL1 = fireEntL1
	self.FireEntL2 = fireEntL2
	self.FireEntR1 = fireEntR1
	self.FireEntR2 = fireEntR2
	
end

function ENT:CreateShield()
	local shield = ents.Create("sent_vj_cw_droidekashield")
	shield:SetPos(self:GetPos())
	shield:SetAngles(self:GetAngles())
	shield:SetOwner(self)
	shield:SetParent(self)
	shield:Spawn()
	shield:Activate()
	shield:SetSolid(SOLID_BBOX)
	shield:SetMoveType(MOVETYPE_NONE)
	shield:AddEffects(bit.bor(EF_BONEMERGE,EF_PARENT_ANIMATES))
	self.Shield = shield
	if self.DroidekaHasSpawned == true then
		self:EmitSound("vj_sw_clone_wars_era/snpcs/droideka/SHIELD_STRT"..math.random(1,5)..".wav", 90)
		ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Shield"))
	end
end

function ENT:RemoveShield()
	self.Shield:Remove()
	ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Shield"))
end

function ENT:OnInput(key, activator, caller, data)
	if key == "footstep" then
		self:FootStepSoundCode()
	elseif key == "UnfoldSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/droideka/drd_GEN_droideka_unfold.wav", 80)
	end
end

function ENT:OnThink()
	if self:GetActivity() == ACT_RUN then 
		self.RollLoop:Play()
		self.DroidekaIsRolling = true
	else
		self.RollLoop:Stop()
		self.DroidekaIsRolling = false
	end
end

function ENT:OnThinkActive()
	if !self.Dead then
		if self.DroidekaShieldDestroyed == false then
			if self.DroidekaIsRolling == true then
				if IsValid(self.Shield) then
					self:RemoveShield()
				end
			else
				if !IsValid(self.Shield) then
					self:CreateShield()
				end
			end
		elseif self.DroidekaShieldDestroyed == true && CurTime() > self.DroidekaShieldRegenerateTime then
			self:CreateShield()
			self.DroidekaShieldDestroyed = false
		end
	end
end

function ENT:OnRangeAttackExecute(status, enemy, projectile) 
	if status == "Init" then
		local blasterRod = {}
		local blasterRod2 = {}
		
		blasterRod.Num = 1 
		blasterRod.Spread = Vector(0,0,0)
		blasterRod.Damage = 6
		blasterRod.Force = 5
		blasterRod.AmmoType = "AR2"
		blasterRod.Tracer = 1
		blasterRod.TracerName = "effect_sw_laser_red"
		blasterRod.IgnoreEntity = self.Shield
		
		blasterRod2.Num = 1 
		blasterRod2.Spread = Vector(0,0,0)
		blasterRod2.Damage = 6
		blasterRod2.Force = 5
		blasterRod2.AmmoType = "AR2"
		blasterRod2.Tracer = 1
		blasterRod2.TracerName = "effect_sw_laser_red"
		blasterRod2.IgnoreEntity = self.Shield
	
		if self.DroidekaRightFire == false then
			blasterRod.Src = self.FireEntL1:GetPos()			
			blasterRod2.Src = self.FireEntL2:GetPos()
			ParticleEffectAttach("vj_muzzle_blaster_red",PATTACH_POINT_FOLLOW,self,2)
			ParticleEffectAttach("vj_muzzle_blaster_red",PATTACH_POINT_FOLLOW,self,3)
			direction1 = (enemy:GetPos() + enemy:OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzleL1")).Pos):GetNormalized()
			direction2 = (enemy:GetPos() + enemy:OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzleL2")).Pos):GetNormalized()
			self.DroidekaRightFire = true
		else
			blasterRod.Src = self.FireEntR1:GetPos()
			blasterRod2.Src = self.FireEntR2:GetPos()
			direction1 = (enemy:GetPos() + enemy:OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzleR1")).Pos):GetNormalized()
			direction2 = (enemy:GetPos() + enemy:OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzleR2")).Pos):GetNormalized()
			ParticleEffectAttach("vj_muzzle_blaster_red",PATTACH_POINT_FOLLOW,self,4)
			ParticleEffectAttach("vj_muzzle_blaster_red",PATTACH_POINT_FOLLOW,self,5)
			self.DroidekaRightFire = false
		end
		
		local spread = self.DroidekaBlasterSpread
		local sharedSpread = Vector(math.Rand(-spread,spread), math.Rand(-spread,spread), math.Rand(-spread,spread))

		local finalDirection1 = (direction1 + sharedSpread):GetNormalized()
		local finalDirection2 = (direction2 + sharedSpread):GetNormalized()

		blasterRod.Dir = finalDirection1
		blasterRod2.Dir = finalDirection2		
		
		blasterRod.Callback = function(attacker, tr, dmgInfo)
			if IsValid(self) then
				dmgInfo:SetAttacker(self)
				dmgInfo:SetInflictor(self)
			end
			if tr.Hit then
				if tr.HitSky then return end
				local sparkEffect = EffectData()
				sparkEffect:SetOrigin(tr.HitPos)
				sparkEffect:SetScale(1)
				sparkEffect:SetMagnitude(2)
				util.Effect("Sparks", sparkEffect, true, true)
				util.Decal("fadingscorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			end
		end
		
		blasterRod2.Callback = function(attacker, tr, dmgInfo)
			if IsValid(self) then
				dmgInfo:SetAttacker(self)
				dmgInfo:SetInflictor(self)
			end
			if tr.Hit then
				if tr.HitSky then return end
				local sparkEffect = EffectData()
				sparkEffect:SetOrigin(tr.HitPos)
				sparkEffect:SetScale(1)
				sparkEffect:SetMagnitude(2)
				util.Effect("Sparks", sparkEffect, true, true)
				util.Decal("fadingscorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			end
		end

		if self.DroidekaRightFire == false then
			self.FireEntL1:FireBullets(blasterRod)
			self.FireEntL2:FireBullets(blasterRod2)
		else
			self.FireEntR1:FireBullets(blasterRod)
			self.FireEntR2:FireBullets(blasterRod2)
		end
		
		VJ.EmitSound(self, "vj_sw_clone_wars_era/snpcs/droideka/wep_GEN_droidekaFire_01.wav", 85, self:GetSoundPitch(100, 110), 1, CHAN_WEAPON)
		VJ.EmitSound(self, "vj_sw_clone_wars_era/weapons/shared/distant.wav", 140, self:GetSoundPitch(90, 110), 1, bit.band(CHAN_AUTO, CHAN_WEAPON))

		VJ_EmitSound(self, "vj_sw_clone_wars_era/snpcs/sentry_gun/fire.wav", 85, self:VJ_DecideSoundPitch(100, 120))
		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness", "4")
		muzzlelight:SetKeyValue("distance", "120")
		muzzlelight:Fire("Color", "255 0 0")
		muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("muzzleL1")).Pos)
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		muzzlelight:Fire("TurnOn", "", 0)
		muzzlelight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(muzzlelight)
		return true
	end	
end

function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" then	
		if self.DroidekaShieldDestroyed == true then
			self.DroidekaShieldRegenerateTime = CurTime() + 15
		end
		if dmginfo:IsBulletDamage() or dmginfo:GetDamageType() == DMG_SLASH or dmginfo:GetDamageType() == DMG_CLUB then
			VJ.EmitSound(self, "VJ.Impact.Armor")
			dmginfo:ScaleDamage(0.25)
			local sparkEffect = EffectData()
			sparkEffect:SetOrigin(dmginfo:GetDamagePosition())
			sparkEffect:SetNormal(dmginfo:GetDamageForce():GetNormalized())
			sparkEffect:SetMagnitude(3)
			sparkEffect:SetScale(1)
			util.Effect("ElectricSpark", sparkEffect)
		end
	end	
end

function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		if IsValid(self.Shield) then
			self.Shield:Remove()
			self:EmitSound("vj_sw_clone_wars_era/snpcs/droideka/SHIELD_BRK"..math.random(1,4)..".wav", 90)
			ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Shield"))
		end
	elseif status == "DeathAnim" then	
		timer.Simple( 0.2, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetPos(self:GetAttachment(1).Pos)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
		timer.Simple( 1, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetPos(self:GetAttachment(1).Pos)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
		timer.Simple( 1.8, function() if IsValid(self) then
			local myPos = self:GetPos() + self:GetUp()*20
			ParticleEffect("explosion_turret_break", myPos, Angle(0, 0, 0))
			util.BlastDamage(self, self, myPos, 80, 20)
			VJ.EmitSound(self, "npc/scanner/cbot_energyexplosion1.wav",80)
		end end)
	end
end

function ENT:CustomOnRemove()
	self.RollLoop:Stop()
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/