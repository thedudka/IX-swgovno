AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/DeltaSquad/Scorch.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Scorch.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Scorch.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Scorch.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Scorch.mdl"} -- Leave empty if using more than one model
ENT.HealthRegenParams = {
	Enabled = true, -- Can it regenerate its health?
	Amount = 1, -- How much should the health increase after every delay?
	Delay = VJ.SET(0.35, 0.35), -- Delay between each regeneration
}
ENT.MainSoundPitch = 100 -- Can be a number or VJ.SET
ENT.VJ_NPC_Class = {"CLASS_REPUBLIC"}

ENT.ScorchSoundTbl_Alert = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alert15.mp3"}

ENT.ScorchSoundTbl_CombatIdle = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/combat17.mp3"}

ENT.ScorchSoundTbl_Death = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/death1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/death2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/death3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/death4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/death5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/death6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/death7.mp3"}

ENT.ScorchSoundTbl_DamageByPlayer = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/friendlyfire12.mp3",}

ENT.ScorchSoundTbl_GrenadeSight = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadespotted1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadespotted2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadespotted3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadespotted4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadespotted5.mp3"}

ENT.ScorchSoundTbl_GrenadeAttack = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadethrow1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadethrow2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadethrow3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/grenadethrow4.mp3"}

ENT.ScorchSoundTbl_KilledEnemy = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy20.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy21.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy22.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy23.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy24.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy25.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy26.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy27.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy28.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy29.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy30.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy31.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy32.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy33.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy34.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy35.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy36.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy37.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy38.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy39.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy40.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy41.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy42.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy43.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy44.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/killedenemy45.mp3"}

ENT.ScorchSoundTbl_Pain = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain20.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain21.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain22.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain23.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain24.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain25.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain26.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain27.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain28.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain29.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain30.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain31.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain32.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain33.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain34.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain35.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain36.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain37.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/pain38.mp3"}

local ScorchSoundTbl_AlertBattleDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertbattledroid15.mp3"}

local ScorchSoundTbl_AlertSuperBattleDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertsuperbattledroid9.mp3"}

local ScorchSoundTbl_AlertDroideka = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertdroideka1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertdroideka2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertdroideka3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertdroideka4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertdroideka5.mp3"}

local ScorchSoundTbl_AlertSpiderDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertspiderdroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_scorch/alertspiderdroid2.mp3",}

function ENT:GalacticRepublicOnInit() 

	self:Give("weapon_vj_cw_dc-17m")
	
	self.SoundTbl_Alert = self.ScorchSoundTbl_Alert

	self.SoundTbl_CombatIdle = self.ScorchSoundTbl_CombatIdle

	self.SoundTbl_Death = self.ScorchSoundTbl_Death

	self.SoundTbl_GrenadeSight = self.ScorchSoundTbl_GrenadeSight

	self.SoundTbl_GrenadeAttack = self.ScorchSoundTbl_GrenadeAttack

	self.SoundTbl_KilledEnemy = self.ScorchSoundTbl_KilledEnemy

	self.SoundTbl_Pain = self.ScorchSoundTbl_Pain
	
	self.SoundTbl_AllyDeath = false
	
	self.SoundTbl_Suppressing = false
	
	self.SoundTbl_DangerSight = false
	
	if GetConVar("vj_cw_galaticrepublic_hostile"):GetInt() < 1 then
		self.SoundTbl_DamageByPlayer = self.ScorchSoundTbl_DamageByPlayer
	end
	
end

function ENT:OnAlert(ent)
	if self.CWHasMoreAlertVoiceLines == true then
		local uniqueAlertChance = math.random(1, 3)
		if uniqueAlertChance == 1 || uniqueAlertChance == 2 && ent:IsNPC() then
			if ent.VJ_CW_IsBattleDroid then
				self:PlaySoundSystem("Alert", ScorchSoundTbl_AlertBattleDroid)
				return
			elseif ent.VJ_CW_IsSuperBattleDroid then
				self:PlaySoundSystem("Alert", ScorchSoundTbl_AlertSuperBattleDroid)
				return
			elseif ent.VJ_CW_IsDroideka then
				self:PlaySoundSystem("Alert", ScorchSoundTbl_AlertDroideka)
				return
			elseif ent.VJ_CW_IsSpiderDroid then
				self:PlaySoundSystem("Alert", ScorchSoundTbl_AlertSpiderDroid)
				return
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