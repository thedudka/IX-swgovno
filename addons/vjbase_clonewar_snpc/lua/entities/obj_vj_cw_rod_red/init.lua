AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
if !SERVER then return end

ENT.Model = "models/weapons/w_missile_launch.mdl"
ENT.DoesDirectDamage = true -- Should it deal direct damage when it collides with something?
ENT.DirectDamage = 50
ENT.DirectDamageType = DMG_AIRBOAT
ENT.CollisionDecal = "FadingScorch"
ENT.SoundTbl_OnCollide = {"ambient/energy/spark4.wav"}
------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetNoDraw(true) 
	ParticleEffectAttach("hcea_red_hunter_nade", PATTACH_ABSORIGIN_FOLLOW, self, 0,Angle(50,50,50))
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAngle = Angle(0, 0, 0)
--
function ENT:OnDestroy(data, phys)
	ParticleEffect("hcea_red_hunter_hit", data.HitPos, defAngle)
end
--------------------------------------------------------------------------------------
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/