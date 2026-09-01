AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/Clonetrooper_Engineer.mdl"} -- Leave empty if using more than one model
ENT.VJ_NPC_Class = {"CLASS_REPUBLIC"}
ENT.CWTurret = NULL
ENT.CWIsPlacingTurret = false
ENT.CWNextTurretTimer = 0

function ENT:CWPlaceTurret()
	if self.CWNextTurretTimer < CurTime() && !self.CWIsPlacingTurret && !IsValid(self.CWTurret) then
		local centerPosition = self:GetPos() + self:OBBCenter()
		local trace = util.TraceLine({
			start = centerPosition,
			endpos = centerPosition + self:GetForward()*80,
			filter = self
		})
		if !trace.Hit then
			self.CWNextTurretTimer = CurTime() + 30
			self.CWIsPlacingTurret = true
			self:PlayAnim("vjseq_Turret_Drop" ,true, false, false)
			timer.Simple(0.9, function()
				if IsValid(self) && !IsValid(self.CWTurret) then
					local sentryGun = ents.Create("npc_vj_cwrep_sentry_gun")
					sentryGun:SetPos(self:GetPos() + self:GetForward()*55)
					sentryGun:SetAngles(self:GetAngles())
					sentryGun:Spawn()
					sentryGun:Activate()
					sentryGun.VJ_NPC_Class = self.VJ_NPC_Class
					sentryGun:SetState(VJ_STATE_FREEZE, 1)
					VJ.EmitSound(sentryGun, "vj_sw_clone_wars_era/snpcs/sentry_gun/place.wav", 80, 100)
					if IsValid(self:GetCreator()) then
						undo.Create(sentryGun:GetName())
							undo.AddEntity(sentryGun)
							undo.SetPlayer(self:GetCreator())
						undo.Finish()
					end
					self.CWTurret = sentryGun
					self.CWIsPlacingTurret = false
				end
			end)
		end
	end
end

function ENT:OnThinkActive()
	if !self.VJ_IsBeingControlled && IsValid(self:GetEnemy()) && self.EnemyData.Visible && !self:IsBusy() && !self.IsReloadingWeapon then 
		local enemyDistance = self:GetEnemy():GetPos():Distance(self:GetPos()) -- Needed to make Engineers place the Sentry Gun within its sight distance
		if enemyDistance <= 1990 then
			self:CWPlaceTurret()
		end
	end
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/