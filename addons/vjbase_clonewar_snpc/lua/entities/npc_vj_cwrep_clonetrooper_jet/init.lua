AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJSW/GalacticRepublic/Clones/Clonetrooper_Jet.mdl"} -- Leave empty if using more than one model

-- Credit to ϟLightning Boltϟ and Panzer Elite for the Jetpack code
ENT.CanJetpackJump = true
ENT.JetpackJump_NextT = 0
ENT.JetpackJump_Nexttime = 2
ENT.JetpackJump_activated = 0
ENT.JetpackJump_jumping = 0
ENT.JetpackJump_durationT = 0
ENT.JetpackJump_duration = 5.0
ENT.JetpackJump_Chance = 10
ENT.JetpackJump_anim = "vjseq_CS_Jump"
ENT.JetpackJump_landanim = "vjseq_jump_holding_land"
ENT.JetpackJump_Rangemin = 200
ENT.JetpackJump_Rangemax = 2500
ENT.JetpackJump_Range = 4000
ENT.JetpackJump_Rangeclose = 450
ENT.JetpackJump_Cooldown = 5
ENT.JetpackJump_originalgravity = 1
ENT.JetpackJump_originalmovetype = VJ_MOVETYPE_GROUND
ENT.SoundTbl_JetpackSound = {"weapons/stinger_fire1.wav","weapons/stinger_fire1.wav"}
ENT.JetpackJump_originaldragn = 0
ENT.JetpackJump_originaldrag = true
ENT.JetpackJump_originalflinch = 1
ENT.JetpackJump_originalenemy = NULL
ENT.JetpackJump_originalmelee = true

ENT.JetpackJumpEscape_Nexttime = 2
ENT.JetpackJumpEscape_NextT = 0
ENT.JetpackJumpEscape_activated = 0
ENT.JetpackJumpEscape_recharge = 1

function ENT:OnThinkActive()

	if self.CanJetpackJump == true && !self.VJ_IsBeingControlled then
	
	
	if self.JetpackJump_activated == 1 and self.JetpackJump_jumping == 1 then
	
	local tracedataAD = {}
	tracedataAD.start = self:GetPos() + Vector(0,0,40)
	tracedataAD.endpos = self:GetPos() + Vector(0,0,-30)
	tracedataAD.filter = {self}
	local trAD = util.TraceLine(tracedataAD)
	
	if (self.JetpackJump_durationT < CurTime()) or ( trAD.HitWorld ) or ( trAD.Entity != nil and IsValid(trAD.Entity) and trAD.Entity != self:GetActiveWeapon() and trAD.Entity != self) then
	
		self.JetpackJump_jumping = 0
		self:SetFriction(self.JetpackJump_originalgravity)
		self.CurrentAttackAnimation = self.JetpackJump_landanim
		--self.PlayingAttackAnimation = true
		timer.Simple(VJ.AnimDuration(self,self.CurrentAttackAnimation) -0.1,function()
			if IsValid(self) then
				self.MovementType = self.JetpackJump_originalmovetype
				self.CanFlinch = self.JetpackJump_originalflinch
				self.CanTurnWhileStationary = true
				--self:SetFriction(self.JetpackJump_originalgravity)
				local physw11 = self:GetPhysicsObject()
						if ( IsValid( physw11 ) ) then
							physw11:EnableDrag(self.JetpackJump_originaldrag)
						end	
				timer.Simple(1,function()
				if IsValid(self) then
				self.CanPerformMeleeCharge = self.JetpackJump_originalmelee 
				end 
				end)
				self.PauseAttacks = false
				self.NextChaseTime = CurTime() + 0.2
				self.NextIdleTime = CurTime() 
				self.JetpackJump_NextT = CurTime() + self.JetpackJump_Cooldown
				self:ClearSchedule()
				self.JetpackJump_activated = 0
				self:PlayAnim( self.AnimTbl_IdleStand,false,0.2,false,0,{})
				if IsValid(self.JetpackJump_originalenemy) and self.JetpackJump_originalenemy != NULL then
					self:FaceCertainPosition(self.JetpackJump_originalenemy:GetPos())
				end
			end
		end)
		self:PlayAnim(self.CurrentAttackAnimation,false,0.5,false,0,{SequenceDuration=(0.5)})
		
	end
	
	end
	
	if self.JetpackJump_NextT < CurTime() and self.JetpackJump_activated == 0 and self.MovementType == VJ_MOVETYPE_GROUND and self.PauseAttacks == false then
	
	if (IsValid(self:GetEnemy()) and math.random(1,10) >= self.JetpackJump_Chance) or (self.JetpackJumpEscape_activated == 1) then
	self.JetpackJump_NextT = CurTime() + self.JetpackJump_Nexttime
	if (IsValid(self:GetEnemy()) and self:GetPos():DistToSqr( self:GetEnemy():GetPos() ) < self.JetpackJump_Rangemax*self.JetpackJump_Rangemax and self:GetPos():DistToSqr( self:GetEnemy():GetPos() ) > self.JetpackJump_Rangeclose*self.JetpackJump_Rangeclose) or (self.JetpackJumpEscape_activated == 1) then
	
		local targetent = self
		if IsValid(self:GetEnemy()) and self.JetpackJumpEscape_activated != 1 then
			targetent = self:GetEnemy()
		end
		local attackspottbl = {targetent:GetForward()*math.random(0,100) +targetent:GetRight()*math.random(-100,100),
			targetent:GetForward()*math.random(-100,80) +targetent:GetRight()*math.random(-100,100),
			targetent:GetForward()*math.random(-100,80) +targetent:GetRight()*math.random(-120,120),
			targetent:GetForward()*math.random(-120,0) +targetent:GetRight()*math.random(-150,150),
			targetent:GetForward()*math.random(-120,0) +targetent:GetRight()*math.random(-50,50)}
		local chosenpos = Vector(0,0,0)
		local sutiableattackpos = {}
		local actualattackpos = Vector(0,0,0)
		local tracss = {}
		local tracc = {}
		local tracssdata = {}
		local tracsscx = {}
		--local enemydirection = Vector(0,0,0)
		local enemyeyepos = targetent:EyePos()
		local postocheck = Vector(0,0,0)
		--local timeaddition = 0
		local isenemyunreachable = false
		if IsValid(self:GetEnemy()) and self.JetpackJumpEscape_activated != 1 and self:IsUnreachable(self:GetEnemy()) == true and self:GetEnemy():GetPos().z > self:GetPos().z then
			isenemyunreachable = true
		end
			for k,vapos in ipairs(attackspottbl) do
			if table.Count( sutiableattackpos ) <= 3 then
				tracssdata = {
						start = enemyeyepos,
						endpos = enemyeyepos +vapos:GetNormalized()*math.random(self.JetpackJump_Rangemin+100,self.JetpackJump_Rangeclose),
						filter = {self,self:GetActiveWeapon(),targetent}
						}
				if self.JetpackJumpEscape_activated == 1 then tracssdata.endpos = enemyeyepos +vapos:GetNormalized()*math.random(self.JetpackJump_Rangeclose,self.JetpackJump_Rangemax) end
				if IsValid(self:GetEnemy()) and self.JetpackJumpEscape_activated != 1 and self:GetEnemy():GetActiveWeapon() != NULL and self:GetEnemy():GetActiveWeapon() != nil then tracssdata.filter = {self,self:GetActiveWeapon(),targetent,self:GetEnemy():GetActiveWeapon()} end
				
				tracss = util.TraceLine(tracssdata)
				

				
				--if tracss.HitWorld == true or (tracss.Entity != nil and tracss.Entity != NULL and (tracss.Entity:GetClass() == "prop_physics" or tracss.Entity:GetClass() == "prop_dynamic" ) ) then 
				if tracss.HitPos:DistToSqr(enemyeyepos) > self.JetpackJump_Rangemin*self.JetpackJump_Rangemin then
				
				tracc = util.TraceLine({
						start = tracss.HitPos,--trace11.HitPos + Vector(0,0,70),
						endpos = tracss.HitPos + Vector(0,0,-128),
						filter = {self,self:GetActiveWeapon()}
						})
				if tracc.HitWorld == true or (tracc.Entity != NULL and tracc.Entity != nil and (tracc.Entity:GetClass() == "prop_dynamic" or tracc.Entity:GetClass() == "prop_physics")) then
				--table.insert( sutiableattackpos, pointa:GetPos() )
				--table.insert( sutiableattackpos, tracss.HitPos+Vector(0,0,-15) )
				postocheck = tracss.HitPos+Vector(0,0,-10)
				if isenemyunreachable == true then
				tracsscx = util.TraceLine({
						start = postocheck,
						endpos = postocheck+Vector(0,0,-800),
						filter = {self,self:GetActiveWeapon()}
						})
				if tracsscx.HitWorld == true then postocheck = tracsscx.HitPos +Vector(0,0,20) end
				end

				local greShootVel = postocheck -self:GetPos()

				local selfpos = self:GetPos() + self:GetUp()*50
				local heightdifference = postocheck.z - selfpos.z
			
			--if math.random(self.GrenadeThrowHigh_chance,50) > -40 then
				postocheck = postocheck + Vector(0,0,5)
			
				local targetdir = postocheck -selfpos
				local Midpoint = Vector((selfpos.x + postocheck.x)/2,(selfpos.y + postocheck.y)/2,(selfpos.z + postocheck.z)/2)
				local midpointdist = selfpos:Distance( Midpoint )
				local midpointupper = Midpoint + Vector(0,0, midpointdist*1.732 ) --/1 for tan45 , 1.731 for tan60 (sqroot 3)
				heightdifference = postocheck.z - selfpos.z
			


				local vel_range = 0
				local vel_force	= 0
				local failedsecondcheck = 0
				local failedsecondchecka = 0
				local failedsecondcheck2 = 0
				local failedsecondcheck2a = 0
				--local failedsecondcheck3 = 0
				local issutiablepos = 0
				local tr2 = util.TraceEntity({
							start = midpointupper,
							endpos = postocheck,
							filter = {self}
							},self)
				local tr3 = util.TraceEntity({
							start = selfpos,
							endpos = midpointupper,
							filter = {self}
							},self)
				if tr2.HitPos:DistToSqr(postocheck) > 64*64 then failedsecondcheck = 1 end
				if tr3.HitPos:DistToSqr(midpointupper) > 64*64 then failedsecondchecka = 1 end
			
				if failedsecondcheck == 0 and failedsecondchecka == 0 then
				greShootVel = midpointupper -self:GetPos()
				issutiablepos = 1
				--local vel_lengthz = math.sqrt( 22.86*(midpointupper.z - selfpos.z) ) 
				--local vel_lengthx = (midpointdist*2)/((vel_lengthz*2)/11.43) --calculate the flight time of grenade
				--local vel_force =  math.sqrt( vel_lengthx*vel_lengthx + vel_lengthz*vel_lengthz )
				vel_range = (midpointdist*2)*0.01905 + ((heightdifference*0.01905)/1.732)
				vel_force = math.sqrt( (11.43*vel_range)/(0.8632) ) --1 unit = 0.01905m sin 2.1 rad = 0.8632
				
				greShootVel = greShootVel:GetNormalized()*(vel_force/0.01905)
				
				else
				midpointupper = Midpoint + Vector(0,0, midpointdist/1 ) --try 45 degrees
				--if math.abs(heightdifference) > 1 then 
				--midpointupper = midpointupper + Vector(0,0, heightdifference/2) + targetdir:GetNormalized()*(heightdifference/2)
				--end

						
				local tr2a = util.TraceEntity({
							start = midpointupper,
							endpos = postocheck,
							filter = {self}
							},self)
				local tr3a = util.TraceEntity({
							start = selfpos,
							endpos = midpointupper,
							filter = {self}
							},self)
				if tr2a.HitPos:DistToSqr(postocheck) > 64*64 then failedsecondcheck2 = 1 end
				if tr3a.HitPos:DistToSqr(midpointupper) > 64*64 then failedsecondcheck2a = 1 end

				if failedsecondcheck2 == 0 and failedsecondcheck2a == 0 then 
				greShootVel = midpointupper -self:GetPos()
				issutiablepos = 1
				
				--local vel_lengthz = math.sqrt( 22.86*(midpointupper.z - selfpos.z) ) 
				--local vel_lengthx = (midpointdist*2)/( (vel_lengthz*2)/11.43 ) --calculate the flight time of grenade
				--local vel_force =  math.sqrt( vel_lengthx*vel_lengthx + vel_lengthz*vel_lengthz )

				vel_range = (midpointdist*2)*0.01905 + ((heightdifference*0.01905)/1)
				vel_force = math.sqrt( (11.43*vel_range)/(1) ) --1 unit = 0.01905m sin 1.57 rad = 0.99999
	
				greShootVel = greShootVel:GetNormalized()*(vel_force/0.01905)
				
				end
				

				end
				
				
				if issutiablepos == 1 then
				table.insert( sutiableattackpos, greShootVel )
				end
				
				--end
				
				
				
			end
			end
			end
	
	
	
	
	
	
			end
			
					if actualattackpos == Vector(0,0,0) and table.Count( sutiableattackpos ) >= 1 then
						local useablepos = VJ_PICK(sutiableattackpos)
						if useablepos != nil and useablepos != NULL and useablepos != Vector(0,0,0) and useablepos != false then
							actualattackpos = useablepos
						end
					end
					
					if actualattackpos != Vector(0,0,0) then 
					
						self.JetpackJump_activated = 1
						if self.JetpackJumpEscape_activated == 1 then self.JetpackJumpEscape_activated = 0 end
						self.JetpackJump_NextT = CurTime() + self.JetpackJump_Cooldown
						self.JetpackJump_originalgravity = self:GetFriction()
						self.JetpackJump_originalmovetype = self.MovementType
						self.JetpackJump_originalflinch = self.CanFlinch
						self.JetpackJump_originalmelee = self.CanPerformMeleeCharge
						self.CanPerformMeleeCharge = false
						self.CanFlinch = 0
						self.MovementType = VJ_MOVETYPE_STATIONARY
						self.CanTurnWhileStationary = false
						self:SetFriction(0)
						self:FaceCertainPosition( self:GetPos() +actualattackpos:GetNormalized()*1000 )
						self.CurrentAttackAnimation = self.JetpackJump_anim
						self:ClearSchedule()
						self:StopMoving()
						self.Weapon_ShotsSinceLastReload = 0
						if IsValid(self:GetEnemy()) then
						self.JetpackJump_originalenemy = self:GetEnemy()
						else
						self.JetpackJump_originalenemy = NULL
						end
						self.JetpackJump_durationT = CurTime() + self.JetpackJump_duration
				
						self:StopAttacks(true)
						self.PauseAttacks = true
						self.NextChaseTime = CurTime() + self.JetpackJump_duration + 0.6
						self.NextIdleTime = CurTime() + self.JetpackJump_duration + 0.6
			
						self:PlayAnim(ACT_HL2MP_JUMP_AR2,false,(self.JetpackJump_duration+0.5),false,0,{SequenceDuration=(self.JetpackJump_duration+0.5)})
	
						local physw1 = self:GetPhysicsObject()
						if ( IsValid( physw1 ) ) then
							--self.JetpackJump_originaldragn = 0
							self.JetpackJump_originaldrag = physw1:IsDragEnabled() 
							physw1:EnableDrag(false)
							--physw1:SetVelocity(actualattackpos +self:GetUp()*math.random(0,10) )
				
						end
	
						self:SetVelocity( actualattackpos +self:GetUp()*math.random(0,10) )
						
						timer.Simple(0.4,function()
						if IsValid(self) then
						if self.JetpackJump_jumping != 1 and self.JetpackJump_activated == 1 then
							self.JetpackJump_jumping = 1
						end
						end
						end)
						
							if self.HasSounds != false then
							local soundtbl = self.SoundTbl_JetpackSound
							if VJ_PICK(soundtbl) != false then
								self.CurrentMeleeAttackSound = VJ_CreateSound(self,soundtbl,90,100)
							end
							end
	
					end
			
			
	end

	end
	end
	end

	-- The following if statement was added by me, Helghast Loyalist
	if self.JetpackJump_activated == 1 then
		local jetpackeffect1 = ents.Create("info_particle_system")
		jetpackeffect1:SetKeyValue("effect_name","vj_bms_turret_full")
		jetpackeffect1:SetPos(self:GetAttachment(self:LookupAttachment("jetpackfx1")).Pos)
		jetpackeffect1:SetAngles(self:GetAttachment(self:LookupAttachment("jetpackfx1")).Ang)
		jetpackeffect1:Fire("SetParentAttachment","jetpackfx1")
		jetpackeffect1:Fire("Start","",0.0)
		jetpackeffect1:SetParent(self)
		jetpackeffect1:Spawn()
		jetpackeffect1:Activate()	
		jetpackeffect1:Fire("Kill","",0.07)
		local jetpackeffect2 = ents.Create("info_particle_system")
		jetpackeffect2:SetKeyValue("effect_name","vj_bms_turret_full")
		jetpackeffect2:SetPos(self:GetAttachment(self:LookupAttachment("jetpackfx2")).Pos)
		jetpackeffect2:SetAngles(self:GetAttachment(self:LookupAttachment("jetpackfx2")).Ang)
		jetpackeffect2:Fire("SetParentAttachment","jetpackfx2")
		jetpackeffect2:Fire("Start","",0.0)
		jetpackeffect2:SetParent(self)
		jetpackeffect2:Spawn()
		jetpackeffect2:Activate()	
		jetpackeffect2:Fire("Kill","",0.07)
	end
	
end

-- To add rest of the SNPC and get full list of the function, you need to decompile VJ Base.

/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/