AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/Clonetrooper_Heavy.mdl"} -- Leave empty if using more than one model
ENT.FootstepSoundTimerRun = 0.5
ENT.Weapon_IgnoreSpawnMenu = true
ENT.Weapon_FindCoverOnReload = false

function ENT:GalacticRepublicOnInit() 
	self:Give("weapon_vj_cw_z-6_chaingun")
end

function ENT:SetAnimationTranslations(wepHoldType)

	self.AnimationTranslations[ACT_RANGE_ATTACK1] 					= ACT_HL2MP_IDLE_RPG
	self.AnimationTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
	self.AnimationTranslations[ACT_RANGE_ATTACK1_LOW] 				= ACT_HL2MP_IDLE_CROUCH_RPG
	self.AnimationTranslations[ACT_RELOAD] 							= "vjges_reload_ar2"
	self.AnimationTranslations[ACT_RELOAD_LOW] 						= "vjges_reload_ar2"
	self.AnimationTranslations[ACT_COVER_LOW] 						= ACT_HL2MP_IDLE_CROUCH_RPG
	self.AnimationTranslations[ACT_IDLE] 							= ACT_HL2MP_IDLE_RPG
	self.AnimationTranslations[ACT_IDLE_ANGRY] 						= ACT_HL2MP_IDLE_RPG
	self.AnimationTranslations[ACT_JUMP] 							= ACT_HL2MP_JUMP_RPG
	self.AnimationTranslations[ACT_GLIDE] 							= ACT_HL2MP_JUMP_RPG
	self.AnimationTranslations[ACT_LAND] 							= ACT_HL2MP_IDLE_RPG
	self.AnimationTranslations[ACT_WALK] 							= ACT_HL2MP_WALK_RPG
	self.AnimationTranslations[ACT_WALK_AIM] 						= ACT_HL2MP_WALK_RPG
	self.AnimationTranslations[ACT_WALK_CROUCH] 					= ACT_HL2MP_WALK_CROUCH_RPG
	self.AnimationTranslations[ACT_WALK_CROUCH_AIM] 				= ACT_HL2MP_WALK_CROUCH_RPG
	self.AnimationTranslations[ACT_RUN] 							= ACT_HL2MP_WALK_RPG
	self.AnimationTranslations[ACT_RUN_AIM] 						= ACT_HL2MP_WALK_RPG
	self.AnimationTranslations[ACT_RUN_CROUCH] 						= ACT_HL2MP_WALK_CROUCH_RPG
	self.AnimationTranslations[ACT_RUN_CROUCH_AIM] 					= ACT_HL2MP_WALK_CROUCH_RPG
	return true

end

function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		self:DeathWeaponDrop(dmginfo,hitgroup)
		if IsValid(self:GetActiveWeapon()) then 
			self:GetActiveWeapon():Remove() 
		end
	end
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/