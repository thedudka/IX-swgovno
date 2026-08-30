AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.VJ_NPC_Class = {"CLASS_CIS"}
ENT.Model = {"models/VJSW/ConfederacyOfIndependentSystems/Battle_Droid.mdl"} -- Leave empty if using more than one model
ENT.StartHealth = 100
ENT.FootStepSoundLevel = 80
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = VJ.BLOOD_COLOR_BLUE
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.HasBloodDecal = true -- Does it spawn a decal when damaged?
ENT.HasBloodPool = true -- Does it have a blood pool?

ENT.SoundTbl_Alert = {
"vj_sw_clone_wars_era/snpcs/battledroid/alert1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert5.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert6.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert7.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert8.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert9.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert10.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert11.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/alert12.mp3"}

ENT.SoundTbl_CombatIdle = {
"vj_sw_clone_wars_era/snpcs/battledroid/combat1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat5.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat6.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat7.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat8.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat9.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat10.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat11.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat12.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat13.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat14.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/combat15.mp3"}

ENT.SoundTbl_DangerSight = {
"vj_sw_clone_wars_era/snpcs/battledroid/danger1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/danger2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/danger3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/danger4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/danger5.mp3"}

ENT.SoundTbl_Death = {
"vj_sw_clone_wars_era/snpcs/battledroid/death1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death5.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death6.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death7.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death8.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death9.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death10.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death11.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/death12.mp3"}

ENT.SoundTbl_GrenadeSight = {
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted5.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted6.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted7.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted8.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted9.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted10.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted11.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/grenadespotted12.mp3"}

ENT.SoundTbl_KilledEnemy = {
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy5.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy6.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy8.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy9.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy10.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy11.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy13.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy14.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy15.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy16.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy17.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/killedenemy18.mp3"}

ENT.SoundTbl_Pain = {
"vj_sw_clone_wars_era/snpcs/battledroid/pain1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain5.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain6.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain7.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain8.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain9.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain10.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain11.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain12.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain13.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain14.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain15.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain16.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain18.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain19.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain20.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain22.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain23.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain24.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain25.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain26.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain27.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain28.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain29.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain30.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain31.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/pain32.mp3"}

ENT.SoundTbl_Suppressing = {
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing1.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing2.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing3.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing4.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing5.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing6.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing7.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing8.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing9.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing10.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing11.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing12.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing13.mp3",
"vj_sw_clone_wars_era/snpcs/battledroid/suppressing14.mp3"}

ENT.SoundTbl_FootStep = {
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep1.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep2.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep3.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep4.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep5.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep6.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep7.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/battledroidstep8.wav"}

ENT.SoundTbl_Impact = false

function ENT:Init()
	self:SetNW2Bool("AVP.IsTech",true)
end

function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" then	
		if dmginfo:IsBulletDamage() or dmginfo:GetDamageType() == DMG_SLASH or dmginfo:GetDamageType() == DMG_CLUB then
			VJ.EmitSound(self, "VJ.Impact.Armor")
			if math.random(1, 3) == 1 then
				dmginfo:ScaleDamage(0.50)
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

function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	if GetConVar("vj_cw_disablebattledroiddismemberment"):GetInt() < 1 then
		if dmginfo:IsBulletDamage() then
			if ( hitgroup == HITGROUP_HEAD ) then
				self.Corpse:SetBodygroup(1,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXhead"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Head.mdl", {Pos=self:LocalToWorld(Vector(0,0,65)), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
			elseif ( hitgroup == HITGROUP_LEFTARM ) then
				self.Corpse:SetBodygroup(3,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXleftarm"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_LeftArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
			elseif ( hitgroup == HITGROUP_RIGHTARM ) then
				self.Corpse:SetBodygroup(2,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXrightarm"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_RightArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)

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
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_LeftArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_RightArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
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