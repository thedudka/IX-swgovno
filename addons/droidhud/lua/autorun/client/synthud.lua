CreateClientConVar("SyntHud_enabled",1,true,false, "Enable Synthetik HUD",0,1)
CreateClientConVar("SyntHud_background",1,true,false, "Adds a background behind the hud",0,1)
CreateClientConVar("SyntHud_armor_background",1,true,false, "Aarmor backgorund style",0,3)
CreateClientConVar("SyntHud_bars_background",1,true,false, "Display background for health/armor",0,1)

CreateClientConVar("SyntHud_separated", 1, true, false, "Unify the health and armor bars together (default = 1)",0,1)
CreateClientConVar("SyntHud_position_x", 0, true, false, "Modify the horizontal position of the hud (0 to default position)")
CreateClientConVar("SyntHud_position_y", 0, true, false, "Modify the vertical position of the hud (0 to default position)")
CreateClientConVar("SyntHud_width", 0, true, false, "Modify the width of the hud (0 to default width)")
CreateClientConVar("SyntHud_scale", 1, true, false, "Modify the scale of the hud (1 to default scale)",0.5)
CreateClientConVar("SyntHud_ap_fixed", 0, true, false, "Armor bar will stay in position instead of folloing the health bar (default = 0)",0,1)
CreateClientConVar("SyntHud_bars_digits", 1, true, false, "Display health and armor digits (default = 1)",0,1)
CreateClientConVar("SyntHud_alternative_ar2_bullet", 0, true, false, "Change AR2 ammo icon (bullet instead of energy cell, default = 0)",0,1)

CreateClientConVar("SyntHud_lowhp_alert", 1, true, false, "Low health alert",0,1)
CreateClientConVar("SyntHud_max_hp", 0, false, false, "Set the maximum health to display (0 to auto-detect)",0)
CreateClientConVar("SyntHud_max_ap", 100, false, false, "Set the maximum armor to display (0 to hide armor)",0)
CreateClientConVar("SyntHud_keep_exceeding", 0, true, false, "If health or armor exceed the maximum set, should it keep it if the value goes below the threshold",0,1)

CreateClientConVar("SyntHud_shield_mode", 0, true, false, "Enables shield functionality",0,1)
CreateClientConVar("SyntHud_shield_vignette", 1, true, false, "Vignette when shield low",0,1)
CreateClientConVar("SyntHud_shield_alert", 1, true, false, "Shield alert",0,1)

local Transitions = {}
Transitions.LostTotHealth = {}
Transitions.LostHealth = {}
Transitions.LostArmor = {}
Transitions.GainHealth = {}
Transitions.GainArmor = {}

local StoredMaxAmmo = {}

local MaxHp = 0
local MaxAp = 0
local SetMaxHp = 100

local ReachMaxHp = 100
local ReachMaxAp = 100

local HpGainAlpha = 0
local ApGainAlpha = 0
local ArmorClamp = 0
local ApBg = 0

local CNextTimer = 0
local AmNextTimer = 0
local NNextTimer = 0

local HpFlashAlpha = 0
local AmmoLocation = 0

local WeaponNameAlpha = 0
local AmmoAlpha = 0

local ClipShakeH = 0
local ClipShakeW = 0
local BgClipShakeH = 0
local BgClipShakeW = 0

local ClipShakeTime = 0
local BgClipShakeTime = 0

local ClipAlpha = 255	
local ClipAlphaDir = 0
local ClipAlphaVel = 0

local AmmoShakeH = 0
local AmmoShakeW = 0
local AmmoShakeTime = 0

local AmmoAnimTime = 0
local AmmoAnimTime2 = 0
local AmmoAnimStep = 0

local AmmoFlash = 0

local CustomScale = GetConVar("SyntHud_scale"):GetFloat()
local ScrRatio = ScrH()/1080*CustomScale

-- Setting up textures
	local HudBg = surface.GetTextureID("vgui/synthud/hudbg")
	local LowHP = surface.GetTextureID("vgui/synthud/lowhp")
	local LowAP = surface.GetTextureID("vgui/synthud/lowap")
	local ShieldTunnel = surface.GetTextureID("vgui/synthud/shieldtunnel")
	local GainHP = surface.GetTextureID("vgui/synthud/gainhp")

	local HpIcon = surface.GetTextureID("vgui/synthud/hpicon")
	local ApIcon = surface.GetTextureID("vgui/synthud/apicon")
	
	local SecAmmoIcon = surface.GetTextureID("vgui/synthud/secammo")
	local AmmoCountBG = surface.GetTextureID("vgui/synthud/ammobg") 
	
	local function LoadFonts()

		surface.CreateFont( "Font Ammo", {
			font = "Alte Haas Grotesk", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
			size = 34*ScrRatio,
			weight = 500,
			blursize = 0,
			scanlines = 0,
			antialias = true,
			underline = false,
			italic = false,
			strikeout = false,
			symbol = false,
			rotary = false,
			shadow = false,
			additive = false,
			outline = false,
		} )	

		surface.CreateFont( "Font Bars", {
			font = "Alte Haas Grotesk", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
			size = 22*ScrRatio,
			weight = 500,
			blursize = 0,
			scanlines = 0,
			antialias = true,
			underline = false,
			italic = false,
			strikeout = false,
			symbol = false,
			rotary = false,
			shadow = false,
			additive = false,
			outline = false,
		} )	

		surface.CreateFont( "Font Name", {
			font = "Alte Haas Grotesk", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
			size = 26*ScrRatio,
			weight = 500,
			blursize = 0,
			scanlines = 0,
			antialias = true,
			underline = false,
			italic = false,
			strikeout = false,
			symbol = false,
			rotary = false,
			shadow = false,
			additive = false,
			outline = false,
		} )	

		surface.CreateFont( "Font Clip", {
			font = "Orbitron", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
			size = 45*ScrRatio,
			weight = 500,
			blursize = 0,
			scanlines = 0,
			antialias = true,
			underline = false,
			italic = false, 
			strikeout = false,
			symbol = false,
			rotary = false,
			shadow = false,
			additive = false,
			outline = false,
		} )	
	end

	LoadFonts()

local function CalculateLossTransition(value,name)
	if not Transitions[name].Lost then
		Transitions[name].Lost = 0
		Transitions[name].VelocityMult = 0
		Transitions[name].LossVelocity = 0
		Transitions[name].DamageDelay = 0
		Transitions[name].DamageValue = 0
		Transitions[name].LossFreeze = 0

		Transitions[name].LastDamage = 0
		Transitions[name].LastDamageFade = 0
		Transitions[name].LastDamageAnim = 0
		Transitions[name].LastDamageAnimSpeed = 0
	end

	local Trans = Transitions[name]

	if name == "LostArmor" and GetConVar("SyntHud_shield_mode"):GetBool() == true then
		Trans.VelocityMult = 5
	else
		Trans.VelocityMult = 1.5
	end

	Trans.LossVelocity = math.Clamp((Trans.Lost-value)*Trans.VelocityMult,1,30000)

	if (value and Trans.Lost) then
		if (Trans.Lost > value) then
			Trans.Lost = Trans.Lost-RealFrameTime()*Trans.LossVelocity
			if (Trans.Lost < value) then
				Trans.Lost = value  
			end
		elseif (Trans.Lost < value) then
			Trans.Lost = value
		end
	end

	-- Last inflicted damage overlap

	if Trans.LossFreeze == 0 then
		Trans.LastDamageFade = math.Clamp(Trans.LastDamageFade-RealFrameTime()*500,0,255)
	end

	if Trans.DamageDelay < CurTime() then
		Trans.LossFreeze = 0
	end

	if Trans.DamageValue > value then
		Trans.LossFreeze = 1
		Trans.LastDamage = Trans.DamageValue
		Trans.DamageValue = value
		Trans.DamageDelay = CurTime()+0.4
		Trans.LastDamageFade = 255
		Trans.LastDamageAnim = 0
	end

	if Trans.DamageValue <= value then
		Trans.DamageValue = value
	end

	Trans.LastDamageAnimSpeed = math.max((2.5-Trans.LastDamageAnim)*4,1)

	if Trans.LastDamageFade > 0 then
		Trans.LastDamageAnim = Trans.LastDamageAnim + RealFrameTime()*Trans.LastDamageAnimSpeed
	end

	return Trans.Lost, Trans.LastDamage, Trans.LastDamageFade, Trans.LastDamageAnim

	-- -- Old code
	
	-- if Trans.DamageDelay < CurTime() or value <= 0 then
	-- 	Trans.LossFreeze = 0
	-- end
	
	-- if Trans.Lost == value or Trans.DamageValue ~= value then
	-- 	if name == "LostArmor" and GetConVar("SyntHud_shield_mode"):GetBool() == true then return Trans.Lost end
	-- 	Trans.LossFreeze = 1
	-- 	Trans.DamageDelay = CurTime()+0.1
	-- 	Trans.DamageValue = value
	-- end

	-- return Trans.Lost
end

local function CalculateGainTransition(value,name,default)
	if not Transitions[name].Gain then
		Transitions[name].Gain = 0
		Transitions[name].GainDifference = 0
		Transitions[name].GainDelay = 0
		Transitions[name].GainFreeze = 0
		Transitions[name].GainValue = 0
		Transitions[name].GainAlpha = 0
	end

	local Transition = Transitions[name]

	if not LocalPlayer():Alive() then
		Transition.Gain = default 
	end
	
	if (Transition.Gain and value)then
		if Transition.Gain > value then
			Transition.Gain = value
		elseif Transition.Gain < value and Transition.GainAlpha == 0 then 
			Transition.Gain = value
		end
	end

	Transition.HpGainDifference = value-Transition.Gain

	if Transition.GainDelay < CurTime() then
		Transition.GainFreeze = 0
		Transition.GainAlpha = math.Clamp(Transition.GainAlpha - RealFrameTime()*500,0,250)
	end

	if Transition.Gain == value 
	or (Transition.HealthGainValue < value and (Transition.GainAlpha > 0 or Transition.GainFreeze == 1)) then
		Transition.GainFreeze = 1
		Transition.GainDelay = CurTime()+0.6
		Transition.HealthGainValue = value
		Transition.GainAlpha = 250
	end

	return Transition.HpGainDifference, Transition.GainAlpha
end

Transitions.LostStamina = {}
Transitions.GainStamina = {}

hook.Add("HUDPaint", "SyntHud_StaminaBar", function()
	local player = LocalPlayer()
	if not IsValid(player) or not player:IsDroid() or (ix and ix.option and ix.option.Get and ix.option.Get("thirdpersonEnabled", false)) then return end
	if not GetConVar("SyntHud_enabled"):GetBool() then return end
	if not player:Alive() then return end

	
	local CustomScale = GetConVar("SyntHud_scale"):GetFloat()
	local ScrRatio = ScrH() / 1080 * CustomScale
	local CustomWidth = GetConVar("SyntHud_width"):GetInt()
	local BarsDigits = GetConVar("SyntHud_bars_digits"):GetBool()
	local BarsBg = GetConVar("SyntHud_bars_background"):GetBool()

	
	local currentStamina = player:GetLocalVar("stm", 100)
	local maxStamina = 100

	
	player.LostStamina, player.LastStamDamage, player.StamDamageFade, player.StamDamageAnim = CalculateLossTransition(currentStamina, "LostStamina")
	player.StamGainDiff, StamGainAlpha = CalculateGainTransition(currentStamina, "GainStamina", 100)

	
	local BarLength = (180 * ScrRatio + CustomWidth) * 2
	local BarHeight = 18 * ScrRatio
	local StartW = (ScrW() / 2) - (BarLength / 2)
	local StartH = 1058 * ScrRatio 

	
	local StmLength = math.Clamp(currentStamina / maxStamina, 0, 1) * BarLength
	local LostStmStart = StartW + StmLength
	local LostStmLength = math.Clamp((player.LostStamina - currentStamina) / maxStamina, 0, 1) * BarLength
	
	local LastStmDamageLength = math.Clamp((player.LastStamDamage - currentStamina) / maxStamina, 0, 1) * BarLength
	local LastStmDamageAnim = math.sin(player.StamDamageAnim) * 10

	local StmGainStart = StartW + StmLength - (player.StamGainDiff / maxStamina * BarLength)
	local StmGainLength = (player.StamGainDiff / maxStamina) * BarLength

	
	if BarsBg then
		surface.SetDrawColor(30, 30, 30, 225)
		surface.DrawRect(StartW, StartH, BarLength, BarHeight)
	end

	
	surface.SetDrawColor(230, 190, 40, 255)
	surface.DrawRect(StartW, StartH, StmLength, BarHeight)

	
	surface.SetDrawColor(222, 166, 50, 255)
	surface.DrawRect(LostStmStart, StartH, LostStmLength, BarHeight)

	
	surface.SetDrawColor(222, 166, 50, player.StamDamageFade)
	surface.DrawRect(LostStmStart, StartH, LastStmDamageLength, BarHeight)

	
	surface.SetDrawColor(222, 166, 50, player.StamDamageFade / 4)
	surface.DrawRect(LostStmStart, StartH - (LastStmDamageAnim * 2), LastStmDamageLength + (LastStmDamageAnim * 2), BarHeight + (LastStmDamageAnim * 4))

	
	surface.SetDrawColor(250, 250, 250, StamGainAlpha)
	surface.DrawRect(StmGainStart, StartH, StmGainLength, BarHeight)

	
	if player.StamGainDiff > 0 then
		draw.SimpleText("+" .. math.Round(player.StamGainDiff), "Font Bars", StartW + (4 * ScrRatio), StartH - (3 * ScrRatio), Color(255, 255, 255, StamGainAlpha), 0, 0)
	end

	if BarsDigits then
		draw.SimpleText(math.Round(currentStamina), "Font Bars", StartW + (8 * ScrRatio), StartH + (20 * ScrRatio), Color(230, 190, 40, 255), 0, 0)
	end
end)

hook.Add("HUDPaint","SyntHud",function() 
	local player = LocalPlayer()
	if not player:IsDroid() or (ix and ix.option and ix.option.Get and ix.option.Get("thirdpersonEnabled", false)) then return end
	if (GetConVar("SyntHud_enabled"):GetBool()==true) then
		local Weapon = player:GetActiveWeapon()
		local ShieldMode = GetConVar("SyntHud_shield_mode"):GetBool()
		-- Elements position

		local Separated = GetConVar("SyntHud_separated"):GetInt()

		local CustomPositionX = GetConVar("SyntHud_position_x"):GetInt()
		local CustomPositionY = GetConVar("SyntHud_position_y"):GetInt()
		local CustomWidth = GetConVar("SyntHud_width"):GetInt()
		
		local FixedAp = GetConVar("SyntHud_ap_fixed"):GetBool()
		local BarsDigits = GetConVar("SyntHud_bars_digits"):GetBool()

		local HpBarLength = 180*ScrRatio+CustomWidth
		local HpBarHeight = 18*ScrRatio

		local HealthBarPercentageStartW = (ScrW()/2)- HpBarLength-(Separated*2) + CustomPositionX
		local HealthBarPercentageStartH = ScrH() - (66*ScrRatio) + CustomPositionY
		CustomScale = GetConVar("SyntHud_scale"):GetFloat()
		ScrRatio = ScrH()/1080*CustomScale

		if not player:Alive() then
			StoredMaxAmmo = {}
		end

		-- Maximum value
			local KeepExceed = GetConVar("SyntHud_keep_exceeding"):GetBool()

			local ConMaxHp = GetConVar("SyntHud_max_hp"):GetInt()
			local ConMaxAp = GetConVar("SyntHud_max_ap"):GetInt()

			if GetConVar("shld_enable") then
				if GetConVar("shld_enable"):GetBool() then
					ConMaxAp = GetConVar("shld_max_armor"):GetInt()
				end
			end

			if ConMaxHp > 0 then
				SetMaxHp = ConMaxHp
			elseif ConMaxHp <= 0 then
				SetMaxHp = player:GetMaxHealth()
			end

			SetMaxAp = ConMaxAp

			if !PlayerMaxAp then
				PlayerMaxAp = 100
			end

			if KeepExceed == true then

				if player:Health() > ReachMaxHp then
					ReachMaxHp = player:Health()
				end 

				if player:Armor() > ReachMaxAp then
					ReachMaxAp = player:Armor()
				end

				if ReachMaxHp > MaxHp then
					MaxHp = ReachMaxHp
				end

				if ReachMaxAp > MaxAp then
					MaxAp = ReachMaxAp
				end

			else
				if player:Health() > SetMaxHp then
					MaxHp = player:Health()
				else
					MaxHp = SetMaxHp
				end

				if player:Armor() > SetMaxAp then
					MaxAp = player:Armor()
				else
					MaxAp = SetMaxAp
				end
			end

			if !player:Alive() then
				ReachMaxHp = 0
				ReachMaxAp = 0
				MaxHp = SetMaxHp
				MaxAp = SetMaxAp
			end

			local MaxTot = MaxHp+MaxAp
			
			local HpRatio = MaxHp/MaxTot
			local ApRatio = MaxAp/MaxTot

			if (!player.DispHealth) then
				player.DispHealth = 0
			end
			
			player.DispHealth = player:Health()

		-- END of maximum value

		-- Background elements
			if player:Alive() then

				-- Low HP Opacity
					local LowHpAlpha = math.Clamp(-(player:Health()/MaxHp*255)*2.5+318.75, 0,255)
					local LowHpFlicker = math.Clamp(math.random((LowHpAlpha/1.5), LowHpAlpha),0,255)

				-- Low AP Opacity
					local ShieldAlert = GetConVar("SyntHud_shield_alert"):GetBool()

					if player:Armor() <= 0 and ShieldMode == true and ShieldAlert == true then
						LowApFlicker = math.random(10,25)
					else
						LowApFlicker = 0
					end

					local ShieldTunnelAlpha = -(player:Armor()/MaxAp*255)+255

					
				-- Hud Background
					if GetConVar("SyntHud_background"):GetBool() == true then
						surface.SetTexture(HudBg)
						surface.SetDrawColor(Color(0,0,0,240))
							surface.DrawTexturedRect(HealthBarPercentageStartW-(225*ScrRatio),HealthBarPercentageStartH-(275*ScrRatio), ((800+(CustomWidth*2))*ScrRatio), (550*ScrRatio))
					end

				-- Shield vignette
					if ShieldMode == true and GetConVar("SyntHud_shield_vignette"):GetBool() == true then
						surface.SetTexture(ShieldTunnel)
							surface.SetDrawColor(Color(255,255,255,ShieldTunnelAlpha)) 
							surface.DrawTexturedRect(0,0,ScrW(),ScrH()+50)
					end

				-- LowHP
					if GetConVar("SyntHud_lowhp_alert"):GetBool() == true then
						surface.SetTexture(LowHP)
							surface.SetDrawColor(Color(255,255,255,LowHpFlicker)) 
							surface.DrawTexturedRect(0,0,ScrW(),ScrH()+50)
					end

				-- LowAP
					if ShieldMode == true and ShieldAlert == true then
						surface.SetTexture(LowAP)
							surface.SetDrawColor(Color(255,255,255,LowApFlicker)) 
							surface.DrawTexturedRect(0,0,ScrW(),ScrH()+50)
					end

				-- Ammo background
					surface.SetDrawColor( 30, 30, 30, 225)
						surface.DrawRect(HealthBarPercentageStartW,HealthBarPercentageStartH - (45*ScrRatio),HpBarLength * 2 + (Separated*4),39*ScrRatio)


			end
		-- END of background elements
	
		-- Ammo counters

			if (Weapon:IsValid()) then

				-- Setting up variables

					local Clip = Weapon:Clip1()
					local MaxClip = Weapon:GetMaxClip1()
					local Ammo = player:GetAmmoCount(Weapon:GetPrimaryAmmoType())
					local SecAmmo = player:GetAmmoCount(Weapon:GetSecondaryAmmoType())
					local AmmoType = LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()
					local SecAmmoType = LocalPlayer():GetActiveWeapon():GetSecondaryAmmoType()
					local GrenadeCount = LocalPlayer():GetAmmoCount("grenade")
					local WeaponName = Weapon:GetPrintName()
					local FrameRate = 1/FrameTime()

				-- Weapons that doesn't have magazine

					if Weapon:GetMaxClip1() == -1 then
						StoredMaxAmmo[WeaponName] = StoredMaxAmmo[WeaponName] or Ammo
						if Ammo > StoredMaxAmmo[WeaponName] then
							StoredMaxAmmo[WeaponName] = Ammo
						end

						Clip = Ammo
						MaxClip = StoredMaxAmmo[WeaponName]
					end

				-- Location calculation
				
					local AmmoCountLocationW = HealthBarPercentageStartW+(HpBarLength*2)-(232*ScrRatio)+(Separated*4)
					local AmmoCountLocationH = HealthBarPercentageStartH-(59*ScrRatio)

					local AmmoIconW = 256*ScrRatio
					local AmmoIconH = 64*ScrRatio

				-- Texture scissor coordinates

					AmmoRectStartX = AmmoCountLocationW-(5*ScrRatio)
					AmmoRectStartY = AmmoCountLocationH+(14*ScrRatio)
					AmmoRectStopX = AmmoCountLocationW+(232*ScrRatio)
					AmmoRectStopY = AmmoCountLocationH+(53*ScrRatio)

				-- If custom ammo type, display SMG icon

					if AmmoType > 10 or AmmoType == 9 then
						AmmoType = 4
					end

				-- Alternative AR2 ammo type

					local AltAr2 = GetConVar("SyntHud_alternative_ar2_bullet"):GetBool()

					if AmmoType == 1 then
						if AltAr2 == true then
							AmmoType = 20
						end
					end

					AmmoFlash = AmmoType

				-- Setting up Ammo animation variables

					CurrentTimer = CurTime()
					ClipNum = Clip
					AmmoNum = Ammo
					AmmoTarget = 100

					if (!NextFire) then
						NextFire = 0
					end

					AmmoVel = 44/NextFire*ScrRatio

					if AmmoVel <= 0 then
						AmmoVel = 300
					end

					AmmoLocation = math.Clamp(AmmoLocation - RealFrameTime()*AmmoVel,0,100)

					if (!ClipNumNew) then
						ClipNumNew = 0
					end

					if CNextTimer > CurTime()-0.05 then
						ClipNumNew = Clip
					end

				-- Setting up reload animation reading (Thanks to Darky's Arx HUD, that helped me to figure out how to detect animation sequence https://steamcommunity.com/sharedfiles/filedetails/?id=2360363900)

					local ViewModel, Reloading

					if Weapon.Wep then --  FA:S 2.0
						ViewModel = Weapon.Wep
					elseif Weapon.CW_VM then --  CW 2.0
						ViewModel = Weapon.CW_VM
					else --  ArcCW, TFA or any other weapon pack
						ViewModel = LocalPlayer():GetViewModel()
					end

					local SequenceName = ViewModel:GetSequenceName(ViewModel:GetSequence())
					local SequenceCycle = -(ViewModel:GetCycle()) + 1

					if string.find(string.lower(SequenceName), "reload") and not Reloading or string.find(string.lower(SequenceName), "wet") and not Reloading then
						Reloading = true
					end

					if Reloading and ViewModel:GetCycle()>=0.97 then
						Reloading = false
					end

				-- Shake clip counter
					if ((ClipNum ~= ClipNumNew) or (ClipNum < 0 and AmmoNum ~= AmmoNumNew)) then
						CNextTimer = CurTime()
						ClipShakeTime = CurTime() + 0.1
						if FrameRate < 20 then
							CNextTimer = CurTime()+0.1
						end							
					end

					if (WeaponName ~= WeaponNameNew) then
						CNextTimer = CurTime()
						BgClipShakeTime = CurTime() + 0.1
						ClipShakeTime = CurTime()
						
					end

					if (!AmmoNumNew) then
						AmmoNumNew = 0
					end

					if AmNextTimer < CurTime()+0.05  then
						AmmoNumNew = Ammo
					end

					if (AmmoNum ~= AmmoNumNew) then
						AmNextTimer = CurTime()
					end


					ClipShakeH = math.Rand(-200*ScrRatio,200*ScrRatio) * math.min(CurTime() - ClipShakeTime,0)
					ClipShakeW = math.Rand(-200*ScrRatio,200*ScrRatio) * math.min(CurTime() - ClipShakeTime,0)
					BgClipShakeH = math.Rand(-100*ScrRatio,100*ScrRatio) * math.min(CurTime() - BgClipShakeTime,0)
					BgClipShakeW = math.Rand(-100*ScrRatio,100*ScrRatio) * math.min(CurTime() - BgClipShakeTime,0)


				-- Ammo Consuption Animation
				
					if ((ClipNum < ClipNumNew) and (WeaponName == WeaponNameNew)) or ((AmmoNum < AmmoNumNew) and (WeaponName == WeaponNameNew) and ClipNum < 0)then
						AmmoAnimStep = 1
						AmmoAnimTime = CurTime()
						NextFire = Weapon:GetNextPrimaryFire() - CurTime()
					end

					-- Step 1: Bullet slash and shading
					if AmmoAnimStep == 1 and AmmoAnimTime < CurTime() + 0.02 then 
						AmmoFlash = AmmoFlash + 100 
						AmmoShakeTime = CurTime() +0.05
						AmmoLocation = 0
					end

					-- Step 2: Stop shading and place bullet at bottom
					if (CurrentTimer > AmmoAnimTime) and AmmoAnimStep == 1 then
						AmmoAnimStep = 2
						AmmoLocation = (44*ScrRatio)
					end

					-- Reset to step 0
					if (CurrentTimer > AmmoAnimTime) and AmmoAnimStep == 2 then
						AmmoAnimStep = 0
					end

				-- Ammo Reload Flash
					if ((ClipNum > ClipNumNew) or (WeaponName ~= WeaponNameNew) and AmmoType >= 0) then
						AmmoAnimStep = 11
						AmmoAnimTime = CurTime() + 0.1
						AmmoLocation = 0
					end

					if AmmoAnimStep == 11 then
						AmmoFlash = AmmoFlash + 100
						AmmoShakeTime = CurTime() +0.05
					end

					if (CurrentTimer > AmmoAnimTime) and AmmoAnimStep == 11 then
						AmmoAnimStep = 0
					end

				-- Empty ammo flickering

					if (Clip == 0 and AmmoAnimStep == 0) or (Clip == -1 and Ammo == 0) then
						AmmoFade = math.Rand(25,75)
						AmmoLocation = 0
					else
						AmmoFade = 255
					end

				-- Ammo reload animation (thanks to )

					if Reloading == true and AmmoAnimStep == 0 then
						AmmoLocation = (44*ScrRatio)*SequenceCycle
						AmmoFade = math.Rand(25,75)
					end

				-- Ammo shaking coordinates

					AmmoShakeW = math.Rand(-150*ScrRatio,150*ScrRatio) * math.min(CurTime() - AmmoShakeTime,0)
					AmmoShakeH = math.Rand(-150*ScrRatio,150*ScrRatio) * math.min(CurTime() - AmmoShakeTime,0)

				-- Ammo drawing

					if AmmoType >= 0 then
						local AmmoIcon = surface.GetTextureID("vgui/synthud/ammoicons/ammo_"..AmmoFlash)
						surface.SetTexture(AmmoIcon)
							surface.SetDrawColor(Color(255,255,255,AmmoFade))
							render.SetScissorRect( AmmoRectStartX,AmmoRectStartY,AmmoRectStopX,AmmoRectStopY, true ) 
							-- draw.RoundedBox( 4, 0, 0, ScrW(), ScrH(), color_white ) -- Test box to adjust scissor rect
							surface.DrawTexturedRect(AmmoCountLocationW+(4*ScrRatio)+AmmoShakeW,AmmoCountLocationH-(3*ScrRatio)+AmmoLocation+AmmoShakeH,AmmoIconW,AmmoIconH)
							render.SetScissorRect( 0,0,0,0, false ) 
					end

				-- Ammo Counter + weapon name
					WeaponNameAlpha = math.Clamp(WeaponNameAlpha - RealFrameTime()*250,0,250)
					WeaponNameAlphaFlick = math.random(WeaponNameAlpha-50, WeaponNameAlpha)
					AmmoAlpha = math.Clamp(AmmoAlpha + RealFrameTime()*250,0,250)

					if (!WeaponNameNew) then
						WeaponNameNew = ""
					end

					if NNextTimer > CurTime()-0.05 then
						WeaponNameNew = WeaponName
					end

					if (WeaponName ~= WeaponNameNew) then
						NNextTimer = CurTime()
						AmmoAlphaDelay = CurTime()+1
						AmmoLocation = 60
						if FrameRate < 20 then
							NNextTimer = CurTime()+0.1
						end
					end

					if (CurTime() < AmmoAlphaDelay) or (AmmoType <= 0) or (Weapon:GetMaxClip1() == -1) then
						WeaponNameAlpha = 250
						AmmoAlpha = 0
					end


					if Ammo > 0 then
						draw.SimpleText(Ammo, "Font Ammo", HealthBarPercentageStartW + (10*ScrRatio) + (ClipShakeW/2), HealthBarPercentageStartH - (43*ScrRatio) + (ClipShakeH/2), Color(255, 255, 255, AmmoAlpha), 0, 0)
					else					
						draw.SimpleText("EMPTY", "Font Ammo", HealthBarPercentageStartW + (10*ScrRatio) + (ClipShakeW/2), HealthBarPercentageStartH - (43*ScrRatio) + (ClipShakeH/2), Color(255, 255, 255, AmmoAlpha), 0, 0)
					end

					draw.SimpleText(WeaponName, "Font Name", HealthBarPercentageStartW + (8*ScrRatio), HealthBarPercentageStartH - (33*ScrRatio), Color(255, 255, 255, WeaponNameAlphaFlick), 0, 0)

				-- Clip Counter
					ClipLocationLimit = (HpBarLength+(Separated*2))*2
					ClipLocation = math.Clamp(Clip/MaxClip*ClipLocationLimit, 0 , ClipLocationLimit+20)
					ClipPercent = Clip/MaxClip*100
					ClipLocationV = HealthBarPercentageStartH-(110*ScrRatio)

					if (!ClipContent) then
						ClipContent = Clip
					end

					if (!ClipHundred) then
						ClipHundred = 0
					end

					if AmmoType > -1 then

						-- Clip BG color

							if ClipPercent > 25 then
								ACR = 255
								ACG = 255
								ACB = 255
							else
								ACR = 255 
								ACG = 175
								ACB = 30
							end
						
						-- Empty clip alpha

							if Clip == 0 then
								if ClipAlpha <= 00 then
									ClipAlphaDir = 1
								elseif ClipAlpha >= 255 then
									ClipAlphaDir = 2
								end

								if ClipAlphaDir == 1 then
									ClipAlphaVel = RealFrameTime()*300
								elseif ClipAlphaDir == 2 then
									ClipAlphaVel = -RealFrameTime()*300
								end

								ClipAlpha = math.Clamp(ClipAlpha + ClipAlphaVel,0,255)
							else
								ClipAlpha = 255
								ClipAlphaDir = 0
								ClipAlphaVel = 0
							end

						-- Ghost clip trail

							if (!LostClip) then
								LostClip = 0
							end

							LostClipVelocity = math.Clamp((LostClip-ClipLocation)*4,1,30000)

							if (ClipLocation and LostClip) then
								if (LostClip > ClipLocation) then
									LostClip = LostClip-RealFrameTime()*LostClipVelocity
									if (LostClip < ClipLocation) then
										LostClip = ClipLocation  
									end
								elseif (LostClip < ClipLocation) then
									LostClip = ClipLocation
								end
							end

							if (WeaponName ~= WeaponNameNew) then
								LostClip = ClipLocation
							end

						-- Drawing BG

							surface.SetTexture(AmmoCountBG)
								surface.SetDrawColor(Color(ACR,ACG,ACB,255))
								surface.DrawTexturedRect(HealthBarPercentageStartW-(36*ScrRatio)+ClipLocation+BgClipShakeW,ClipLocationV+BgClipShakeH,(70*ScrRatio),(54*ScrRatio))
								
						-- Drawing ghost trail

							if LostClip != ClipLocation then
								for  i=0, 6 do
									surface.SetTexture(AmmoCountBG)
										surface.SetDrawColor(Color(ACR,ACG,ACB,(10*i+10)))
										surface.DrawTexturedRect(HealthBarPercentageStartW-(36*ScrRatio)+LostClip-((i*LostClipVelocity/40)),ClipLocationV,(70*ScrRatio),(54*ScrRatio))
								end
							end

						-- Drawing text

							if Clip >= 100 then
								-- ClipContent = Clip
								local mult = 10^-2
								ClipHundred = math.floor(Clip * mult)/mult
								local roundClip = math.floor(Clip - ClipHundred)
								if roundClip >= 10 then
									ClipContent = roundClip
								else
									ClipContent = "0"..roundClip
								end
							elseif Clip >= 10 then
								ClipContent = Clip
							elseif Clip > 0 then
								ClipContent = "0"..Clip
							elseif Clip <= 0 and Ammo > 0 then
								ClipContent = "'R'"
							elseif (Clip <= 0) and (Ammo <= 0) then
								ClipContent = "NO"
							end

							draw.SimpleText(ClipContent, "Font Clip", HealthBarPercentageStartW-2+ClipLocation+ClipShakeW+BgClipShakeW,ClipLocationV+(4*ScrRatio)+ClipShakeH+BgClipShakeH, Color(0, 0, 0, ClipAlpha), 1, 0)
							if Clip >= 100 then
								draw.SimpleText("+"..ClipHundred, "Font Bars", HealthBarPercentageStartW-2+ClipLocation+BgClipShakeW,ClipLocationV+(-17*ScrRatio)+BgClipShakeH, Color(255, 255, 255, ClipAlpha), 1, 0)
							end
						-- Secondary
							for i=0, math.Clamp(SecAmmo-1,-1,2) do
								surface.SetTexture(SecAmmoIcon)
									surface.SetDrawColor(Color(255,255,255,255))
									surface.DrawTexturedRect(HealthBarPercentageStartW+(HpBarLength*2)+(8*ScrRatio), HealthBarPercentageStartH-(45*ScrRatio)+(i*(16*ScrRatio)), (21*ScrRatio),(7*ScrRatio))
							end
					end		
			end
		-- END of ammo counter drawing	
		-- Health and armor drawing
			local BarsBg = GetConVar("SyntHud_bars_background"):GetBool()
			local ApBgStyle = GetConVar("SyntHud_armor_background"):GetInt()
			local RegenDelay = 0
			local NextRegen = 0
			local NextRegenTime = 0
			
			-- Lost total transition			
				player.TotHealth = player:Health()+player:Armor()
				player.LostTotHealth, player.LastTotDamage, player.TotDamageFade, player.TotDamageAnim = CalculateLossTransition(player.TotHealth, "LostTotHealth")

			-- Lost Health transition
				player.LostHealth, player.LastHpDamage, player.HpDamageFade, player.HpDamageAnim = CalculateLossTransition(player:Health(), "LostHealth")
				
			-- Lost Armor transition
				player.LostArmor, player.LastApDamage, player.ApDamageFade, player.ApDamageAnim = CalculateLossTransition(player:Armor(), "LostArmor")

			-- Gained health transition
				player.HpGainDifference, HpGainAlpha = CalculateGainTransition(player:Health(), "GainHealth", 100)
				
			-- Gained Armor transition
				player.ApGainDifference, ApGainAlpha = CalculateGainTransition(player:Armor(), "GainArmor", 0)

			-- Shield recharge bar
				if GetConVar("shld_enable") then
					if GetConVar("shld_enable"):GetBool() == true then
						RegenDelay = GetConVar("shld_regen_delay"):GetInt()
						NextRegen = player:GetNWFloat("shld.nextRecharge")
						NextRegenTime = math.max(NextRegen-CurTime(),0)
					end
				end
			
			-- Flashing armor background
				local ApBgClr = 250

				if ApBgStyle == 0 then
					ApBg = math.random(10, 40)
				elseif ApBgStyle == 1 then
					ApBg = 20
				elseif ApBgStyle == 2 then
					ApBg = 225
					ApBgClr = 30
				else
					ApBg = 0
				end

				local HpLength = player:Health()/MaxHp*HpBarLength*HpRatio*2
				local BgLength = HpBarLength*2+Separated*4

				if Separated == 1 and FixedAp == true and BarsBg == true then
					BgLength = HpBarLength*HpRatio*2
				end

				local LostBarStart = HealthBarPercentageStartW+(player.TotHealth)/MaxTot*HpBarLength*2
				local LostBarLength = (player.LostTotHealth-player.TotHealth)/MaxTot*HpBarLength*2
				local LastTotDamageLength = (player.LastTotDamage-player.TotHealth)/MaxTot*HpBarLength*2
				local LastTotDamageAnim = math.sin(player.TotDamageAnim)*10

				local HpGainStart = (HealthBarPercentageStartW+HpLength-(player.HpGainDifference/MaxHp)*HpRatio*2)-((player.HpGainDifference)/MaxHp*HpBarLength*HpRatio*2)
				local HpGainLength = (player.HpGainDifference/MaxHp*HpBarLength*HpRatio*2)

				local LostHpStart = HealthBarPercentageStartW+player:Health()/MaxHp*HpBarLength*HpRatio*2
				local LostHpLength = (player.LostHealth-player:Health())/MaxHp*HpBarLength*HpRatio*2
				local LastHpDamageLength = (player.LastHpDamage-player:Health())/MaxHp*HpBarLength*HpRatio*2
				local LastHpDamageAnim = math.sin(player.HpDamageAnim)*10

				local ApStart = 0
				local ApGainStart = 0
				local ApLength = player:Armor()/MaxAp*HpBarLength*ApRatio*2 
				local ApGainLength = player.ApGainDifference/MaxAp*HpBarLength*ApRatio*2
				local LostApLength = (player.LostArmor-player:Armor())/MaxAp*HpBarLength*ApRatio*2
				local LostApStart = 0
				local LastApDamageLength = (player.LastApDamage-player:Armor())/MaxAp*HpBarLength*ApRatio*2
				local LastApDamageAnim = math.sin(player.ApDamageAnim)*10

				local RegenTimeLength = math.abs(NextRegenTime-RegenDelay)/RegenDelay*HpBarLength*ApRatio*2

				if Separated == 0 then
					ApStart = HealthBarPercentageStartW+(HpLength)
					ApGainStart = (HealthBarPercentageStartW+player.TotHealth/MaxTot*HpBarLength*2-(player.ApGainDifference/MaxAp*ApRatio*2))-((player.ApGainDifference)/MaxAp*HpBarLength*ApRatio*2)
				else
					if FixedAp == false then
						ApStart = (HealthBarPercentageStartW+(player.LostHealth)/MaxHp*HpBarLength*HpRatio*2)+(4*ScrRatio)
						ApGainStart = (HealthBarPercentageStartW+(player.LostHealth+player:Armor()+2)/MaxHp*HpBarLength*HpRatio*2-(player.ApGainDifference/MaxAp*ApRatio*2))-((player.ApGainDifference)/MaxAp*HpBarLength*ApRatio*2)
						LostApStart = ApStart+player:Armor()/MaxAp*HpBarLength*ApRatio*2
					else
						ApStart = (HealthBarPercentageStartW+HpBarLength*HpRatio*2)+(4*ScrRatio)
						ApGainStart = ApStart+(player:Armor()/MaxAp*HpBarLength*ApRatio*2)-2-ApGainLength
						LostApStart = ApStart+player:Armor()/MaxAp*HpBarLength*ApRatio*2
					end
				end

			-- Bars drawing
				if player:Alive() then
					-- Background
						if BarsBg == true then
							surface.SetDrawColor( 30, 30, 30, 225)
								surface.DrawRect(HealthBarPercentageStartW,HealthBarPercentageStartH,BgLength,HpBarHeight)
						end

					-- Armor bar background
						surface.SetDrawColor( ApBgClr, ApBgClr, ApBgClr, ApBg)
							surface.DrawRect(ApStart,HealthBarPercentageStartH,HpBarLength*ApRatio*2,HpBarHeight)

					-- HpBar 
						surface.SetDrawColor( 229, 45, 47, 255)
							surface.DrawRect(HealthBarPercentageStartW,HealthBarPercentageStartH,HpLength,HpBarHeight)
		
					-- ArmorBar
						surface.SetDrawColor( 49, 194, 213, 255)
							surface.DrawRect(ApStart,HealthBarPercentageStartH,ApLength,HpBarHeight)

					-- Armor Regen Time
					if NextRegenTime > 0 and player:Armor() < MaxAp then
						surface.SetDrawColor( 0, 0, 0, 255)
							surface.DrawRect(ApStart,HealthBarPercentageStartH+HpBarHeight,HpBarLength*ApRatio*2,3)

						surface.SetDrawColor( 49, 194, 213, 255)
							surface.DrawRect(ApStart,HealthBarPercentageStartH+HpBarHeight,RegenTimeLength,3)
					end

					if Separated == 0 then
						-- LostBar
							surface.SetDrawColor( 222, 166, 50, 255)
								surface.DrawRect(LostBarStart,HealthBarPercentageStartH,LostBarLength,HpBarHeight)

							-- Last damage
							surface.SetDrawColor( 222, 166, 50, player.HpDamageFade)
								surface.DrawRect(LostBarStart,HealthBarPercentageStartH,LastTotDamageLength,HpBarHeight)

							-- Last damage animation
							surface.SetDrawColor( 222, 166, 50, player.HpDamageFade/4)
								surface.DrawRect(LostBarStart,HealthBarPercentageStartH-(LastTotDamageAnim*2),LastTotDamageLength+(LastTotDamageAnim*2),HpBarHeight+(LastTotDamageAnim*4))

					else
						-- LostArmor 
							surface.SetDrawColor( 222, 255, 255, 255)
								surface.DrawRect(LostApStart,HealthBarPercentageStartH,LostApLength,HpBarHeight)

							if ShieldMode == false then
								-- Last damage
									surface.SetDrawColor( 222, 255, 255, player.ApDamageFade)
										surface.DrawRect(LostApStart-1,HealthBarPercentageStartH,LastApDamageLength,HpBarHeight)

								-- Last damage animation
									surface.SetDrawColor( 222, 255, 255, player.ApDamageFade/4)
										surface.DrawRect(LostApStart-1,	HealthBarPercentageStartH-(LastApDamageAnim*2),	LastApDamageLength+(LastApDamageAnim*2),HpBarHeight+(LastApDamageAnim*4))
							end

						-- LostHealth
							surface.SetDrawColor( 222, 166, 50, 255)
								surface.DrawRect(LostHpStart-1,HealthBarPercentageStartH,LostHpLength,HpBarHeight)

							-- Last damage
								surface.SetDrawColor( 222, 166, 50, player.HpDamageFade)
									surface.DrawRect(LostHpStart-1,HealthBarPercentageStartH,LastHpDamageLength,HpBarHeight)

							-- Last damage animation
								surface.SetDrawColor( 222, 166, 50, player.HpDamageFade/4)
									surface.DrawRect(LostHpStart-1,HealthBarPercentageStartH-(LastHpDamageAnim*2),LastHpDamageLength+(LastHpDamageAnim*2),HpBarHeight+(LastHpDamageAnim*4))
					end
					
					-- Hp Gain Bar
						surface.SetDrawColor( 250, 250, 250, HpGainAlpha)
							surface.DrawRect(HpGainStart,HealthBarPercentageStartH,HpGainLength,HpBarHeight)
					
					-- Ap Gain Bar		
						if ShieldMode == false then
						surface.SetDrawColor( 250, 250, 250, ApGainAlpha)	
							surface.DrawRect(ApGainStart+2,HealthBarPercentageStartH,ApGainLength,HpBarHeight)
							--(player.ApGainDifference/100*HpBarLength)
						end

					-- Texts
						surface.SetTexture(HpIcon)
							surface.SetDrawColor(Color(229, 45, 47, 255))
							surface.DrawTexturedRect(HealthBarPercentageStartW, HealthBarPercentageStartH+(23*ScrRatio), 18*ScrRatio, 18*ScrRatio)

						if player.HpGainDifference > 0 then
							draw.SimpleText("+"..player.HpGainDifference, "Font Bars", HealthBarPercentageStartW + (4*ScrRatio), HealthBarPercentageStartH + (-3*ScrRatio), Color(255, 255, 255, HpGainAlpha), 0, 0)
						end

						if BarsDigits == true then
							draw.SimpleText(player:Health(), "Font Bars", HealthBarPercentageStartW + (22*ScrRatio), HealthBarPercentageStartH + (20*ScrRatio), Color(229, 45, 47, 255), 0, 0)
						end

						if BarsDigits == true then
							ArmorClamp = 55
						else
							ArmorClamp = 20
						end

						if (MaxAp > 0) then
							surface.SetTexture(ApIcon)
								surface.SetDrawColor(Color(49, 194, 213, 255))
								surface.DrawTexturedRect(math.Clamp(ApStart, HealthBarPercentageStartW + (ArmorClamp*ScrRatio), 100000), HealthBarPercentageStartH+(23*ScrRatio), 18*ScrRatio, 18*ScrRatio)

							if player.ApGainDifference > 0 and ShieldMode == false then
								draw.SimpleText("+"..player.ApGainDifference, "Font Bars", ApStart + (4*ScrRatio), HealthBarPercentageStartH + (-3*ScrRatio), Color(255, 255, 255, ApGainAlpha), 0, 0)
							end

							if BarsDigits == true then
								draw.SimpleText(player:Armor(), "Font Bars", math.Clamp(ApStart , HealthBarPercentageStartW + (ArmorClamp*ScrRatio), 100000)+ (22*ScrRatio), HealthBarPercentageStartH + (20*ScrRatio), Color(49, 194, 213, 255), 0, 0)
							end
							
						end
				end
		-- END of Health/Armor drawing
	end
end)

-- Menu panel
	hook.Add("PopulateToolMenu", "ammolimitmenu", function()

		spawnmenu.AddToolMenuOption("Options", "Synthetik Hud", "Synthetik Hud settings", "Synthetik Hud settings", "", "", SyntHudMenuPanel)
		spawnmenu.AddToolMenuOption("Options", "Synthetik Hud", "Synthetik Hud shield mode", "Synthetik Hud shield mode", "", "", SyntHudShieldPanel)

	end)

	function SyntHudMenuPanel (dform)
		dform:CheckBox("Enable the HUD", "SyntHud_enabled")
		dform:CheckBox("Show a background for more readability", "SyntHud_background")
		dform:CheckBox("Show a background for health/armor bars", "SyntHud_bars_background")
		local cbox = dform:ComboBox("Armor background style", "SyntHud_armor_background")
		cbox:AddChoice("0 - Flashing white armor background")
		cbox:AddChoice("1 - Static white armor background")
		cbox:AddChoice("2 - Static black armor background")
		cbox:AddChoice("3 - No armor background background")
		dform:CheckBox("Display health/armor numbers", "SyntHud_bars_digits")
		dform:CheckBox("Separate health and armor bars", "SyntHud_separated")
		dform:CheckBox("Armor bar stay in place (only with separated bars)", "SyntHud_ap_fixed")
		dform:CheckBox("Enable low health alert", "SyntHud_lowhp_alert")
		local cbox = dform:ComboBox("AR2 icon style", "SyntHud_alternative_ar2_bullet")
		cbox:AddChoice("0 - Energy cell", "0")
		cbox:AddChoice("1 - Bullet", "1")
		dform:NumSlider("Position X", "SyntHud_position_x", -800, 800,0):SetHeight(16)
		dform:NumSlider("Position Y", "SyntHud_position_y", -1000, 100,0):SetHeight(16)
		dform:NumSlider("Custom Width", "SyntHud_width", -100, 700,0):SetHeight(16)
		dform:ControlHelp("Those three option above are relative to the default state, set them to 0 to reset to default.")
		dform:NumSlider("Custom Scale", "SyntHud_scale", 0.5, 3,2):SetHeight(16)
		dform:ControlHelp("The custom scale is a multiplier of the default scale. Set to 1 to reset to default")
		dform:NumSlider("Maximum health", "SyntHud_max_hp", 0, 200,0)
		dform:ControlHelp("Set to 0 to automatically detect player's maximum health")
		dform:NumSlider("Maximum armor", "SyntHud_max_ap", 0, 200,0)
		dform:ControlHelp("Setting this to 0 will hide the armor bar")
		dform:CheckBox("Keep exceeding value", "SyntHud_keep_exceeding")
		dform:ControlHelp("If the health or armor exceed its maximum value, it will keep the maximum reached until death.")
	end

	function SyntHudShieldPanel (dform)
		dform:CheckBox("Enable shield mode", "SyntHud_shield_mode")
		dform:Help("Check this box if you use some sort of shield or armor regen addon.")
		dform:Help("This will change the way the armor bar will behave and add some visual effects related to armor level. The armor loss transition will be accelerated, armor gain display will be disabled and you may add the following options below")
		dform:CheckBox("Low armor vignette", "SyntHud_shield_vignette")
		dform:Help("Will display a vignette on your screen as your armor depletes")
		dform:CheckBox("Armor depleted alert", "SyntHud_shield_alert")
		dform:Help("Displays an alert on the bottom of the screen when the armor is depleted, same as the health alert")
	end

	-- Refresh fonts size when changing scale option
	cvars.AddChangeCallback("SyntHud_scale", function()
		LoadFonts()
	end)

-- Hide default hud
hook.Add( "HUDShouldDraw","HideDefaultHUD1", function( szShouldDraw )
	local ply = LocalPlayer()
	if (GetConVar("SyntHud_enabled"):GetBool()==true) then
		shoulddrawtable = 		
		{
			["CHudHealth"] = false,
			["CHudBattery"] = false, 
			["CHudAmmo"] = false,	
			["CHudSecondaryAmmo"] = false,
		} 
		return shoulddrawtable[ szShouldDraw ]
	end
end)