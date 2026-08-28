AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/Clonetrooper.mdl"} -- Leave empty if using more than one model
ENT.StartHealth = 100
ENT.FootStepSoundLevel = 80

ENT.SoundTbl_Alert = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/alert1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alert2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alert3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alert4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alert5.mp3"}

ENT.SoundTbl_CombatIdle = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat7.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat8.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat9.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat10.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat11.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat12.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat13.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat14.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat15.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat16.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat17.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/combat18.mp3"}

ENT.SoundTbl_DangerSight = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/danger1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/danger2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted7.mp3"}

ENT.SoundTbl_Death = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/death1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/death2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/death3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/death4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/death5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/death6.mp3"}

ENT.SoundTbl_GrenadeSight = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/grenadespotted7.mp3"}

ENT.SoundTbl_KilledEnemy = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy7.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy8.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy9.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy10.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy11.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy12.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy13.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy14.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy15.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/killedenemy16.mp3"}

ENT.SoundTbl_AllyDeath = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/mandown7.mp3"}

ENT.SoundTbl_Pain = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain7.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain8.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/pain9.mp3"}

ENT.SoundTbl_Suppressing = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing7.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing8.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing9.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing10.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing11.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/suppressing12.mp3"}

ENT.SoundTbl_FootStep = {
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep1.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep2.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep3.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep4.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep5.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep6.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep7.wav",
"vj_sw_clone_wars_era/snpcs/footsteps/trooperstep8.wav"}

local SoundTbl_AlertBattleDroid = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertbattledroid5.mp3"}

local SoundTbl_AlertSuperBattleDroid = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertsuperbattledroid1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertsuperbattledroid2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertsuperbattledroid3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertsuperbattledroid4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertsuperbattledroid5.mp3"}

local SoundTbl_AlertDroideka = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertdroideka1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertdroideka2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertdroideka3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertdroideka4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertdroideka5.mp3"}

local SoundTbl_AlertSpiderDroid = {
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid1.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid2.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid3.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid4.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid5.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid6.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid7.mp3",
"vj_sw_clone_wars_era/snpcs/clonetrooper/alertspiderdroid8.mp3"}

ENT.CWHasNoDeathAnim = false
ENT.CWIsGunner = false
ENT.CWHasMoreAlertVoiceLines = true

function ENT:Init()

	if GetConVar("vj_cw_galaticrepublic_hostile"):GetInt() < 1 then
		self.VJ_NPC_Class = {"CLASS_GALACTIC_REPUBLIC","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
		self.FriendsWithAllPlayerAllies = true -- Should this NPC be friends with other player allies?
		self.SoundTbl_DamageByPlayer = {
		"vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire1.mp3",
		"vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire2.mp3",
		"vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire3.mp3",
		"vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire4.mp3",
		"vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire5.mp3",
		"vj_sw_clone_wars_era/snpcs/clonetrooper/friendlyfire6.mp3"}
	else
		self.VJ_NPC_Class = {"CLASS_GALACTIC_REPUBLIC"} -- NPCs with the same class with be allied to each other
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
		self.FriendsWithAllPlayerAllies = true -- Should this NPC be friends with other player allies?
	end
	
	if self.CWHasNoDeathAnim == false then
		if GetConVar("vj_cw_disabledeathanims"):GetInt() > 0 then	
				self.HasDeathAnimation = false
			else
				self.HasDeathAnimation = true
		end
	end
	
	if self.CWIsGunner == true then
		function self:TranslateActivity(act)
			if act == ACT_IDLE then
				return ACT_DRIVE_JEEP
			end
			return self.BaseClass.TranslateActivity(self, act)
		end
	end

	self:GalacticRepublicOnInit()
end

function ENT:GalacticRepublicOnInit() end

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

function ENT:OnAlert(ent)
	if self.CWHasMoreAlertVoiceLines == true then
		local uniqueAlertChance = math.random(1, 3)
		if uniqueAlertChance == 1 || uniqueAlertChance == 2 && ent:IsNPC() then
			if ent.VJ_CW_IsBattleDroid then
				self:PlaySoundSystem("Alert", SoundTbl_AlertBattleDroid)
				return
			elseif ent.VJ_CW_IsSuperBattleDroid then
				self:PlaySoundSystem("Alert", SoundTbl_AlertSuperBattleDroid)
				return
			elseif ent.VJ_CW_IsDroideka then
				self:PlaySoundSystem("Alert", SoundTbl_AlertDroideka)
				return
			elseif ent.VJ_CW_IsSpiderDroid then
				self:PlaySoundSystem("Alert", SoundTbl_AlertSpiderDroid)
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