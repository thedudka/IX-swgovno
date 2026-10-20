AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vjsw/confederacyofindependentsystems/Homing_Spider_Droid.mdl" -- Leave empty if using more than one model
ENT.StartHealth = 3000
ENT.VJ_NPC_Class = {"CLASS_CIS"}
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
ENT.RangeAttackProjectiles = "obj_vj_cw_heavyrod_red" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = 1 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = VJ.SET(2,3) -- How much time until it can use a range attack?
ENT.RangeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the range attack animation?
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.Immune_Melee = true -- Immune to melee-type damage | Example: Crowbar, slash damages
ENT.Immune_Dissolve = true
ENT.Immune_Toxic = true
ENT.Immune_Bullet = true
ENT.AnimTbl_RangeAttack = false
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
ENT.TurningSpeed = 5 -- How fast it can turn
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.PoseParameterLooking_TurningSpeed = 5 -- How fast does the parameter turn?
ENT.SoundTbl_Impact = false
ENT.VJ_ID_Healable = false

	-- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {"vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA02.wav","vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA03.wav","vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA04.wav","vj_sw_clone_wars_era/snpcs/at-te/fs_walker_layerA05.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

ENT.BreathSoundLevel = 80
ENT.FootStepSoundLevel = 100
function ENT:OnInput(key, activator, caller, data)
	if key == "SWBF_Homing.Step" then
		self:FootStepSoundCode()
		util.ScreenShake(self:GetPos(), 14, 200, 0.6, 4500)
	end
end

function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end

function ENT:Init() 

	self:SetCollisionBounds(Vector(-85,-85,0),Vector(85,85,400))
	
	if GetConVar("vj_cw_cis_friendly"):GetInt() > 0 then
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
	else
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
	end
	
	self.NextBlasterFire = 0
	
	self.IdleLoop = CreateSound(self,"vehicles/crane/crane_idle_loop3.wav")
	self.IdleLoop:SetSoundLevel(100)
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
		if self.enemyDistance <= 3000 then
			if angleDiff <= 60 then
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
		if enemyDistance <= 4500 then
			if IsValid(self:GetEnemy()) && CurTime() > self.NextBlasterFire then
				VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/homing_spider_droid/fire.wav",95)
				timer.Create("laserFireTime" .. self:EntIndex(),0.1,6,function()
					if IsValid(self:GetEnemy()) && !self.Dead then
						self:FireLaser()
					else
						timer.Remove("laserFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
			self.NextBlasterFire = CurTime() + math.Rand(3,5)
			end
		end
	end
end

function ENT:FireLaser() 
    local laser = {}
    laser.Num = 1 
    laser.Spread = Vector(math.random(95, -95), math.random(95, -95), math.random(95, -95))
    laser.Damage = 22
    laser.Force = 5
    laser.AmmoType = "AR2"
    laser.Tracer = 1
    laser.TracerName = "vj_cw_homingspiderdroid_beam"
	laser.Src = self:GetAttachment(1).Pos
	laser.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter())-self:GetAttachment(1).Pos

	ParticleEffectAttach("hcea_red_hunter_muzzle",PATTACH_POINT_FOLLOW,self,1)
	
    laser.Callback = function(attacker, tr, dmgInfo)
		dmgInfo:SetDamageType(DMG_BURN)
        if tr.Hit then
            if tr.HitSky then return end
            local sparkEffect = EffectData()
            sparkEffect:SetOrigin(tr.HitPos)
            sparkEffect:SetScale(1)
            sparkEffect:SetMagnitude(2)
            util.Effect("Sparks", sparkEffect, true, true)
            util.Decal("fadingscorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			ParticleEffect("hcea_gold_hunter_hit",tr.HitPos,Angle(0,0,0),nil)
        end
    end

    self:FireBullets(laser)
	
	local muzzleflash = ents.Create("env_sprite")
	muzzleflash:SetKeyValue("model","vj_base/sprites/glow.vmt")
	muzzleflash:SetKeyValue("scale","2")
	muzzleflash:SetKeyValue("rendermode","5")
	muzzleflash:SetKeyValue("rendercolor", "255 0 0")
	muzzleflash:Spawn()
	muzzleflash:SetParent(self)
	muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("muzzle_top")).Pos + self:GetAttachment(self:LookupAttachment("muzzle_top")).Ang:Forward() * 15)
	muzzleflash:Fire("Kill","",0.07)
	self:DeleteOnRemove(muzzleflash)
	
    local muzzlelight = ents.Create("light_dynamic")
    muzzlelight:SetKeyValue("brightness", "4")
    muzzlelight:SetKeyValue("distance", "120")
    muzzlelight:Fire("Color", "255 0 0")
    muzzlelight:SetPos(self:GetAttachment(1).Pos)
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

		self:PlayAnim("vjges_Fire", false)

		if IsValid(projectile) && IsValid(projectile:GetOwner()) then
			if IsValid(projectile:GetPhysicsObject()) && IsValid(projectile:GetOwner():GetEnemy()) then
				projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), enemy, "Line", projectile:GetPos(), 1, 2000))
				projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
			end
		end

		VJ.EmitSound(self,"vj_sw_clone_wars_era/weapons/rocketlauncher/fire.wav",95)
		
		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness", "4")
		muzzlelight:SetKeyValue("distance", "220")
		muzzlelight:Fire("Color", "255 0 0")
		muzzlelight:SetPos(self:GetAttachment(3).Pos)
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		muzzlelight:Fire("TurnOn", "", 0)
		muzzlelight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(muzzlelight)
		
		local muzzleflash = ents.Create("env_sprite")
		muzzleflash:SetKeyValue("model","vj_base/sprites/glow.vmt")
		muzzleflash:SetKeyValue("scale","3")
		muzzleflash:SetKeyValue("rendermode","5")
		muzzleflash:SetKeyValue("rendercolor", "255 0 0")
		muzzleflash:Spawn()
		muzzleflash:SetParent(self)
		muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("muzzle_bottom")).Pos + self:GetAttachment(self:LookupAttachment("muzzle_bottom")).Ang:Forward() * 15)
		muzzleflash:Fire("Kill","",0.07)
		self:DeleteOnRemove(muzzleflash)
		
	end
end

function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("muzzle_bottom")).Pos -- Attachment example
end

function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" then	
		if dmginfo:IsBulletDamage() or dmginfo:GetDamageType() == DMG_SLASH or dmginfo:GetDamageType() == DMG_CLUB then
			local inflictor = dmginfo:GetInflictor()
			local attacker = dmginfo:GetAttacker()
			local weapon = IsValid(attacker) and attacker:IsPlayer() and attacker:GetActiveWeapon()
			local isRailcoil = (IsValid(inflictor) and inflictor:GetClass() == "rw_sw_railcoil") or
				(IsValid(weapon) and weapon:GetClass() == "rw_sw_railcoil")

			VJ.EmitSound(self, "VJ.Impact.Armor")
			if (isRailcoil) then
				dmginfo:ScaleDamage(1.0)
			else
				dmginfo:ScaleDamage(0.40)
			end

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
		local myPos = self:GetPos() + self:GetUp()*300
		ParticleEffect("doi_stuka_explosion", myPos, Angle(-90,0,0))
		ParticleEffect("doi_stuka_explosion", myPos, Angle(90,0,0))
		ParticleEffect("doi_stuka_explosion", myPos, Angle(0,-90,0))
		ParticleEffect("doi_stuka_explosion", myPos, Angle(0,90,0))
		--ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(0,0,-90), self)
		--ParticleEffect("doi_stuka_explosion", self:GetAttachment(self:LookupAttachment("root")).Pos, Angle(0,0,90), self)
		--ParticleEffectAttach("doi_mortar_explosion", PATTACH_POINT_FOLLOW, self, 3)
		VJ.EmitSound(self, "VJ.Explosion")
		VJ.EmitSound(self,"ambient/explosions/explode_2.wav",95)
		util.ScreenShake(myPos, 100, 200, 1, 2500)
		util.BlastDamage(self, self, myPos, 300, 60)
	end
end

function ENT:CustomOnRemove()
	self.IdleLoop:Stop()
	timer.Remove("laserFireTime" .. self:EntIndex())
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/