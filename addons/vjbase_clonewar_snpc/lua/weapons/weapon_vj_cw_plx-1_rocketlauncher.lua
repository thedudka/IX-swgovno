if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "VJ_REPUBLIC_RPG"
SWEP.Author 					= "Helghast Loyalist"
SWEP.Contact					= "https://steamcommunity.com/profiles/76561198180831682/"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ CW"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
SWEP.Slot						= 4 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.UseHands					= true
end
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 5 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0.8 -- How much time until the bullet/projectile is fired?
SWEP.NPC_ReloadSound			= {"vj_base/weapons/blaster/reload.wav"}
SWEP.NPC_BulletSpawnAttachment = "missile" -- The attachment that the bullet spawns on, leave empty for base to decide!
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/vj_weapons/c_rpg7.mdl" // "models/weapons/c_rpg.mdl"
SWEP.WorldModel					= "models/weapons/glcw_weps_battlefront/rep_rocket_launcher.mdl"
SWEP.HoldType 					= "rpg"
SWEP.ViewModelFOV				= 60 -- Player FOV for the view model
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
SWEP.MadeForNPCsOnly 			= true
SWEP.NPC_FiringDistanceScale 	= 2.5
SWEP.NPC_StandingOnly 			= true
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 5 -- Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 1 -- Max amount of bullets per clip
SWEP.Primary.Recoil				= 0.6 -- How much recoil does the player get?
SWEP.Primary.Delay				= 0.3 -- Time until it can shoot again
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Ammo				= "RPG_Round" -- Ammo type
SWEP.Primary.Sound				= {"vj_sw_clone_wars_era/weapons/rocketlauncher/alt_fire.wav"}
SWEP.Primary.DistantSound		= {"vj_sw_clone_wars_era/weapons/rocketlauncher/alt_fire.wav"}
SWEP.PrimaryEffects_DynamicLightColor = Color(0, 63, 255)
SWEP.Primary.DistantSoundVolume	= 0.2 -- Distant sound volume
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.PrimaryEffects_MuzzleFlash = true
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_MuzzleParticles = {"hcea_t25r_muzzle"}
SWEP.PrimaryEffects_MuzzleAttachment = 1
	-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy 				= 1 -- Time until it can shoot again after deploying the weapon
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasReloadSound				= true -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.Reload_TimeUntilAmmoIsSet	= 0.8 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 1.8 -- How much time until the player can play idle animation, shoot, etc.
SWEP.ReloadSound				= "vj_weapons/reload_rpg.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
	if CLIENT then return end
	local owner = self:GetOwner()
	local projectile = ents.Create("obj_vj_cw_heavyrod_blue")
	local spawnPos = self:GetBulletPos()
	if owner:IsPlayer() then
		local plyAng = owner:GetAimVector():Angle()
		projectile:SetPos(owner:GetShootPos() + plyAng:Forward()*-20 + plyAng:Up()*-9 + plyAng:Right()*10)
	else
		projectile:SetPos(spawnPos)
	end
	projectile:SetOwner(owner)
	projectile:Activate()
	projectile:Spawn()
	
	local phys = projectile:GetPhysicsObject()
	if IsValid(phys) then
		if owner.IsVJBaseSNPC then
			phys:SetVelocity(owner:CalculateProjectile("Line", spawnPos, owner:GetAimPosition(owner:GetEnemy(), spawnPos, 1, 2500), 2500))
		elseif owner:IsPlayer() then
			phys:SetVelocity(owner:GetAimVector() * 2500)
		else
			phys:SetVelocity(owner:CalculateProjectile("Line", spawnPos, owner:GetEnemy():GetPos() + owner:GetEnemy():OBBCenter(), 2500))
		end
		projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------