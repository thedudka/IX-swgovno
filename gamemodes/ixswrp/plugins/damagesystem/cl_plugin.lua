local COLOR_CRITICAL = Color(170, 35, 35, 220)

    local dv_SCRW = ScrW()
    local dv_SCRH = ScrH()
    local muffle_lastDSP = nil
    local redflash_lastWait = 0
    local redflash_flashAlpha = 0
    local sensitivity_smoothFactor = 1.0
    local sensitivity_targetFactor = 1.0

hook.Add("PopulateCharacterInfo", "ixCriticalStateDescription", function(client, character, container)
	if (!IsValid(client) or !client:IsPlayer() or !client:IsCritical()) then
		return
	end

	local criticalRow = container:AddRow("criticalState")
	criticalRow:SetText("В критическом состоянии.")
	criticalRow:SetBackgroundColor(COLOR_CRITICAL)
	criticalRow:SizeToContents()
end)

do
    local modify = {
        ["$pp_colour_addr"] = 0, 
        ["$pp_colour_addg"] = 0, 
        ["$pp_colour_addb"] = 0, 
        ["$pp_colour_brightness"] = 0, 
        ["$pp_colour_contrast"] = 1, 
        ["$pp_colour_colour"] = 1, 
        ["$pp_colour_mulr"] = 0, 
        ["$pp_colour_mulg"] = 0, 
        ["$pp_colour_mulb"] = 0
    }

    function PLUGIN:RenderScreenspaceEffects()
        local client = LocalPlayer()
        
        if not IsValid(client) or not client:Alive() then return end

        local character = client:GetCharacter()
        if not character then return end

        local health = client:Health()

        if health >= 60 or health <= 0 then return end

        local painFactor = (60 - health) / 60

        modify["$pp_colour_colour"] = math.Clamp(1 - painFactor, 0, 1)
        
        modify["$pp_colour_brightness"] = -0.05 * painFactor

        DrawColorModify(modify)

        local blurPasses = math.ceil(painFactor * 5)
        DrawToyTown(blurPasses, ScrH())
    end
end

hook.Add("CalcView", "WoundedWalk_CameraSway", function(ply, pos, angles, fov)
        local weapon = ply:GetActiveWeapon()
		local character = ply:GetCharacter()
        if not character or ply:GetLocalVar("ragdoll", 0) != 0 or ply:IsForceUser() then return end
		if not IsValid(ply) or not ply:Alive() then return end
        if IsValid(weapon) then
            local class = weapon.Base or ""
            if string.find(class, "arc9") or string.find(class, "mg_base") then return end
        end
        local hp = ply:Health()
        local threshold = 50
        if hp >= threshold then return end
        local factor = (threshold - hp) / threshold
        local intensity = 1.35
        local speed = 1
        local sway = factor * intensity
        local time = CurTime() * (1 + factor * speed * 4)
        angles.p = angles.p + math.sin(time) * sway * 3
        angles.y = angles.y + math.cos(time * 0.8) * sway * 2
        angles.r = angles.r + math.sin(time * 1.2) * sway * 5
        return { origin = pos, angles = angles, fov = fov }
    end)
    local function ApplySensitivitySmoothing(x, y)
        if sensitivity_smoothFactor < 1.0 then
            x = x * sensitivity_smoothFactor
            y = y * sensitivity_smoothFactor
        end
        return x, y
    end
	    hook.Add("InputMouseApplied", "WoundedWalk_SensitivitySmoothing", function(cmd, x, y, angle)
        if x ~= 0 or y ~= 0 then
            local smoothX, smoothY = ApplySensitivitySmoothing(x, y)
            cmd:SetMouseX(smoothX)
            cmd:SetMouseY(smoothY)
        end
    end)

    hook.Add("OnScreenSizeChanged", "WoundedWalk_ScreenSize", function()
        dv_SCRW = ScrW()
        dv_SCRH = ScrH()
    end)
    hook.Add("HUDPaint", "WoundedWalk_MuffleAndSounds", function()
        local ply = LocalPlayer()
        if ply:IsForceUser() or !IsValid(ply) then 
            if muffle_lastDSP then
                ply:SetDSP(0)
                muffle_lastDSP = nil
            end
            sensitivity_smoothFactor = 1.0
            sensitivity_targetFactor = 1.0
            return 
        end
        local hp = ply:Health()
        local curTime = CurTime()
        if IsValid(ply) then
            local threshold = 49
            local intensity = 1
            if hp <= threshold then
                local dspValue = math.floor(14 * intensity)
                if not muffle_lastDSP or muffle_lastDSP ~= dspValue then
                    ply:SetDSP(dspValue)
                    muffle_lastDSP = dspValue
                end
            else
                if muffle_lastDSP then
                    ply:SetDSP(0)
                    muffle_lastDSP = nil
                end
            end
        end
        if IsValid(ply) and !ply:IsCritical() then
            local threshold = 30
            if hp < threshold then
                local intensity = (1 - math.Clamp(hp / threshold, 0, 1)) * 1
                surface.SetDrawColor(150, 0, 0, (50 * intensity) * redflash_flashAlpha)
                surface.DrawRect(0, 0, ScrW(), ScrH())
                if curTime > redflash_lastWait then
                    redflash_flashAlpha = 1
                    redflash_lastWait = curTime + 0.4
                else
                    redflash_flashAlpha = math.Approach(redflash_flashAlpha, 0, FrameTime() * 3)
                end
            else
                redflash_flashAlpha = 0
            end
        end
        if IsValid(ply) then
            local threshold = 49
            if hp < threshold then
                local intensity = 1
                local hpPercent = math.Clamp(hp / threshold, 0, 1)
                local reduction = (1 - hpPercent) * intensity
                sensitivity_targetFactor = math.max(0.1, 1 - reduction)
            else
                sensitivity_targetFactor = 1.0
            end
            sensitivity_smoothFactor = math.Approach(sensitivity_smoothFactor, sensitivity_targetFactor, FrameTime() * 5)
        else
            sensitivity_smoothFactor = 1.0
            sensitivity_targetFactor = 1.0
        end
    end)


