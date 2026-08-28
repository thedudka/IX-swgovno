AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/DeltaSquad/Sev.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Sev.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Sev.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Sev.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Sev.mdl"} -- Leave empty if using more than one model
ENT.HealthRegenParams = {
	Enabled = true, -- Can it regenerate its health?
	Amount = 1, -- How much should the health increase after every delay?
	Delay = VJ.SET(0.35, 0.35), -- Delay between each regeneration
}
ENT.MainSoundPitch = 100 -- Can be a number or VJ.SET

ENT.SevSoundTbl_Alert = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alert13.mp3"}

ENT.SevSoundTbl_CombatIdle = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/combat20.mp3"}

ENT.SevSoundTbl_DangerSight = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/danger1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/danger2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/danger3.mp3"}

ENT.SevSoundTbl_Death = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/death13.mp3"}

ENT.SevSoundTbl_DamageByPlayer = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/friendlyfire9.mp3"}

ENT.SevSoundTbl_GrenadeSight = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadespotted1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadespotted2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadespotted3.mp3"}

ENT.SevSoundTbl_GrenadeAttack = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadethrow1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadethrow2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadethrow3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadethrow4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/grenadethrow5.mp3"}

ENT.SevSoundTbl_KilledEnemy = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy20.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy21.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy22.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy23.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy24.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy25.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy26.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy27.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy28.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy29.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy30.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy31.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy32.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy33.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy34.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy35.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy36.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy37.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy38.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy39.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy40.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy41.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy42.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/killedenemy43.mp3"}

ENT.SevSoundTbl_Pain = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain20.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain21.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain22.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain23.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain24.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain25.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain26.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain27.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain28.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain29.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/pain30.mp3"}

local SevSoundTbl_AlertBattleDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertbattledroid14.mp3"}

local SevSoundTbl_AlertSuperBattleDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertsuperbattledroid8.mp3"}

local SevSoundTbl_AlertDroideka = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertdroideka1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertdroideka2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertdroideka3.mp3"}

local SevSoundTbl_AlertSpiderDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertspiderdroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertspiderdroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_sev/alertspiderdroid3.mp3"}

function ENT:GalacticRepublicOnInit() 

	self:Give("weapon_vj_cw_dc-17m")
	
	self.SoundTbl_Alert = self.SevSoundTbl_Alert

	self.SoundTbl_CombatIdle = self.SevSoundTbl_CombatIdle

	self.SoundTbl_DangerSight = self.SevSoundTbl_DangerSight

	self.SoundTbl_Death = self.SevSoundTbl_Death

	self.SoundTbl_GrenadeSight = self.SevSoundTbl_GrenadeSight

	self.SoundTbl_GrenadeAttack = self.SevSoundTbl_GrenadeAttack

	self.SoundTbl_KilledEnemy = self.SevSoundTbl_KilledEnemy

	self.SoundTbl_Pain = self.SevSoundTbl_Pain
	
	self.SoundTbl_AllyDeath = false
	
	self.SoundTbl_Suppressing = false
	
	if GetConVar("vj_cw_galaticrepublic_hostile"):GetInt() < 1 then
		self.SoundTbl_DamageByPlayer = self.SevSoundTbl_DamageByPlayer
	end
	
end

function ENT:OnAlert(ent)
	if self.CWHasMoreAlertVoiceLines == true then
		local uniqueAlertChance = math.random(1, 3)
		if uniqueAlertChance == 1 || uniqueAlertChance == 2 && ent:IsNPC() then
			if ent.VJ_CW_IsBattleDroid then
				self:PlaySoundSystem("Alert", SevSoundTbl_AlertBattleDroid)
				return
			elseif ent.VJ_CW_IsSuperBattleDroid then
				self:PlaySoundSystem("Alert", SevSoundTbl_AlertSuperBattleDroid)
				return
			elseif ent.VJ_CW_IsDroideka then
				self:PlaySoundSystem("Alert", SevSoundTbl_AlertDroideka)
				return
			elseif ent.VJ_CW_IsSpiderDroid then
				self:PlaySoundSystem("Alert", SevSoundTbl_AlertSpiderDroid)
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