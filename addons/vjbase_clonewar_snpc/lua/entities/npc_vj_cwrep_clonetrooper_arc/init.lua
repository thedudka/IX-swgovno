AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vjsw/galacticrepublic/clones/Clonetrooper_Arc.mdl","models/vjsw/galacticrepublic/clones/Clonetrooper_Arc_Captain.mdl","models/vjsw/galacticrepublic/clones/Clonetrooper_Arc_Commander.mdl","models/vjsw/galacticrepublic/clones/Clonetrooper_Arc_Lieutenant.mdl","models/vjsw/galacticrepublic/clones/Clonetrooper_Arc_Sergeant.mdl"} -- Leave empty if using more than one model
ENT.VJ_NPC_Class = {"CLASS_REPUBLIC"}
function ENT:OnInput(key, activator, caller, data)
	if key == "Impact" then
		VJ_EmitSound(self, "physics/body/body_medium_impact_soft"..math.random(1,7)..".wav", 75, 100)
	end
end

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
		local checkSides = self:VJ_CheckAllFourSides(80)
		if checkSides.Right == true && checkSides.Left == true then 
			if !dmginfo:IsExplosionDamage() && !self:IsBusy() && !self.IsReloadingWeapon && !self.Flinching && self.EnemyData.DistanceNearest >= 250 then
				local dododge = math.random(1,4)
				if dododge == 1 then
					self:StopMoving()
					local randomdirection = math.random(1,2)
					if randomdirection == 1 then self:PlayAnim("vjseq_roll_right",true, 1, false)  
					elseif randomdirection == 2 then self:PlayAnim("vjseq_roll_left",true, 1, false)
					end 
				end
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