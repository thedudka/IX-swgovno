if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "VJ_Z-6"
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
SWEP.WorldModel					= "models/weapons/glcw_weps_battlefront/rep_chaingun.mdl"
SWEP.HoldType 					= "ar2"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
SWEP.MadeForNPCsOnly 			= true -- Is tihs weapon meant to be for NPCs only?
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 11 -- Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 200 -- Max amount of bullets per clip
SWEP.Primary.Delay				= 0.1 -- Time until it can shoot again
SWEP.Primary.TracerType			= "effect_sw_laser_blue" -- Tracer type (Examples: AR2, laster, 9mm)
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Ammo				= "AR2" -- Ammo type
SWEP.Primary.Sound				= {"vj_sw_clone_wars_era/weapons/rotaryblastercannon/fire.wav"}
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(0.5,90,-190)
SWEP.WorldModel_CustomPositionOrigin = Vector(-9.5,-0.5,1)
--SWEP.Primary.SoundVolume = 0.5
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"vj_sw_clone_wars_era/weapons/shared/distant.wav"}
SWEP.Primary.DistantSoundVolume	= 0.5 -- Distant sound volume
SWEP.PrimaryEffects_MuzzleParticles = {"vj_muzzle_blaster_blue"}
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_SpawnShells = false
SWEP.NPC_ReloadSound			= {"vj_base/weapons/blaster/reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.PrimaryEffects_DynamicLightColor = Color(0, 63, 255)
--SWEP.NPC_NextPrimaryFire = 0.06 -- Next time it can use primary fire
--SWEP.NPC_NextPrimaryFire = 0.9 -- Next time it can use primary fire
--SWEP.NPC_TimeUntilFire = 0.1 -- How much time until the bullet/projectile is fired?
--SWEP.NPC_TimeUntilFireExtraTimers = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6} -- Extra timers, which will make the gun fire again! | The seconds are counted after the self.NPC_TimeUntilFire!
SWEP.NPC_CustomSpread	 		= 1.5 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasReloadSound				= false -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.ReloadSound				= "weapons/T21_reload.wav"
SWEP.Reload_TimeUntilAmmoIsSet	= 0.8 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 1.8 -- How much time until the player can play idle animation, shoot, etc.

function SWEP:DoImpactEffect( tr, dmgtype )
	if( tr.HitSky ) then return true; end
	
	local effectdata = EffectData()
	effectdata:SetOrigin( tr.HitPos )
	effectdata:SetScale( 1 )
	effectdata:SetMagnitude( 2 ) 
	util.Effect( "Sparks", effectdata, true, true )
	
	util.Decal( "fadingscorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal );
end

function SWEP:CustomOnPrimaryAttack_BeforeShoot()

	local randomRateOfFire = math.random(1,6)
	if randomRateOfFire == 1 then
		self.NPC_TimeUntilFireExtraTimers = {0.085,0.085*2,0.085*3,0.085*4,0.085*5,0.085*6,0.085*7,0.085*8,0.085*9,0.085*10,0.085*11,0.085*12,0.085*13,0.085*14} -- Next time it can use primary fire
		self.NPC_NextPrimaryFire = 1.5 -- Next time it can use primary fire
	elseif randomRateOfFire == 2 then
		self.NPC_TimeUntilFireExtraTimers = {0.085,0.085*2,0.085*3,0.085*4,0.085*5,0.085*6,0.085*7,0.085*8,0.085*9,0.085*10,0.085*11,0.085*12,0.085*13,0.085*14,0.085*15,0.085*16,0.085*17,0.085*18} -- Next time it can use primary fire
		self.NPC_NextPrimaryFire = 1.8 -- Next time it can use primary fire
	elseif randomRateOfFire == 3 then
		self.NPC_TimeUntilFireExtraTimers = {0.085,0.085*2,0.085*3,0.085*4,0.085*5,0.085*6,0.085*7,0.085*8,0.085*9,0.085*10,0.085*11,0.085*12,0.085*13,0.085*14,0.085*15,0.085*16,0.085*17,0.085*18,0.085*19,0.085*20} -- Next time it can use primary fire
		self.NPC_NextPrimaryFire = 2 -- Next time it can use primary fire
	elseif randomRateOfFire == 5 then
		self.NPC_TimeUntilFireExtraTimers = {0.085,0.085*2,0.085*3,0.085*4,0.085*5,0.085*6,0.085*7,0.085*8,0.085*9,0.085*10,0.085*11,0.085*12,0.085*13,0.085*14,0.085*15,0.085*16,0.085*17,0.085*18,0.085*19,0.085*20,0.085*21,0.085*22,0.085*23,0.085*24} -- Next time it can use primary fire
		self.NPC_NextPrimaryFire = 2.3 -- Next time it can use primary fire
	elseif randomRateOfFire == 6 then
		self.NPC_TimeUntilFireExtraTimers = {0.085,0.085*2,0.085*3,0.085*4,0.085*5,0.085*6,0.085*7,0.085*8,0.085*9,0.085*10,0.085*11,0.085*12,0.085*13,0.085*14,0.085*15,0.085*16,0.085*17,0.085*18,0.085*19,0.085*20,0.085*21,0.085*22,0.085*23,0.085*24,0.085*25,0.085*26} -- Next time it can use primary fire
		self.NPC_NextPrimaryFire = 2.5 -- Next time it can use primary fire
	end
	
end