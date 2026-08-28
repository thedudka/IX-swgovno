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

ENT.RadiusDamageRadius = 200
ENT.RadiusDamage = 70
---------------------------------------------------------------------------------------------------------------------------------------------

function ENT:Init()
	ParticleEffectAttach("ins_rockettrail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
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

function ENT:EATWeaponDrop()
	local funcGetActiveWeapon = metaNPC.GetActiveWeapon
	local activeWep = funcGetActiveWeapon(self)
	if !IsValid(activeWep) then return end	
	local orgPos, orgAng = activeWep:GetPos(), activeWep:GetAngles()
	self:DropWeapon(activeWep, nil, self:GetForward()) -- Override the velocity so it doesn't throw the weapon (default source behavior)
	if activeWep.WorldModel_UseCustomPosition then
		activeWep:SetPos(orgPos)
		activeWep:SetAngles(orgAng)
	end
	local phys = activeWep:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetMass(1)
	end
	self.WeaponEntity = activeWep
end