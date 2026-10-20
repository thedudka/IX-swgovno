AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.VJ_NPC_Class = {"CLASS_CIS"}
ENT.Model = {"models/VJSW/ConfederacyOfIndependentSystems/Super_Battle_Droid.mdl"} -- Leave empty if using more than one model
ENT.StartHealth = 250
ENT.MeleeAttackDamage = 50
ENT.FootStepSoundLevel = 80
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.LimitChaseDistance = true -- Should it limit chasing when between certain distances? | true = Always limit | "OnlyRange" = Only limit if it's able to range attack
ENT.LimitChaseDistance_Min = 0 -- Min distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's min distance
ENT.LimitChaseDistance_Max = 1200 -- Max distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's max distance
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.TimeUntilMeleeAttackDamage = false
ENT.SoundTbl_Impact = false
--ENT.CanFlinch = true -- Can it flinch? | false = Don't flinch | true = Always flinch | "DamageTypes" = Flinch only from certain damages types
ENT.FlinchDamageTypes = {DMG_BLAST} -- Which types of damage types should it flinch from when "DamageTypes" is used?
ENT.AnimTbl_Flinch = "vjseq_Hit"
ENT.FlinchChance = 5
ENT.AnimTbl_MeleeAttack = {"vjseq_Meleeattack","vjseq_Meleeattack2"}
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.HasMeleeAttackKnockBack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_vj_cw_sbdrocket" -- Entities that it can spawn when range attacking | table = Picks randomly
	-- ====== Animation ====== --
ENT.AnimTbl_RangeAttack = "vjseq_Crouchfire" -- Animations to play when it range attacks | false = Don't play an animation
	-- ====== Distance ====== --
ENT.RangeAttackMinDistance = 800 -- Min distance an enemy must be to initiate a range attack
ENT.RangeAttackMaxDistance = 3000 -- Max distance an enemy must be to initiate a range attack
ENT.RangeAttackAngleRadius = 100 -- Max angle from its sight direction within which an enemy must be to initiate an attack | 100 = In front of it | 180 = All around it
	-- ====== Timer ====== --
ENT.TimeUntilRangeAttackProjectileRelease = false -- How much time until the projectile is thrown? | false = Make the attack event-based
ENT.NextRangeAttackTime = VJ.SET(15,22) -- How much time until it can use a range attack? | number = Specific time | VJ.SET = Randomized between the 2 numbers
ENT.RangeAttackAnimationFaceEnemy = false

ENT.SoundTbl_Alert = {
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert1.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert2.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert3.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert4.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert5.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert6.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert7.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert8.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alert9.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/alertorganic1.mp3"}

ENT.SoundTbl_Death = {
"vj_sw_clone_wars_era/snpcs/superbattledroid/death1.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/death2.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/death3.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/death4.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/death5.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/death6.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/death7.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/death8.mp3"}

ENT.SoundTbl_KilledEnemy = {
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy1.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy2.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy3.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy4.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy5.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy6.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy7.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/killedenemy8.mp3"}

ENT.SoundTbl_Pain = {
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain1.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain2.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain3.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain4.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain5.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain6.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain7.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain8.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain9.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain10.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain11.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain12.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain13.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain14.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain15.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain16.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain17.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain18.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain19.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain20.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain21.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain22.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain23.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain24.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain25.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain26.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain27.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain28.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain29.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain30.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain31.mp3",
"vj_sw_clone_wars_era/snpcs/superbattledroid/pain32.mp3"}

ENT.SoundTbl_FootStep = {
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep1.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep2.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep3.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep4.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep5.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep6.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep7.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/superbattledroidstep8.wav"}

ENT.SoundTbl_MeleeAttackExtra = {"vj_base/impact/metal_crush1.wav","vj_base/impact/metal_crush2.wav","vj_base/impact/metal_crush3.wav"}

ENT.MainSoundPitch = VJ.SET(100, 100) -- Can be a number or VJ.SET

ENT.SBDIsMoving = false
ENT.SBDChestArmorBroken = false
ENT.SBDHeadArmorBroken = false
ENT.SBDIsWounded = false
ENT.SBDBlasterSpread = 0.03

function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward() * math.random(220, 240) + self:GetUp() * 10
end

function ENT:Init()
	if GetConVar("vj_cw_cis_friendly"):GetInt() > 0 then
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
	else
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
	end
	self:SetCollisionBounds(Vector(13, 13, 90), Vector(-13, -13, 0))
	self.NextBlasterFire = 0
	self.NextRandomMovement = 0
end

function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" then
		local inflictor = dmginfo:GetInflictor()
		local attacker = dmginfo:GetAttacker()
		local weapon = IsValid(attacker) and attacker:IsPlayer() and attacker:GetActiveWeapon()
		local isRailcoil = (IsValid(inflictor) and inflictor:GetClass() == "rw_sw_railcoil") or
			(IsValid(weapon) and weapon:GetClass() == "rw_sw_railcoil")

		if self.SBDChestArmorBroken == false then
			if dmginfo:IsBulletDamage() then
				if dmginfo:GetDamage() >= 60 && (hitgroup == 20) then
					self:SetBodygroup(2,1)
					ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("ArmorBreakFX1"))
					VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
					self.SBDChestArmorBroken = true
					if math.random(1,3) == 3 && !self.Dead then
						self:StopMoving()
						self:PlayAnim("vjseq_Hit", true, false, false)
						self:StopParticles()
					end
				end
			elseif dmginfo:IsExplosionDamage() then
					self:SetBodygroup(2,1)
					if dmginfo:GetDamage() >= 60 && (hitgroup == 20) then
					ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("ArmorBreakFX1"))
					self.SBDChestArmorBroken = true
					if self.SBDHeadArmorBroken == true then
						VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
					end
					if math.random(1,2) == 2 && !self.Dead then
						self:StopMoving()
						self:PlayAnim("vjseq_Hit", true, 2.4, false)
						self:StopParticles()
					end
				end
			end
		end
		if self.SBDHeadArmorBroken == false then
			if dmginfo:IsBulletDamage() then
				if dmginfo:GetDamage() >= 60 && (hitgroup == 21) then
					self:SetBodygroup(1,1)
					ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("ArmorBreakFX2"))
					self.SBDHeadArmorBroken = true
					VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
					if math.random(1,3) == 3 && !self.Dead then
						self:StopMoving()
						self:PlayAnim("vjseq_Hit", true, false, false)
						self:StopParticles()
					end
				end
			elseif dmginfo:IsExplosionDamage() then
				self:SetBodygroup(1,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("ArmorBreakFX2"))
				self.SBDHeadArmorBroken = true
				if self.SBDChestArmorBroken == true then
					VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				end
				if math.random(1,2) == 2 && !self.Dead then
					self:StopMoving()
					self:PlayAnim("vjseq_Hit", true, 2.4, false)
					self:StopParticles()
				end
			end
		end
		if (isRailcoil) then
			dmginfo:ScaleDamage(1.0)
		else
			if self.SBDChestArmorBroken == true && self.SBDHeadArmorBroken == false then
				if !(hitgroup == 20) and dmginfo:IsBulletDamage() or dmginfo:GetDamageType() == DMG_SLASH or dmginfo:GetDamageType() == DMG_CLUB then
					VJ.EmitSound(self, "VJ.Impact.Armor")
					dmginfo:ScaleDamage(0.25)
					local sparkEffect = EffectData()
					sparkEffect:SetOrigin(dmginfo:GetDamagePosition())
					sparkEffect:SetNormal(dmginfo:GetDamageForce():GetNormalized())
					sparkEffect:SetMagnitude(3)
					sparkEffect:SetScale(1)
					util.Effect("ElectricSpark", sparkEffect)
				end
			elseif self.SBDChestArmorBroken == false && self.SBDHeadArmorBroken == true then
				if !(hitgroup == 21) and dmginfo:IsBulletDamage() or dmginfo:GetDamageType() == DMG_SLASH or dmginfo:GetDamageType() == DMG_CLUB then
					VJ.EmitSound(self, "VJ.Impact.Armor")
					dmginfo:ScaleDamage(0.25)
					local sparkEffect = EffectData()
					sparkEffect:SetOrigin(dmginfo:GetDamagePosition())
					sparkEffect:SetNormal(dmginfo:GetDamageForce():GetNormalized())
					sparkEffect:SetMagnitude(3)
					sparkEffect:SetScale(1)
					util.Effect("ElectricSpark", sparkEffect)
				end
			elseif self.SBDChestArmorBroken == true && self.SBDHeadArmorBroken == true then
				if !(hitgroup == 20) and !(hitgroup == 21) and dmginfo:IsBulletDamage() or dmginfo:GetDamageType() == DMG_SLASH or dmginfo:GetDamageType() == DMG_CLUB then
					VJ.EmitSound(self, "VJ.Impact.Armor")
					dmginfo:ScaleDamage(0.25)
					local sparkEffect = EffectData()
					sparkEffect:SetOrigin(dmginfo:GetDamagePosition())
					sparkEffect:SetNormal(dmginfo:GetDamageForce():GetNormalized())
					sparkEffect:SetMagnitude(3)
					sparkEffect:SetScale(1)
					util.Effect("ElectricSpark", sparkEffect)
				end
			else
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
	end	
end

function ENT:OnInput(key, activator, caller, data)
	if key == "footstep" then
		self:FootStepSoundCode()
	elseif key == "Melee" then
		self:ExecuteMeleeAttack()
	elseif key == "ChargeEffects" then
		ParticleEffectAttach("doom_imp_fireball_cheap", PATTACH_POINT_FOLLOW, self, 1)
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/superbattledroid/wep_GEN_sbdRckStrt_01.wav", 90)
	elseif key == "FireRocket" then
		self:ExecuteRangeAttack()
		self:StopParticles()
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

		self:EmitSound("VJ.Weapon_RPG.Single")

		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness","4")
		muzzlelight:SetKeyValue("distance","120")
		muzzlelight:Fire("Color","255 150 60")
		muzzlelight:SetPos(self:GetAttachment(1).Pos)
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		muzzlelight:Fire("TurnOn","",0)
		muzzlelight:Fire("Kill","",0.07)
		self:DeleteOnRemove(muzzlelight)

		local muzzleflash = ents.Create("env_sprite")
		muzzleflash:SetKeyValue("model","vj_base/sprites/glow.vmt")
		muzzleflash:SetKeyValue("scale","1")
		muzzleflash:SetKeyValue("rendermode","5")
		muzzleflash:SetKeyValue("rendercolor", "255 150 60")
		muzzleflash:Spawn()
		muzzleflash:SetParent(self)
		muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("Muzzle")).Pos + self:GetAttachment(self:LookupAttachment("Muzzle")).Ang:Forward() * 15)
		muzzleflash:Fire("Kill","",0.07)
		self:DeleteOnRemove(muzzleflash)		

	end
end

function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("Muzzle")).Pos -- Attachment example
end

function ENT:OnThinkAttack(isAttacking, enemy)
	if !self.VJ_IsBeingControlled then
		-- Blaster
		if IsValid(self:GetEnemy()) && self.EnemyData.Visible && CurTime() > self.NextBlasterFire && !self.Flinching && !self:IsBusy() && self.EnemyData.DistanceNearest <= 3000 then
			if math.random(1,8) == 1 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,5,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(1.5,1.7)
			elseif math.random(1,8) == 2 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,6,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(1.7,2)
			elseif math.random(1,8) == 3 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,7,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(1.8,2.1)
			elseif math.random(1,8) == 4 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,8,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(2,2.3)
			elseif math.random(1,8) == 5 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,9,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(2.3,2.6)
			elseif math.random(1,8) == 6 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,10,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(2.4,2.7)
			elseif math.random(1,8) == 7 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,11,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(2.5,2.8)
			elseif math.random(1,8) == 8 then
				timer.Create("blasterFireTime" .. self:EntIndex(),0.19,12,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() then
						self:FireBlaster()
					else
						timer.Remove("blasterFireTime" .. self:EntIndex())
						self.NextBlasterFire = CurTime() +1
					end
				end)	
				self.NextBlasterFire = CurTime() + math.Rand(2.6,2.9)
			end
		end		
	end
end

function ENT:FireBlaster() 

	if self.SBDIsWounded == false then
		self:PlayAnim("vjges_Fire", false)
	else
		self:PlayAnim("vjges_Woundedfire", false)
	end

	local spread = self.SBDBlasterSpread	

    local blasterRod = {}
    blasterRod.Num = 1 
	blasterRod.Spread = Vector(spread, spread, 0)
    blasterRod.Damage = 11
    blasterRod.Force = 5
    blasterRod.AmmoType = "AR2"
    blasterRod.Tracer = 1
    blasterRod.TracerName = "effect_sw_laser_red"
	blasterRod.Src = self:GetAttachment(1).Pos
	blasterRod.Dir = (self:GetAimPosition(self:GetEnemy(), self:GetAttachment(1).Pos) - self:GetAttachment(1).Pos):GetNormal()

	ParticleEffectAttach("hcea_red_hunter_muzzle",PATTACH_POINT_FOLLOW,self,1)
	
    blasterRod.Callback = function(attacker, tr, dmgInfo)
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

    self:FireBullets(blasterRod)

	VJ.EmitSound(self, "vj_sw_clone_wars_era/snpcs/superbattledroid/wep_GEN_sbdRocket_01.wav", 85, self:GetSoundPitch(100, 110), 1, CHAN_WEAPON)
	VJ.EmitSound(self, "vj_sw_clone_wars_era/weapons/shared/distant.wav", 140, self:GetSoundPitch(90, 110), 1, bit.band(CHAN_AUTO, CHAN_WEAPON))
	
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

function ENT:OnThinkActive()
	if IsValid(self:GetEnemy()) && !self.VJ_IsBeingControlled then 
		if self.EnemyData.Visible then
			if self.EnemyData.DistanceNearest <= 1200 && self.EnemyData.DistanceNearest > 600 && CurTime() > self.NextRandomMovement && !self:IsBusy() then
				local checkSides = self:VJ_CheckAllFourSides(200)
				local randomSide = {}
				if checkSides.Backward == true then randomSide[#randomSide+1] = "Backward" end
				if checkSides.Right == true then randomSide[#randomSide+1] = "Right" end
				if checkSides.Left == true then randomSide[#randomSide+1] = "Left" end
				local chooseSide = VJ.PICK(randomSide)
				if chooseSide == "Backward" then self:SetLastPosition(self:GetPos() +self:GetForward() *200) end
				if chooseSide == "Right" then self:SetLastPosition(self:GetPos() +self:GetRight() *200) end
				if chooseSide == "Left" then self:SetLastPosition(self:GetPos() -self:GetRight() *200) end
				if chooseSide == "Right" or chooseSide == "Left" or chooseSide == "Backward" then
					self:SCHEDULE_GOTO_POSITION("TASK_RUN_PATH")
					self.NextRandomMovement = CurTime() +math.Rand(10, 15)
					self.SBDIsMoving = true
					return
				end
			elseif self.SBDIsMoving == true && self:IsBusy() then
				self:ClearSchedule()
				self:StopMoving()
				self.SBDIsMoving = false
				return
			elseif self.EnemyData.DistanceNearest <= 600 && self.EnemyData.DistanceNearest > 80 && CurTime() > self.NextRandomMovement && !self:IsBusy() then
				local checkSides = self:VJ_CheckAllFourSides(75)
				local randomSide = {}
				if checkSides.Right == true then randomSide[#randomSide+1] = "Right" end
				if checkSides.Left == true then randomSide[#randomSide+1] = "Left" end
				local chooseSide = VJ.PICK(randomSide)
				if chooseSide == "Right" then self:PlayAnim("vjseq_StepRight",true, false, false) end
				if chooseSide == "Left" then self:PlayAnim("vjseq_StepLeft",true, false, false) end
				if chooseSide == "Right" or chooseSide == "Left" then
					self.NextRandomMovement = CurTime() +math.Rand(5, 10)
					return
				end
			end
		elseif !self.EnemyData.Visible && self.SBDIsMoving == true then
			self:ClearSchedule()
			self:StopMoving()
			self.SBDIsMoving = false
			return
		end
	elseif !IsValid(self:GetEnemy()) && self.SBDIsMoving == true then
		self:ClearSchedule()
		self:StopMoving()
		self.SBDIsMoving = false
		return
	end
end

function ENT:OnThink() 
	if self:Health() <= (self:GetMaxHealth() / 2.2) then
		self.SBDIsWounded = true
	else
		self.SBDIsWounded = false
	end
end

function ENT:TranslateActivity(act)
	if self.SBDIsWounded == false then
		if act == ACT_IDLE then
			if IsValid(self:GetEnemy()) then 
				if timer.Exists("blasterFireTime" .. self:EntIndex()) then
					return ACT_IDLE_ANGRY
				else
					return ACT_COMBAT_IDLE
				end
			else
				return ACT_IDLE_AGITATED
			end
		elseif act == ACT_WALK or act == ACT_RUN then
			if IsValid(self:GetEnemy()) && timer.Exists("blasterFireTime" .. self:EntIndex()) then
				return ACT_WALK_AIM
			else
				return ACT_WALK
			end
		end
	else
		if act == ACT_IDLE then
			return self:GetSequenceActivity(self:LookupSequence("Woundedbreathe"))
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end

function ENT:SetAnimationTranslations(wepHoldType) 
	self.AnimationTranslations[ACT_WALK] = {self:GetSequenceActivity(self:LookupSequence("Woundedwalkforward"))}
	self.AnimationTranslations[ACT_RUN] = {self:GetSequenceActivity(self:LookupSequence("Woundedwalkforward"))}
end

function ENT:CustomOnRemove()
	timer.Remove("blasterFireTime" .. self:EntIndex())
end

-- All functions and variables can be found in the GitHub Repository: https://github.com/DrVrej/VJ-Base
