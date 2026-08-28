AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize() 
	if !IsValid(self:GetOwner()) then
		self:Remove()
	end
end