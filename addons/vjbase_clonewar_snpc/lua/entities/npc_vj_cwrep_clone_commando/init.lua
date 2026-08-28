AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/Clone_Commando.mdl","models/vjsw/galacticrepublic/clones/Clone_Commando_MP_A.mdl","models/vjsw/galacticrepublic/clones/Clone_Commando_MP_B.mdl","models/vjsw/galacticrepublic/clones/Clone_Commando_MP_C.mdl","models/vjsw/galacticrepublic/clones/Clone_Commando_MP_D.mdl"} -- Leave empty if using more than one model
ENT.StartHealth = 140
ENT.AnimTbl_MeleeAttack = {"vjges_gesture_signal_forward"}
ENT.MeleeAttackDamage = 55
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.HasMeleeAttackKnockBack = false
ENT.TimeUntilMeleeAttackDamage = 0.4
ENT.Weapon_IgnoreSpawnMenu = true

ENT.SoundTbl_MeleeAttackExtra = {
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_01.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_02.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_03.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_04.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_05.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_06.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_07.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_08.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_09.wav",
"vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_RC_melee_10.wav"}

ENT.CloneCommandoShield = 60
ENT.CloneCommandoShieldMax = 60
ENT.CloneCommandoShieldRegenTime = 0

function ENT:GalacticRepublicOnInit() 
	self:Give("weapon_vj_cw_dc-17m")
end

function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" then	
		self.CloneCommandoShieldRegenTime = CurTime() + 10
		if self.CloneCommandoShield > 0 then
			if dmginfo:GetDamage() >= self.CloneCommandoShield then
				dmginfo:SetDamage(dmginfo:GetDamage() - self.CloneCommandoShield)
				self.CloneCommandoShield = 0
				self.CloneCommandoShieldRegenTime = CurTime() + 15
				ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
				VJ.EmitSound(self, "vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_shieldLrg_0"..math.random(1,3)..".wav", 90)
			else
				self.CloneCommandoShield = self.CloneCommandoShield - dmginfo:GetDamage()
				dmginfo:SetDamage(0)
				ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
				VJ.EmitSound(self, "vj_sw_clone_wars_era/snpcs/clonecommando/imp_GEN_shield_0"..math.random(1,5)..".wav", 90)
			end
		else
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
end

function ENT:OnThinkActive()
	if CurTime() > self.CloneCommandoShieldRegenTime && self.CloneCommandoShield < self.CloneCommandoShieldMax then
		self.CloneCommandoShield = self.CloneCommandoShieldMax
		ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		VJ.EmitSound(self, "vj_sw_clone_wars_era/snpcs/clonecommando/int_GEN_shieldChrgUp_01.wav", 90)
	end
	
	if IsValid(self:GetEnemy()) && self.Alerted == true && !self.VJ_IsBeingControlled && !self:IsBusy() && !self.IsReloadingWeapon then
		local enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos())
			if !self:GetEnemy().VJ_ID_Boss then 
				if enemyDistance > 3000 then
					if self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m" or self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m_antiarmor" then
						self:DoChangeWeapon("weapon_vj_cw_dc-17m_sniper")
						VJ.CreateSound(self,"vj_sw_clone_wars_era/weapons/dc-17m/attachmentswitch.wav",80)
					end
				elseif enemyDistance <= 3000 then
					if self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m_sniper" or self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m_antiarmor" then
						self:DoChangeWeapon("weapon_vj_cw_dc-17m")
						VJ.CreateSound(self,"vj_sw_clone_wars_era/weapons/dc-17m/attachmentswitch.wav",80)
					end
				end
			else
				if self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m" or self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m_sniper" then
					self:DoChangeWeapon("weapon_vj_cw_dc-17m_antiarmor")
					VJ.CreateSound(self,"vj_sw_clone_wars_era/weapons/dc-17m/attachmentswitch.wav",80)
				end
			end			
	elseif !IsValid(self:GetEnemy()) && self.Alerted == false  && !self.VJ_IsBeingControlled && !self:IsBusy() && !self.IsReloadingWeapon then
		if self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m_antiarmor" or self:GetActiveWeapon():GetClass() == "weapon_vj_cw_dc-17m_sniper"  then
			self:DoChangeWeapon("weapon_vj_cw_dc-17m")
			VJ.CreateSound(self,"vj_sw_clone_wars_era/weapons/dc-17m/attachmentswitch.wav",80)
		end
	end	
end

function ENT:OnThink() 
	if self.CloneCommandoShield > 0 then
		self:RemoveAllDecals()
	end
end

function ENT:OnMeleeAttack(status, enemy) 
	if status == "PreInit" then 	
		timer.Simple( 0.2, function() if IsValid(self) then 
			VJ.EmitSound(self, "vj_sw_clone_wars_era/snpcs/clonecommando/wep_GEN_bladeShing_0"..math.random(1,2)..".wav", 75) 
			self:SetBodygroup(2,1)	end end)
		timer.Simple( 0.9, function() if IsValid(self) then self:SetBodygroup(2,0) end end)
	end
end

function ENT:OnDeath(dmginfo, hitgroup, status) 
	if status == "Init" then
		if self:GetBodygroup(2) == 1 then
			self:SetBodygroup(2,0)
		end
	end
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/