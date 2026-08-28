AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/ConfederacyOfIndependentSystems/Battle_Droid_Assassin.mdl"} -- Leave empty if using more than one model

function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	if GetConVar("vj_cw_disablebattledroiddismemberment"):GetInt() < 1 then
		if dmginfo:IsBulletDamage() then
			if ( hitgroup == HITGROUP_HEAD ) then
			local bloodeffect = EffectData()
				self.Corpse:SetBodygroup(1,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXhead"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_Head.mdl", {Pos=self:LocalToWorld(Vector(0,0,65)), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
			elseif ( hitgroup == HITGROUP_LEFTARM ) then
				self.Corpse:SetBodygroup(3,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXleftarm"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_LeftArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
			elseif ( hitgroup == HITGROUP_RIGHTARM ) then
				self.Corpse:SetBodygroup(2,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXrightarm"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_RightArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)

			elseif ( hitgroup == HITGROUP_LEFTLEG ) then
				self.Corpse:SetBodygroup(5,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXleftleg"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_LeftLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)

			elseif ( hitgroup == HITGROUP_RIGHTLEG ) then
				self.Corpse:SetBodygroup(4,1)
				ParticleEffectAttach("hcea_gold_hunter_hit",PATTACH_POINT_FOLLOW,corpse,self:LookupAttachment("DamageFXrightleg"))
				VJ.EmitSound(self,"npc/manhack/gib.wav", 65)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_RightLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
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
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_Head.mdl", {Pos=self:LocalToWorld(Vector(0,0,65)), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_LeftArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_RightArm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_LeftLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
				self:CreateGibEntity("prop_ragdoll", "models/vjsw/confederacyofindependentsystems/bodyparts/Battle_Droid_Assassin_RightLeg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) end)
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