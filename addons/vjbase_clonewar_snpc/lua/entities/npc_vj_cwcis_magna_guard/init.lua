AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.VJ_NPC_Class = {"CLASS_CIS"}
ENT.Model = {"models/vjsw/confederacyofindependentsystems/MagnaGuard.mdl"} -- Leave empty if using more than one model
ENT.StartHealth = 250
ENT.FootStepSoundLevel = 80
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasExtraMeleeAttackSounds = true
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_vj_cw_sbdrocket" -- Entities that it can spawn when range attacking | table = Picks randomly
	-- ====== Animation ====== --
ENT.AnimTbl_RangeAttack = "vjseq_FireRockets" -- Animations to play when it range attacks | false = Don't play an animation
	-- ====== Distance ====== --
ENT.RangeAttackMinDistance = 1000 -- Min distance an enemy must be to initiate a range attack
ENT.RangeAttackMaxDistance = 3000 -- Max distance an enemy must be to initiate a range attack
ENT.RangeAttackAngleRadius = 100 -- Max angle from its sight direction within which an enemy must be to initiate an attack | 100 = In front of it | 180 = All around it
	-- ====== Timer ====== --
ENT.TimeUntilRangeAttackProjectileRelease = false -- How much time until the projectile is thrown? | false = Make the attack event-based
ENT.NextRangeAttackTime = VJ.SET(20,25) -- How much time until it can use a range attack? | number = Specific time | VJ.SET = Randomized between the 2 numbers
ENT.RangeAttackAnimationFaceEnemy = false

ENT.SoundTbl_FootStep = {
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep02.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep03.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep04.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep05.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep06.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep07.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep08.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep09.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/magnaguardstep10.wav"}

ENT.SoundTbl_Impact = false

ENT.MagnaGuardIsStaffMelee = true
ENT.MagnaGuardIsRangeAttacking = false

function ENT:CreateStaff()
    if IsValid(self.StaffModel) then return end

    local staff = ents.Create("prop_vj_animatable")
    if not IsValid(staff) then return end

    staff:SetModel("models/vjsw/confederacyofindependentsystems/MagnaGuard_Staff.mdl")
    staff:SetPos(self:GetPos())
    staff:SetAngles(self:GetAngles())
    staff:SetParent(self)
    staff:Spawn()
    staff:Activate()
    staff:SetSolid(SOLID_NONE)
    staff:SetMoveType(MOVETYPE_NONE)
    staff:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    staff:AddEffects(bit.bor(EF_BONEMERGE, EF_PARENT_ANIMATES))

    self.StaffModel = staff
    self:DeleteOnRemove(staff)
end

function ENT:Init()
	if GetConVar("vj_cw_cis_friendly"):GetInt() > 0 then
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
	else
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
	end
	self:SetNW2Bool("AVP.IsTech",true)
	
	self.NextDodge = 0
	
    ParticleEffectAttach("magnaguard_staff_elec_nade",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Staff_Top"))
    ParticleEffectAttach("magnaguard_staff_elec_nade",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Staff_Bot"))
	
	self.StaffLoop = CreateSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_ELEC_LP_1.wav")
	self.StaffLoop:SetSoundLevel(80)
	self.StaffLoop:Play()
	self.StaffLoop:ChangeVolume(1)
	
	self.JumpLoop = CreateSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_Fall_lp_01.wav")
	self.JumpLoop:SetSoundLevel(80)
	self.JumpLoop:ChangeVolume(1)
	
    local staff = ents.Create("prop_vj_cw_animatable_selfremove")
    staff:SetModel("models/vjsw/confederacyofindependentsystems/MagnaGuard_Staff.mdl") 
    staff:SetPos(self:GetPos())
    staff:SetAngles(self:GetAngles())
    staff:SetOwner(self)
    staff:SetParent(self)
    staff:Spawn()
    staff:Activate()
    staff:SetSolid(SOLID_NONE)
    staff:SetMoveType(MOVETYPE_NONE)
    staff:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    staff:AddEffects(bit.bor(EF_BONEMERGE,EF_PARENT_ANIMATES))
    self.StaffModel = staff
end

function ENT:OnInput(key, activator, caller, data)
	if key == "footstep" then
		self:FootStepSoundCode()
	elseif key == "IsStaffMelee" then
		self.MagnaGuardIsStaffMelee = true
	elseif key == "IsKickMelee" then
		self.MagnaGuardIsStaffMelee = false
	elseif key == "melee" then
		if self.MagnaGuardIsStaffMelee == true then
			self.MeleeAttackDamageType = DMG_SLASH
			self.SoundTbl_MeleeAttackExtra = {
			"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_ELECIMP_1.wav",
			"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_ELECIMP_2.wav",
			"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_ELECIMP_3.wav"}

			self.SoundTbl_MeleeAttackMiss = {
			"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_MISS_1.wav",
			"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_MISS_2.wav",
			"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_MISS_3.wav",
			"vj_sw_clone_wars_era/snpcs/magnaguard/STAFF_MISS_4.wav"}
			
			self.ExtraMeleeAttackSoundLevel = 90
			self.MeleeAttackMissSoundLevel = 90
			self.MeleeAttackDamage = 55
		else
			self.MeleeAttackDamageType = DMG_CLUB
			self.SoundTbl_MeleeAttackExtra = {"vj_base/impact/metal_crush1.wav","vj_base/impact/metal_crush2.wav","vj_base/impact/metal_crush3.wav"}
			self.SoundTbl_MeleeAttackMiss = "Zombie.AttackMiss"
			self.ExtraMeleeAttackSoundLevel = 75
			self.MeleeAttackMissSoundLevel = 75
			self.MeleeAttackDamage = 50
		end
		self:ExecuteMeleeAttack()
	elseif key == "FireRocket" then
		self:ExecuteRangeAttack()
	elseif key == "MeleeAttackSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_melee_01.wav", 80)
	elseif key == "MeleeAttack2Sound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_melee_02.wav", 80)
	elseif key == "ActionBreatheIdleSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_ActnBrthe_01.wav", 80)
	elseif key == "DodgeLeftSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_dodgeLeft_01.wav", 80)
	elseif key == "DodgeLeftLandSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_dgeLeftLnd_01.wav", 80)
	elseif key == "DodgeUpSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_DdgUpFlp_01.wav", 80)
	elseif key == "DodgeUpLandSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_DdgUpLnd_01.wav", 80)
	elseif key == "RocketCrouchSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_RcktsCrch_01.wav", 80)
	elseif key == "RocketFireSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_RcktsFire_01.wav", 80)
	elseif key == "RocketStandSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_RcktsStnd_01.wav", 80)
	elseif key == "LandSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_Land_01.wav", 80)
	elseif key == "ShutdownSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_shutDwn_01.wav", 80)
	elseif key == "TurnLeftSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_TrnLeft_01.wav", 80)
	elseif key == "TurnRightSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_TrnRight_01.wav", 80)
	elseif key == "WallAttachSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_WllAtch_01.wav", 80)
	elseif key == "WallDetachSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_WllDtch_01.wav", 80)
	elseif key == "DeathSound1" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_Death_01.wav", 80)
	elseif key == "DeathSound2" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_Death_02.wav", 80)
	elseif key == "DeathSound3" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_Death_03.wav", 80)
	elseif key == "Death2ExplosionSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/magnaguard/exp_YYY_GGdie_01.wav", 80)
	elseif key == "PikeHitGroundSound" then
		VJ.EmitSound(self,"SolidMetal.ImpactHard", 80)
	end
end

function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" then	
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

function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	if self.EnemyData.DistanceNearest > 180 && self.EnemyData.DistanceNearest < 200 && !self.PropInteraction_Found then
		self.AnimTbl_MeleeAttack = {"vjseq_lunge","vjseq_lunge2"}
		self.MeleeAttackDistance = 200
		self.HasMeleeAttackKnockBack = true
	else
		self.AnimTbl_MeleeAttack = {"vjges_Meleeattack","vjges_Meleeattack2"}
		self.MeleeAttackDistance = 70
		if enemy.IsPlayer() then
			self.HasMeleeAttackKnockBack = false
		else
			self.HasMeleeAttackKnockBack = true
		end
	end
end

function ENT:OnThink()
	if self:GetActivity() == ACT_GLIDE then 
		self.JumpLoop:Play()
	else
		self.JumpLoop:Stop()	
	end
end

function ENT:CustomOnRemove()
	self.StaffLoop:Stop()
	self.JumpLoop:Stop()
	self:StopSound("vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_melee_01.wav")
	self:StopSound("vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_melee_02.wav")
	self:StopSound("vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_dodgeLeft_01.wav")
	self:StopSound("vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_dgeLeftLnd_01.wav")
	self:StopSound("vj_sw_clone_wars_era/snpcs/magnaguard/drd_YYY_GG_RcktsStnd_01.wav")
end

function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)	
    local bone = corpse:LookupBone("weaponAttach_R")
	local pos, ang = corpse:GetBonePosition(bone)
	self:CreateExtraDeathCorpse("prop_physics","models/vjsw/confederacyofindependentsystems/MagnaGuard_Staff.mdl",{Pos=pos,Ang=ang})
end

function ENT:OnMeleeAttackExecute(status, ent, isProp) 
	if status == "PreDamage" then
		if self.MagnaGuardIsStaffMelee == true then
			if IsValid(ent) then
				local hitPos = ent:NearestPoint(self:MeleeAttackTraceOrigin())
				local sparkEffect = EffectData()
				sparkEffect:SetOrigin(hitPos)
				sparkEffect:SetNormal((hitPos - self:MeleeAttackTraceOrigin()):GetNormalized())
				sparkEffect:SetMagnitude(3)
				sparkEffect:SetScale(1)
				util.Effect("StunstickImpact", sparkEffect)
			end
		end
	end
end

function ENT:OnRangeAttack(status, enemy) 
	if status == "Init" then
		self.MagnaGuardIsRangeAttacking = true
		timer.Simple( VJ.AnimDuration(self,"vjseq_FireRockets"), function() if IsValid(self) then self.MagnaGuardIsRangeAttacking = false end end)
	end
end

function ENT:OnRangeAttackExecute(status, enemy, projectile) 
	if status == "PostSpawn" then
		timer.Simple(0.3, function()
			if IsValid(projectile:GetOwner():GetEnemy()) then
				if IsValid(projectile) then
					if IsValid(projectile:GetOwner()) then
						if IsValid(projectile:GetPhysicsObject()) && IsValid(projectile:GetOwner():GetEnemy()) then
							projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), enemy, "Line", projectile:GetPos(), 1, 2000))
							projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
						end
					end
				end
			else
				projectile:Remove()
			end
		end)


		self:EmitSound("VJ.Weapon_RPG.Single")

		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness","4")
		muzzlelight:SetKeyValue("distance","120")
		muzzlelight:Fire("Color","255 150 60")
		muzzlelight:SetPos(self:GetAttachment(3).Pos)
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
		muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("Rocket")).Pos + self:GetAttachment(self:LookupAttachment("Rocket")).Ang:Forward() * 15)
		muzzleflash:Fire("Kill","",0.07)
		self:DeleteOnRemove(muzzleflash)
	end
end

function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("Rocket")).Pos -- Attachment example
end

function ENT:RangeAttackProjVel(projectile)
	return self:GetUp()*400
end

function ENT:TranslateActivity(act)
	if !self.Alerted then
		if act == ACT_IDLE then 
			return self:GetSequenceActivity(self:LookupSequence("RelaxBreathe"))
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end

-- Credit to ϟLightning Boltϟ and Panzer Elite for the Jetpack code. It was moddifed by me to work as the Magna Guard's jump ability instead
ENT.CanJetpackJump = true
ENT.JetpackJump_NextT = 0
ENT.JetpackJump_Nexttime = 2
ENT.JetpackJump_activated = 0
ENT.JetpackJump_jumping = 0
ENT.JetpackJump_durationT = 0
ENT.JetpackJump_duration = 5.0
ENT.JetpackJump_Chance = 10
ENT.JetpackJump_anim = "vjseq_TakeOff"
ENT.JetpackJump_landanim = "vjseq_Land"
ENT.JetpackJump_Rangemin = 200
ENT.JetpackJump_Rangemax = 2500
ENT.JetpackJump_Range = 4000
ENT.JetpackJump_Rangeclose = 450
ENT.JetpackJump_Cooldown = 5
ENT.JetpackJump_originalgravity = 1
ENT.JetpackJump_originalmovetype = VJ_MOVETYPE_GROUND
ENT.SoundTbl_JetpackSound = false
ENT.JetpackJump_originaldragn = 0
ENT.JetpackJump_originaldrag = true
ENT.JetpackJump_originalflinch = 1
ENT.JetpackJump_originalenemy = NULL
ENT.JetpackJump_originalmelee = true

ENT.JetpackJumpEscape_Nexttime = 2
ENT.JetpackJumpEscape_NextT = 0
ENT.JetpackJumpEscape_activated = 0
ENT.JetpackJumpEscape_recharge = 1

function ENT:OnThinkActive()
	if IsValid(self:GetEnemy()) && !self.VJ_IsBeingControlled then 
		if self.EnemyData.Visible && self.EnemyData.DistanceNearest <= 1200 && CurTime() > self.NextDodge && !self:IsBusy() && self.JetpackJump_activated == 0 then
			local checkSides = self:VJ_CheckAllFourSides(150)
			local randomSide = {}
			if checkSides.Right == true then randomSide[#randomSide+1] = "Right" end
			if checkSides.Left == true then randomSide[#randomSide+1] = "Left" end
			local chooseSide = VJ.PICK(randomSide)
			if chooseSide == "Right" then self:PlayAnim("vjseq_DodgeRight",true, false, false) end
			if chooseSide == "Left" then self:PlayAnim("vjseq_DodgeLeft",true, false, false) end
			if chooseSide == "Right" or chooseSide == "Left" then
				self.NextDodge = CurTime() +math.Rand(5, 10)
				return
			end
		end
	end
	
	if self.CanJetpackJump == true && !self.VJ_IsBeingControlled && self.MagnaGuardIsRangeAttacking == false then
	
	
	if self.JetpackJump_activated == 1 and self.JetpackJump_jumping == 1 then
	
	local tracedataAD = {}
	tracedataAD.start = self:GetPos() + Vector(0,0,40)
	tracedataAD.endpos = self:GetPos() + Vector(0,0,-30)
	tracedataAD.filter = {self}
	local trAD = util.TraceLine(tracedataAD)
	
	if (self.JetpackJump_durationT < CurTime()) or ( trAD.HitWorld ) or ( trAD.Entity != nil and IsValid(trAD.Entity) and trAD.Entity != self:GetActiveWeapon() and trAD.Entity != self) then
	
		self.JetpackJump_jumping = 0
		self:SetFriction(self.JetpackJump_originalgravity)
		self.CurrentAttackAnimation = self.JetpackJump_landanim
		--self.PlayingAttackAnimation = true
		timer.Simple(VJ.AnimDuration(self,self.CurrentAttackAnimation) -0.1,function()
			if IsValid(self) then
				self.MovementType = self.JetpackJump_originalmovetype
				self.CanFlinch = self.JetpackJump_originalflinch
				self.CanTurnWhileStationary = true
				--self:SetFriction(self.JetpackJump_originalgravity)
				local physw11 = self:GetPhysicsObject()
						if ( IsValid( physw11 ) ) then
							physw11:EnableDrag(self.JetpackJump_originaldrag)
						end	
				timer.Simple(1,function()
				if IsValid(self) then
				self.CanPerformMeleeCharge = self.JetpackJump_originalmelee 
				end 
				end)
				self.PauseAttacks = false
				self.NextChaseTime = CurTime() + 0.2
				self.NextIdleTime = CurTime() 
				self.JetpackJump_NextT = CurTime() + self.JetpackJump_Cooldown
				self:ClearSchedule()
				self.JetpackJump_activated = 0
				self:PlayAnim( self.AnimTbl_IdleStand,false,0.2,false,0,{})
				if IsValid(self.JetpackJump_originalenemy) and self.JetpackJump_originalenemy != NULL then
					self:FaceCertainPosition(self.JetpackJump_originalenemy:GetPos())
				end
			end
		end)
		self:PlayAnim(self.CurrentAttackAnimation,false,false,false,0,{SequenceDuration=(0.5)})
		
	end
	
	end
	
	if self.JetpackJump_NextT < CurTime() and self.JetpackJump_activated == 0 and self.MovementType == VJ_MOVETYPE_GROUND and self.PauseAttacks == false then
	
	if (IsValid(self:GetEnemy()) and math.random(1,10) >= self.JetpackJump_Chance) or (self.JetpackJumpEscape_activated == 1) then
	self.JetpackJump_NextT = CurTime() + self.JetpackJump_Nexttime
	if (IsValid(self:GetEnemy()) and self:GetPos():DistToSqr( self:GetEnemy():GetPos() ) < self.JetpackJump_Rangemax*self.JetpackJump_Rangemax and self:GetPos():DistToSqr( self:GetEnemy():GetPos() ) > self.JetpackJump_Rangeclose*self.JetpackJump_Rangeclose) or (self.JetpackJumpEscape_activated == 1) then
	
		local targetent = self
		if IsValid(self:GetEnemy()) and self.JetpackJumpEscape_activated != 1 then
			targetent = self:GetEnemy()
		end
		local attackspottbl = {targetent:GetForward()*math.random(0,100) +targetent:GetRight()*math.random(-100,100),
			targetent:GetForward()*math.random(-100,80) +targetent:GetRight()*math.random(-100,100),
			targetent:GetForward()*math.random(-100,80) +targetent:GetRight()*math.random(-120,120),
			targetent:GetForward()*math.random(-120,0) +targetent:GetRight()*math.random(-150,150),
			targetent:GetForward()*math.random(-120,0) +targetent:GetRight()*math.random(-50,50)}
		local chosenpos = Vector(0,0,0)
		local sutiableattackpos = {}
		local actualattackpos = Vector(0,0,0)
		local tracss = {}
		local tracc = {}
		local tracssdata = {}
		local tracsscx = {}
		--local enemydirection = Vector(0,0,0)
		local enemyeyepos = targetent:EyePos()
		local postocheck = Vector(0,0,0)
		--local timeaddition = 0
		local isenemyunreachable = false
		if IsValid(self:GetEnemy()) and self.JetpackJumpEscape_activated != 1 and self:IsUnreachable(self:GetEnemy()) == true and self:GetEnemy():GetPos().z > self:GetPos().z then
			isenemyunreachable = true
		end
			for k,vapos in ipairs(attackspottbl) do
			if table.Count( sutiableattackpos ) <= 3 then
				tracssdata = {
						start = enemyeyepos,
						endpos = enemyeyepos +vapos:GetNormalized()*math.random(self.JetpackJump_Rangemin+100,self.JetpackJump_Rangeclose),
						filter = {self,self:GetActiveWeapon(),targetent}
						}
				if self.JetpackJumpEscape_activated == 1 then tracssdata.endpos = enemyeyepos +vapos:GetNormalized()*math.random(self.JetpackJump_Rangeclose,self.JetpackJump_Rangemax) end
				if IsValid(self:GetEnemy()) and self.JetpackJumpEscape_activated != 1 and self:GetEnemy():GetActiveWeapon() != NULL and self:GetEnemy():GetActiveWeapon() != nil then tracssdata.filter = {self,self:GetActiveWeapon(),targetent,self:GetEnemy():GetActiveWeapon()} end
				
				tracss = util.TraceLine(tracssdata)
				

				
				--if tracss.HitWorld == true or (tracss.Entity != nil and tracss.Entity != NULL and (tracss.Entity:GetClass() == "prop_physics" or tracss.Entity:GetClass() == "prop_dynamic" ) ) then 
				if tracss.HitPos:DistToSqr(enemyeyepos) > self.JetpackJump_Rangemin*self.JetpackJump_Rangemin then
				
				tracc = util.TraceLine({
						start = tracss.HitPos,--trace11.HitPos + Vector(0,0,70),
						endpos = tracss.HitPos + Vector(0,0,-128),
						filter = {self,self:GetActiveWeapon()}
						})
				if tracc.HitWorld == true or (tracc.Entity != NULL and tracc.Entity != nil and (tracc.Entity:GetClass() == "prop_dynamic" or tracc.Entity:GetClass() == "prop_physics")) then
				--table.insert( sutiableattackpos, pointa:GetPos() )
				--table.insert( sutiableattackpos, tracss.HitPos+Vector(0,0,-15) )
				postocheck = tracss.HitPos+Vector(0,0,-10)
				if isenemyunreachable == true then
				tracsscx = util.TraceLine({
						start = postocheck,
						endpos = postocheck+Vector(0,0,-800),
						filter = {self,self:GetActiveWeapon()}
						})
				if tracsscx.HitWorld == true then postocheck = tracsscx.HitPos +Vector(0,0,20) end
				end

				local greShootVel = postocheck -self:GetPos()

				local selfpos = self:GetPos() + self:GetUp()*50
				local heightdifference = postocheck.z - selfpos.z
			
			--if math.random(self.GrenadeThrowHigh_chance,50) > -40 then
				postocheck = postocheck + Vector(0,0,5)
			
				local targetdir = postocheck -selfpos
				local Midpoint = Vector((selfpos.x + postocheck.x)/2,(selfpos.y + postocheck.y)/2,(selfpos.z + postocheck.z)/2)
				local midpointdist = selfpos:Distance( Midpoint )
				local midpointupper = Midpoint + Vector(0,0, midpointdist*1.732 ) --/1 for tan45 , 1.731 for tan60 (sqroot 3)
				heightdifference = postocheck.z - selfpos.z
			


				local vel_range = 0
				local vel_force	= 0
				local failedsecondcheck = 0
				local failedsecondchecka = 0
				local failedsecondcheck2 = 0
				local failedsecondcheck2a = 0
				--local failedsecondcheck3 = 0
				local issutiablepos = 0
				local tr2 = util.TraceEntity({
							start = midpointupper,
							endpos = postocheck,
							filter = {self}
							},self)
				local tr3 = util.TraceEntity({
							start = selfpos,
							endpos = midpointupper,
							filter = {self}
							},self)
				if tr2.HitPos:DistToSqr(postocheck) > 64*64 then failedsecondcheck = 1 end
				if tr3.HitPos:DistToSqr(midpointupper) > 64*64 then failedsecondchecka = 1 end
			
				if failedsecondcheck == 0 and failedsecondchecka == 0 then
				greShootVel = midpointupper -self:GetPos()
				issutiablepos = 1
				--local vel_lengthz = math.sqrt( 22.86*(midpointupper.z - selfpos.z) ) 
				--local vel_lengthx = (midpointdist*2)/((vel_lengthz*2)/11.43) --calculate the flight time of grenade
				--local vel_force =  math.sqrt( vel_lengthx*vel_lengthx + vel_lengthz*vel_lengthz )
				vel_range = (midpointdist*2)*0.01905 + ((heightdifference*0.01905)/1.732)
				vel_force = math.sqrt( (11.43*vel_range)/(0.8632) ) --1 unit = 0.01905m sin 2.1 rad = 0.8632
				
				greShootVel = greShootVel:GetNormalized()*(vel_force/0.01905)
				
				else
				midpointupper = Midpoint + Vector(0,0, midpointdist/1 ) --try 45 degrees
				--if math.abs(heightdifference) > 1 then 
				--midpointupper = midpointupper + Vector(0,0, heightdifference/2) + targetdir:GetNormalized()*(heightdifference/2)
				--end

						
				local tr2a = util.TraceEntity({
							start = midpointupper,
							endpos = postocheck,
							filter = {self}
							},self)
				local tr3a = util.TraceEntity({
							start = selfpos,
							endpos = midpointupper,
							filter = {self}
							},self)
				if tr2a.HitPos:DistToSqr(postocheck) > 64*64 then failedsecondcheck2 = 1 end
				if tr3a.HitPos:DistToSqr(midpointupper) > 64*64 then failedsecondcheck2a = 1 end

				if failedsecondcheck2 == 0 and failedsecondcheck2a == 0 then 
				greShootVel = midpointupper -self:GetPos()
				issutiablepos = 1
				
				--local vel_lengthz = math.sqrt( 22.86*(midpointupper.z - selfpos.z) ) 
				--local vel_lengthx = (midpointdist*2)/( (vel_lengthz*2)/11.43 ) --calculate the flight time of grenade
				--local vel_force =  math.sqrt( vel_lengthx*vel_lengthx + vel_lengthz*vel_lengthz )

				vel_range = (midpointdist*2)*0.01905 + ((heightdifference*0.01905)/1)
				vel_force = math.sqrt( (11.43*vel_range)/(1) ) --1 unit = 0.01905m sin 1.57 rad = 0.99999
	
				greShootVel = greShootVel:GetNormalized()*(vel_force/0.01905)
				
				end
				

				end
				
				
				if issutiablepos == 1 then
				table.insert( sutiableattackpos, greShootVel )
				end
				
				--end
				
				
				
			end
			end
			end
	
	
	
	
	
	
			end
			
					if actualattackpos == Vector(0,0,0) and table.Count( sutiableattackpos ) >= 1 then
						local useablepos = VJ_PICK(sutiableattackpos)
						if useablepos != nil and useablepos != NULL and useablepos != Vector(0,0,0) and useablepos != false then
							actualattackpos = useablepos
						end
					end
					
					if actualattackpos != Vector(0,0,0) then 
					
						self.JetpackJump_activated = 1
						if self.JetpackJumpEscape_activated == 1 then self.JetpackJumpEscape_activated = 0 end
						self.JetpackJump_NextT = CurTime() + self.JetpackJump_Cooldown
						self.JetpackJump_originalgravity = self:GetFriction()
						self.JetpackJump_originalmovetype = self.MovementType
						self.JetpackJump_originalflinch = self.CanFlinch
						self.JetpackJump_originalmelee = self.CanPerformMeleeCharge
						self.CanPerformMeleeCharge = false
						self.CanFlinch = 0
						self.MovementType = VJ_MOVETYPE_STATIONARY
						self.CanTurnWhileStationary = false
						self:SetFriction(0)
						self:FaceCertainPosition( self:GetPos() +actualattackpos:GetNormalized()*1000 )
						self.CurrentAttackAnimation = self.JetpackJump_anim
						self:ClearSchedule()
						self:StopMoving()
						self.Weapon_ShotsSinceLastReload = 0
						if IsValid(self:GetEnemy()) then
						self.JetpackJump_originalenemy = self:GetEnemy()
						else
						self.JetpackJump_originalenemy = NULL
						end
						self.JetpackJump_durationT = CurTime() + self.JetpackJump_duration
				
						self:StopAttacks(true)
						self.PauseAttacks = true
						self.NextChaseTime = CurTime() + self.JetpackJump_duration + 0.6
						self.NextIdleTime = CurTime() + self.JetpackJump_duration + 0.6
						
						self:PlayAnim(self.JetpackJump_anim,false,0,false,0,{})
						
						timer.Simple(VJ.AnimDuration(self,self.JetpackJump_anim), function() if IsValid(self) then -- Timer added by me, Helghast Loyalist.
						self:PlayAnim(ACT_GLIDE,false,(self.JetpackJump_duration+0.5),false,0,{SequenceDuration=(self.JetpackJump_duration+0.5)})
	
						local physw1 = self:GetPhysicsObject()
						if ( IsValid( physw1 ) ) then
							--self.JetpackJump_originaldragn = 0
							self.JetpackJump_originaldrag = physw1:IsDragEnabled() 
							physw1:EnableDrag(false)
							--physw1:SetVelocity(actualattackpos +self:GetUp()*math.random(0,10) )
				
						end
	
						self:SetVelocity( actualattackpos +self:GetUp()*math.random(0,10) )
						
						timer.Simple(0.4,function()
						if IsValid(self) then
						if self.JetpackJump_jumping != 1 and self.JetpackJump_activated == 1 then
							self.JetpackJump_jumping = 1
						end
						end
						end)
						end end)
						
							if self.HasSounds != false then
							local soundtbl = self.SoundTbl_JetpackSound
							if VJ_PICK(soundtbl) != false then
								self.CurrentMeleeAttackSound = VJ_CreateSound(self,soundtbl,90,100)
							end
							end
	
					end
			
			
	end

	end
	end
	end
	
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/