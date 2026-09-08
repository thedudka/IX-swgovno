AddCSLuaFile() 
DEFINE_BASECLASS( "base_anim" )

local LoadedSounds

if SERVER then 
	util.AddNetworkString( "CreateKDMenu" )
	util.AddNetworkString( "ModelChange" )
end

if CLIENT then 

	surface.CreateFont("HoloCronTitle", {
	    font = "Soloist",
	    extended = true,
	    size = 50
	})

	surface.CreateFont("HoloCronFont", {
	    font = "Seagram tfb",
	    extended = true,
	    size = 30
	})

	ENT.AutomaticFrameAdvance = true
	LoadedSounds = {}
end

ENT.PrintName = "Sith Holocron"
ENT.Author = "Kier"
ENT.Information = "An editable holocron entity"
ENT.Category = "Holocrons"

ENT.Editable = true
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.RenderGroup = RENDERGROUP_OPAQUE

ENT.IconOverride = "materials/wos/targetindicators/plasma_ring_sd.png"

function ENT:SetupDataTables()

	self:NetworkVar( "Bool", 0, "HolocronAccess", { KeyName = "holocronaccess", Edit = { type = "Boolean", order = 1 } } )
	self:NetworkVar( "String", 1, "HolocronText", { KeyName = "holocrontext", Edit = { type = "Generic", order = 2, waitforenter = true } } )

	if SERVER then 
		self:SetHolocronText( "CHANGE ME" )
		self:SetHolocronAccess( false )
	end

end

function ENT:SpawnFunction( ply, tr, ClassName )

	if ( !tr.Hit ) then return end

	local SpawnPos = tr.HitPos + tr.HitNormal

	-- Make sure the spawn position is not out of bounds
	local oobTr = util.TraceLine( {
		start = tr.HitPos,
		endpos = SpawnPos,
		mask = MASK_SOLID_BRUSHONLY
	} )

	if ( oobTr.Hit ) then
		SpawnPos = oobTr.HitPos + oobTr.HitNormal * ( tr.HitPos:Distance( oobTr.HitPos ) / 2 )
	end

	local ent = ents.Create( ClassName )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()

	return ent

end

function ENT:Initialize()

	self:SetModel( "models/holocrons/holocron_sith01.mdl" )

	self:SetColor( Color( 255, 255, 255, 255 ) )

	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

	if SERVER then self:PhysicsInit( SOLID_VPHYSICS ) end -- DONT CHANGE - CAN BREAK PHYSGUNS

	self:PhysWake()
	
end

function ENT:Use( active )
	self:SetUseType( SIMPLE_USE )

	if active:IsPlayer() then 
		if self:GetHolocronAccess() == true then 
			net.Start("CreateKDMenu")
				net.WriteString(self:GetHolocronText())
			net.Send(active)
			--self:SetModel("models/holocrons/jedi_holocron_opened.mdl")
		else
			active:Say("I'm too pathetic to open this holocron. I'm...a failure.")
		end
	end
end

function ENT:Think()
	for k, v in pairs( ents.FindByClass("ent_holocron_sith")) do
		local newang = Angle(0,(CurTime()*90)%360,0)
		v:SetAngles(newang)
	end

	self:NextThink( CurTime() + 10 )
	return true
end

net.Receive("CreateKDMenu", function()  
	local displaytext = net.ReadString()

	local holocron = vgui.Create("DFrame")
	holocron:SetSize( ScrW()/2, ScrH()/2 )
	holocron:Center()
	holocron:SetTitle("")
	holocron:MakePopup()
	holocron:SetSizable(false)
	holocron:SetDraggable(false)
	holocron:ShowCloseButton(false)
	holocron:SetDeleteOnClose(true)

	holocron.Paint = function(self, w, h)


		draw.RoundedBoxEx(50, w/2, h*0.05, w/2*0.96, h, Color(176, 11, 11,200), true, true, false, false)
		draw.RoundedBoxEx(50, w*0.02, h*0.05, w/2*0.96, h, Color(0, 12, 176,200), true, true, false, false)
		local LightningCrack = Material("materials/holocron/lightning_crack.png", "noclamp smooth")
		local LightningEffect = Material("materials/holocron/lightning_effect.png", "noclamp smooth")
		surface.SetMaterial( LightningCrack )
		surface.SetDrawColor( 128, 0, 255, 255 )
		surface.DrawTexturedRect(w*0.02, h*0.05, w*0.96, h*0.98)
		draw.RoundedBox(0, w*0.02, h*0.05, w*0.005, h, Color( 10, 10, 10))
		draw.RoundedBox(0, w*0.98, h*0.05, w*0.005, h, Color( 10, 10, 10))

		

		--[[surface.SetMaterial( LightningEffect )
		surface.SetDrawColor( 128, 0, 255, 255 )
		surface.DrawTexturedRect(w/2*0.8, h*0.08, w*0.2, h*0.98)]]--

		surface.SetFont("HoloCronTitle")
		local holocrontitle = "Holocron"
		local tw, th = surface.GetTextSize(holocrontitle)

		draw.RoundedBoxEx(100, w*0.02, h*0.05, w*0.96, h*0.01+th*1.02, Color(10, 10, 10), true, true, false, false)

		draw.RoundedBox(0, w*0.02, h*0.99, w*0.965, h*0.02, Color( 10, 10, 10))

		local JediLogo = Material("materials/holocron/jedi_logo.png", "noclamp smooth")
		local SithLogo = Material("materials/holocron/sith_logo.png", "noclamp smooth")
		local Jedi = Material("materials/holocron/jedi.png", "noclamp smooth")
		local Sith = Material("materials/holocron/sith.png", "noclamp smooth")

		surface.SetMaterial( JediLogo )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(0, 0, w*0.1, h*0.155)

		surface.SetMaterial( SithLogo )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(w*0.9, 0, w*0.1, h*0.15)

		--[[surface.SetMaterial( Jedi )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(0, h/2, w*0.2, h*0.5)

		surface.SetMaterial( Sith )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(w*0.75, h/2*1.015, w*0.3, h*0.5)]]--

		surface.SetTextColor(255, 255, 255, 255)
		surface.SetTextPos(w/2-tw/2, h*0.06)
		surface.DrawText(holocrontitle)

		--[[draw.RoundedBox(0, w/2, 0, 1, h, Color(255,255,255))
		draw.RoundedBox(0, 0, h/2, w, 1, Color(255,255,255))]]--
	end

	local holoclose = vgui.Create("DButton", holocron )
	holoclose:SetPos(holocron:GetWide()/2*0.925, holocron:GetTall()*0.925)
	holoclose:SetSize(holocron:GetWide()/2*0.15, holocron:GetTall()/2*0.15)
	holoclose:SetText("")
	holoclose.DoClick = function()
		holocron:Close()
	end
	holoclose.Paint = function(self, w, h)
		surface.SetDrawColor(5, 5, 5, 250)
		surface.DrawRect(0, 0, w, h)

		local closebg = Material("materials/wos/targetindicators/plasma_square_sd.png", "noclamp smooth")
		surface.SetMaterial( closebg )
		surface.SetDrawColor( 100, 100, 100, 255 )
		surface.DrawTexturedRect(0, 0, w, h)

		local closemat = Material("materials/wos/runes/n.png", "noclamp smooth")
		surface.SetMaterial( closemat )
		surface.SetDrawColor( 25, 25, 25, 255 )
		surface.DrawTexturedRect(w/2*0.3, h/2*0.35, w*0.7, h*0.7)

		--[[surface.SetTextColor(0, 0, 0, 255)
		surface.SetFont("HoloCronFont")
		local closetext = "Close"
		local ww, hh = surface.GetTextSize( closetext )
		surface.SetTextPos(w*0.5-ww, h*0.5-hh)
		surface.DrawText( closetext )]]--
	end

	local holotextbg = vgui.Create( "DPanel", holocron )
	holotextbg:SetPos(holocron:GetWide()/2*0.6, holocron:GetTall()/2*0.6)
	holotextbg:SetSize(holocron:GetWide()/2*0.8, holocron:GetTall()/2)
	holotextbg:SetBackgroundColor( Color(0, 0, 0, 255))

	local holotext = vgui.Create( "DLabel", holotextbg )
	holotext:SetPos(holotextbg:GetWide()*0.1, 0)
	holotext:SetSize(holocron:GetWide()/2*0.65, holocron:GetTall()/2)
	holotext:SetFont("HoloCronFont")
	holotext:SetText(displaytext)
	holotext:SetColor(Color(255, 255, 255))
	holotext:SetWrap(true)
end )

hook.Add( "OnEntityCreated", "HolocronLoopSound2", function(ent)
	if ent:GetClass() == "ent_holocron_sith" then 
		print( ent:EntIndex() )
		ent:StartLoopingSound("holocronloop/holocron_loop.wav")
	end
end)

hook.Add( "PreDrawHalos", "HolocronGlow2", function()
	halo.Add( ents.FindByClass( "ent_holocron_sith" ), Color(255,0,0), 10, 10, 8, true, false )
end)

hook.Add( "EntityRemoved", "StopHolocronLoop2", function(ent)
	if ent:GetClass() == "ent_holocron_sith" then
		RunConsoleCommand("stopsound")
	end
end)

hook.Add( "Think", "DynLightHolocron2", function() 
	if CLIENT then 
		for k, v in pairs( ents.FindByClass("ent_holocron_sith") ) do
			local k_ddark = DynamicLight( v:EntIndex() )
			if ( k_ddark ) then 
				k_ddark.pos = v:GetPos()
				k_ddark.r = 255
				k_ddark.g = 0
				k_ddark.b = 0
				k_ddark.brightness = 1
				k_ddark.Decay = 1000
				k_ddark.Size = 250
				k_ddark.DieTime = CurTime() + 1
				k_ddark.nomodel = false
			end
		end
	end
end)

function ENT:CanProperty( ply, prop )
	if ( ply:IsAdmin() or ply:IsSuperAdmin() ) then 
		return true
	elseif ( ply:GetUserGroup() == "User" ) then
		return false
	end
end