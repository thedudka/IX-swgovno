AddCSLuaFile()

SWEP.Base = "weapon_base"
SWEP.PrintName = "Remote Detonator"
SWEP.Category = "Helix"
SWEP.Spawnable = false
SWEP.AdminOnly = true
SWEP.UseHands = true
SWEP.IsAlwaysRaised = true
SWEP.DrawViewModel = true
SWEP.ViewModelFlip = true
SWEP.ViewModel = Model( "models/weapons/c_slam.mdl" )
SWEP.WorldModel = Model( "models/weapons/w_remotedetonator.mdl" )
SWEP.Instructions = "ЛКМ: Отправить сигнал о детонации"
SWEP.ViewModelFOV = 45
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.DrawAnim	=	"detonator_draw"
SWEP.IdleAnim	=	"detonator_idle"
SWEP.FireAnim	=	"detonator_detonate"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

function SWEP:Initialize()
	self:SetHoldType( "slam" )
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
	self:NetworkVar( "Int", 0, "Mode" )
end

function SWEP:UpdateNextIdle()
	local vm = self.Owner:GetViewModel()
end

function SWEP:Deploy()
	local speed = GetConVarNumber( "sv_defaultdeployspeed" )

	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( self.DrawAnim ) )
	vm:SetPlaybackRate( speed )

	self:SetNextPrimaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:SetNextSecondaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:UpdateNextIdle()

	return true
end

function SWEP:Holster() return true end

function SWEP:Think()
	local vm = self.Owner:GetViewModel()
	local curtime = CurTime()

	if ( 1 > 0 && CurTime() > 1 ) then

		vm:SendViewModelMatchingSequence( vm:LookupSequence( self.IdleAnim ) )

		self:UpdateNextIdle()

	end
end

function SWEP:PrimaryAttack()
	if !self.Owner:KeyPressed(IN_ATTACK) then return end

	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( self.FireAnim ) )

	self:UpdateNextIdle()

	if (CLIENT) then
		return
	end

	self:SetNextPrimaryFire(CurTime() + 1)

	local client = self:GetOwner()

	if (!IsValid(client)) then
		return
	end

	client:EmitSound("weapons/slam/mine_mode.wav", 65)

	local faction

	if (client:IsNeutral()) then
		faction = "neutral"
	elseif (client:IsRepublic()) then
		faction = "republic"
	elseif (client:IsCIS()) then
		faction = "cis"
	else
		client:Notify("Ваша фракция не может управлять детпаками.")
		return
	end

	local detonated = 0

	for _, charge in ipairs(ents.FindByClass("ix_detpack_charge")) do
		if (IsValid(charge) and charge:CanRemoteDetonate(faction)) then
			charge:Detonate(client)
			detonated = detonated + 1
		end
	end

end




/*AddCSLuaFile()

SWEP.UseHands = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.DrawAmmo = false

SWEP.DrawAnim	=	"detonator_draw"
SWEP.IdleAnim	=	"detonator_idle"
SWEP.FireAnim	=	"detonator_detonate"

function SWEP:Initialize()
	self:SetHoldType( "slam" )
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
	self:NetworkVar( "Int", 0, "Mode" )
end

function SWEP:UpdateNextIdle()
	local vm = self.Owner:GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() / vm:GetPlaybackRate() )
end

SWEP.Switch = {
	[0] = function(ply) JMod.EZ_Remote_Trigger(ply) end,
	[1] = function(ply) JMod.EZ_BombDrop(ply) end,
	[2] = function(ply) JMod.EZ_WeaponLaunch(ply) end
}

SWEP.Modes = {
	[0] = "*trigger*",
	[1] = "*bomb*",
	[2] = "*launch*"
}

function SWEP:PrimaryAttack( right )
	if !self.Owner:KeyPressed(IN_ATTACK) then return end

	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( self.FireAnim ) )

	self:EmitSound( "weapons/slam/mine_mode.wav" )

	self:UpdateNextIdle()

	if SERVER then
		local f = self.Switch[self:GetMode()]
		if f then f(self.Owner) end
	end

	self:SetNextPrimaryFire( CurTime() + 0.2 )
end

function SWEP:SecondaryAttack()
	if !self.Owner:KeyPressed(IN_ATTACK2) then return end
	self:SetNextSecondaryFire( CurTime() + 0.1 )
	self:EmitSound("Weapon_AR2.Empty")
	if CLIENT then return end
	local len = #self.Modes + 1
	self:SetMode( (self:GetMode() + 1)%len )
end

function SWEP:OnDrop()

	self:Remove()

end

function SWEP:Deploy()
	local speed = GetConVarNumber( "sv_defaultdeployspeed" )

	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( self.DrawAnim ) )
	vm:SetPlaybackRate( speed )

	self:SetNextPrimaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:SetNextSecondaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:UpdateNextIdle()

	return true
end

function SWEP:Holster() return true end

function SWEP:Think()
	local vm = self.Owner:GetViewModel()
	local curtime = CurTime()
	local idletime = self:GetNextIdle()

	if ( idletime > 0 && CurTime() > idletime ) then

		vm:SendViewModelMatchingSequence( vm:LookupSequence( self.IdleAnim ) )

		self:UpdateNextIdle()

	end
end
*/
