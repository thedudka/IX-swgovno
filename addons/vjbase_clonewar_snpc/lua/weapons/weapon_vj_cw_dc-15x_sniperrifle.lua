if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "VJ_REPUBLIC_SNIPER"
SWEP.Author 					= "Helghast Loyalist"
SWEP.Contact					= "http://steamcommunity.com/profiles/76561198180831682/"
SWEP.Purpose					= "This weapon is made for NPCs only"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ GLCW"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
SWEP.Slot						= 1 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 1 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.SwayScale 					= 4 -- Default is 1, The scale of the viewmodel sway
SWEP.UseHands					= true
end
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_EnableDontUseRegulate 	= false -- Used for VJ Base SNPCs, if enabled the SNPC will remove use regulate
SWEP.NPC_NextPrimaryFire 		= 2.5 -- Next time it can use primary fire
SWEP.NPC_CustomSpread	 		= 0.2 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.MadeForNPCsOnly 			= true -- Is tihs weapon meant to be for NPCs only?
SWEP.NPC_FiringDistanceScale = 2.5
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/weapons/c_irifle.mdl"
SWEP.WorldModel					= "models/weapons/glcw_weps_battlefront/rep_sniper_rifle.mdl"
SWEP.HoldType 					= "ar2"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 80 -- Damage
SWEP.Primary.PlayerDamage		= "Same" -- Only applies for players | "Same" = Same as self.Primary.Damage, "Double" = Double the self.Primary.Damage OR put a number to be different from self.Primary.Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 8 -- Max amount of bullets per clip
SWEP.Primary.Recoil				= 2 -- How much recoil does the player get?
SWEP.Primary.Cone				= 1 -- How accurate is the bullet? (Players)
SWEP.Primary.Delay				= 0.9 -- Time until it can shoot again
SWEP.Primary.TracerType			= "effect_astw2_swbf_laser_blue_sniper" -- Tracer type (Examples: AR2, laster, 9mm)
SWEP.Primary.Automatic			= false -- Is it automatic?
SWEP.Primary.Ammo				= "AR2" -- Ammo type
SWEP.Primary.Sound				= {"vj_sw_clone_wars_era/weapons/sniperrifle/fire.wav"}
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"vj_sw_clone_wars_era/weapons/sniperrifle/fire_dist.wav"}
SWEP.PrimaryEffects_DynamicLightColor = Color(0, 63, 255)
SWEP.Primary.DistantSoundVolume	= 0.5 -- Distant sound volume
SWEP.Primary.Ammo				= "ar2" -- Ammo type
SWEP.NPC_ReloadSound			= {"vj_base/weapons/blaster/reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_MuzzleParticles = {"vj_muzzle_blaster_blue"}
	-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy 				= 0.6 -- Time until it can shoot again after deploying the weapon
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasReloadSound				= false -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.Reload_TimeUntilAmmoIsSet	= 2.7 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 3.5 -- How much time until the player can play idle animation, shoot, etc.