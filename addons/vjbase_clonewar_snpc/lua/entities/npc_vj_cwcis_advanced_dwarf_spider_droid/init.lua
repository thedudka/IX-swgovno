AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vjsw/confederacyofindependentsystems/Advanced_Dwarf_Spider_Droid.mdl" -- Leave empty if using more than one model
ENT.StartHealth = 500
ENT.VJ_NPC_Class = {"CLASS_CIS"}
ENT.HullType = HULL_LARGE
ENT.VJ_ID_Boss = true
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.LimitChaseDistance = true -- Should it limit chasing when between certain distances? | true = Always limit | "OnlyRange" = Only limit if it's able to range attack
ENT.LimitChaseDistance_Min = 0 -- Min distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's min distance
ENT.LimitChaseDistance_Max = 1300 -- Max distance from the enemy to limit its chasing | "UseRangeDistance" = Use range attack's max distance
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackMinDistance = 0 -- Min range attack distance
ENT.RangeAttackMaxDistance = 1500 -- This is how far away it can shoot
ENT.TimeUntilRangeAttackProjectileRelease = false -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = VJ.SET(10,18) -- How much time until it can use a range attack?
ENT.RangeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the range attack animation?
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.Immune_Melee = true -- Immune to melee-type damage | Example: Crowbar, slash damages
ENT.Immune_Dissolve = true
ENT.Immune_Toxic = true
ENT.AnimTbl_RangeAttack = false
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
ENT.TurningSpeed = 5 -- How fast it can turn
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.PoseParameterLooking_TurningSpeed = 5 -- How fast does the parameter turn?
ENT.SoundTbl_Impact = false
ENT.VJ_ID_Healable = false
ENT.EntitiesToNoCollide = {"sent_vj_cw_asdarmorrightleg","sent_vj_cw_asdarmorleftleg","sent_vj_cw_asdarmoreye"} -- Set to a table of entity class names for it to not collide with otherwise leave it to false
ENT.HasDeathAnimation = true -- Should it play death animations?
ENT.AnimTbl_Death = {"vjseq_Death"}

	-- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {"vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpid_FS_01.wav","vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpid_FS_02.wav","vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpid_FS_03.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

ENT.BreathSoundLevel = 80
ENT.FootStepSoundLevel = 95

ENT.ASDIsScanning = false
ENT.ASDIsRangeAttacking = false

function ENT:GetSightDirection()
    if self.ASDIsScanning == false then
        return self:GetAttachment(self:LookupAttachment("eye")).Ang:Forward()
    else
        return self:GetAttachment(self:LookupAttachment("scannereye")).Ang:Forward()
    end
end

function ENT:Init() 

	self:SetCollisionBounds(Vector(-85,-85,0),Vector(85,85,120))
	
	if GetConVar("vj_cw_cis_friendly"):GetInt() > 0 then
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
	else
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
	end
	
	--self.IdleLoop = CreateSound(self,"vehicles/crane/crane_idle_loop3.wav")
	--self.IdleLoop:SetSoundLevel(70)
	--self.IdleLoop:Play()
	--self.IdleLoop:ChangeVolume(1)
	
	local scannerlight = ents.Create("light_dynamic")
	scannerlight:SetKeyValue("brightness", "4")
	scannerlight:SetKeyValue("distance", "220")
	scannerlight:Fire("Color", "255 0 0")
	scannerlight:SetPos(self:GetAttachment(6).Pos)
	scannerlight:SetLocalAngles(self:GetAttachment(6).Ang)
	scannerlight:Spawn()
	scannerlight:Activate()
	scannerlight:SetParent(self, 6)
	scannerlight:Fire("TurnOff", "", 0)
	self.ScannerLight = scannerlight
	self:DeleteOnRemove(scannerlight)
	
	self.NextCannonFire = 0
	
	local armorRightLeg = ents.Create("sent_vj_cw_asdarmorrightleg")
	armorRightLeg:SetPos(self:GetPos())
	armorRightLeg:SetAngles(self:GetAngles())
	armorRightLeg:SetOwner(self)
	armorRightLeg:SetParent(self)
	armorRightLeg:Spawn()
	armorRightLeg:Activate()
	armorRightLeg:SetSolid(SOLID_BBOX)
	armorRightLeg:SetMoveType(MOVETYPE_NONE)
	armorRightLeg:AddEffects(bit.bor(EF_BONEMERGE,EF_PARENT_ANIMATES))
	self.ArmorRightLeg = armorRightLeg
	
	local armorLeftLeg = ents.Create("sent_vj_cw_asdarmorleftleg")
	armorLeftLeg:SetPos(self:GetPos())
	armorLeftLeg:SetAngles(self:GetAngles())
	armorLeftLeg:SetOwner(self)
	armorLeftLeg:SetParent(self)
	armorLeftLeg:Spawn()
	armorLeftLeg:Activate()
	armorLeftLeg:SetSolid(SOLID_BBOX)
	armorLeftLeg:SetMoveType(MOVETYPE_NONE)
	armorLeftLeg:AddEffects(bit.bor(EF_BONEMERGE,EF_PARENT_ANIMATES))
	self.ArmorLeftLeg = armorLeftLeg
	
	local armorEye = ents.Create("sent_vj_cw_asdarmoreye")
	armorEye:SetPos(self:GetPos())
	armorEye:SetAngles(self:GetAngles())
	armorEye:SetOwner(self)
	armorEye:SetParent(self)
	armorEye:Spawn()
	armorEye:Activate()
	armorEye:SetSolid(SOLID_BBOX)
	armorEye:SetMoveType(MOVETYPE_NONE)
	armorEye:AddEffects(bit.bor(EF_BONEMERGE,EF_PARENT_ANIMATES))
	self.ArmorEye = armorEye
	
end

function ENT:CreateRightArmorGib()	
    local bone = self:LookupBone("knee_B_R1")
	local pos, ang = self:GetBonePosition(bone)
	self:CreateGibEntity("prop_physics", "models/vjsw/confederacyofindependentsystems/Advanced_Dwarf_Spider_Droid_LegArmorR.mdl", {Pos=pos+self:GetUp()*50,Ang=ang, NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
end

function ENT:CreateLeftArmorGib()	
    local bone = self:LookupBone("knee_F_L1")
	local pos, ang = self:GetBonePosition(bone)
	self:CreateGibEntity("prop_physics", "models/vjsw/confederacyofindependentsystems/Advanced_Dwarf_Spider_Droid_LegArmorL.mdl", {Pos=pos+self:GetUp()*50,Ang=ang, NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
end

function ENT:CreateEyeArmorGib()	
    local bone = self:LookupBone("eyelid")
	local pos, ang = self:GetBonePosition(bone)
	self:CreateGibEntity("prop_physics", "models/vjsw/confederacyofindependentsystems/Advanced_Dwarf_Spider_Droid_EyeArmor.mdl", {Pos=pos+self:GetUp()*50,Ang=ang, NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
end

function ENT:OnInput(key, activator, caller, data)
	if key == "footstep" then
		self:FootStepSoundCode()
		util.ScreenShake(self:GetPos(), 3, 200, 0.6, 2024)
	elseif key == "LegMoveSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpidLeg_0"..math.random(1,8)..".wav", 95)
	elseif key == "ScanSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpidScan_01.wav", 80)
	elseif key == "ScanUpSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpidScanUp_01.wav", 80)
	elseif key == "ScanDownSound" then
		VJ.EmitSound(self,"vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpidScanDn_01.wav", 80)
	elseif key == "StartScan" then
		self.ASDIsScanning = true
		if IsValid(self.ScannerLight) then
			self.ScannerLight:Fire("TurnOn", "", 0)
		end
	elseif key == "EndScan" then
		self.ASDIsScanning = false
		if IsValid(self.ScannerLight) then
			self.ScannerLight:Fire("TurnOff", "", 0)
		end
	elseif key == "RocketFire" then
		if IsValid(self:GetEnemy()) then
			self:FireRockets()
		end
	elseif key == "DeathEffects" then
		ParticleEffectAttach("bo3_panzer_explosion", PATTACH_POINT_FOLLOW, self, 7)
		ParticleEffectAttach("doi_mortar_explosion", PATTACH_POINT_FOLLOW, self, 7)
		VJ.EmitSound(self, "VJ.Explosion")
		util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
		util.BlastDamage(self, self, self:GetPos(), 300, 60)
		if IsValid(self.ArmorRightLeg) then
			self.ArmorRightLeg:Remove()
			self:CreateRightArmorGib()
		end
		if IsValid(self.ArmorLeftLeg) then
			self.ArmorLeftLeg:Remove()
			self:CreateLeftArmorGib()
		end
		if IsValid(self.ArmorEye) then
			self.ArmorEye:Remove()
			self:CreateEyeArmorGib()
		end
	end
end

function ENT:OnThinkActive()
	if (self:GetActivity() == ACT_TURN_LEFT or self:GetActivity() == ACT_TURN_RIGHT) && self:GetCycle() >= 0.95 then
		self:SetCycle(0.1)
	end
	
	if IsValid(self:GetEnemy()) then
		local angleDiff = math.abs(math.AngleDifference(self:GetForward():Angle().yaw, (self:GetEnemy():GetPos() - self:GetPos()):GetNormalized():Angle().yaw))
		self.enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
		if self.ASDIsRangeAttacking == false then
			if self.enemyDistance <= 1300 then
				if angleDiff <= 60 then
					self:SetMaxYawSpeed(0)
				else
					self:SetMaxYawSpeed(self.TurningSpeed)
				end
			else 
				self:SetMaxYawSpeed(self.TurningSpeed)
			end
		end
    else
		self:SetMaxYawSpeed(self.TurningSpeed)
	end
	
	if self.ASDIsScanning == true && IsValid(self:GetEnemy()) && self.EnemyData.Visible then
		timer.Remove("scanTime" .. self:EntIndex())
		self:StopSound("vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpidScan_01.wav")
		self.ASDIsScanning = false
		if IsValid(self.ScannerLight) then
			self.ScannerLight:Fire("TurnOff", "", 0)
		end
		self:PlayAnim("vjseq_FireRockets",true, false, false)
		timer.Simple( VJ.AnimDuration(self,"vjseq_FireRockets"), function() if IsValid(self) && !self.Dead then
			self:PlayAnim("vjseq_ExitDefensiveBreathe",true, false, false)
			timer.Simple( VJ.AnimDuration(self,"vjseq_ExitDefensiveBreathe"), function() if IsValid(self) && !self.Dead then
				self:SetMaxYawSpeed(self.TurningSpeed)
				self.ASDIsRangeAttacking = false
			end end)
		end end)		
	end
	
end

function ENT:OnThinkAttack(isAttacking, enemy)
	if !self.VJ_IsBeingControlled then
		local enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
		if enemyDistance <= 4500 then
			if IsValid(self:GetEnemy()) && CurTime() > self.NextCannonFire && !self:IsBusy() then
				timer.Create("cannonFireTime" .. self:EntIndex(),0,1,function()
					if IsValid(self:GetEnemy()) && !self.Dead && !self:IsBusy() && self.EnemyData.Visible then
						self:FireCannon()
					else
						timer.Remove("cannonFireTime" .. self:EntIndex())
						self.NextCannonFire = CurTime() +1
					end
				end)	
			self.NextCannonFire = CurTime() + math.random(3,4)
			end
		end
	end
end

function ENT:FireCannon() 
	local projectile = ents.Create("obj_vj_cw_heavyrod_red")
	projectile:SetPos(self:GetAttachment(self:LookupAttachment("Muzzle")).Pos)
	projectile:SetAngles(self:GetAngles())
	projectile:SetOwner(self)
	projectile:Spawn()
	projectile:Activate()

	if IsValid(self:GetEnemy()) and IsValid(projectile:GetPhysicsObject()) then
		projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), projectile:GetOwner():GetEnemy(), "Line", projectile:GetPos(), 1, 2000))
		projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
	end
	
    VJ.EmitSound(self,"vj_sw_clone_wars_era/weapons/rocketlauncher/fire.wav",95)
	
	local muzzlelight = ents.Create("light_dynamic")
	muzzlelight:SetKeyValue("brightness", "4")
	muzzlelight:SetKeyValue("distance", "220")
	muzzlelight:Fire("Color", "255 0 0")
	muzzlelight:SetPos(self:GetAttachment(1).Pos)
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
	muzzleflash:SetPos(self:GetAttachment(self:LookupAttachment("Muzzle")).Pos + self:GetAttachment(self:LookupAttachment("Muzzle")).Ang:Forward() * 15)
	muzzleflash:Fire("Kill","",0.07)
	self:DeleteOnRemove(muzzleflash)

end

function ENT:FireRockets() 
	local projectile = ents.Create("obj_vj_rocket")
	projectile:SetPos(self:GetAttachment(self:LookupAttachment("Rockets_R")).Pos)
	projectile:SetAngles(self:GetAngles())
	projectile:SetOwner(self)
	projectile:Spawn()
	projectile:Activate()
	projectile:GetPhysicsObject():SetVelocity(projectile:GetUp()*400)
	projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
	timer.Simple(0.3, function()
		if IsValid(projectile:GetOwner():GetEnemy()) then
			if IsValid(projectile) then
				if IsValid(projectile:GetOwner()) then
					if IsValid(projectile:GetPhysicsObject()) && IsValid(projectile:GetOwner():GetEnemy()) then
						projectile:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile:GetOwner(), projectile:GetOwner():GetEnemy(), "Line", projectile:GetPos(), 1, 2000))
						projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
					end
				end
			end
		else
			projectile:Remove()
		end
	end)
	
	local projectile2 = ents.Create("obj_vj_rocket")
	projectile2:SetPos(self:GetAttachment(self:LookupAttachment("Rockets_L")).Pos)
	projectile2:SetAngles(self:GetAngles())
	projectile2:SetOwner(self)
	projectile2:Spawn()
	projectile2:Activate()
	projectile2:GetPhysicsObject():SetVelocity(projectile2:GetUp()*400)
	projectile2:SetAngles(projectile2:GetVelocity():GetNormal():Angle())
	timer.Simple(0.3, function()
		if IsValid(projectile2:GetOwner():GetEnemy()) then
			if IsValid(projectile2) then
				if IsValid(projectile2:GetOwner()) then
					if IsValid(projectile2:GetPhysicsObject()) && IsValid(projectile2:GetOwner():GetEnemy()) then
						projectile2:GetPhysicsObject():SetVelocity(VJ.CalculateTrajectory(projectile2:GetOwner(), projectile2:GetOwner():GetEnemy(), "Line", projectile2:GetPos(), 1, 2000))
						projectile2:SetAngles(projectile2:GetVelocity():GetNormal():Angle())
					end
				end
			end
		else
			projectile2:Remove()
		end
	end)
	
    self:EmitSound("VJ.Weapon_RPG.Single")
	
	ParticleEffectAttach("vj_rifle_full",PATTACH_POINT_FOLLOW,self,3)
	ParticleEffectAttach("vj_rifle_full",PATTACH_POINT_FOLLOW,self,4)
	
	local muzzlelight = ents.Create("light_dynamic")
	muzzlelight:SetKeyValue("brightness", "4")
	muzzlelight:SetKeyValue("distance", "220")
	muzzlelight:Fire("Color", "255 150 60")
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
	muzzleflash:SetKeyValue("rendercolor", "255 150 60")
	muzzleflash:Spawn()
	muzzleflash:SetParent(self)
	muzzleflash:SetPos(self:GetAttachment(3).Pos)
	muzzleflash:Fire("Kill","",0.07)
	self:DeleteOnRemove(muzzleflash)
	
	local muzzlelight2 = ents.Create("light_dynamic")
	muzzlelight2:SetKeyValue("brightness", "4")
	muzzlelight2:SetKeyValue("distance", "220")
	muzzlelight2:Fire("Color", "255 150 60")
	muzzlelight2:SetPos(self:GetAttachment(4).Pos)
	muzzlelight2:SetLocalAngles(self:GetAngles())
	muzzlelight2:Spawn()
	muzzlelight2:Activate()
	muzzlelight2:SetParent(self)
	muzzlelight2:Fire("TurnOn", "", 0)
	muzzlelight2:Fire("Kill", "", 0.07)
	self:DeleteOnRemove(muzzlelight2)
	
	local muzzleflash2 = ents.Create("env_sprite")
	muzzleflash2:SetKeyValue("model","vj_base/sprites/glow.vmt")
	muzzleflash2:SetKeyValue("scale","3")
	muzzleflash2:SetKeyValue("rendermode","5")
	muzzleflash2:SetKeyValue("rendercolor", "255 150 60")
	muzzleflash2:Spawn()
	muzzleflash2:SetParent(self)
	muzzleflash2:SetPos(self:GetAttachment(4).Pos)
	muzzleflash2:Fire("Kill","",0.07)
	self:DeleteOnRemove(muzzleflash2)

end

function ENT:OnRangeAttack(status, enemy) 
	if status == "Init" then
		self.ASDIsRangeAttacking = true
		self:SetMaxYawSpeed(0)
		self:PlayAnim("vjseq_EnterDefensiveBreathe",true, false, false)
		timer.Simple( VJ.AnimDuration(self,"vjseq_EnterDefensiveBreathe"), function() if IsValid(self) && !self.Dead then
			self:PlayAnim("vjseq_ScanArea",true, false, false)
				timer.Create("scanTime" .. self:EntIndex(),VJ.AnimDuration(self,"vjseq_ScanArea"),1,function()
					self:PlayAnim("vjseq_ExitDefensiveBreathe",true, false, false)
					timer.Simple( VJ.AnimDuration(self,"vjseq_ExitDefensiveBreathe"), function() if IsValid(self) && !self.Dead then
						self:SetMaxYawSpeed(self.TurningSpeed)
						self.ASDIsRangeAttacking = false
					end end)	
				end)
		end end)
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
		if dmginfo:IsBulletDamage() then
			local inflictor = dmginfo:GetInflictor()
			local attacker = dmginfo:GetAttacker()
			local weapon = IsValid(attacker) and attacker:IsPlayer() and attacker:GetActiveWeapon()
			local isRailcoil = (IsValid(inflictor) and inflictor:GetClass() == "rw_sw_railcoil") or
				(IsValid(weapon) and weapon:GetClass() == "rw_sw_railcoil")

			if (isRailcoil) then
				dmginfo:ScaleDamage(1.0)
			elseif (hitgroup == HITGROUP_HEAD) then
				dmginfo:ScaleDamage(0.05)
				if math.random(1,5) == 1 then self:PlayAnim("vjges_EyeBlink", false) end
			elseif (hitgroup == HITGROUP_HEAD) or (hitgroup == HITGROUP_STOMACH) then
				dmginfo:ScaleDamage(0.05)
			else
				dmginfo:SetDamage(0)
			end
		elseif dmginfo:IsExplosionDamage() then
			dmginfo:ScaleDamage(0.25)
		end
	end	
end

function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		ParticleEffectAttach("smoke_burning_engine_01",PATTACH_POINT_FOLLOW,self,7)
		ParticleEffectAttach("striderbuster_break_lightning", PATTACH_POINT_FOLLOW, self, 7)
		
		timer.Simple( 0.3, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*40 + self:GetUp()*60 + self:GetRight()*-15)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
		timer.Simple( 0.6, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*40 + self:GetUp()*65 + self:GetRight()*15)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)

		timer.Simple( 0.8, function() if IsValid(self) then
			ParticleEffectAttach("striderbuster_break_lightning", PATTACH_POINT_FOLLOW, self, 7)
		end end)

		timer.Simple( 0.9, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*40 + self:GetUp()*60 + self:GetRight()*15)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
		timer.Simple( 1.2, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*40 + self:GetUp()*65 + self:GetRight()*-15)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		
		timer.Simple( 1.5, function() if IsValid(self) then
			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay", 0.01)
			self.Spark1:SetKeyValue("Magnitude", "8")
			self.Spark1:SetKeyValue("Spark Trail Length", "3")
			self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*40 + self:GetUp()*60 + self:GetRight()*15)
			self.Spark1:SetAngles(self:GetAngles())
			self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)
		end end)
		self:StopSound("vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpidScan_01.wav")
		if self.ASDIsScanning == true then
			timer.Remove("scanTime" .. self:EntIndex())
			self.ASDIsScanning = false
			if IsValid(self.ScannerLight) then
				self.ScannerLight:Fire("TurnOff", "", 0)
			end
		end
	end
end

function ENT:CustomOnRemove()
	--self.IdleLoop:Stop()
	timer.Remove("cannonFireTime" .. self:EntIndex())
	timer.Remove("scanTime" .. self:EntIndex())
	self:StopSound("vj_sw_clone_wars_era/snpcs/advanced_dwarf_spider_droid/drd_GEN_dSpidScan_01.wav")
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/