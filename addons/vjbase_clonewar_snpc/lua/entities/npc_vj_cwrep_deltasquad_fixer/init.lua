AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/DeltaSquad/Fixer.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Fixer.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Fixer.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Fixer.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Fixer.mdl"} -- Leave empty if using more than one model
ENT.HealthRegenParams = {
	Enabled = true, -- Can it regenerate its health?
	Amount = 1, -- How much should the health increase after every delay?
	Delay = VJ.SET(0.35, 0.35), -- Delay between each regeneration
}
ENT.MainSoundPitch = 100 -- Can be a number or VJ.SET

ENT.FixerSoundTbl_Alert = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alert12.mp3"}

ENT.FixerSoundTbl_CombatIdle = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/combat16.mp3"}

ENT.FixerSoundTbl_DangerSight = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/danger1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/danger2.mp3"}

ENT.FixerSoundTbl_Death = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/death16.mp3"}

ENT.FixerSoundTbl_DamageByPlayer = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/friendlyfire17.mp3"}

ENT.FixerSoundTbl_GrenadeSight = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadespotted1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadespotted2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadespotted3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadespotted4.mp3",}

ENT.FixerSoundTbl_GrenadeAttack = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/grenadethrow9.mp3"}

ENT.FixerSoundTbl_KilledEnemy = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy20.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy21.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy22.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy23.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy24.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy25.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy26.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy27.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy28.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy29.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy30.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy31.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy32.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy33.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy34.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy35.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy36.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy37.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy38.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy39.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy40.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy41.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy42.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy43.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy44.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy45.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy46.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy47.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy48.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy49.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy50.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy51.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy52.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy53.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy54.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy55.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/killedenemy56.mp3"}

ENT.FixerSoundTbl_Pain = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain20.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain21.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain22.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain23.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain24.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain25.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain26.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain27.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain28.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain29.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain30.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain31.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain32.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain33.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain34.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/pain35.mp3"}

local FixerSoundTbl_AlertBattleDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertbattledroid15.mp3"}

local FixerSoundTbl_AlertSuperBattleDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertsuperbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertsuperbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertsuperbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertsuperbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertsuperbattledroid5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertsuperbattledroid6.mp3"}

local FixerSoundTbl_AlertDroideka = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertdroideka1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertdroideka2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertdroideka3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertdroideka4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertdroideka5.mp3"}

local FixerSoundTbl_AlertSpiderDroid = {
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertspiderdroid1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertspiderdroid2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_fixer/alertspiderdroid3.mp3"}

function ENT:GalacticRepublicOnInit() 

	self:Give("weapon_vj_cw_dc-17m")
	
	self.SoundTbl_Alert = self.FixerSoundTbl_Alert

	self.SoundTbl_CombatIdle = self.FixerSoundTbl_CombatIdle

	self.SoundTbl_DangerSight = self.FixerSoundTbl_DangerSight

	self.SoundTbl_Death = self.FixerSoundTbl_Death

	self.SoundTbl_GrenadeSight = self.FixerSoundTbl_GrenadeSight

	self.SoundTbl_GrenadeAttack = self.FixerSoundTbl_GrenadeAttack

	self.SoundTbl_KilledEnemy = self.FixerSoundTbl_KilledEnemy

	self.SoundTbl_Pain = self.FixerSoundTbl_Pain
	
	self.SoundTbl_AllyDeath = false
	
	self.SoundTbl_Suppressing = false
	
	if GetConVar("vj_cw_galaticrepublic_hostile"):GetInt() < 1 then
		self.SoundTbl_DamageByPlayer = self.FixerSoundTbl_DamageByPlayer
	end
	
end

function ENT:OnAlert(ent)
	if self.CWHasMoreAlertVoiceLines == true then
		local uniqueAlertChance = math.random(1, 3)
		if uniqueAlertChance == 1 || uniqueAlertChance == 2 && ent:IsNPC() then
			if ent.VJ_CW_IsBattleDroid then
				self:PlaySoundSystem("Alert", FixerSoundTbl_AlertBattleDroid)
				return
			elseif ent.VJ_CW_IsSuperBattleDroid then
				self:PlaySoundSystem("Alert", FixerSoundTbl_AlertSuperBattleDroid)
				return
			elseif ent.VJ_CW_IsDroideka then
				self:PlaySoundSystem("Alert", FixerSoundTbl_AlertDroideka)
				return
			elseif ent.VJ_CW_IsSpiderDroid then
				self:PlaySoundSystem("Alert", FixerSoundTbl_AlertSpiderDroid)
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