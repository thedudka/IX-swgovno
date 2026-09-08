/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_rocket"
ENT.PrintName		= "SBD Rocket"
ENT.Author 			= "Helghast Loyalist"
ENT.Contact 		= "http://steamcommunity.com/profiles/76561198180831682/"
ENT.Category		= "Confederacy of Independent Systems"

ENT.VJ_ID_Danger = true

ENT.Model = "models/weapons/w_missile_closed.mdl"
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 200
ENT.RadiusDamage = 70
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_BLAST
ENT.RadiusDamageForce = 90
ENT.CollisionDecal = "Scorch"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.SoundTbl_Idle = "vj_sw_clone_wars_era/weapons/protonmortar/loop.wav"
ENT.SoundTbl_OnCollide = "ambient/explosions/explode_8.wav"
---------------------------------------------------------------------------------------------------------------------------------------------

function ENT:Init()
	self:SetNoDraw(true) 
	ParticleEffectAttach("hcea_t25p_tracer_charged_sparks", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("hcea_hunter_plasma_rifle_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end

local defAngle = Angle(0, 0, 0)
--
function ENT:OnDestroy(data, phys)
	VJ.EmitSound(self, "vj_sw_clone_wars_era/weapons/shared/wristrocketexplosion.wav",95)
	ParticleEffect("doom_rev_missile_blast", data.HitPos, defAngle)
	util.ScreenShake(data.HitPos, 16, 200, 1, 3000)

	local expLight = ents.Create("light_dynamic")
	expLight:SetKeyValue("brightness", "4")
	expLight:SetKeyValue("distance", "300")
	expLight:SetLocalPos(data.HitPos)
	expLight:SetLocalAngles(self:GetAngles())
	expLight:Fire("Color", "255 150 0")
	expLight:SetParent(self)
	expLight:Spawn()
	expLight:Activate()
	expLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(expLight)
end