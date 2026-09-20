AddCSLuaFile()
SWEP.Base = "weapon_base"
SWEP.Category = "Waypoint System"

SWEP.PrintName = "Waypoint Designator"
SWEP.Author = "Ace"
SWEP.Contact = "github.com/hiisuuii/waypointsystem-swep"
SWEP.Instructions = "R to change color, LMB to place/remove, RMB to zoom, Shift+RMB to set name"

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/ace/sw/w_macrobinoculars.mdl"

SWEP.AutoSwitchFrom = false
SWEP.AutoSwitchTo = false
SWEP.Slot = 2
SWEP.SlotPos = 10
SWEP.Weight = 1 
SWEP.DrawAmmo = false
SWEP.DrawWeaponInfoBox = true
SWEP.DrawCrosshair = true
SWEP.Primary.Delay = 1
SWEP.Primary.Ammo = "none"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.HoldType = "camera"
SWEP.IsAlwaysRaised = true

local LastRld = -1

local colors = {
	[1] = "Красный",
	[2] = "Зеленый",
	[3] = "Синий",
	[4] = "Желтый",
	[5] = "Фиолетовый"
}

if SERVER then
	util.AddNetworkString("wpname")
	util.AddNetworkString("kaito_waypoints_sounds")
end

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "Zoomed")
end

-- Safe helper methods in case SetupDataTables hasn't bound yet
function SWEP:IsZoomed()
	if self.GetZoomed then
		return self:GetZoomed()
	end
	return self.m_bZoomed or false
end

function SWEP:ToggleZoom(state)
	if self.SetZoomed then
		self:SetZoomed(state)
	else
		self.m_bZoomed = state
	end
end

function SWEP:ShouldDrawViewModel()
	return false
end

function SWEP:Initialize()
	self:SetHoldType("camera")
	self.waypointcolor = 1
	self.WaypointName = ""
	self:InstallDataTable()
	self:SetupDataTables()
end

function SWEP:Precache()
	util.PrecacheSound( "kaito/macroping/waypoint_place.mp3" )
	util.PrecacheSound( "kaito/macroping/waypoint_remove.mp3" )
	util.PrecacheSound( "kaito/macroping/waypoint_fail.mp3" )
	util.PrecacheSound( "kaito/macroping/swep_zoom.mp3" )
	util.PrecacheSound( "kaito/macroping/swep_change_color.mp3" )
end

function SWEP:Reload()
	if LastRld < CurTime() then 
		if self.waypointcolor >= 5 then
			self.waypointcolor = 1
		elseif self.waypointcolor >= 1 then
			self.waypointcolor = self.waypointcolor + 1
		end
		if CLIENT then
			self:EmitSound( "kaito/macroping/swep_change_color.mp3", 35, 100, 1, CHAN_WEAPON )
			if IsValid(self.Owner) then
				self.Owner:ChatPrint("Цвет метки установлен на "..colors[self.waypointcolor])
			end
		end
		LastRld = CurTime() + 0.5
	end
end

function SWEP:ResetZoom()
	if IsValid(self.Owner) then
		self.Owner:SetFOV(0, 0.2)
	end
	self:ToggleZoom(false)
end

function SWEP:Deploy()
	self:ResetZoom()
	return true
end

function SWEP:Holster()
	self:ResetZoom()
	return true
end

function SWEP:OnRemove()
	self:ResetZoom()
end

function SWEP:PrimaryAttack()
	if SERVER then
		if not IsValid(self.Owner) then return end

		if self.Owner:KeyDown(IN_SPEED) then
			for k,v in ipairs(ents.FindByClass("waypoint_marker")) do
				v:Remove()
			end
			self.Owner:ChatPrint("Все метки удалены")
			return 
		end

		local hitpos = self.Owner:GetEyeTrace().HitPos
		local alreadyPoint = false

		for k,v in ipairs(ents.FindInSphere(hitpos,320)) do
			if v:GetClass() == "waypoint_marker" then
				if (v:GetWPOwner() == self.Owner) then
					net.Start("kaito_waypoints_sounds")
						net.WriteString("remove")
					net.Send(self.Owner)
					v:Remove()
				else
					self.Owner:ChatPrint("Эта метка не ваша!")
					net.Start("kaito_waypoints_sounds")
						net.WriteString("fail")
					net.Send(self.Owner)
				end
				alreadyPoint = true
			end
		end

		if not alreadyPoint then
			local ent = ents.Create("waypoint_marker")
			if IsValid(ent) then
				ent:SetPos(hitpos)
				ent:SetColorType(self.waypointcolor)
				ent:SetWPOwner(self.Owner)
				ent:Spawn()
				
				local sendCheck = GetConVar("macroping_play_sounds_all") and GetConVar("macroping_play_sounds_all"):GetInt() or 0
				net.Start("kaito_waypoints_sounds")
					net.WriteString("add")
				if sendCheck == 0 then
					net.Send(self.Owner)
				else
					net.Broadcast()
				end
			end
		end
	end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end

function SWEP:SecondaryAttack()
	if not IsValid(self.Owner) then return end

	self:SetNextSecondaryFire(CurTime() + 0.3)
	
	local checkPlaySounds = GetConVar("macroping_play_zoom_sounds") and GetConVar("macroping_play_zoom_sounds"):GetInt() or 1

	if self.Owner:KeyDown(IN_SPEED) then
		if IsFirstTimePredicted() then
			self:DermaPanel()
			self:ResetZoom()
		end
	else
		-- Wrap the toggle logic in IsFirstTimePredicted so replays don't flip the state rapidly
		if IsFirstTimePredicted() then
			local isZoomed = self:IsZoomed()
			if not isZoomed then
				self.Owner:SetFOV(20, 0.3)
				self:ToggleZoom(true)
			else
				self.Owner:SetFOV(0, 0.3)
				self:ToggleZoom(false)
			end

			if checkPlaySounds ~= 0 then
				self:EmitSound("kaito/macroping/swep_zoom.mp3", 40, 100, 1, CHAN_WEAPON)
			end
		end
	end
end

function SWEP:DrawHUD()
	if not self:IsZoomed() then return end

	-- Lazy-load the material only when needed to prevent load-order issues
	if not self.BinOverlayMat then
		self.BinOverlayMat = Material("kaito/bino_overlay.png", "smooth noclamp")
	end

	local shouldDrawBinOverlay = GetConVar("macroping_draw_overlay") and GetConVar("macroping_draw_overlay"):GetInt() or 1
	if shouldDrawBinOverlay ~= 0 and self.BinOverlayMat then
		surface.SetDrawColor(255, 255, 255, 255)
		surface.SetMaterial(self.BinOverlayMat)
		surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
	end
end

function SWEP:AdjustMouseSensitivity()
	if self:IsZoomed() then
		return 0.2
	end
	return 1
end

function SWEP:DermaPanel()
	if CLIENT then
		local Frame = vgui.Create( "DFrame" )
		local framew = ScrW() * 300 / 1920
		local frameh = ScrH() * 75 / 1080
		Frame:SetPos( ScrW()/2 - (framew)/2, ScrH()/2 - (frameh)/2 ) 
		Frame:SetSize( framew, frameh + 25 ) 
		Frame:SetTitle( "Установить название метки" ) 
		Frame:SetVisible( true ) 
		Frame:SetDraggable( true ) 
		Frame:ShowCloseButton( true ) 
		Frame:MakePopup()

		local NameEntry = vgui.Create("DTextEntry", Frame)
		NameEntry:SetPos(10, 40)
		NameEntry:SetSize(framew - (ScrW() * 20 / 1920), 25)
		NameEntry:SetText("Название метки")
		NameEntry:SetUpdateOnType(true)
		NameEntry.OnValueChange = function()
			self.WaypointName = NameEntry:GetValue()
		end
		NameEntry.OnEnter = function()
			self.WaypointName = NameEntry:GetValue()
			net.Start("wpname")
			net.WriteString(self.WaypointName)
			net.SendToServer()
		end

		local desc = vgui.Create("DLabel", Frame)
		desc:SetPos(10, 70)
		desc:SetSize(framew - (ScrW() * 20 / 1920), 25)
		desc:SetText("ENTER для подтверждения")
	end
end