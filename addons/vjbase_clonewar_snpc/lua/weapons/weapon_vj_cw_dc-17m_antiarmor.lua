if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "VJ_DC-17M"
SWEP.Author 					= "Helghast Loyalist"
SWEP.Contact					= "http://steamcommunity.com/profiles/76561198180831682/"
SWEP.Purpose					= "This weapon is made for NPCs only"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ CW"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
SWEP.Slot						= 2 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.UseHands					= true
end
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/weapons/c_irifle.mdl"
SWEP.WorldModel					= "models/vsw/starwars/weapons/rc_weapons/w_dc-17m_antiarmor.mdl"
SWEP.HoldType 					= "ar2"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
SWEP.MadeForNPCsOnly 			= true -- Is tihs weapon meant to be for NPCs only?
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 10 -- Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 1 -- Max amount of bullets per clip
SWEP.Primary.Delay				= 0.1 -- Time until it can shoot again
SWEP.Primary.TracerType			= "effect_sw_laser_blue" -- Tracer type (Examples: AR2, laster, 9mm)
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Ammo				= "AR2" -- Ammo type
SWEP.Primary.Sound				= {"vj_sw_clone_wars_era/weapons/dc-17m/fire_antiarmor.wav"}
--SWEP.Primary.SoundVolume = 0.5
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"vj_sw_clone_wars_era/weapons/dc-17m/fire_antiarmor.wav"}
SWEP.Primary.DistantSoundVolume	= 0.5 -- Distant sound volume
--SWEP.PrimaryEffects_MuzzleParticles = {"vj_muzzle_blaster_blue"}
--SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_SpawnShells = false
SWEP.NPC_ReloadSound			= {"vj_base/weapons/blaster/reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
--SWEP.PrimaryEffects_DynamicLightColor = Color(0, 63, 255)
SWEP.Primary.SoundPitch	= VJ.SET(90, 100)
SWEP.NPC_NextPrimaryFire 		= 3 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0.8 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode = true
SWEP.NPC_StandingOnly 			= true
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasReloadSound				= false -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.Reload_TimeUntilAmmoIsSet	= 0.8 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 1.8 -- How much time until the player can play idle animation, shoot, etc.

function SWEP:OnPrimaryAttack(status, statusData)
	-- Override this function if you want to make your own secondary attack!
	local owner = self:GetOwner()
	local spawnPos = self:GetBulletPos()
	local projectile = ents.Create(self.NPC_SecondaryFireEnt)
	projectile:SetPos(spawnPos)
	projectile:SetAngles(owner:GetAngles())
	projectile:SetOwner(owner)
	projectile:Spawn()
	projectile:Activate()
	ParticleEffectAttach("doom_mancu_nade", PATTACH_ABSORIGIN_FOLLOW, projectile, 0,Angle(50,50,50))
	local phys = projectile:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		if phys:IsGravityEnabled() then
			phys:SetVelocity(VJ.CalculateTrajectory(owner, owner:GetEnemy(), "Curve", projectile:GetPos(), 1, 1))
		else
			phys:SetVelocity(VJ.CalculateTrajectory(owner, owner:GetEnemy(), "Line", projectile:GetPos(), 1, 2000))
		end
		projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
	end
end