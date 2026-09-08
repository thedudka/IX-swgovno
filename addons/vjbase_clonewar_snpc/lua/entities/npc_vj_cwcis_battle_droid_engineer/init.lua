AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/ConfederacyOfIndependentSystems/Battle_Droid_Engineer.mdl"} -- Leave empty if using more than one model
ENT.VJ_NPC_Class = {"CLASS_CIS"}
ENT.CWTurret = NULL
ENT.CWIsPlacingTurret = false
ENT.CWNextTurretTimer = 0

function ENT:CWPlaceTurret()
	if self.CWNextTurretTimer < CurTime() && !self.CWIsPlacingTurret && !IsValid(self.CWTurret) then
		local centerPosition = self:GetPos() + self:OBBCenter()
		local trace = util.TraceLine({
			start = centerPosition,
			endpos = centerPosition + self:GetForward()*80,
			filter = self
		})
		if !trace.Hit then
			self.CWNextTurretTimer = CurTime() + 30
			self.CWIsPlacingTurret = true
			self:PlayAnim("vjseq_Turret_Drop" ,true, false, false)
			timer.Simple(0.9, function()
				if IsValid(self) && !IsValid(self.CWTurret) then
					local sentryGun = ents.Create("npc_vj_cwcis_sentry_gun")
					sentryGun:SetPos(self:GetPos() + self:GetForward()*55)
					sentryGun:SetAngles(self:GetAngles())
					sentryGun:Spawn()
					sentryGun:Activate()
					sentryGun.VJ_NPC_Class = self.VJ_NPC_Class
					sentryGun:SetState(VJ_STATE_FREEZE, 1)
					VJ.EmitSound(sentryGun, "vj_sw_clone_wars_era/snpcs/sentry_gun/place.wav", 80, 100)
					if IsValid(self:GetCreator()) then
						undo.Create(sentryGun:GetName())
							undo.AddEntity(sentryGun)
							undo.SetPlayer(self:GetCreator())
						undo.Finish()
					end
					self.CWTurret = sentryGun
					self.CWIsPlacingTurret = false
				end
			end)
		end
	end
end

function ENT:OnThinkActive()
	if !self.VJ_IsBeingControlled && IsValid(self:GetEnemy()) && self.EnemyData.Visible && !self:IsBusy() && !self.IsReloadingWeapon then 
		local enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos()) -- Needed to make Engineers place the Sentry Gun within its sight distance
		if enemyDistance <= 1990 then
			self:CWPlaceTurret()
		end
	end
end

function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	if GetConVar("vj_cw_disablebattledroiddismemberment"):GetInt() < 1 then
		if dmginfo:IsBulletDamage() then
			if ( hitgroup == HITGROUP_HEAD ) then
			local bloodeffect = EffectData()
				self.Corpse:SetBodygroup(1,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXhead"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Head.mdl", {Pos=self:LocalToWorld(Vector(0,0,65)), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
			elseif ( hitgroup == HITGROUP_LEFTARM ) then
				self.Corpse:SetBodygroup(3,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXleftarm"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Engineer_LeftArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
			elseif ( hitgroup == HITGROUP_RIGHTARM ) then
				self.Corpse:SetBodygroup(2,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXrightarm"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Engineer_RightArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)

			elseif ( hitgroup == HITGROUP_LEFTLEG ) then
				self.Corpse:SetBodygroup(5,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXleftleg"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_LeftLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)

			elseif ( hitgroup == HITGROUP_RIGHTLEG ) then
				self.Corpse:SetBodygroup(4,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXrightleg"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_RightLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
			end
		elseif dmginfo:IsExplosionDamage() then
			if math.random(1,3) == 3 then
				self.Corpse:SetBodygroup(1,1)
				self.Corpse:SetBodygroup(3,1)
				self.Corpse:SetBodygroup(2,1)
				self.Corpse:SetBodygroup(5,1)
				self.Corpse:SetBodygroup(4,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("chest"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Head.mdl", {Pos=self:LocalToWorld(Vector(0,0,65)), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Engineer_LeftArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Engineer_RightArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_LeftLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_RightLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
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