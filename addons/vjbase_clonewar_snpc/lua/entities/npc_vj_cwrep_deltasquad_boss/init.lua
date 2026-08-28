AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/DeltaSquad/Boss.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Boss.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Boss.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Boss.mdl","models/VJSW/GalacticRepublic/Clones/DeltaSquad/Boss.mdl"} -- Leave empty if using more than one model
ENT.HealthRegenParams = {
	Enabled = true, -- Can it regenerate its health?
	Amount = 1, -- How much should the health increase after every delay?
	Delay = VJ.SET(0.35, 0.35), -- Delay between each regeneration
}
ENT.MainSoundPitch = 100 -- Can be a number or VJ.SET
ENT.CWHasMoreAlertVoiceLines = false

ENT.BossSoundTbl_Alert = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/alert1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/alert2.mp3"}

ENT.BossSoundTbl_CombatIdle = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/combat15.mp3"}

ENT.BossSoundTbl_DangerSight = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/danger1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/danger2.mp3"}

ENT.BossSoundTbl_Death = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/death1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/death2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/death3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/death4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/death5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/death6.mp3"}

ENT.BossSoundTbl_DamageByPlayer = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/friendlyfire1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/friendlyfire2.mp3"}

ENT.BossSoundTbl_GrenadeSight = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/grenadespotted1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/grenadespotted2.mp3"}

ENT.BossSoundTbl_GrenadeAttack = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/grenadethrow1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/grenadethrow2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/grenadethrow3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/grenadethrow4.mp3"}

ENT.BossSoundTbl_KilledEnemy = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/killedenemy1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/killedenemy2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/killedenemy3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/killedenemy4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/killedenemy5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/killedenemy6.mp3"}

ENT.BossSoundTbl_Pain = {
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain1.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain2.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain3.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain4.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain5.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain6.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain7.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain8.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain9.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain10.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain11.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain12.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain13.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain14.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain15.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain16.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain17.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain18.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain19.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain20.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain21.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain22.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain23.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain24.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain25.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain26.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain27.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain28.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain29.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain30.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain31.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain32.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain33.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain34.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain35.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain36.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain37.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain38.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain39.mp3",
"vj_sw_clone_wars_era/snpcs/deltasquad_boss/pain40.mp3"}

function ENT:GalacticRepublicOnInit() 

	self:Give("weapon_vj_cw_dc-17m")
	
	self.SoundTbl_Alert = self.BossSoundTbl_Alert

	self.SoundTbl_CombatIdle = self.BossSoundTbl_CombatIdle

	self.SoundTbl_DangerSight = self.BossSoundTbl_DangerSight

	self.SoundTbl_Death = self.BossSoundTbl_Death

	self.SoundTbl_GrenadeSight = self.BossSoundTbl_GrenadeSight

	self.SoundTbl_GrenadeAttack = self.BossSoundTbl_GrenadeAttack

	self.SoundTbl_KilledEnemy = self.BossSoundTbl_KilledEnemy

	self.SoundTbl_Pain = self.BossSoundTbl_Pain
	
	self.SoundTbl_AllyDeath = false
	
	self.SoundTbl_Suppressing = false
	
	if GetConVar("vj_cw_galaticrepublic_hostile"):GetInt() < 1 then
		self.SoundTbl_DamageByPlayer = self.BossSoundTbl_DamageByPlayer
	end
	
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/