AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/VJSW/GalacticRepublic/Misc/Sentry_Gun.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 250 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HullType = HULL_HUMAN
ENT.SightDistance = 2000 -- How far it can see
ENT.MovementType = VJ_MOVETYPE_STATIONARY -- How does the SNPC move?
ENT.AnimTbl_RangeAttack = false
ENT.CanTurnWhileStationary = true -- If set to true, the SNPC will be able to turn while it's a stationary SNPC
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackMinDistance = 0 -- Min range attack distance
ENT.RangeAttackMaxDistance = 2000 -- This is how far away it can shoot
ENT.RangeAttackAngleRadius = 100 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.TimeUntilRangeAttackProjectileRelease = 0.16 -- How much time until the projectile code is ran?
ENT.RangeAttackReps = 1 -- How many times does it run the projectile code?
ENT.NextRangeAttackTime = 0 -- How much time until it can use a range attack?
ENT.NextAnyAttackTime_Range = 0 -- How much time until it can use any attack again? | Counted in Seconds
ENT.TurningSpeed = 5 -- How fast it can turn
ENT.TurningUseAllAxis = true -- If set to true, angles will not be restricted to y-axis, it will change all axes (plural axis)
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.SoundTbl_Death = {"npc/scanner/cbot_energyexplosion1.wav"}
ENT.DeathSoundLevel = 95
ENT.SoundTbl_Impact = false
ENT.CanReceiveOrders = false
ENT.VJ_ID_Healable = false

ENT.SentryGunSpread = Vector(0.08716, 0.08716, 0.08716) * 1.25

function ENT:Init()
	self:SetCollisionBounds(Vector(10, 10, 20), Vector(-10, -10, 0))
	
	timer.Simple(0.01,function() 
		if IsValid(self) then 
			self:SetPos(self:GetPos() + self:GetUp() * 30) end
		end)

	if GetConVar("vj_cw_galaticrepublic_hostile"):GetInt() < 1 then
		self.VJ_NPC_Class = {"CLASS_GALACTIC_REPUBLIC","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
		self.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
		self.FriendsWithAllPlayerAllies = true -- Should this NPC be friends with other player allies?
	else
		self.VJ_NPC_Class = {"CLASS_GALACTIC_REPUBLIC"} -- NPCs with the same class with be allied to each other
		self.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
		self.FollowPlayer = false -- Should the SNPC follow the player when the player presses a certain key?
		self.FriendsWithAllPlayerAllies = true -- Should this NPC be friends with other player allies?
	end

end

local defAng = Angle(0, 0, 0)

function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		local myPos = self:GetPos()
		ParticleEffect("explosion_turret_break", myPos, defAng)
		util.BlastDamage(self, self, myPos, 80, 20)
	end
end

function ENT:OnRangeAttackExecute(status, enemy, projectile) 
	if status == "Init" then
		local blasterRod = {}
		blasterRod.Num = 1 
		blasterRod.Spread = self.SentryGunSpread
		blasterRod.Damage = 11
		blasterRod.Force = 5
		blasterRod.AmmoType = "AR2"
		blasterRod.Tracer = 1
		blasterRod.TracerName = "effect_sw_laser_blue"
		blasterRod.Src = self:GetAttachment(self:LookupAttachment("muzzle")).Pos
		blasterRod.Dir = (self:GetAimPosition(enemy, self:GetAttachment(self:LookupAttachment("muzzle")).Pos) - self:GetAttachment(self:LookupAttachment("muzzle")).Pos):GetNormal()

		ParticleEffectAttach("vj_muzzle_blaster_blue",PATTACH_POINT_FOLLOW,self,1)
		
		blasterRod.Callback = function(attacker, tr, dmgInfo)
			if tr.Hit then
				if tr.HitSky then return end
				local sparkEffect = EffectData()
				sparkEffect:SetOrigin(tr.HitPos)
				sparkEffect:SetScale(1)
				sparkEffect:SetMagnitude(2)
				util.Effect("Sparks", sparkEffect, true, true)
				util.Decal("fadingscorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			end
		end

		self:FireBullets(blasterRod)

		VJ_EmitSound(self, "vj_sw_clone_wars_era/snpcs/sentry_gun/fire.wav", 85, self:VJ_DecideSoundPitch(100, 120))
		local muzzlelight = ents.Create("light_dynamic")
		muzzlelight:SetKeyValue("brightness", "4")
		muzzlelight:SetKeyValue("distance", "120")
		muzzlelight:Fire("Color", "0 63 255")
		muzzlelight:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos)
		muzzlelight:SetLocalAngles(self:GetAngles())
		muzzlelight:Spawn()
		muzzlelight:Activate()
		muzzlelight:SetParent(self)
		muzzlelight:Fire("TurnOn", "", 0)
		muzzlelight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(muzzlelight)
		return true
	end	
end

-- All functions and variables are located inside the base files. It can be found in the GitHub Repository: https://github.com/DrVrej/VJ-Base