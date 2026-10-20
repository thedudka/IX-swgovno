AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vjsw/confederacyofindependentsystems/Dwarf_Spider_Droid.mdl" -- Leave empty if using more than one model
ENT.StartHealth = 300
ENT.VJ_NPC_Class = {"CLASS_CIS"}
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.LimitChaseDistance = true -- Should it limit chasing when between certain distances? | true = Always limit | "OnlyRange" = Only limit if it's able to range attack
ENT.LimitChaseDistance_Min = 0 -- Min distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's min distance
ENT.LimitChaseDistance_Max = 1000 -- Max distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's max distance
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackMinDistance = 0 -- Min range attack distance
ENT.RangeAttackMaxDistance = 9000 -- This is how far away it can shoot
ENT.RangeAttackProjectiles = "obj_vj_cw_rod_red" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = 0.5 -- How much time until the projectile code is ran?
ENT.RangeAttackExtraTimers = {0.7} -- Extra range attack timers, EX: {1, 1.4} | it will run the projectile code after the given amount of seconds
ENT.NextRangeAttackTime = VJ.SET(1.5,2.5) -- How much time until it can use a range attack? | number = Specific time | VJ.SET = Randomized between the 2 numbers
ENT.RangeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the range attack animation?
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.AnimTbl_RangeAttack = false
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
ENT.TurningSpeed = 5 -- How fast it can turn
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.PoseParameterLooking_TurningSpeed = 5 -- How fast does the parameter turn?
ENT.SoundTbl_Impact = false
ENT.VJ_ID_Healable = false

	-- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {"npc/dog/dog_footstep1.wav","npc/dog/dog_footstep2.wav","npc/dog/dog_footstep3.wav","npc/dog/dog_footstep4.wav"}


ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

ENT.BreathSoundLevel = 80
ENT.FootStepSoundLevel = 80


function ENT:OnInput(key, activator, caller, data)
	if key == "SWBF_Dwarf.Step" then
		self:FootStepSoundCode()
	end
end

function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end

function ENT:Init() 

	self:SetCollisionBounds(Vector(-24,-24,0),Vector(24,24,95))
	
	if GetConVar("vj_cw_cis_friendly"):GetInt() > 0 then
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
	else
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
	end
	
end

function ENT:OnThinkActive()
	if (self:GetActivity() == ACT_TURN_LEFT or self:GetActivity() == ACT_TURN_RIGHT) && self:GetCycle() >= 0.95 then
		self:SetCycle(0.1)
	end
	
	if IsValid(self:GetEnemy()) then
		local angleDiff = math.abs(math.AngleDifference(self:GetForward():Angle().yaw, (self:GetEnemy():GetPos() - self:GetPos()):GetNormalized():Angle().yaw))
		self.enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
		if self.enemyDistance <= 1000 then
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

function ENT:OnRangeAttackExecute(status, enemy, projectile) 
	if status == "PostSpawn" then

		self:PlayAnim("vjges_Fire", false)

		if IsValid(projectile) && IsValid(projectile:GetOwner()) then
			if IsValid(projectile:GetPhysicsObject()) && IsValid(projectile:GetOwner():GetEnemy()) then
				projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), enemy, "Line", projectile:GetPos(), 1, 2000))
				projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
			end
		end

		VJ.EmitSound(self, "vj_sw_clone_wars_era/snpcs/dwarf_spider_droid/fire.wav", 90, self:GetSoundPitch(100, 110), 1, CHAN_WEAPON)
		VJ.EmitSound(self, "vj_sw_clone_wars_era/weapons/shared/distant.wav", 140, self:GetSoundPitch(90, 110), 1, bit.band(CHAN_AUTO, CHAN_WEAPON))

		ParticleEffectAttach("hcea_red_hunter_muzzle",PATTACH_POINT_FOLLOW,self,2)
		
		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness", "4")
		muzzlelight:SetKeyValue("distance", "120")
		muzzlelight:Fire("Color", "255 0 0")
		muzzlelight:SetPos(self:GetAttachment(2).Pos)
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		muzzlelight:Fire("TurnOn", "", 0)
		muzzlelight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(muzzlelight)
		
		local muzzleflash = ents.Create("env_sprite")
		muzzleflash:SetKeyValue("model","vj_base/sprites/glow.vmt")
		muzzleflash:SetKeyValue("scale","1")
		muzzleflash:SetKeyValue("rendermode","5")
		muzzleflash:SetKeyValue("rendercolor", "255 0 0")
		muzzleflash:Spawn()
		muzzleflash:SetParent(self)
		muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos + self:GetAttachment(self:LookupAttachment("muzzle")).Ang:Forward() * 15)
		muzzleflash:Fire("Kill","",0.07)
		self:DeleteOnRemove(muzzleflash)
		
	end
end

function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("muzzle")).Pos -- Attachment example
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
			if (!isRailcoil) then
				dmginfo:ScaleDamage(0.25)
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
		local myPos = self:GetPos() + self:GetUp()*60
		local defAng = Angle(0, 0, 0)
		ParticleEffect("explosion_turret_break", myPos, defAng)
		ParticleEffect("doom_rev_missile_blast", myPos, defAng)
		util.BlastDamage(self, self, myPos, 80, 20)
		util.ScreenShake(self:GetPos(), 16, 200, 1, 3000)
		VJ.EmitSound(self, "vj_sw_clone_wars_era/weapons/shared/wristrocketexplosion.wav",95)
	end
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/