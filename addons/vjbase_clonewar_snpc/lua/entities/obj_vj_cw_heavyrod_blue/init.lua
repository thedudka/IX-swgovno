AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Init()
	self:SetNoDraw(true)		   
	ParticleEffectAttach("glcw_heavyrod_blue", PATTACH_ABSORIGIN_FOLLOW, self, 0,Angle(50,50,50))
end