AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.MeleeAttackDamage = 10
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.HasBloodDecal = true -- Does it spawn a decal when damaged?
ENT.HasBloodPool = true -- Does it have a blood pool?
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackThrowTime = 0.85 -- Time until the grenade is released
ENT.FootstepSoundTimerRun = 0.3 -- Next foot step sound when it is running
ENT.FootstepSoundTimerWalk = 0.5 -- Next foot step sound when it is walking
ENT.UsePoseParameterMovement = true
ENT.DeathAnimationChance = 2
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackModel = "models/vsw/thermaldetonator.mdl" -- The model for the grenade entity

ENT.AnimTbl_MeleeAttack = {"vjseq_seq_meleeattack01"}
ENT.AnimTbl_GrenadeAttack = {"vjges_gesture_item_throw"}
ENT.AnimTbl_Medic_GiveHealth = {"vjges_gesture_item_drop"}
ENT.AnimTbl_Flinch = {"vjges_flinch_01","vjges_flinch_02"}
ENT.AnimTbl_CallForHelp = {"vjges_gesture_signal_group","vjges_gesture_signal_forward"}
ENT.CallForBackUpOnDamageAnimation = {"vjges_gesture_signal_halt"}
ENT.AnimTbl_Death = {"vjseq_death_02","vjseq_death_03"}
ENT.HitGroupFlinching_Values = {
	{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head_01","vjges_flinch_head_02"}},
	{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_phys_01","vjges_flinch_phys_02","vjges_flinch_back_01"}},
	{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_flinch_stomach_01","vjges_flinch_stomach_02"}},
	{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_shoulder_l"}},
	{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_shoulder_r"}}
}

function ENT:OnGrenadeAttackExecute(status, grenade, overrideEnt, landDir, landingPos)
	if status == "PreSpawn" && !IsValid(overrideEnt) then
		util.SpriteTrail(grenade,10,Color(255,0,0),true,15,15,0.35,1/(6+6)*0.5,"VJ_Base/sprites/trail.vmt")
		grenade.SoundTbl_Startup = {"vj_sw_clone_wars_era/weapons/grenade/throw.wav"}
	end
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/