local cvEnabled = CreateClientConVar("cl_mandohud_enabled", "1", true, false, "Enable the Mandalorian holographic HUD.")

local hiddenElements = {
    CHudHealth = true,
    CHudBattery = true,
    CHudAmmo = true,
    CHudSecondaryAmmo = true,
    CHudCrosshair = false,
    CHudVoiceStatus = true,
    CHudVoiceSelfStatus = true
}

local paletteSets = {
    mando = {
        shell = Color(4, 6, 9, 210),
        shellSoft = Color(10, 14, 18, 120),
        panel = Color(8, 12, 18, 168),
        panelSoft = Color(8, 14, 22, 86),
        amber = Color(255, 165, 52, 240),
        amberSoft = Color(255, 165, 52, 85),
        amberDim = Color(255, 165, 52, 32),
        ylw = Color(253, 255, 110, 212),
        holo = Color(17, 18, 19, 200),
        holoSoft = Color(92, 220, 255, 46),
        danger = Color(255, 82, 82, 200),
        text = Color(255, 224, 170, 245),
        textSoft = Color(255, 224, 170, 120),
        grid = Color(92, 220, 255, 18),
        scan = Color(92, 220, 255, 14)
    },
    clone = {
        shell = Color(8, 10, 14, 214),
        shellSoft = Color(18, 24, 30, 126),
        panel = Color(10, 16, 24, 172),
        panelSoft = Color(10, 18, 26, 90),
        amber = Color(228, 238, 255, 240),
        amberSoft = Color(228, 238, 255, 92),
        amberDim = Color(228, 238, 255, 36),
        ylw = Color(253, 255, 110, 212),
        red = Color(255, 0, 0, 210),
        holo = Color(110, 218, 255, 212),
        blue = Color(40, 140, 255, 200),
        holoSoft = Color(110, 218, 255, 56),
        danger = Color(255, 86, 86, 210),
        text = Color(236, 244, 255, 246),
        textSoft = Color(236, 244, 255, 134),
        grid = Color(110, 218, 255, 22),
        scan = Color(110, 218, 255, 16)
    }
}
local palette = paletteSets.mando

local radarCache = {}
local radarDetections = {}
local nextRadarRefresh = 0
local radarEchoHoldTime = 0.22
local radarEchoLifetime = 1.45
local helmetStateKey = "MandoHUDHelmetRaised"
local helmetTransitionKey = "MandoHUDHelmetRaiseTransition"
local helmetTransitionEndKey = "MandoHUDHelmetRaiseTransitionEnd"
local helmetStartupTransitionKey = "MandoHUDHelmetLowerTransition"
local helmetStartupTransitionStartKey = "MandoHUDHelmetLowerTransitionStart"
local helmetStartupTransitionEndKey = "MandoHUDHelmetLowerTransitionEnd"
local helmetTransitionDuration = 0.45
local damageGlitchHealthThreshold = 0.34
local damageGlitchPulseDuration = 0.6
local damageGlitchLastHealth = nil
local damageGlitchPulseEnd = 0
local commsTransmissionFadeDuration = 1.1
local commsTransmissionEntries = {}
local thirdPersonEnabled = false
local wasThirdPersonToggleDown = false
local thirdPersonDistance = 104
local thirdPersonHeight = 14
local thirdPersonSideOffset = 16
local currentHUDProfile = "mando"

local helmetBodygroupKeywords = {
    "helmet",
    "visor",
    "mask"
}

local trooperHelmetBodygroupKeywords = {
    "helmet",
    "visor",
    "mask",
    "head",
    "phase",
    "gear"
}

local inactiveHelmetSelectionKeywords = {
    "none",
    "off",
    "up",
    "open",
    "raised",
    "flip"
}

local cloneTrooperKeywords = {
    "clone",
    "trooper",
    "stormtrooper",
    "storm",
    "tk",
    "phase",
    "republic",
    "imperial"
}

local cloneTrooperModelProfiles = {
    ["models/aussiwozzi/cgi/base/104th_wolffe.mdl"] = true,
    ["models/aussiwozzi/cgi/base/unassigned_trp.mdl"] = true,
    ["models/nada/tk_trooper.mdl"] = true
}

local function sx(value)
    return math.floor((ScrW() / 1920) * value)
end

local function sy(value)
    return math.floor((ScrH() / 1080) * value)
end

local function sp(value)
    return math.floor(math.min(ScrW() / 1920, ScrH() / 1080) * value)
end

local function withAlpha(col, alpha)
    return Color(col.r, col.g, col.b, alpha)
end

local function fitTextToWidth(text, font, maxWidth)
    local value = tostring(text or "")
    surface.SetFont(font)

    if select(1, surface.GetTextSize(value)) <= maxWidth then
        return value
    end

    local ellipsis = "..."
    for index = #value, 1, -1 do
        local candidate = string.sub(value, 1, index) .. ellipsis
        if select(1, surface.GetTextSize(candidate)) <= maxWidth then
            return candidate
        end
    end

    return ellipsis
end

local function normalizeLookupValue(value)
    return string.Trim(string.lower(tostring(value or "")))
end

local function hasKeywordMatch(value, keywords)
    local normalizedValue = normalizeLookupValue(value)

    for _, keyword in ipairs(keywords) do
        if string.find(normalizedValue, keyword, 1, true) then
            return true
        end
    end

    return false
end

local function findHelmetBodygroupInfoByKeywords(ply, keywords)
    if not IsValid(ply) then
        return nil, 0
    end

    for _, bodygroup in ipairs(ply:GetBodyGroups() or {}) do
        if (bodygroup.num or 0) > 1 and hasKeywordMatch(bodygroup.name, keywords or helmetBodygroupKeywords) then
            local bodygroupIndex = bodygroup.id or 0
            return bodygroup, ply:GetBodygroup(bodygroupIndex)
        end
    end

    return nil, 0
end

local function isExplicitCloneTrooperModel(modelName)
    return cloneTrooperModelProfiles[normalizeLookupValue(modelName)] == true
end

local function findHelmetBodygroupInfo(ply, useTrooperKeywords)
    local bodygroup, value = findHelmetBodygroupInfoByKeywords(ply, helmetBodygroupKeywords)
    if bodygroup or not useTrooperKeywords then
        return bodygroup, value
    end

    return findHelmetBodygroupInfoByKeywords(ply, trooperHelmetBodygroupKeywords)
end

local function getSelectedBodygroupName(bodygroup, value)
    if not bodygroup or not bodygroup.submodels then
        return ""
    end

    local selectedIndex = math.max((value or 0) + 1, 1)
    return tostring(bodygroup.submodels[selectedIndex] or "")
end

local function isHelmetSelectionActive(bodygroup, value)
    if not bodygroup then
        return false
    end

    local selectionName = getSelectedBodygroupName(bodygroup, value)
    if selectionName ~= "" then
        return not hasKeywordMatch(selectionName, inactiveHelmetSelectionKeywords)
    end

    return (value or 0) > 0
end

local function getHUDProfile(ply)
    if not IsValid(ply) then
        return "mando"
    end

    local modelName = ply:GetModel() or ""
    local explicitCloneTrooperModel = isExplicitCloneTrooperModel(modelName)
    local helmetBodygroup, helmetValue = findHelmetBodygroupInfo(ply, explicitCloneTrooperModel)
    local selectedBodygroupName = getSelectedBodygroupName(helmetBodygroup, helmetValue)
    local looksCloneTrooper = explicitCloneTrooperModel
        or hasKeywordMatch(modelName, cloneTrooperKeywords)
        or hasKeywordMatch(selectedBodygroupName, cloneTrooperKeywords)

    if not looksCloneTrooper then
        return "mando"
    end

    if not helmetBodygroup then
        return "clone"
    end

    if isHelmetSelectionActive(helmetBodygroup, helmetValue) then
        return "clone"
    end

    return "off"
end

local function isHUDActive(ply)
    return cvEnabled:GetBool()
        and IsValid(ply)
        and ply:Alive()
    and isnumber(FACTION_CLONE)
    and ply:Team() == FACTION_CLONE
        and not ply:GetNWBool(helmetStateKey, false)
        and getHUDProfile(ply) ~= "off"
end

local function isThirdPersonActive(ply)
    return thirdPersonEnabled and IsValid(ply) and ply:Alive()
end

local function getPlayerHealthState(ply)
    local healthMax = 100
    if IsValid(ply) and ply.GetMaxHealth then
        healthMax = math.max(ply:GetMaxHealth(), 100)
    end

    local healthValue = 0
    if IsValid(ply) then
        healthValue = math.max(ply:Health(), 0)
    end

    return healthValue, healthMax, math.Clamp(healthValue / math.max(healthMax, 1), 0, 1)
end

local function updateDamageGlitchPulse(ply)
    if not IsValid(ply) or not ply:Alive() then
        damageGlitchLastHealth = nil
        damageGlitchPulseEnd = 0
        return
    end

    local healthValue, _, healthRatio = getPlayerHealthState(ply)
    if damageGlitchLastHealth ~= nil and healthValue < damageGlitchLastHealth and healthRatio <= damageGlitchHealthThreshold then
        damageGlitchPulseEnd = math.max(damageGlitchPulseEnd, CurTime() + damageGlitchPulseDuration)
    end

    damageGlitchLastHealth = healthValue
end

local function getDamageGlitchState(ply)
    updateDamageGlitchPulse(ply)

    if not IsValid(ply) or not ply:Alive() then
        return false, 0, false
    end

    local _, _, healthRatio = getPlayerHealthState(ply)
    local lowHealthIntensity = math.Clamp((damageGlitchHealthThreshold - healthRatio) / damageGlitchHealthThreshold, 0, 1)
    local pulseTimeLeft = math.max(damageGlitchPulseEnd - CurTime(), 0)
    local pulseIntensity = math.Clamp(pulseTimeLeft / damageGlitchPulseDuration, 0, 1)
    local intensity = math.Clamp((lowHealthIntensity * 0.72) + (pulseIntensity * 0.6), 0, 1)

    if intensity <= 0 then
        return false, 0, false
    end

    local signal = math.sin(CurTime() * (20 + (intensity * 24))) + (math.sin(CurTime() * 63) * 0.28)
    local shouldDropFrame = signal > (1.18 - (intensity * 0.82))
    return true, intensity, shouldDropFrame
end

local function getHelmetShutdownProgress(ply)
    if not IsValid(ply) or not ply:GetNWBool(helmetTransitionKey, false) then
        return false, 0
    end

    local transitionEndTime = ply:GetNWFloat(helmetTransitionEndKey, 0)
    local remaining = math.max(transitionEndTime - CurTime(), 0)
    local progress = 1 - math.Clamp(remaining / helmetTransitionDuration, 0, 1)
    return true, progress
end

local function getHelmetStartupProgress(ply)
    if not IsValid(ply) or not ply:GetNWBool(helmetStartupTransitionKey, false) then
        return false, 0, false
    end

    local transitionStartTime = ply:GetNWFloat(helmetStartupTransitionStartKey, 0)
    local transitionEndTime = ply:GetNWFloat(helmetStartupTransitionEndKey, 0)
    local now = CurTime()
    if transitionStartTime > now then
        return true, 0, true
    end

    local remaining = math.max(transitionEndTime - CurTime(), 0)
    local transitionDuration = math.max(transitionEndTime - transitionStartTime, 0.001)
    local progress = 1 - math.Clamp(remaining / transitionDuration, 0, 1)
    return true, progress, false
end

local function shouldSkipHelmetShutdownFrame(progress)
    if progress >= 0.94 then
        return true
    end

    local signal = math.sin(CurTime() * (28 + (progress * 34))) + (math.sin(CurTime() * 87) * 0.42)
    return signal > (1.06 - (progress * 1.52))
end

local function shouldSkipHelmetStartupFrame(progress)
    if progress <= 0.08 then
        return true
    end

    local signal = math.sin(CurTime() * (24 + (progress * 26))) + (math.sin(CurTime() * 71) * 0.34)
    return signal > (0.84 + (progress * 0.78))
end

local function drawHelmetShutdownFlicker(progress)
    local sw = ScrW()
    local sh = ScrH()
    local lineCount = 4 + math.floor(progress * 5)

    for index = 1, lineCount do
        local bandHeight = math.max(sy(2), 2) + (index % 2)
        local bandY = math.floor(((CurTime() * (54 + (progress * 30))) + (index * (sh / math.max(lineCount, 1)))) % sh)
        local bandColor = index % 2 == 0 and palette.holo or palette.amber
        surface.SetDrawColor(withAlpha(bandColor, math.floor(44 + (progress * 96))))
        surface.DrawRect(0, bandY, sw, bandHeight)
    end

    local interferenceY = math.floor((sh * 0.32) + (math.sin(CurTime() * 11) * sh * 0.12))
    surface.SetDrawColor(withAlpha(palette.holo, math.floor(18 + (progress * 48))))
    surface.DrawRect(0, interferenceY, sw, math.max(sy(18), 12))
end

local function drawHelmetStartupFlicker(progress)
    local sw = ScrW()
    local sh = ScrH()
    local lineCount = 3 + math.floor((1 - progress) * 4)

    for index = 1, lineCount do
        local bandHeight = math.max(sy(2), 2)
        local bandY = math.floor(((CurTime() * (46 + ((1 - progress) * 24))) + (index * (sh / math.max(lineCount, 1)))) % sh)
        local bandColor = index % 2 == 0 and palette.amberSoft or palette.holo
        surface.SetDrawColor(withAlpha(bandColor, math.floor(22 + ((1 - progress) * 74))))
        surface.DrawRect(0, bandY, sw, bandHeight)
    end

    local pulseHeight = math.max(sy(12), 8)
    local pulseY = math.floor((sh * 0.55) + (math.sin(CurTime() * 8.5) * sh * 0.08))
    surface.SetDrawColor(withAlpha(palette.holo, math.floor(16 + ((1 - progress) * 38))))
    surface.DrawRect(0, pulseY, sw, pulseHeight)
end

local function drawDamageGlitchOverlay(intensity)
    local sw = ScrW()
    local sh = ScrH()
    local lineCount = 2 + math.floor(intensity * 4)

    for index = 1, lineCount do
        local bandHeight = math.max(sy(2), 2) + (index % 2)
        local bandY = math.floor(((CurTime() * (32 + (intensity * 18))) + (index * (sh / math.max(lineCount + 1, 2)))) % sh)
        local bandColor = index % 3 == 0 and palette.danger or (index % 2 == 0 and palette.holo or palette.amberSoft)
        surface.SetDrawColor(withAlpha(bandColor, math.floor(18 + (intensity * 60))))
        surface.DrawRect(0, bandY, sw, bandHeight)
    end

    local warningHeight = math.max(sy(10), 8)
    local warningY = math.floor((sh * 0.64) + (math.sin(CurTime() * 9) * sh * 0.05))
    surface.SetDrawColor(withAlpha(palette.danger, math.floor(10 + (intensity * 28))))
    surface.DrawRect(0, warningY, sw, warningHeight)
end

local function getComlinkFrequencyForPlayer(ply)
    if MandoComlink and MandoComlink.GetFrequency then
        return MandoComlink.GetFrequency(ply)
    end

    if not IsValid(ply) then
        return ""
    end

    return string.upper(string.Trim(tostring(ply:GetNWString("MandoHUDComlinkFrequency", ""))))
end

local function arePlayersLinkedOnComms(listener, speaker)
    if MandoComlink and MandoComlink.ArePlayersLinked then
        return MandoComlink.ArePlayersLinked(listener, speaker)
    end

    if not IsValid(listener) or not IsValid(speaker) or not listener:IsPlayer() or not speaker:IsPlayer() then
        return false
    end

    local listenerFrequency = getComlinkFrequencyForPlayer(listener)
    if listenerFrequency == "" then
        return false
    end

    return listenerFrequency == getComlinkFrequencyForPlayer(speaker)
end

local function markCommsTransmissionState(speaker, isTalking)
    local localPlayer = LocalPlayer()
    if not IsValid(localPlayer) or not IsValid(speaker) or not speaker:IsPlayer() then
        return
    end

    local isSelfTransmission = speaker == localPlayer
    if not isSelfTransmission and not arePlayersLinkedOnComms(localPlayer, speaker) then
        return
    end

    if isSelfTransmission and getComlinkFrequencyForPlayer(localPlayer) == "" then
        return
    end

    local now = CurTime()
    local entry = commsTransmissionEntries[speaker] or {}
    entry.lastHeard = now

    if isTalking then
        entry.isTalking = true
        entry.startedAt = entry.startedAt or now
        entry.fadeUntil = nil
    else
        entry.isTalking = false
        entry.fadeUntil = now + commsTransmissionFadeDuration
    end

    commsTransmissionEntries[speaker] = entry
end

local function suppressDefaultVoicePanels()
    if not GAMEMODE then
        return
    end

    GAMEMODE.PlayerStartVoice = function() end
    GAMEMODE.PlayerEndVoice = function() end

    if IsValid(g_VoicePanelList) then
        g_VoicePanelList:SetVisible(false)
        g_VoicePanelList:SetAlpha(0)
    end
end

hook.Add("InitPostEntity", "MandoHUD.SuppressDefaultVoicePanels", function()
    timer.Simple(0, suppressDefaultVoicePanels)
end)

hook.Add("OnReloaded", "MandoHUD.SuppressDefaultVoicePanelsReload", function()
    timer.Simple(0, suppressDefaultVoicePanels)
end)

hook.Add("PlayerStartVoice", "MandoHUD.TrackCommsVoiceStart", function(speaker)
    markCommsTransmissionState(speaker, true)
end)

hook.Add("PlayerEndVoice", "MandoHUD.TrackCommsVoiceEnd", function(speaker)
    markCommsTransmissionState(speaker, false)
end)

hook.Add("EntityRemoved", "MandoHUD.CleanupCommsEntries", function(ent)
    if commsTransmissionEntries[ent] then
        commsTransmissionEntries[ent] = nil
    end
end)

local function getCommsSpeakerLabel(speaker)
    if not IsValid(speaker) then
        return "UNKNOWN"
    end

    local nickname = string.Trim(tostring(speaker:Nick() or "UNKNOWN"))
    if nickname == "" then
        nickname = "UNKNOWN"
    end

    return string.upper(nickname)
end

local function refreshCommsTransmissionEntries(ply)
    if not IsValid(ply) or not ply:Alive() or getComlinkFrequencyForPlayer(ply) == "" then
        table.Empty(commsTransmissionEntries)
        return
    end

    local now = CurTime()
    local seenSpeakers = {}

    for _, speaker in ipairs(player.GetAll()) do
        if IsValid(speaker) and speaker:IsPlayer() then
            local linked = speaker == ply and getComlinkFrequencyForPlayer(ply) ~= "" or arePlayersLinkedOnComms(ply, speaker)
            local entry = commsTransmissionEntries[speaker]
            local isSpeaking = linked and speaker.IsSpeaking and speaker:IsSpeaking() or false
            local voiceLevel = speaker.VoiceVolume and math.Clamp(speaker:VoiceVolume(), 0, 1) or 0

            if isSpeaking then
                entry = entry or {}
                entry.isTalking = true
                entry.startedAt = entry.startedAt or now
                entry.lastHeard = now
                entry.fadeUntil = nil
                entry.voiceLevel = voiceLevel > 0 and voiceLevel or 0.65
                commsTransmissionEntries[speaker] = entry
                seenSpeakers[speaker] = true
            elseif entry then
                if not linked then
                    commsTransmissionEntries[speaker] = nil
                elseif entry.isTalking then
                    entry.isTalking = false
                    entry.lastHeard = now
                    entry.fadeUntil = now + commsTransmissionFadeDuration
                    entry.voiceLevel = math.max(entry.voiceLevel or 0.28, 0.28)
                    seenSpeakers[speaker] = true
                elseif entry.fadeUntil and entry.fadeUntil > now then
                    seenSpeakers[speaker] = true
                else
                    commsTransmissionEntries[speaker] = nil
                end
            end
        end
    end

    for speaker, entry in pairs(commsTransmissionEntries) do
        if not seenSpeakers[speaker] then
            local linked = IsValid(speaker) and speaker:IsPlayer() and ((speaker == ply and getComlinkFrequencyForPlayer(ply) ~= "") or arePlayersLinkedOnComms(ply, speaker))
            if not linked then
                commsTransmissionEntries[speaker] = nil
            elseif entry.isTalking then
                entry.isTalking = false
                entry.lastHeard = now
                entry.fadeUntil = now + commsTransmissionFadeDuration
            elseif not entry.fadeUntil or entry.fadeUntil <= now then
                commsTransmissionEntries[speaker] = nil
            end
        end
    end
end

local function getCurrentCommsTransmission(ply)
    if not IsValid(ply) or getComlinkFrequencyForPlayer(ply) == "" then
        return nil
    end

    refreshCommsTransmissionEntries(ply)

    local now = CurTime()
    local bestSpeaker
    local bestEntry
    local activeCount = 0

    for speaker, entry in pairs(commsTransmissionEntries) do
        local visible = false

        local isSelfTransmission = speaker == ply
        local linked = IsValid(speaker) and speaker:IsPlayer() and ((isSelfTransmission and getComlinkFrequencyForPlayer(ply) ~= "") or arePlayersLinkedOnComms(ply, speaker))

        if not linked then
            commsTransmissionEntries[speaker] = nil
        else
            if entry.isTalking then
                visible = true
                if not isSelfTransmission then
                    activeCount = activeCount + 1
                end
            elseif entry.fadeUntil and entry.fadeUntil > now then
                visible = true
            end

            if not visible then
                commsTransmissionEntries[speaker] = nil
            elseif not bestEntry then
                bestSpeaker = speaker
                bestEntry = entry
            else
                local currentIsSelf = bestSpeaker == ply
                local currentPriority = bestEntry.isTalking and (currentIsSelf and 2 or 3) or 1
                local entryPriority = entry.isTalking and (isSelfTransmission and 2 or 3) or 1
                local currentTime = bestEntry.lastHeard or 0
                local entryTime = entry.lastHeard or 0

                if entryPriority > currentPriority or (entryPriority == currentPriority and entryTime > currentTime) then
                    bestSpeaker = speaker
                    bestEntry = entry
                end
            end
        end
    end

    if not bestSpeaker or not bestEntry then
        return nil
    end

    local alpha = 255
    if not bestEntry.isTalking and bestEntry.fadeUntil then
        alpha = math.floor(255 * math.Clamp((bestEntry.fadeUntil - now) / commsTransmissionFadeDuration, 0, 1))
    end

    return {
        speaker = bestSpeaker,
        label = getCommsSpeakerLabel(bestSpeaker),
        frequency = getComlinkFrequencyForPlayer(bestSpeaker),
        alpha = alpha,
        isTalking = bestEntry.isTalking and true or false,
        isOutgoing = bestSpeaker == ply,
        startedAt = bestEntry.startedAt or bestEntry.lastHeard or now,
        activeCount = activeCount,
        voiceLevel = bestEntry.voiceLevel or 0.5
    }
end

local function buildFonts()
    surface.CreateFont("MandoHUD.Title", {
        font = "Trebuchet MS",
        size = math.max(sy(28), 18),
        weight = 1000,
        extended = true
    })

    surface.CreateFont("MandoHUD.Section", {
        font = "Trebuchet MS",
        size = math.max(sy(19), 15),
        weight = 900,
        extended = true
    })

    surface.CreateFont("MandoHUD.Body", {
        font = "Trebuchet MS",
        size = math.max(sy(17), 14),
        weight = 700,
        extended = true
    })

    surface.CreateFont("MandoHUD.BodyItalic", {
        font = "Trebuchet MS",
        size = math.max(sy(17), 14),
        weight = 700,
        italic = true,
        extended = true
    })

    surface.CreateFont("MandoHUD.Small", {
        font = "Trebuchet MS",
        size = math.max(sy(15), 12),
        weight = 700,
        extended = true
    })

    surface.CreateFont("MandoHUD.Numeric", {
        font = "Consolas",
        size = math.max(sy(22), 16),
        weight = 900,
        extended = true
    })

    surface.CreateFont("MandoHUD.Bearing", {
        font = "Consolas",
        size = math.max(sy(17), 14),
        weight = 800,
        extended = true
    })
end

buildFonts()

hook.Add("OnScreenSizeChanged", "MandoHUD.RebuildFonts", function()
    buildFonts()
end)

local function drawPolyOutline(poly, col)
    surface.SetDrawColor(col)

    for index = 1, #poly do
        local pointA = poly[index]
        local pointB = poly[index + 1] or poly[1]
        surface.DrawLine(pointA.x, pointA.y, pointB.x, pointB.y)
    end
end

local function drawSoftLine(x1, y1, x2, y2, col)
    surface.SetDrawColor(withAlpha(col, 26))
    surface.DrawLine(x1 - 1, y1, x2 - 1, y2)
    surface.DrawLine(x1 + 1, y1, x2 + 1, y2)
    surface.DrawLine(x1, y1 - 1, x2, y2 - 1)
    surface.DrawLine(x1, y1 + 1, x2, y2 + 1)
    surface.SetDrawColor(col)
    surface.DrawLine(x1, y1, x2, y2)
end

local function drawSkewedRightText(text, font, x, y, color, skewStep)
    local value = tostring(text or "")
    surface.SetFont(font)

    local glyphs = {}
    local totalWidth = 0

    for index = 1, #value do
        local glyph = value:sub(index, index)
        local glyphWidth = surface.GetTextSize(glyph)
        glyphs[#glyphs + 1] = {
            glyph = glyph,
            width = glyphWidth
        }
        totalWidth = totalWidth + glyphWidth
    end

    local cursorX = x - totalWidth
    local baseY = y - (((#glyphs - 1) * skewStep) * 0.32)

    for index, glyphData in ipairs(glyphs) do
        if glyphData.glyph ~= " " then
            draw.SimpleText(
                glyphData.glyph,
                font,
                cursorX,
                baseY + ((index - 1) * skewStep),
                color,
                TEXT_ALIGN_LEFT,
                TEXT_ALIGN_TOP
            )
        end

        cursorX = cursorX + glyphData.width
    end
end

local function drawSkewedLeftText(text, font, x, y, color, skewStep)
    local value = tostring(text or "")
    surface.SetFont(font)

    local glyphs = {}
    local cursorX = x
    local baseY = y - (((#value - 1) * skewStep) * 0.32)

    for index = 1, #value do
        local glyph = value:sub(index, index)
        local glyphWidth = surface.GetTextSize(glyph)
        glyphs[#glyphs + 1] = {
            glyph = glyph,
            width = glyphWidth
        }
    end

    for index, glyphData in ipairs(glyphs) do
        if glyphData.glyph ~= " " then
            draw.SimpleText(
                glyphData.glyph,
                font,
                cursorX,
                baseY + ((#glyphs - index) * skewStep),
                color,
                TEXT_ALIGN_LEFT,
                TEXT_ALIGN_TOP
            )
        end

        cursorX = cursorX + glyphData.width
    end
end

local function drawSoftCircle(x, y, radius, col)
    surface.DrawCircle(x, y, radius + 1, withAlpha(col, 24))
    surface.DrawCircle(x, y, radius, col)
end

local function drawArcLine(cx, cy, radius, startAngle, endAngle, col, step)
    local increment = step or 5
    local previousX = cx + math.cos(math.rad(startAngle)) * radius
    local previousY = cy + math.sin(math.rad(startAngle)) * radius

    for angle = startAngle + increment, endAngle, increment do
        local nextX = cx + math.cos(math.rad(angle)) * radius
        local nextY = cy + math.sin(math.rad(angle)) * radius
        drawSoftLine(previousX, previousY, nextX, nextY, col)
        previousX = nextX
        previousY = nextY
    end
end

local function buildCutPanel(x, y, width, height, cut)
    return {
        { x = x + cut, y = y },
        { x = x + width - cut, y = y },
        { x = x + width, y = y + cut },
        { x = x + width, y = y + height - cut },
        { x = x + width - cut, y = y + height },
        { x = x + cut, y = y + height },
        { x = x, y = y + height - cut },
        { x = x, y = y + cut }
    }
end

local function buildCirclePoly(cx, cy, radius, segments)
    local poly = {}
    local count = segments or 40

    for index = 0, count - 1 do
        local angle = (index / count) * math.pi * 2
        poly[#poly + 1] = {
            x = cx + math.cos(angle) * radius,
            y = cy + math.sin(angle) * radius
        }
    end

    return poly
end

local function buildSectorPoly(cx, cy, radius, startAngle, endAngle, segments)
    local poly = {
        { x = cx, y = cy }
    }
    local count = math.max(segments or 10, 2)
    local angleStep = (endAngle - startAngle) / count

    for index = 0, count do
        local angle = startAngle + (angleStep * index)
        poly[#poly + 1] = {
            x = cx + math.cos(math.rad(angle)) * radius,
            y = cy + math.sin(math.rad(angle)) * radius
        }
    end

    return poly
end

local function drawGrid(x, y, width, height, step)
    surface.SetDrawColor(palette.grid)

    local currentX = x + step
    while currentX < x + width do
        surface.DrawLine(currentX, y + 4, currentX, y + height - 4)
        currentX = currentX + step
    end

    local currentY = y + step
    while currentY < y + height do
        surface.DrawLine(x + 4, currentY, x + width - 4, currentY)
        currentY = currentY + step
    end
end

local function drawPanel(x, y, width, height, title)
    local cut = math.max(sp(18), 10)
    local poly = buildCutPanel(x, y, width, height, cut)
    local headerHeight = math.max(sy(26), 20)
    local scanOffset = (CurTime() * 90) % math.max(height, 1)

    draw.NoTexture()
    surface.SetDrawColor(palette.panel)
    surface.DrawPoly(poly)

    surface.SetDrawColor(palette.panelSoft)
    surface.DrawRect(x + 2, y + 2, width - 4, headerHeight)
    drawGrid(x, y, width, height, math.max(sp(28), 18))

    surface.SetDrawColor(palette.scan)
    surface.DrawRect(x + 10, y + scanOffset, width - 20, 1)

    drawPolyOutline(poly, palette.amberSoft)
    drawPolyOutline({
        { x = x + cut + 4, y = y + 4 },
        { x = x + width - cut - 4, y = y + 4 },
        { x = x + width - 4, y = y + cut + 4 },
        { x = x + width - 4, y = y + height - cut - 4 },
        { x = x + width - cut - 4, y = y + height - 4 },
        { x = x + cut + 4, y = y + height - 4 },
        { x = x + 4, y = y + height - cut - 4 },
        { x = x + 4, y = y + cut + 4 }
    }, palette.holoSoft)

    draw.SimpleText(title, "MandoHUD.Section", x + math.max(sp(18), 12), y + math.max(sp(8), 6), palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

local function humanizeLabel(value)
    local text = tostring(value or "")
    if text ~= "" and string.sub(text, 1, 1) == "#" and language and language.GetPhrase then
        local phrase = language.GetPhrase(string.sub(text, 2))
        if phrase and phrase ~= "" and phrase ~= string.sub(text, 2) then
            text = phrase
        end
    end

    text = string.gsub(text, "weapon_", "")
    text = string.gsub(text, "npc_", "")
    text = string.gsub(text, "^#+", "")
    text = string.gsub(text, "_", " ")
    text = string.gsub(text, "%s+", " ")
    text = string.Trim(text)

    if text == "" then
        return "UNAVAILABLE"
    end

    return string.upper(text)
end

local function getMapLabel(maxLength)
    local mapLabel = humanizeLabel(game.GetMap() or "UNKNOWN")
    if maxLength and #mapLabel > maxLength then
        return string.sub(mapLabel, 1, maxLength)
    end

    return mapLabel
end

local function normalizeFiremodeLabel(modeValue, labelValue)
    local explicitLabel = tostring(labelValue or "")
    if explicitLabel ~= "" then
        local lowered = string.lower(explicitLabel)
        if string.find(lowered, "safe", 1, true) then
            return "SAFETY"
        elseif string.find(lowered, "semi", 1, true) then
            return "SEMI"
        elseif string.find(lowered, "auto", 1, true) then
            return "AUTOMATIC"
        elseif string.find(lowered, "burst", 1, true) then
            return humanizeLabel(explicitLabel)
        end

        return humanizeLabel(explicitLabel)
    end

    if type(modeValue) == "boolean" then
        return modeValue and "AUTOMATIC" or "SEMI"
    end

    if type(modeValue) == "number" then
        if modeValue == 0 then
            return "SAFETY"
        elseif modeValue == 1 then
            return "SEMI"
        elseif modeValue < 0 then
            return string.format("%d-RND BURST", math.abs(modeValue))
        elseif modeValue >= 2 then
            return "AUTOMATIC"
        end
    end

    local modeText = tostring(modeValue or "")
    if modeText == "" then
        return nil
    end

    local lowered = string.lower(modeText)
    if string.find(lowered, "safe", 1, true) then
        return "SAFETY"
    elseif string.find(lowered, "semi", 1, true) then
        return "SEMI"
    elseif string.find(lowered, "auto", 1, true) then
        return "AUTOMATIC"
    elseif string.find(lowered, "burst", 1, true) then
        return humanizeLabel(modeText)
    end

    return humanizeLabel(modeText)
end

local function getFiremodeColor(label)
    if not label or label == "" then
        return palette.holo
    end

    if label == "SAFETY" then
        return palette.textSoft
    elseif string.find(label, "BURST", 1, true) then
        return palette.amber
    end

    return palette.holo
end

local function getWeaponFiremodeLabel(weapon)
    if not IsValid(weapon) then
        return nil
    end

    local weaponTable = weapon.GetTable and weapon:GetTable() or nil
    local firemodes = weapon.Firemodes or (weaponTable and weaponTable.Firemodes) or nil

    local function getEntryLabel(entry)
        if type(entry) ~= "table" then
            return nil
        end

        return normalizeFiremodeLabel(
            entry.Mode,
            entry.PrintName or entry.Name or entry.DisplayName or entry.HUD
        )
    end

    local function getIndexedLabel(indexValue)
        local index = tonumber(indexValue)
        if not index or type(firemodes) ~= "table" then
            return nil
        end

        local entry = firemodes[math.floor(index)]
        return getEntryLabel(entry)
    end

    if weapon.GetCurrentFiremodeTable then
        local label = getEntryLabel(weapon:GetCurrentFiremodeTable())
        if label then
            return label
        end
    end

    if weapon.GetFiremodeTable then
        local label = getEntryLabel(weapon:GetFiremodeTable())
        if label then
            return label
        end
    end

    local currentFiremode = weapon.GetCurrentFiremode and weapon:GetCurrentFiremode() or nil
    if type(currentFiremode) == "table" then
        local label = getEntryLabel(currentFiremode)
        if label then
            return label
        end
    else
        local label = getIndexedLabel(currentFiremode) or normalizeFiremodeLabel(currentFiremode)
        if label then
            return label
        end
    end

    local rawFiremode = weapon.GetFiremode and weapon:GetFiremode() or nil
    if type(rawFiremode) == "table" then
        local label = getEntryLabel(rawFiremode)
        if label then
            return label
        end
    else
        local label = getIndexedLabel(rawFiremode) or normalizeFiremodeLabel(rawFiremode)
        if label then
            return label
        end
    end

    local indexedSources = {
        weapon.Firemode,
        weapon.FireMode,
        weaponTable and weaponTable.Firemode or nil,
        weaponTable and weaponTable.FireMode or nil
    }

    if weapon.GetNW2Int then
        indexedSources[#indexedSources + 1] = weapon:GetNW2Int("Firemode", 0)
        indexedSources[#indexedSources + 1] = weapon:GetNW2Int("FireMode", 0)
    end

    if weapon.GetNWInt then
        indexedSources[#indexedSources + 1] = weapon:GetNWInt("Firemode", 0)
        indexedSources[#indexedSources + 1] = weapon:GetNWInt("FireMode", 0)
    end

    for _, source in ipairs(indexedSources) do
        local label = getIndexedLabel(source)
        if label then
            return label
        end
    end

    local primaryData = weapon.Primary or (weaponTable and weaponTable.Primary) or nil
    if primaryData and primaryData.Automatic ~= nil then
        return normalizeFiremodeLabel(primaryData.Automatic)
    end

    return nil
end

local function getWeaponData(ply)
    local weapon = ply:GetActiveWeapon()
    if not IsValid(weapon) then
        return {
            name = "UNARMED",
            class = "NO ACTIVE SYSTEM",
            clip = "--",
            reserve = "--",
            ammoRatio = 0,
            clipValue = nil,
            reserveValue = 0,
            maxClip = 0,
            usesAmmo = false,
            firemodeLabel = nil
        }
    end

    local clip = weapon.Clip1 and weapon:Clip1() or -1
    local reserve = 0
    local ammoType = weapon.GetPrimaryAmmoType and weapon:GetPrimaryAmmoType() or -1
    if ammoType and ammoType >= 0 then
        reserve = ply:GetAmmoCount(ammoType)
    end

    local maxClip = 0
    if weapon.GetMaxClip1 then
        maxClip = weapon:GetMaxClip1() or 0
    end

    local ammoRatio = 0
    if maxClip and maxClip > 0 and clip and clip >= 0 then
        ammoRatio = math.Clamp(clip / maxClip, 0, 1)
    elseif reserve > 0 then
        ammoRatio = math.Clamp(reserve / 180, 0, 1)
    end

    local usesAmmo = (clip and clip >= 0) or reserve > 0 or (maxClip and maxClip > 0)
    local displayName = weapon:GetPrintName() ~= "" and weapon:GetPrintName() or weapon:GetClass()

    return {
        name = humanizeLabel(displayName),
        class = humanizeLabel(weapon:GetClass()),
        clip = clip and clip >= 0 and tostring(clip) or "--",
        reserve = tostring(math.max(reserve, 0)),
        ammoRatio = ammoRatio,
        clipValue = clip and clip >= 0 and clip or nil,
        reserveValue = math.max(reserve, 0),
        maxClip = maxClip and math.max(maxClip, 0) or 0,
        usesAmmo = usesAmmo and true or false,
        firemodeLabel = getWeaponFiremodeLabel(weapon)
    }
end

local function hasActiveWeapon(ply)
    return IsValid(ply) and IsValid(ply:GetActiveWeapon())
end

local function isUtilityWeapon(weapon)
    if not IsValid(weapon) then
        return false
    end

    local weaponTable = weapon.GetTable and weapon:GetTable() or nil
    local category = ""
    if weapon.GetCategory then
        category = weapon:GetCategory() or ""
    end

    if category == "" and weaponTable then
        category = weaponTable.Category or ""
    end

    local className = string.lower(tostring(weapon:GetClass() or ""))
    local printName = ""
    if weapon.GetPrintName then
        printName = weapon:GetPrintName() or ""
    end

    category = string.lower(tostring(category))
    printName = string.lower(tostring(printName ~= "" and printName or (weaponTable and weaponTable.PrintName) or ""))

    local utilityHints = {
        "utility",
        "tool",
        "camera",
        "physgun",
        "cross_arms",
        "cross arms",
        "emote",
        "gesture",
        "pose",
        "hands"
    }

    for _, hint in ipairs(utilityHints) do
        if string.find(category, hint, 1, true) or string.find(className, hint, 1, true) or string.find(printName, hint, 1, true) then
            return true
        end
    end

    return className == "gmod_tool" or className == "weapon_physgun" or className == "weapon_camera"
end

local function shouldDrawEquipment(ply)
    if not hasActiveWeapon(ply) then
        return false
    end

    return not isUtilityWeapon(ply:GetActiveWeapon())
end

local function getTargetData(ply)
    local trace = ply:GetEyeTrace()
    if not trace or trace.HitSky then
        return {
            label = "CLEAR SKY",
            range = "NO LOCK",
            health = "N/A",
            threat = "LOW",
            mode = "PASSIVE"
        }
    end

    local distance = math.floor(trace.HitPos:Distance(ply:EyePos()) / 52.4934)
    local ent = trace.Entity

    if not IsValid(ent) then
        return {
            label = "STATIC SURFACE",
            range = distance .. " M",
            health = "N/A",
            threat = "LOW",
            mode = "TERRAIN"
        }
    end

    local label = "CONTACT"
    if ent:IsPlayer() then
        label = string.upper(ent:Nick() or "PLAYER")
    elseif ent:IsNPC() then
        label = humanizeLabel(ent:GetClass())
    else
        local modelName = ent:GetModel() and string.StripExtension(string.GetFileFromFilename(ent:GetModel())) or ent:GetClass()
        label = humanizeLabel(modelName)
    end

    local healthText = "N/A"
    if ent.Health then
        local healthValue = ent:Health()
        if healthValue and healthValue >= 0 then
            healthText = tostring(math.floor(healthValue))
        end
    end

    local threat = "MED"
    local mode = "TRACKED"
    if ent:IsNPC() then
        threat = "HIGH"
    elseif ent:IsPlayer() then
        threat = "LIVE"
    else
        threat = "LOW"
        mode = "SCAN"
    end

    return {
        label = label,
        range = distance .. " M",
        health = healthText,
        threat = threat,
        mode = mode
    }
end

local function getBearing(angle)
    local normalized = math.NormalizeAngle(angle or 0)
    local bearing = normalized
    if bearing < 0 then
        bearing = bearing + 360
    end
    return math.floor(bearing)
end

local function getCardinal(angle)
    local directions = { "N", "NE", "E", "SE", "S", "SW", "W", "NW" }
    local bearing = getBearing(angle)
    local index = math.floor(((bearing + 22.5) % 360) / 45) + 1
    return directions[index]
end

local function getMovementPercent(ply)
    local velocity = ply:GetVelocity():Length2D()
    local runSpeed = ply.GetRunSpeed and ply:GetRunSpeed() or 240

    if runSpeed <= 0 then
        runSpeed = 240
    end

    return math.Clamp(velocity / runSpeed, 0, 1), math.floor(velocity * 0.06858)
end

local function drawMeterBar(x, y, width, height, amount, label, valueText)
    local fillWidth = math.floor((width - 2) * math.Clamp(amount or 0, 0, 1))

    surface.SetDrawColor(withAlpha(palette.amberSoft, 28))
    surface.DrawRect(x, y, width, height)
    surface.SetDrawColor(palette.amber)
    surface.DrawRect(x + 1, y + 1, fillWidth, height - 2)
    surface.SetDrawColor(palette.holoSoft)
    surface.DrawOutlinedRect(x, y, width, height)

    draw.SimpleText(label, "MandoHUD.Small", x, y - sy(12), palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    draw.SimpleText(valueText, "MandoHUD.Small", x + width, y - sy(12), palette.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
end

local function drawBodyIcon(x, y, width, height)
    local centerX = x + (width * 0.5)
    local headY = y + (height * 0.14)
    local neckY = y + (height * 0.27)
    local shoulderY = y + (height * 0.35)
    local hipY = y + (height * 0.63)
    local kneeY = y + (height * 0.83)

    surface.SetDrawColor(palette.amberSoft)
    surface.DrawCircle(centerX, headY, width * 0.15, palette.amberSoft)
    surface.DrawLine(centerX, neckY, centerX, hipY)
    surface.DrawLine(centerX - width * 0.18, shoulderY, centerX + width * 0.18, shoulderY)
    surface.DrawLine(centerX - width * 0.16, shoulderY + 4, centerX - width * 0.08, hipY - 8)
    surface.DrawLine(centerX + width * 0.16, shoulderY + 4, centerX + width * 0.08, hipY - 8)
    surface.DrawLine(centerX, hipY, centerX - width * 0.15, kneeY)
    surface.DrawLine(centerX, hipY, centerX + width * 0.15, kneeY)
end

local function drawVitalsStatusBar(x, y, width, ratio, label, valueText, fillColor)
    local labelX = x + sp(10)
    local barY = y + sy(16)
    local barHeight = sy(9)
    local fillWidth = math.floor((width - 2) * math.Clamp(ratio or 0, 0, 1))

    surface.SetDrawColor(withAlpha(fillColor, 180))
    surface.DrawRect(x, y + sy(6), sp(6), 1)

    draw.SimpleText(label, "MandoHUD.Small", labelX, y, palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(valueText, "MandoHUD.Small", x + width, y, palette.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

    surface.SetDrawColor(withAlpha(palette.shell, 156))
    surface.DrawRect(x, barY, width, barHeight)

    surface.SetDrawColor(withAlpha(fillColor, 26))
    surface.DrawRect(x + 1, barY + 1, width - 2, barHeight - 2)

    if fillWidth > 0 then
        surface.SetDrawColor(fillColor)
        surface.DrawRect(x + 1, barY + 1, fillWidth, barHeight - 2)
        surface.SetDrawColor(withAlpha(fillColor, 235))
        surface.DrawRect(x + 1, barY + 1, fillWidth, 1)
    end

    surface.SetDrawColor(withAlpha(palette.holo, 38))
    surface.DrawOutlinedRect(x, barY, width, barHeight)

    local segmentStep = math.max(sp(18), 12)
    surface.SetDrawColor(withAlpha(palette.holo, 18))
    for segmentX = x + segmentStep, x + width - segmentStep, segmentStep do
        surface.DrawLine(segmentX, barY + 1, segmentX, barY + barHeight - 2)
    end
end

local function drawVitalsEdgeTrace(x1, y1, x2, y2, ratio, label, valueText, fillColor, labelMode, mirror, style)
    local amount = math.Clamp(ratio or 0, 0, 1)
    style = style or {}
    local labelOffset = style.labelOffset or sy(14)
    local tickHalf = style.tickHalf or math.max(sp(5), 3)
    local curveDepth = style.curveDepth or sy(32)
    local samples = style.samples or 24
    local valueSkewStep = style.valueSkewStep or math.max((ScrH() / 1080) * 0.9, 1)
    local valueInset = style.valueInset or sp(10)
    local valueAboveLift = style.valueAboveLift or sy(10)
    local valueBelowDrop = style.valueBelowDrop or sy(2)
    local controlX = (x1 + x2) * 0.5
    local controlY = ((y1 + y2) * 0.5) - curveDepth
    local labelLeftY = y1 - labelOffset - sy(5)
    local valueRightX = mirror and (x2 + valueInset) or (x2 - valueInset)
    local valueRightY = y2 - labelOffset - valueAboveLift
    local labelAlign = mirror and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT

    if labelMode == "below" then
        labelLeftY = y1 + sy(2)
        valueRightY = y2 + valueBelowDrop
    end

    local function curvePoint(t)
        local inv = 1 - t
        return {
            x = (inv * inv * x1) + (2 * inv * t * controlX) + (t * t * x2),
            y = (inv * inv * y1) + (2 * inv * t * controlY) + (t * t * y2)
        }
    end

    local function curveNormal(t)
        local tx = (2 * (1 - t) * (controlX - x1)) + (2 * t * (x2 - controlX))
        local ty = (2 * (1 - t) * (controlY - y1)) + (2 * t * (y2 - controlY))
        local length = math.sqrt((tx * tx) + (ty * ty))

        if length <= 0 then
            return 0, -1
        end

        return -ty / length, tx / length
    end

    draw.SimpleText(label, "MandoHUD.Body", x1, labelLeftY, palette.textSoft, labelAlign, TEXT_ALIGN_TOP)
    if mirror then
        drawSkewedLeftText(valueText, "MandoHUD.BodyItalic", valueRightX, valueRightY, palette.text, valueSkewStep)
    else
        drawSkewedRightText(valueText, "MandoHUD.BodyItalic", valueRightX, valueRightY, palette.text, valueSkewStep)
    end

    for offset = -3, 3 do
        local previousPoint = curvePoint(0)
        local previousNormalX, previousNormalY = curveNormal(0)

        for step = 1, samples do
            local t = step / samples
            local nextPoint = curvePoint(t)
            local nextNormalX, nextNormalY = curveNormal(t)

            drawSoftLine(
                previousPoint.x + (previousNormalX * offset),
                previousPoint.y + (previousNormalY * offset),
                nextPoint.x + (nextNormalX * offset),
                nextPoint.y + (nextNormalY * offset),
                withAlpha(palette.shell, 172)
            )

            previousPoint = nextPoint
            previousNormalX = nextNormalX
            previousNormalY = nextNormalY
        end
    end

    local previousBase = curvePoint(0)
    local previousFill = curvePoint(0)
    for step = 1, samples do
        local t = step / samples
        local nextBase = curvePoint(t)
        drawSoftLine(previousBase.x, previousBase.y, nextBase.x, nextBase.y, withAlpha(palette.holo, 62))

        if t <= amount then
            drawSoftLine(previousFill.x, previousFill.y, nextBase.x, nextBase.y, withAlpha(fillColor, 130))
            drawSoftLine(previousFill.x, previousFill.y, nextBase.x, nextBase.y, withAlpha(fillColor, 220))
            drawSoftLine(previousFill.x, previousFill.y, nextBase.x, nextBase.y, withAlpha(fillColor, 255))
            drawSoftLine(previousFill.x, previousFill.y, nextBase.x, nextBase.y, fillColor)
            previousFill = nextBase
        elseif amount > ((step - 1) / samples) then
            local cappedPoint = curvePoint(amount)
            drawSoftLine(previousFill.x, previousFill.y, cappedPoint.x, cappedPoint.y, withAlpha(fillColor, 130))
            drawSoftLine(previousFill.x, previousFill.y, cappedPoint.x, cappedPoint.y, withAlpha(fillColor, 220))
            drawSoftLine(previousFill.x, previousFill.y, cappedPoint.x, cappedPoint.y, withAlpha(fillColor, 255))
            drawSoftLine(previousFill.x, previousFill.y, cappedPoint.x, cappedPoint.y, fillColor)
        end

        previousBase = nextBase
    end

    for step = 1, 7 do
        local t = step / 8
        local tickPoint = curvePoint(t)
        local normalX, normalY = curveNormal(t)
        drawSoftLine(
            tickPoint.x - (normalX * tickHalf),
            tickPoint.y - (normalY * tickHalf),
            tickPoint.x + (normalX * tickHalf),
            tickPoint.y + (normalY * tickHalf),
            withAlpha(palette.holo, 22)
        )
    end
end

local function drawVitalsScanBox(x, y, width, height)
    local framePad = sp(8)
    local cut = math.max(sp(14), 10)
    local poly = buildCutPanel(x, y, width, height, cut)
    local innerPoly = buildCutPanel(x + framePad, y + framePad, width - (framePad * 2), height - (framePad * 2), math.max(cut - 4, 5))
    local inset = sp(14)
    local titleY = y + sy(8)
    local dividerY = y + sy(34)
    local guideLeft = x + sp(20)
    local guideRight = x + width - sp(20)
    local figureCenterX = x + (width * 0.5)
    local figureTop = y + sy(46)
    local figureBottom = y + height - sy(40)
    local figureHeight = figureBottom - figureTop
    local coreRadius = math.min(width * 0.16, sp(28))
    local coreY = figureTop + (figureHeight * 0.34)
    local lowerCoreY = figureTop + (figureHeight * 0.60)
    local nodeOffset = math.min(width * 0.24, sp(40))
    local railInset = sp(10)
    local waveformY = y + height - sy(22)
    local scanY = figureTop + ((CurTime() * 52) % math.max(figureBottom - figureTop - sy(12), 1))
    local amber = withAlpha(palette.amber, 220)
    local amberSoft = withAlpha(palette.amber, 110)
    local holo = withAlpha(palette.holo, 165)

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.shell, 216))
    surface.DrawPoly(poly)
    drawPolyOutline(poly, withAlpha(palette.amberSoft, 84))
    drawPolyOutline(innerPoly, withAlpha(palette.holo, 36))

    draw.SimpleText("BIO-PROFILE", "MandoHUD.Section", x + sp(14), titleY, withAlpha(palette.text, 235), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    surface.SetDrawColor(withAlpha(palette.holo, 36))
    surface.DrawLine(x + inset, dividerY, x + width - inset, dividerY)

    surface.SetDrawColor(withAlpha(palette.holo, 16))
    surface.DrawRect(x + inset, scanY, width - (inset * 2), 1)

    for railY = figureTop + sy(8), figureBottom - sy(8), sy(24) do
        drawSoftLine(guideLeft, railY, guideLeft + sp(8), railY, holo)
        drawSoftLine(guideRight - sp(8), railY, guideRight, railY, holo)
    end

    for guideY = figureTop + sy(32), figureBottom - sy(18), sy(54) do
        drawSoftLine(guideLeft + sp(8), guideY, guideRight - sp(8), guideY, withAlpha(palette.holo, 54))
    end

    drawSoftLine(guideLeft, figureTop, guideLeft, figureBottom, holo)
    drawSoftLine(guideRight, figureTop, guideRight, figureBottom, holo)

    local outerRing = buildCirclePoly(figureCenterX, coreY, coreRadius, 28)
    local innerRing = buildCirclePoly(figureCenterX, coreY, coreRadius * 0.48, 20)
    local lowerRing = buildCirclePoly(figureCenterX, lowerCoreY, coreRadius * 0.24, 16)
    local sideNodeY = lowerCoreY + sy(18)
    local leftMarkerX = figureCenterX - nodeOffset
    local rightMarkerX = figureCenterX + nodeOffset

    drawArcLine(figureCenterX, figureTop + sy(20), width * 0.21, 210, 330, amberSoft, 6)
    drawArcLine(figureCenterX, lowerCoreY + sy(18), width * 0.18, 18, 162, withAlpha(palette.holo, 86), 6)

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.amber, 12))
    surface.DrawPoly(outerRing)
    surface.SetDrawColor(withAlpha(palette.holo, 10))
    surface.DrawPoly(innerRing)
    drawPolyOutline(outerRing, amber)
    drawPolyOutline(innerRing, amberSoft)
    drawPolyOutline(lowerRing, amberSoft)

    drawSoftLine(figureCenterX, figureTop + sy(12), figureCenterX, waveformY - sy(10), amberSoft)
    drawSoftLine(figureCenterX - coreRadius, coreY, guideLeft + sp(22), coreY, holo)
    drawSoftLine(figureCenterX + coreRadius, coreY, guideRight - sp(22), coreY, holo)
    drawSoftLine(figureCenterX, coreY - coreRadius, figureCenterX, coreY + coreRadius, amberSoft)
    drawSoftLine(figureCenterX - coreRadius * 0.46, coreY, figureCenterX + coreRadius * 0.46, coreY, amberSoft)
    drawSoftLine(figureCenterX - coreRadius * 0.24, lowerCoreY, figureCenterX + coreRadius * 0.24, lowerCoreY, amberSoft)

    drawSoftLine(leftMarkerX + railInset, sideNodeY, figureCenterX - coreRadius * 0.56, lowerCoreY + sy(6), holo)
    drawSoftLine(figureCenterX + coreRadius * 0.56, lowerCoreY + sy(6), rightMarkerX - railInset, sideNodeY, holo)
    drawSoftLine(leftMarkerX - sp(10), sideNodeY, leftMarkerX + sp(10), sideNodeY, amberSoft)
    drawSoftLine(rightMarkerX - sp(10), sideNodeY, rightMarkerX + sp(10), sideNodeY, amberSoft)
    drawSoftLine(leftMarkerX, sideNodeY - sy(8), leftMarkerX, sideNodeY + sy(8), withAlpha(palette.holo, 120))
    drawSoftLine(rightMarkerX, sideNodeY - sy(8), rightMarkerX, sideNodeY + sy(8), withAlpha(palette.holo, 120))

    drawSoftCircle(figureCenterX, coreY, sp(2), amber)
    drawSoftCircle(leftMarkerX, sideNodeY, sp(2), holo)
    drawSoftCircle(rightMarkerX, sideNodeY, sp(2), holo)

    for rowY = coreY - sy(18), lowerCoreY + sy(10), sy(16) do
        drawSoftLine(guideLeft + sp(8), rowY, guideLeft + sp(20), rowY, holo)
        drawSoftLine(guideRight - sp(20), rowY, guideRight - sp(8), rowY, holo)
    end

    drawSoftLine(x + inset, waveformY, x + width - inset, waveformY, holo)
    local previousX = x + inset
    local previousY = waveformY
    for offset = 4, width - (inset * 2), 4 do
        local waveX = x + inset + offset
        local waveY = waveformY + math.sin((CurTime() * 2.8) + (offset * 0.07)) * sy(4) + math.cos((offset * 0.04) - CurTime()) * sy(2)
        drawSoftLine(previousX, previousY, waveX, waveY, holo)
        previousX = waveX
        previousY = waveY
    end
end

local function drawVitalsStripScanBox(x, y, width, height)
    local cut = math.max(sp(10), 8)
    local framePad = sp(5)
    local poly = buildCutPanel(x, y, width, height, cut)
    local innerPoly = buildCutPanel(x + framePad, y + framePad, width - (framePad * 2), height - (framePad * 2), math.max(cut - 3, 5))
    local inset = sp(10)
    local titleY = y + sy(5)
    local dividerY = y + sy(18)
    local guideLeft = x + sp(12)
    local guideRight = x + width - sp(12)
    local figureCenterX = x + (width * 0.5)
    local figureCenterY = y + (height * 0.56)
    local radius = math.min(width * 0.18, height * 0.22)
    local lowerRadius = radius * 0.48
    local waveformY = y + height - sy(10)
    local topGuideY = dividerY + sy(10)
    local bottomGuideY = y + height - sy(18)
    local amber = withAlpha(palette.amber, 220)
    local amberSoft = withAlpha(palette.amber, 120)
    local holo = withAlpha(palette.holo, 150)

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.shell, 214))
    surface.DrawPoly(poly)
    drawPolyOutline(poly, withAlpha(palette.amberSoft, 78))
    drawPolyOutline(innerPoly, withAlpha(palette.holo, 28))

    draw.SimpleText("BIO-PROFILE", "MandoHUD.Small", x + sp(10), titleY, withAlpha(palette.text, 230), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    surface.SetDrawColor(withAlpha(palette.holo, 26))
    surface.DrawLine(x + inset, dividerY, x + width - inset, dividerY)

    drawSoftLine(guideLeft, topGuideY, guideLeft, bottomGuideY, holo)
    drawSoftLine(guideRight, topGuideY, guideRight, bottomGuideY, holo)

    for railY = topGuideY + sy(6), bottomGuideY - sy(4), sy(16) do
        drawSoftLine(guideLeft, railY, guideLeft + sp(7), railY, holo)
        drawSoftLine(guideRight - sp(7), railY, guideRight, railY, holo)
    end

    local outerRing = buildCirclePoly(figureCenterX, figureCenterY, radius, 24)
    local innerRing = buildCirclePoly(figureCenterX, figureCenterY, radius * 0.46, 18)
    local lowerRing = buildCirclePoly(figureCenterX, figureCenterY + sy(16), lowerRadius, 14)

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.amber, 12))
    surface.DrawPoly(outerRing)
    drawPolyOutline(outerRing, amber)
    drawPolyOutline(innerRing, amberSoft)
    drawPolyOutline(lowerRing, amberSoft)

    drawSoftLine(figureCenterX - radius, figureCenterY, figureCenterX + radius, figureCenterY, amberSoft)
    drawSoftLine(figureCenterX, figureCenterY - radius, figureCenterX, figureCenterY + radius, amberSoft)
    drawSoftLine(guideLeft + sp(10), figureCenterY, figureCenterX - radius, figureCenterY, holo)
    drawSoftLine(figureCenterX + radius, figureCenterY, guideRight - sp(10), figureCenterY, holo)
    drawArcLine(figureCenterX, figureCenterY + sy(18), width * 0.22, 20, 160, withAlpha(palette.holo, 76), 8)

    drawSoftLine(x + inset, waveformY, x + width - inset, waveformY, holo)

    local previousX = x + inset
    local previousY = waveformY
    local waveWidth = width - (inset * 2)
    for step = 1, 18 do
        local t = step / 18
        local waveX = x + inset + (waveWidth * t)
        local waveY = waveformY + math.sin((CurTime() * 1.8) + (t * math.pi * 2.3)) * sy(2)
        drawSoftLine(previousX, previousY, waveX, waveY, withAlpha(palette.holo, 120))
        previousX = waveX
        previousY = waveY
    end
end

local function refreshRadar(ply)
    if CurTime() < nextRadarRefresh then
        return
    end

    nextRadarRefresh = CurTime() + 0.18
    radarCache = {}

    local origin = ply:GetPos()
    local forward = ply:GetForward()
    local right = ply:GetRight()
    local entities = ents.FindInSphere(origin, 2200)

    for _, ent in ipairs(entities) do
        if IsValid(ent) and ent ~= ply then
            local keep = false
            local kind = "object"

            if ent:IsPlayer() then
                keep = ent:Alive()
                kind = "player"
            elseif ent:IsNPC() then
                keep = true
                kind = "npc"
            elseif ent:IsVehicle() then
                keep = true
                kind = "vehicle"
            end

            if keep then
                local offset = ent:GetPos() - origin
                radarCache[#radarCache + 1] = {
                    id = ent:EntIndex(),
                    x = offset:Dot(right),
                    y = offset:Dot(forward),
                    z = offset.z,
                    distance = offset:Length2D(),
                    kind = kind
                }
            end
        end
    end
end

local function drawRadarBlip(x, y, size, col, kind)
    local alphaScale = math.Clamp((col.a or 255) / 255, 0, 1)
    local function fadeTo(alpha)
        return withAlpha(col, math.Clamp(math.floor(alpha * alphaScale), 0, 255))
    end

    if kind == "player" then
        drawSoftCircle(x, y, size + 1, fadeTo(180))
        surface.SetDrawColor(fadeTo(255))
        surface.DrawRect(x - 1, y - 1, 3, 3)
        return
    end

    if kind == "npc" then
        local diamond = {
            { x = x, y = y - size },
            { x = x + size, y = y },
            { x = x, y = y + size },
            { x = x - size, y = y }
        }

        draw.NoTexture()
        surface.SetDrawColor(fadeTo(46))
        surface.DrawPoly(diamond)
        drawPolyOutline(diamond, fadeTo(255))
        return
    end

    if kind == "vehicle" then
        local faded = fadeTo(255)
        drawSoftLine(x - size, y, x + size, y, faded)
        drawSoftLine(x, y - size, x, y + size, faded)
        return
    end

    surface.SetDrawColor(fadeTo(255))
    surface.DrawRect(x - 1, y - 1, 3, 3)
end

local function drawRadar(x, y, width, height, ply)
    local padding = math.max(sp(16), 11)
    local titleY = y + sy(4)
    local titleLineY = titleY + sy(16)
    local footerY = y + height - sy(18)
    local footerLineY = footerY - sy(10)
    local radarTop = titleLineY + sy(14)
    local radarBottom = footerLineY - sy(14)
    local radarRadius = math.min((radarBottom - radarTop) * 0.5, width * 0.34, sy(118))
    local centerX = x + width - padding - radarRadius - sp(4)
    local centerY = radarTop + ((radarBottom - radarTop) * 0.5)
    local radarLeft = centerX - radarRadius
    local radarRight = centerX + radarRadius
    local titleLeft = radarLeft
    local titleRight = radarRight
    local radarPoly = buildCirclePoly(centerX, centerY, radarRadius, 48)
    local radarInnerPoly = buildCirclePoly(centerX, centerY, radarRadius - sp(8), 48)
    local now = CurTime()
    local sweepAngle = (now * 92) % 360
    local sweepPoly = buildSectorPoly(centerX, centerY, radarRadius - sp(6), sweepAngle - 112, sweepAngle - 90, 12)
    local contactCount = 0
    local range = 350
    local usableRadius = radarRadius - sp(10)
    local scanHalfWidth = 11
    local scanCenterAngle = (sweepAngle - scanHalfWidth) % 360
    local footerLeft = radarLeft
    local footerCenter = centerX
    local footerRight = radarRight

    surface.SetDrawColor(withAlpha(palette.holo, 26))
    surface.DrawLine(titleLeft, titleLineY, titleRight, titleLineY)
    surface.DrawLine(footerLeft, footerLineY, footerRight, footerLineY)

    draw.SimpleText("RADAR", "MandoHUD.Section", titleLeft, titleY, palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText("SECTOR SCAN", "MandoHUD.Small", titleRight, titleY + sy(2), palette.textSoft, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.shell, 172))
    surface.DrawPoly(radarPoly)
    surface.SetDrawColor(withAlpha(palette.panel, 136))
    surface.DrawPoly(radarInnerPoly)
    drawPolyOutline(radarPoly, withAlpha(palette.amberSoft, 86))
    drawPolyOutline(radarInnerPoly, withAlpha(palette.holo, 34))
    drawArcLine(centerX, centerY, radarRadius + sp(2), 210, 330, withAlpha(palette.amber, 110), 6)
    drawArcLine(centerX, centerY, radarRadius + sp(2), 30, 150, withAlpha(palette.holo, 84), 6)
    drawArcLine(centerX, centerY, radarRadius + sp(8), 246, 292, withAlpha(palette.amber, 148), 4)
    drawArcLine(centerX, centerY, radarRadius + sp(8), 68, 112, withAlpha(palette.holo, 118), 4)

    surface.SetDrawColor(withAlpha(palette.holo, 18))
    surface.DrawPoly(sweepPoly)

    for ringScale = 0.33, 1, 0.33 do
        drawSoftCircle(centerX, centerY, radarRadius * ringScale, withAlpha(palette.holo, 36))
    end

    for angle = 0, 330, 30 do
        local outerX = centerX + math.cos(math.rad(angle)) * radarRadius
        local outerY = centerY + math.sin(math.rad(angle)) * radarRadius
        local innerDistance = radarRadius - ((angle % 90 == 0) and sp(14) or sp(8))
        local innerX = centerX + math.cos(math.rad(angle)) * innerDistance
        local innerY = centerY + math.sin(math.rad(angle)) * innerDistance
        drawSoftLine(innerX, innerY, outerX, outerY, withAlpha((angle % 90 == 0) and palette.amber or palette.holo, (angle % 90 == 0) and 120 or 60))
    end

    drawSoftLine(centerX - radarRadius, centerY, centerX + radarRadius, centerY, withAlpha(palette.holo, 58))
    drawSoftLine(centerX, centerY - radarRadius, centerX, centerY + radarRadius, withAlpha(palette.holo, 58))

    local sweepX = centerX + math.cos(math.rad(sweepAngle - 90)) * usableRadius
    local sweepY = centerY + math.sin(math.rad(sweepAngle - 90)) * usableRadius
    drawSoftLine(centerX, centerY, sweepX, sweepY, withAlpha(palette.holo, 120))

    local ownship = {
        { x = centerX, y = centerY - sp(10) },
        { x = centerX + sp(7), y = centerY + sp(8) },
        { x = centerX - sp(7), y = centerY + sp(8) }
    }

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.amber, 56))
    surface.DrawPoly(ownship)
    drawPolyOutline(ownship, palette.amber)

    refreshRadar(ply)
    contactCount = #radarCache

    for _, contact in ipairs(radarCache) do
        local offsetX = (contact.x / range) * usableRadius
        local offsetY = -(contact.y / range) * usableRadius
        local offsetLength = math.sqrt((offsetX * offsetX) + (offsetY * offsetY))

        if offsetLength > usableRadius and offsetLength > 0 then
            local scale = usableRadius / offsetLength
            offsetX = offsetX * scale
            offsetY = offsetY * scale
        end

        if offsetLength > 0 then
            local contactAngle = (math.deg(math.atan2(offsetY, offsetX)) + 90) % 360
            if math.abs(math.AngleDifference(contactAngle, scanCenterAngle)) <= scanHalfWidth then
                radarDetections[contact.id] = {
                    detectedAt = now,
                    offsetX = offsetX,
                    offsetY = offsetY,
                    kind = contact.kind
                }
            end
        end
    end

    for contactId, detection in pairs(radarDetections) do
        local age = now - detection.detectedAt
        if age > radarEchoLifetime then
            radarDetections[contactId] = nil
        else
            local color = palette.amber
            local size = sp(4)
            local blipAlpha = 255

            if age > radarEchoHoldTime then
                local fadeProgress = 1 - math.Clamp((age - radarEchoHoldTime) / (radarEchoLifetime - radarEchoHoldTime), 0, 1)
                blipAlpha = math.floor(255 * math.sqrt(fadeProgress))
            end

            if detection.kind == "player" then
                color = palette.holo
                size = sp(4)
            elseif detection.kind == "npc" then
                color = palette.danger
                size = sp(5)
            elseif detection.kind == "vehicle" then
                color = withAlpha(palette.amber, 210)
                size = sp(5)
            end

            if blipAlpha > 0 then
                drawRadarBlip(centerX + detection.offsetX, centerY + detection.offsetY, size, withAlpha(color, blipAlpha), detection.kind)
            end
        end
    end

    draw.SimpleText(string.format("TRACKS %02d", contactCount), "MandoHUD.Small", footerLeft, footerY, palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    draw.SimpleText("RANGE 2.2 KM", "MandoHUD.Small", footerCenter, footerY, palette.textSoft, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText(string.format("%s %03d", getCardinal(ply:EyeAngles().y), getBearing(ply:EyeAngles().y)), "MandoHUD.Body", footerRight, footerY, palette.amber, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
end

local function drawEquipmentBar(x, y, width, height, ratio, label, valueText, fillColor)
    local amount = math.Clamp(ratio or 0, 0, 1)
    local segments = 12
    local gap = math.max(sp(2), 1)
    local innerX = x + 2
    local innerY = y + 2
    local innerWidth = width - 4
    local innerHeight = height - 4
    local segmentWidth = math.max(math.floor((innerWidth - (gap * (segments - 1))) / segments), 3)
    local filledWidth = innerWidth * amount

    surface.SetDrawColor(withAlpha(palette.panelSoft, 116))
    surface.DrawRect(x, y, width, height)
    surface.SetDrawColor(withAlpha(fillColor, 80))
    surface.DrawRect(x, y - 1, math.max(math.floor(width * amount), 0), 1)
    surface.SetDrawColor(withAlpha(palette.holo, 28))
    surface.DrawOutlinedRect(x, y, width, height)

    for segment = 0, segments - 1 do
        local segmentX = innerX + (segment * (segmentWidth + gap))
        local progressAtSegment = filledWidth - (segment * (segmentWidth + gap))
        local drawWidth = math.Clamp(progressAtSegment, 0, segmentWidth)

        if drawWidth > 0 then
            surface.SetDrawColor(drawWidth >= segmentWidth and fillColor or withAlpha(fillColor, 150))
            surface.DrawRect(segmentX, innerY, drawWidth, innerHeight)
        else
            surface.SetDrawColor(withAlpha(fillColor, 18))
            surface.DrawRect(segmentX, innerY, segmentWidth, innerHeight)
        end
    end

    draw.SimpleText(label, "MandoHUD.Small", x, y - sy(12), palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    draw.SimpleText(valueText, "MandoHUD.Small", x + width, y - sy(12), palette.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
end

local function drawEquipment(x, y, width, height, ply)
    local weaponData = getWeaponData(ply)
    local padding = math.max(sp(18), 12)
    local left = x + padding
    local right = x + width - padding
    local innerWidth = right - left
    local bodyX = x + 4
    local bodyY = y + sy(4)
    local bodyW = width - 8
    local bodyH = height - sy(8)
    local bodyCut = math.max(sp(14), 8)
    local titleY = bodyY + sy(6)
    local titleLineY = bodyY + sy(28)
    local weaponBoxY = bodyY + sy(38)
    local weaponBoxH = sy(58)
    local ammoBoxY = weaponBoxY + weaponBoxH + sy(12)
    local ammoBoxH = sy(46)
    local barY = ammoBoxY + ammoBoxH + sy(14)
    local barHeight = sy(12)
    local armorRatio = math.Clamp(ply:Armor() / 100, 0, 1)
    local primaryValueLabel = weaponData.usesAmmo and string.format("%d%%", math.floor(weaponData.ammoRatio * 100)) or "ACTIVE"
    local primaryBarLabel = weaponData.usesAmmo and "MAG CAPACITY" or "SYSTEM LINK"
    local primaryBarRatio = weaponData.usesAmmo and weaponData.ammoRatio or 1
    local primaryBarColor = weaponData.usesAmmo and palette.amber or palette.holo
    local statusPrefix = "STATUS"
    local statusText = "READY"
    local statusColor = palette.holo

    if weaponData.firemodeLabel then
        statusPrefix = "FIREMODE"
        statusText = weaponData.firemodeLabel
        statusColor = getFiremodeColor(weaponData.firemodeLabel)
    elseif weaponData.name == "UNARMED" then
        statusText = "STANDBY"
        statusColor = palette.textSoft
    elseif not weaponData.usesAmmo then
        statusText = "UTILITY"
        statusColor = palette.holo
    elseif (weaponData.clipValue or 0) <= 0 and weaponData.reserveValue <= 0 then
        statusText = "DRY"
        statusColor = palette.danger
    elseif weaponData.clipValue and weaponData.clipValue <= 0 and weaponData.reserveValue > 0 then
        statusText = "RELOAD"
        statusColor = palette.amber
    elseif weaponData.ammoRatio <= 0.25 then
        statusText = "LOW"
        statusColor = palette.danger
    end

    local midX = left + (innerWidth * 0.5)
    local weaponName = fitTextToWidth(weaponData.name, "MandoHUD.Body", innerWidth * 0.58)
    local weaponClass = fitTextToWidth(weaponData.class, "MandoHUD.Small", innerWidth * 0.28)
    local leftDataLabel = weaponData.usesAmmo and "MAG" or "TYPE"
    local leftDataValue = weaponData.usesAmmo and weaponData.clip or "UTILITY"
    local rightDataLabel = weaponData.usesAmmo and "RESERVE" or "AMMO"
    local rightDataValue = weaponData.usesAmmo and weaponData.reserve or "N/A"
    local valueFont = weaponData.usesAmmo and "MandoHUD.Numeric" or "MandoHUD.Body"

    if weaponData.name == "UNARMED" then
        primaryValueLabel = "OFFLINE"
        primaryBarLabel = "WEAPON LINK"
        primaryBarRatio = 0
        primaryBarColor = palette.danger
        leftDataLabel = "LOADOUT"
        leftDataValue = "NONE"
        rightDataLabel = "AMMO"
        rightDataValue = "N/A"
        valueFont = "MandoHUD.Body"
    end

    local bodyPoly = buildCutPanel(bodyX, bodyY, bodyW, bodyH, bodyCut)

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.panel, 138))
    surface.DrawPoly(bodyPoly)
    drawPolyOutline(bodyPoly, withAlpha(palette.amberSoft, 72))
    drawGrid(bodyX, bodyY, bodyW, bodyH, math.max(sp(28), 18))

    draw.SimpleText("EQUIPMENT", "MandoHUD.Section", left, titleY, palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

    surface.SetDrawColor(withAlpha(palette.holo, 24))
    surface.DrawLine(left, titleLineY, right, titleLineY)
    surface.DrawLine(left, weaponBoxY + sy(24), right, weaponBoxY + sy(24))
    surface.DrawLine(left, ammoBoxY + sy(18), right, ammoBoxY + sy(18))
    surface.DrawLine(midX, ammoBoxY + sy(8), midX, ammoBoxY + ammoBoxH - sy(6))
    surface.DrawLine(left, ammoBoxY + ammoBoxH, right, ammoBoxY + ammoBoxH)

    surface.SetDrawColor(withAlpha(palette.amber, 170))
    surface.DrawRect(left, weaponBoxY + weaponBoxH - sy(12), sp(52), 1)
    surface.DrawRect(right - sp(52), weaponBoxY + weaponBoxH - sy(12), sp(52), 1)

    draw.SimpleText("PRIMARY WEAPON", "MandoHUD.Small", left + sp(12), weaponBoxY + sy(8), palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(weaponClass, "MandoHUD.Small", right - sp(12), weaponBoxY + sy(8), palette.textSoft, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    draw.SimpleText(weaponName, "MandoHUD.Body", left + sp(12), weaponBoxY + sy(34), palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(statusPrefix .. " // " .. statusText, "MandoHUD.Small", right - sp(12), weaponBoxY + sy(34), statusColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

    draw.SimpleText(leftDataLabel, "MandoHUD.Small", left + sp(12), ammoBoxY + sy(8), palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(rightDataLabel, "MandoHUD.Small", midX + sp(12), ammoBoxY + sy(8), palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(leftDataValue, valueFont, left + sp(12), ammoBoxY + sy(22), palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(rightDataValue, valueFont, midX + sp(12), ammoBoxY + sy(22), weaponData.usesAmmo and palette.text or palette.holo, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

    drawEquipmentBar(left, barY, innerWidth, barHeight, primaryBarRatio, primaryBarLabel, primaryValueLabel, primaryBarColor)
    drawEquipmentBar(left, barY + sy(34), innerWidth, barHeight, armorRatio, "ARMOR INTEGRITY", string.format("%d%%", math.max(ply:Armor(), 0)), palette.holo)
end

local function drawComms(x, y, width, height, transmission)
    if not transmission then
        return
    end

    local alpha = math.Clamp(transmission.alpha or 255, 0, 255)
    local cut = math.max(sp(14), 8)
    local panelPoly = buildCutPanel(x, y, width, height, cut)
    local left = x + math.max(sp(16), 12)
    local right = x + width - math.max(sp(16), 12)
    local speakerLabel = fitTextToWidth(transmission.frequency .. ' "' .. transmission.label .. '"', "MandoHUD.Body", width * 0.56)
    local stateLabel = transmission.isOutgoing and (transmission.isTalking and "OUTGOING TRANSMISSION" or "OUTGOING MEMORY") or (transmission.isTalking and "INCOMING TRANSMISSION" or "SIGNAL MEMORY")
    local channelLabel = transmission.activeCount and transmission.activeCount > 1 and "SQUAD CHANNEL +" .. tostring(transmission.activeCount - 1) or "SQUAD CHANNEL"
    local waveLeft = x + math.floor(width * 0.56)
    local waveRight = right
    local waveMidY = y + sy(58)
    local waveSpan = math.max(waveRight - waveLeft, sp(48))
    local waveHeight = math.max(sy(14), 10)
    local signalSeed = IsValid(transmission.speaker) and transmission.speaker:EntIndex() or 1
    local voiceLevel = math.Clamp(transmission.voiceLevel or 0.35, 0.05, 1)
    local intensity = transmission.isTalking and math.Clamp(0.35 + (voiceLevel * 1.45), 0.35, 1.55) or 0.32
    local jitter = transmission.isTalking and (0.35 + (voiceLevel * 1.5)) or 0.18

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.panel, math.floor(108 + (alpha * 0.32))))
    surface.DrawPoly(panelPoly)
    drawPolyOutline(panelPoly, withAlpha(palette.amber, math.floor(alpha * 0.82)))

    surface.SetDrawColor(withAlpha(palette.holo, math.floor(alpha * 0.12)))
    surface.DrawLine(left, y + sy(28), right, y + sy(28))
    surface.DrawLine(left, y + sy(64), right, y + sy(64))

    draw.SimpleText("COMMS CHANNEL", "MandoHUD.Small", left, y + sy(8), withAlpha(palette.amber, alpha), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(channelLabel, "MandoHUD.Small", left, y + sy(34), withAlpha(palette.textSoft, math.floor(alpha * 0.92)), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(speakerLabel, "MandoHUD.Body", left, y + sy(50), withAlpha(palette.text, alpha), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(stateLabel, "MandoHUD.Small", right, y + sy(8), withAlpha(transmission.isOutgoing and palette.amber or (transmission.isTalking and palette.holo or palette.textSoft), math.floor(alpha * 0.9)), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

    surface.SetDrawColor(withAlpha(transmission.isTalking and palette.holo or palette.amberSoft, math.floor(alpha * 0.68)))
    surface.DrawRect(left, y + height - sy(14), math.floor((right - left) * math.Clamp(voiceLevel, 0.08, 1)), 1)

    local previousX = waveLeft
    local previousY = waveMidY
    surface.SetDrawColor(withAlpha(palette.amberSoft, math.floor(alpha * 0.4)))

    for offset = 1, waveSpan, 4 do
        local sampleX = waveLeft + offset
        local t = (CurTime() * (7.2 + (intensity * 4.4))) + (offset * 0.062) + (signalSeed * 0.27)
        local envelope = 0.18 + (math.abs(math.sin((offset * 0.068) + (CurTime() * (2.4 + voiceLevel * 7.5)) + signalSeed)) * (0.48 + (voiceLevel * 0.92)))
        local noise = math.sin((offset * 0.19) + (CurTime() * (22 + voiceLevel * 46)) + signalSeed) * jitter
        local amplitude = (math.sin(t * 2.1) + (math.cos(t * 1.15) * 0.7) + (math.sin(t * 3.4 + signalSeed) * 0.36) + noise) * waveHeight * intensity * envelope
        local sampleY = waveMidY + amplitude
        surface.DrawLine(previousX, previousY, sampleX, sampleY)
        previousX = sampleX
        previousY = sampleY
    end

    previousX = waveLeft
    previousY = waveMidY
    surface.SetDrawColor(withAlpha(palette.holo, math.floor(alpha * 0.72)))

    for offset = 1, waveSpan, 4 do
        local sampleX = waveLeft + offset
        local t = (CurTime() * (5.6 + (intensity * 3.2))) + (offset * 0.054) + (signalSeed * 0.19)
        local envelope = 0.16 + (math.abs(math.cos((offset * 0.052) + (CurTime() * (1.8 + voiceLevel * 4.2)) + signalSeed)) * (0.36 + (voiceLevel * 0.58)))
        local noise = math.cos((offset * 0.13) + (CurTime() * (16 + voiceLevel * 28)) + signalSeed) * jitter * 0.32
        local amplitude = (math.sin(t * 1.8) + (math.cos(t * 0.9) * 0.55) + noise) * waveHeight * 0.42 * intensity * envelope
        local sampleY = waveMidY + amplitude
        surface.DrawLine(previousX, previousY, sampleX, sampleY)
        previousX = sampleX
        previousY = sampleY
    end
end

local function drawTargetTelemetry(x, y, width, height, ply)
    drawPanel(x, y, width, height, "MANDALORIAN LINK")

    local target = getTargetData(ply)
    local left = x + math.max(sp(18), 12)
    local currentY = y + sy(44)
    local lineGap = math.max(sy(34), 26)
    local creedLines = {
        "HONOR IS FORGED IN STEEL.",
        "LOYALTY OUTLASTS FEAR.",
        "THIS IS THE WAY."
    }

    draw.SimpleText("CREED", "MandoHUD.Small", left, currentY, palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    currentY = currentY + sy(18)

    for _, line in ipairs(creedLines) do
        draw.SimpleText(line, "MandoHUD.Body", left, currentY, palette.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        currentY = currentY + sy(20)
    end

    currentY = currentY + sy(16)
    draw.SimpleText("TARGET TELEMETRY", "MandoHUD.Section", left, currentY, palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    currentY = currentY + sy(28)

    local function drawField(label, value)
        draw.SimpleText(label, "MandoHUD.Small", left, currentY, palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        draw.SimpleText(value, "MandoHUD.Body", x + width - math.max(sp(18), 12), currentY, palette.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
        currentY = currentY + lineGap
    end

    drawField("CONTACT", target.label)
    drawField("RANGE", target.range)
    drawField("SIGN", target.health)
    drawField("THREAT", target.threat)
    drawField("MODE", target.mode)
    drawField("MAP", getMapLabel(18))
end

local function drawVitals(x, y, width, height, ply)
    local healthMax = 100
    if ply.GetMaxHealth then
        healthMax = math.max(ply:GetMaxHealth(), 100)
    end

    local healthRatio = math.Clamp(ply:Health() / healthMax, 0, 1)
    local armorRatio = math.Clamp(ply:Armor() / 100, 0, 1)
    local padding = math.max(sp(14), 9)
    local traceLeft = x + padding + sp(10)
    local traceRight = x + width - padding - 400
    local armorStartY = y + sy(80)
    local armorEndY = y + sy(140)
    local healthStartY = y + sy(98)
    local healthEndY = y + sy(158)
    local staminaStartY = y + sy(122)
    local staminaEndY = y + sy(182)
    local traceStyle

    if currentHUDProfile == "clone" then
        traceRight = x + width - padding - sp(28)
        armorStartY = y + sy(66)
        armorEndY = y + sy(100)
        healthStartY = y + sy(80)
        healthEndY = y + sy(120)
        staminaStartY = y + sy(102)
        staminaEndY = y + sy(145)
        traceStyle = {
            curveDepth = sy(22),
            valueInset = sp(18),
            valueAboveLift = sy(16),
            valueBelowDrop = -sy(2),
            valueSkewStep = math.max((ScrH() / 1080) * 0.82, 1)
        }
    end

    drawVitalsEdgeTrace(
        traceLeft,
        armorStartY,
        traceRight,
        armorEndY,
        armorRatio,
        "ARMOR",
        tostring(math.max(ply:Armor(), 0)) .. " / 100",
        palette.blue,
        "above",
        nil,
        traceStyle
    )

    drawVitalsEdgeTrace(
        traceLeft,
        healthStartY,
        traceRight,
        healthEndY,
        healthRatio,
        "HEALTH",
        tostring(math.max(ply:Health(), 0)) .. " / " .. tostring(healthMax),
        palette.red,
        "below",
        nil,
        traceStyle
    )

    local staminaValue = math.Clamp(ply:GetLocalVar("stm", 100), 0, 100)
    drawVitalsEdgeTrace(
        traceLeft,
        staminaStartY,
        traceRight,
        staminaEndY,
        staminaValue / 100,
        "STAMINA",
        tostring(math.floor(staminaValue)) .. " / 100",
        palette.ylw,
        "below",
        nil,
        traceStyle
    )
end

local function drawEquipmentSide(x, y, width, height, ply)
    local weaponData = getWeaponData(ply)
    local padding = math.max(sp(14), 9)
    local left = x + padding + sp(10)
    local right = x + width - padding
    local innerWidth = right - left
    local titleY = y + sy(6)
    local metaY = titleY + sy(26)
    local infoY = metaY + sy(22)
    local nameFont = "MandoHUD.Body"
    local cloneInfoWidth = innerWidth * 0.34
    local primaryBarLabel = weaponData.usesAmmo and "MAG CAPACITY" or "SYSTEM LINK"
    local primaryValueLabel = weaponData.usesAmmo and string.format("%d%%", math.floor(weaponData.ammoRatio * 100)) or "ACTIVE"
    local primaryBarRatio = weaponData.usesAmmo and weaponData.ammoRatio or 1
    local primaryBarColor = weaponData.usesAmmo and palette.amber or palette.holo
    local reserveLabel = weaponData.usesAmmo and "MAG / RESERVE" or "LOADOUT"
    local reserveValue = weaponData.usesAmmo and string.format("%s // %s", weaponData.clip, weaponData.reserve) or "UTILITY // LINK"
    local reserveRatio = weaponData.usesAmmo and math.Clamp(weaponData.reserveValue / 180, 0, 1) or primaryBarRatio
    local reserveColor = weaponData.usesAmmo and palette.text or palette.holo
    local statusPrefix = "STATUS"
    local statusText = "READY"
    local statusColor = palette.holo
    local primaryTraceStartY = y + sy(82)
    local primaryTraceEndY = y + sy(132)
    local traceGap = sy(22)
    local reserveTraceStartY = primaryTraceStartY + traceGap
    local reserveTraceEndY = primaryTraceEndY + traceGap
    local traceStyle

    if currentHUDProfile == "clone" then
        metaY = titleY + sy(24)
        infoY = metaY + sy(30)
        nameFont = "MandoHUD.Small"
        primaryTraceStartY = y + sy(70)
        primaryTraceEndY = y + sy(110)
        traceGap = sy(18)
        reserveTraceStartY = primaryTraceStartY + traceGap
        reserveTraceEndY = primaryTraceEndY + traceGap
        traceStyle = {
            curveDepth = sy(18),
            labelOffset = sy(12),
            valueInset = sp(18),
            valueAboveLift = sy(16),
            valueBelowDrop = -sy(6),
            valueSkewStep = math.max((ScrH() / 1080) * 0.82, 1)
        }
    end

    if weaponData.firemodeLabel then
        statusPrefix = "FIREMODE"
        statusText = weaponData.firemodeLabel
        statusColor = getFiremodeColor(weaponData.firemodeLabel)
    elseif weaponData.name == "UNARMED" then
        primaryBarLabel = "WEAPON LINK"
        primaryValueLabel = "OFFLINE"
        primaryBarRatio = 0
        primaryBarColor = palette.danger
        reserveLabel = "LOADOUT"
        reserveValue = "NONE // N/A"
        reserveRatio = 0
        reserveColor = palette.textSoft
        statusText = "STANDBY"
        statusColor = palette.textSoft
    elseif not weaponData.usesAmmo then
        statusText = "UTILITY"
    elseif (weaponData.clipValue or 0) <= 0 and weaponData.reserveValue <= 0 then
        statusText = "DRY"
        statusColor = palette.danger
    elseif weaponData.clipValue and weaponData.clipValue <= 0 and weaponData.reserveValue > 0 then
        statusText = "RELOAD"
        statusColor = palette.amber
    elseif weaponData.ammoRatio <= 0.25 then
        statusText = "LOW"
        statusColor = palette.danger
    end

    local weaponName = fitTextToWidth(weaponData.name, nameFont, currentHUDProfile == "clone" and cloneInfoWidth or (innerWidth * 0.52))
    local weaponClass = fitTextToWidth(weaponData.class, "MandoHUD.Small", currentHUDProfile == "clone" and cloneInfoWidth or (innerWidth * 0.38))
    local statusLine = fitTextToWidth(statusPrefix .. " // " .. statusText, "MandoHUD.Small", currentHUDProfile == "clone" and cloneInfoWidth or (innerWidth * 0.42))

    draw.SimpleText("EQUIPMENT", "MandoHUD.Section", right, titleY, palette.amber, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    surface.SetDrawColor(withAlpha(palette.holo, 28))
    surface.DrawLine(left + sp(108), titleY + sy(10), right, titleY + sy(10))

    draw.SimpleText("PRIMARY WEAPON", "MandoHUD.Small", right, metaY, palette.textSoft, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    draw.SimpleText(weaponClass, "MandoHUD.Small", left, metaY, palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(weaponName, nameFont, right, infoY, palette.amber, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    draw.SimpleText(statusLine, "MandoHUD.Small", left, infoY, statusColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

    drawVitalsEdgeTrace(
        right,
        primaryTraceStartY,
        left,
        primaryTraceEndY,
        primaryBarRatio,
        primaryBarLabel,
        primaryValueLabel,
        primaryBarColor,
        "above",
        true,
        traceStyle
    )

    drawVitalsEdgeTrace(
        right,
        reserveTraceStartY,
        left,
        reserveTraceEndY,
        reserveRatio,
        reserveLabel,
        reserveValue,
        reserveColor,
        "below",
        true,
        traceStyle
    )
end

local function drawArc(cx, cy, radius, startAngle, endAngle, thickness, col)
    local stepCount = math.max(math.floor((endAngle - startAngle) / 4), 4)
    local angleStep = (endAngle - startAngle) / stepCount

    surface.SetDrawColor(col)

    for offset = 0, thickness - 1 do
        local currentRadius = radius + offset
        local previousX = cx + math.cos(math.rad(startAngle)) * currentRadius
        local previousY = cy + math.sin(math.rad(startAngle)) * currentRadius

        for step = 1, stepCount do
            local angle = startAngle + (angleStep * step)
            local nextX = cx + math.cos(math.rad(angle)) * currentRadius
            local nextY = cy + math.sin(math.rad(angle)) * currentRadius
            surface.DrawLine(previousX, previousY, nextX, nextY)
            previousX = nextX
            previousY = nextY
        end
    end
end

/*local function drawReticle(compactMode)
    local ply = LocalPlayer()
    local centerX = ScrW() * 0.5
    local centerY = ScrH() * (compactMode and 0.5 or 0.52)
    local movementRatio = 0
    local trace

    if IsValid(ply) then
        movementRatio = select(1, getMovementPercent(ply))
        trace = ply:GetEyeTrace()
    end

    local spread = movementRatio * sp(compactMode and 1.4 or 2.1)
    local pulse = math.sin(CurTime() * 2.8) * sp(0.45)
    local arcRadius = math.max(sp(compactMode and 10 or 13), compactMode and 7 or 9) + spread + pulse
    local coreSize = math.max(sp(compactMode and 1.5 or 2.1), 1)
    local boxHalfW = math.max(sp(compactMode and 2.6 or 3.5), 2)
    local boxHalfH = math.max(sp(compactMode and 2.6 or 3.5), 2)
    local boxCorner = math.max(sp(1.4), 1)
    local sideGap = arcRadius + sp(compactMode and 2 or 3)
    local sideLength = math.max(sp(compactMode and 4.5 or 6), 4)
    local topTickY = centerY - arcRadius + sy(1)
    local bottomTickY = centerY + arcRadius - sy(1)
    local coreColor = palette.amber
    local accentColor = palette.holo

    if trace and trace.Hit and not trace.HitSky and IsValid(trace.Entity) then
        local entity = trace.Entity
        if (entity.IsPlayer and entity:IsPlayer()) or (entity.IsNPC and entity:IsNPC()) then
            coreColor = palette.danger
            accentColor = withAlpha(palette.danger, 210)
        else
            accentColor = palette.holo
        end
    end

    drawArc(centerX, centerY, arcRadius, 254, 286, 2, palette.amber)
    drawArc(centerX, centerY, arcRadius, 74, 106, 2, withAlpha(palette.amber, 210))

    drawSoftLine(centerX - sideGap - sideLength, centerY, centerX - sideGap, centerY, withAlpha(accentColor, 112))
    drawSoftLine(centerX + sideGap, centerY, centerX + sideGap + sideLength, centerY, withAlpha(accentColor, 112))
    drawSoftLine(centerX - sp(1.5), topTickY, centerX + sp(1.5), topTickY, withAlpha(palette.holo, 108))
    drawSoftLine(centerX - sp(1.5), bottomTickY, centerX + sp(1.5), bottomTickY, withAlpha(palette.holo, 108))

    drawSoftLine(centerX - boxHalfW, centerY - boxHalfH, centerX - boxHalfW + boxCorner, centerY - boxHalfH, accentColor)
    drawSoftLine(centerX - boxHalfW, centerY - boxHalfH, centerX - boxHalfW, centerY - boxHalfH + boxCorner, accentColor)
    drawSoftLine(centerX - boxHalfW, centerY + boxHalfH, centerX - boxHalfW + boxCorner, centerY + boxHalfH, accentColor)
    drawSoftLine(centerX - boxHalfW, centerY + boxHalfH, centerX - boxHalfW, centerY + boxHalfH - boxCorner, accentColor)
    drawSoftLine(centerX + boxHalfW - boxCorner, centerY - boxHalfH, centerX + boxHalfW, centerY - boxHalfH, accentColor)
    drawSoftLine(centerX + boxHalfW, centerY - boxHalfH, centerX + boxHalfW, centerY - boxHalfH + boxCorner, accentColor)
    drawSoftLine(centerX + boxHalfW - boxCorner, centerY + boxHalfH, centerX + boxHalfW, centerY + boxHalfH, accentColor)
    drawSoftLine(centerX + boxHalfW, centerY + boxHalfH - boxCorner, centerX + boxHalfW, centerY + boxHalfH, accentColor)

    local coreDiamond = {
        { x = centerX, y = centerY - coreSize },
        { x = centerX + coreSize, y = centerY },
        { x = centerX, y = centerY + coreSize },
        { x = centerX - coreSize, y = centerY }
    }

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(coreColor, 34))
    surface.DrawPoly(coreDiamond)
    drawPolyOutline(coreDiamond, coreColor)
    drawSoftCircle(centerX, centerY, math.max(sp(compactMode and 1.2 or 1.6), 1), coreColor)
end*/

local function drawThirdPersonStatusBar(x, y, width, ratio, label, valueText, fillColor)
    local amount = math.Clamp(ratio or 0, 0, 1)
    local height = sy(9)

    surface.SetDrawColor(withAlpha(palette.panel, 166))
    surface.DrawRect(x, y, width, height)
    surface.SetDrawColor(withAlpha(fillColor, 44))
    surface.DrawOutlinedRect(x, y, width, height)
    surface.SetDrawColor(fillColor)
    surface.DrawRect(x + 1, y + 1, math.max(math.floor((width - 2) * amount), 0), height - 2)

    draw.SimpleText(label, "MandoHUD.Small", x, y - sy(10), palette.textSoft, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    draw.SimpleText(valueText, "MandoHUD.Small", x + width, y - sy(10), palette.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
end

local function drawThirdPersonHUD(ply, commsTransmission)
    local sw = ScrW()
    local sh = ScrH()
    local healthValue, healthMax, healthRatio = getPlayerHealthState(ply)
    local armorValue = math.max(ply:Armor(), 0)
    local armorRatio = math.Clamp(armorValue / 100, 0, 1)
    local barWidth = math.min(sw * 0.16, sx(250))
    local left = sx(28)
    local baseY = sh - sy(86)
    local freq = getComlinkFrequencyForPlayer(ply)

    if freq ~= "" then
        draw.SimpleText("COMLINK // " .. freq, "MandoHUD.Small", left, baseY - sy(34), palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    end

    drawThirdPersonStatusBar(left, baseY, barWidth, healthRatio, "HEALTH", string.format("%d / %d", healthValue, healthMax), palette.amber)
    drawThirdPersonStatusBar(left, baseY + sy(24), barWidth, armorRatio, "ARMOR", string.format("%d / 100", armorValue), palette.holo)
    //drawReticle(true)

    if commsTransmission then
        local commsW = math.min(sw * 0.19, sx(360))
        local commsH = sy(88)
        local commsX = sw - commsW - sx(28)
        local commsY = sh - commsH - sy(112)
        drawComms(commsX, commsY, commsW, commsH, commsTransmission)
    end
end

local function drawCompass(ply, x, y, width, height)
    width = width or math.min(ScrW() * 0.38, sx(720))
    height = height or sy(72)
    x = x or ((ScrW() * 0.5) - (width * 0.5))
    y = y or (ScrH() - height - sy(28))
    local rawBearing = math.NormalizeAngle(ply:EyeAngles().y or 0)
    if rawBearing < 0 then
        rawBearing = rawBearing + 360
    end

    local bearing = math.floor(rawBearing)
    local bearingText = string.format("%03d", bearing)
    local headingText = "HEADING"
    local headingCardinal = getCardinal(rawBearing)
    local centerX = x + (width * 0.5)
    local stripTop = y + sy(39)
    local baseline = y + height - sy(10)
    local sideInset = math.max(sp(18), 12)
    local stripInset = math.max(sp(42), 30)
    local stripLeft = x + stripInset
    local stripRight = x + width - stripInset
    local plateWidth = math.max(sp(96), 70)
    local plateHeight = sy(20)
    local plateCut = math.max(sp(7), 5)
    local plateLeft = centerX - (plateWidth * 0.5)
    local plateRight = centerX + (plateWidth * 0.5)
    local plateTop = y + sy(12)
    local titleY = y + sy(17)
    local startMark = (math.floor(rawBearing / 5) * 5) - 65
    local endMark = (math.floor(rawBearing / 5) * 5) + 65

    surface.SetFont("MandoHUD.Body")
    local headingTextW = surface.GetTextSize(headingText)
    local cardinalTextW = surface.GetTextSize(headingCardinal)
    local clipLeft = math.max(stripLeft, x + sideInset + headingTextW + sp(22))
    local clipRight = math.min(stripRight, x + width - sideInset - cardinalTextW - sp(22))
    local pixelsPerDegree = (clipRight - clipLeft) / 110
    local valuePlate = buildCutPanel(plateLeft, plateTop, plateWidth, plateHeight, plateCut)
    surface.SetFont("MandoHUD.Bearing")
    local _, bearingTextH = surface.GetTextSize(bearingText)
    local bearingTextY = plateTop + math.floor((plateHeight - bearingTextH) * 0.5) + sy(1)

    drawSoftLine(x + sideInset, stripTop, plateLeft - sp(14), stripTop, withAlpha(palette.holo, 34))
    drawSoftLine(plateRight + sp(14), stripTop, x + width - sideInset, stripTop, withAlpha(palette.holo, 34))
    drawSoftLine(stripLeft, baseline, stripRight, baseline, withAlpha(palette.holo, 76))
    drawSoftLine(x + sideInset + sp(6), stripTop + sy(4), stripLeft, baseline, withAlpha(palette.amberSoft, 112))
    drawSoftLine(x + width - sideInset - sp(6), stripTop + sy(4), stripRight, baseline, withAlpha(palette.amberSoft, 112))
    drawSoftLine(plateLeft - sp(10), stripTop, plateLeft - sp(4), stripTop, withAlpha(palette.amber, 150))
    drawSoftLine(plateRight + sp(4), stripTop, plateRight + sp(10), stripTop, withAlpha(palette.amber, 150))

    draw.SimpleText(headingText, "MandoHUD.Body", x + sideInset, titleY, palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(headingCardinal, "MandoHUD.Body", x + width - sideInset, titleY + sy(1), palette.textSoft, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

    if clipRight > clipLeft then
        render.SetScissorRect(clipLeft, stripTop - sy(4), clipRight, baseline + sy(2), true)
    end

    surface.SetDrawColor(withAlpha(palette.holo, 18))
    for gridOffset = -50, 50, 10 do
        local gridX = centerX + (gridOffset * pixelsPerDegree)
        surface.DrawLine(gridX, stripTop + sy(6), gridX, baseline - sy(2))
    end

    for mark = startMark, endMark, 5 do
        local markBearing = ((mark % 360) + 360) % 360
        local delta = math.AngleDifference(markBearing, rawBearing)
        local tickX = centerX + (delta * pixelsPerDegree)
        local isCardinalStep = markBearing % 90 == 0
        local isIntercardinalStep = markBearing % 45 == 0 and not isCardinalStep
        local isMajor = markBearing % 15 == 0
        local tickTop = baseline - sy(10)
        local tickColor = palette.amberSoft

        if isCardinalStep then
            tickTop = baseline - sy(20)
            tickColor = palette.amber
        elseif isIntercardinalStep then
            tickTop = baseline - sy(16)
            tickColor = withAlpha(palette.amber, 170)
        elseif isMajor then
            tickTop = baseline - sy(13)
            tickColor = withAlpha(palette.amber, 180)
        end

        surface.SetDrawColor(tickColor)
        surface.DrawLine(tickX, tickTop, tickX, baseline)
    end

    if clipRight > clipLeft then
        render.SetScissorRect(0, 0, 0, 0, false)
    end

    draw.NoTexture()
    surface.SetDrawColor(withAlpha(palette.shell, 212))
    surface.DrawPoly(valuePlate)
    drawPolyOutline(valuePlate, withAlpha(palette.amber, 176))
    surface.SetDrawColor(withAlpha(palette.holo, 44))
    surface.DrawLine(plateLeft + sp(10), plateTop + sy(4), plateRight - sp(10), plateTop + sy(4))
    drawSoftLine(plateLeft - sp(10), plateTop + (plateHeight * 0.5), plateLeft - sp(5), plateTop + (plateHeight * 0.5), withAlpha(palette.amberSoft, 118))
    drawSoftLine(plateRight + sp(5), plateTop + (plateHeight * 0.5), plateRight + sp(10), plateTop + (plateHeight * 0.5), withAlpha(palette.amberSoft, 118))

    surface.SetDrawColor(withAlpha(palette.holo, 110))
    surface.DrawLine(centerX, plateTop + plateHeight + sy(1), centerX, baseline)
    surface.DrawLine(centerX - sp(8), stripTop - sy(3), centerX + sp(8), stripTop - sy(3))

    draw.SimpleText(bearingText, "MandoHUD.Bearing", centerX, bearingTextY + sy(1), withAlpha(palette.holo, 34), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    draw.SimpleText(bearingText, "MandoHUD.Bearing", centerX, bearingTextY, palette.amber, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
end

local function drawHelmetShell()
    local sw = ScrW()
    local sh = ScrH()
    local shellOuter
    local shellInner
    local rimOuter
    local rimInner

    if currentHUDProfile == "clone" then
        shellOuter = Color(8, 12, 18, 238)
        shellInner = Color(18, 24, 32, 180)
        rimOuter = Color(142, 152, 168, 132)
        rimInner = Color(74, 86, 98, 120)
    else
        shellOuter = Color(4, 6, 9, 240)
        shellInner = Color(14, 18, 24, 170)
        rimOuter = Color(74, 78, 86, 140)
        rimInner = Color(36, 40, 46, 116)
    end

    local function mirrorPoly(poly)
        local mirrored = {}
        for index = #poly, 1, -1 do
            mirrored[#mirrored + 1] = {
                x = sw - poly[index].x,
                y = poly[index].y
            }
        end

        return mirrored
    end

    local function drawHelmetPlate(poly, innerPoly)
        draw.NoTexture()
        surface.SetDrawColor(shellOuter)
        surface.DrawPoly(poly)
        surface.SetDrawColor(shellInner)
        surface.DrawPoly(innerPoly)
        drawPolyOutline(poly, rimOuter)
        drawPolyOutline(innerPoly, rimInner)
    end

    local function drawHelmetMask(poly)
        draw.NoTexture()
        surface.SetDrawColor(shellOuter)
        surface.DrawPoly(poly)
        drawPolyOutline(poly, withAlpha(rimOuter, 96))
    end

    local function drawOpenPolyline(points, col)
        for index = 1, #points - 1 do
            local pointA = points[index]
            local pointB = points[index + 1]
            drawSoftLine(pointA.x, pointA.y, pointB.x, pointB.y, col)
        end
    end

    local function drawGlowingPolyline(points, coreCol, glowCol)
        for index = 1, #points - 1 do
            local pointA = points[index]
            local pointB = points[index + 1]

            drawSoftLine(pointA.x - 3, pointA.y, pointB.x - 3, pointB.y, withAlpha(glowCol, 12))
            drawSoftLine(pointA.x + 3, pointA.y, pointB.x + 3, pointB.y, withAlpha(glowCol, 12))
            drawSoftLine(pointA.x, pointA.y - 3, pointB.x, pointB.y - 3, withAlpha(glowCol, 12))
            drawSoftLine(pointA.x, pointA.y + 3, pointB.x, pointB.y + 3, withAlpha(glowCol, 12))

            drawSoftLine(pointA.x - 2, pointA.y, pointB.x - 2, pointB.y, withAlpha(glowCol, 22))
            drawSoftLine(pointA.x + 2, pointA.y, pointB.x + 2, pointB.y, withAlpha(glowCol, 22))
            drawSoftLine(pointA.x, pointA.y - 2, pointB.x, pointB.y - 2, withAlpha(glowCol, 22))
            drawSoftLine(pointA.x, pointA.y + 2, pointB.x, pointB.y + 2, withAlpha(glowCol, 22))

            drawSoftLine(pointA.x - 1, pointA.y, pointB.x - 1, pointB.y, withAlpha(glowCol, 40))
            drawSoftLine(pointA.x + 1, pointA.y, pointB.x + 1, pointB.y, withAlpha(glowCol, 40))
            drawSoftLine(pointA.x, pointA.y - 1, pointB.x, pointB.y - 1, withAlpha(glowCol, 40))
            drawSoftLine(pointA.x, pointA.y + 1, pointB.x, pointB.y + 1, withAlpha(glowCol, 40))

            drawSoftLine(pointA.x, pointA.y, pointB.x, pointB.y, withAlpha(glowCol, 110))
            drawSoftLine(pointA.x, pointA.y, pointB.x, pointB.y, withAlpha(coreCol, 86))
            drawSoftLine(pointA.x, pointA.y, pointB.x, pointB.y, coreCol)
        end
    end

    local function buildBlendLine(outerPoly, innerPoly, indices, blend)
        local points = {}
        local t = blend or 0.5

        for _, polyIndex in ipairs(indices) do
            local outerPoint = outerPoly[polyIndex]
            local innerPoint = innerPoly[polyIndex]
            points[#points + 1] = {
                x = Lerp(t, outerPoint.x, innerPoint.x),
                y = Lerp(t, outerPoint.y, innerPoint.y)
            }
        end

        return points
    end

    local function pickPolyline(poly, indices)
        local points = {}

        for _, polyIndex in ipairs(indices) do
            local point = poly[polyIndex]
            points[#points + 1] = {
                x = point.x,
                y = point.y
            }
        end

        return points
    end

    local function offsetPolyline(points, offsetX, offsetY)
        local shifted = {}
        local dx = offsetX or 0
        local dy = offsetY or 0

        for index = 1, #points do
            shifted[index] = {
                x = points[index].x + dx,
                y = points[index].y + dy
            }
        end

        return shifted
    end

    local topShell
    local topShellInner
    local bottomLeftShell
    local bottomRightShell
    local topTrim
    local bottomLeftTrim
    local bottomRightTrim

    if currentHUDProfile == "clone" then
        local bottomShellDrop = sy(36)

        topShell = {
            { x = 0, y = 0 },
            { x = sw, y = 0 },
            { x = sw, y = sy(54) },
            { x = sw * 0.97, y = sy(62) },
            { x = sw * 0.90, y = sy(70) },
            { x = sw * 0.80, y = sy(78) },
            { x = sw * 0.68, y = sy(84) },
            { x = sw * 0.58, y = sy(88) },
            { x = sw * 0.54, y = sy(89) },
            { x = sw * 0.51, y = sy(92) },
            { x = sw * 0.49, y = sy(92) },
            { x = sw * 0.46, y = sy(89) },
            { x = sw * 0.42, y = sy(88) },
            { x = sw * 0.32, y = sy(84) },
            { x = sw * 0.20, y = sy(78) },
            { x = sw * 0.10, y = sy(70) },
            { x = sw * 0.03, y = sy(60) },
            { x = 0, y = sy(52) }
        }
        topShellInner = {
            { x = sx(12), y = sy(10) },
            { x = sw - sx(12), y = sy(10) },
            { x = sw - sx(14), y = sy(50) },
            { x = sw * 0.966, y = sy(57) },
            { x = sw * 0.894, y = sy(64) },
            { x = sw * 0.796, y = sy(72) },
            { x = sw * 0.682, y = sy(78) },
            { x = sw * 0.584, y = sy(82) },
            { x = sw * 0.544, y = sy(83) },
            { x = sw * 0.512, y = sy(86) },
            { x = sw * 0.488, y = sy(86) },
            { x = sw * 0.456, y = sy(83) },
            { x = sw * 0.416, y = sy(82) },
            { x = sw * 0.318, y = sy(78) },
            { x = sw * 0.204, y = sy(72) },
            { x = sw * 0.106, y = sy(64) },
            { x = sw * 0.034, y = sy(56) },
            { x = sx(12), y = sy(48) }
        }
        bottomLeftShell = {
            { x = 0, y = sh },
            { x = 0, y = sh - sy(138) + bottomShellDrop },
            { x = sw * 0.12, y = sh - sy(134) + bottomShellDrop },
            { x = sw * 0.24, y = sh - sy(128) + bottomShellDrop },
            { x = sw * 0.34, y = sh - sy(120) + bottomShellDrop },
            { x = sw * 0.41, y = sh - sy(108) + bottomShellDrop },
            { x = sw * 0.455, y = sh - sy(80) + bottomShellDrop },
            { x = sw * 0.468, y = sh }
        }
        bottomRightShell = mirrorPoly(bottomLeftShell)
        topTrim = offsetPolyline(pickPolyline(topShell, {
            18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3
        }), 0, sy(12))
        bottomLeftTrim = offsetPolyline(pickPolyline(bottomLeftShell, {
            2, 3, 4, 5, 6, 7
        }), 0, -sy(12))
        bottomRightTrim = offsetPolyline(pickPolyline(bottomRightShell, {
            2, 3, 4, 5, 6, 7
        }), 0, -sy(12))
    else
        local bottomShellDrop = sy(48)

        topShell = {
            { x = 0, y = 0 },
            { x = sw, y = 0 },
            { x = sw, y = sy(42) },
            { x = sw * 0.96, y = sy(54) },
            { x = sw * 0.90, y = sy(66) },
            { x = sw * 0.82, y = sy(76) },
            { x = sw * 0.72, y = sy(82) },
            { x = sw * 0.60, y = sy(86) },
            { x = sw * 0.54, y = sy(86) },
            { x = sw * 0.51, y = sy(90) },
            { x = sw * 0.49, y = sy(90) },
            { x = sw * 0.46, y = sy(86) },
            { x = sw * 0.40, y = sy(86) },
            { x = sw * 0.28, y = sy(82) },
            { x = sw * 0.18, y = sy(74) },
            { x = sw * 0.10, y = sy(62) },
            { x = sw * 0.04, y = sy(52) },
            { x = 0, y = sy(44) }
        }
        topShellInner = {
            { x = sx(10), y = sy(8) },
            { x = sw - sx(10), y = sy(8) },
            { x = sw - sx(12), y = sy(40) },
            { x = sw * 0.954, y = sy(50) },
            { x = sw * 0.892, y = sy(60) },
            { x = sw * 0.812, y = sy(70) },
            { x = sw * 0.714, y = sy(76) },
            { x = sw * 0.602, y = sy(80) },
            { x = sw * 0.546, y = sy(80) },
            { x = sw * 0.512, y = sy(84) },
            { x = sw * 0.488, y = sy(84) },
            { x = sw * 0.454, y = sy(80) },
            { x = sw * 0.398, y = sy(80) },
            { x = sw * 0.286, y = sy(76) },
            { x = sw * 0.186, y = sy(68) },
            { x = sw * 0.108, y = sy(58) },
            { x = sw * 0.046, y = sy(48) },
            { x = sx(10), y = sy(42) }
        }
        bottomLeftShell = {
            { x = 0, y = sh },
            { x = 0, y = sh - sy(154) + bottomShellDrop },
            { x = sw * 0.10, y = sh - sy(150) + bottomShellDrop },
            { x = sw * 0.22, y = sh - sy(140) + bottomShellDrop },
            { x = sw * 0.32, y = sh - sy(126) + bottomShellDrop },
            { x = sw * 0.39, y = sh - sy(110) + bottomShellDrop },
            { x = sw * 0.424, y = sh - sy(96) + bottomShellDrop },
            { x = sw * 0.434, y = sh }
        }
        bottomRightShell = mirrorPoly(bottomLeftShell)
        topTrim = offsetPolyline(pickPolyline(topShell, {
            18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3
        }), 0, sy(10))
        bottomLeftTrim = offsetPolyline(pickPolyline(bottomLeftShell, {
            2, 3, 4, 5, 6, 7
        }), 0, -sy(10))
        bottomRightTrim = offsetPolyline(pickPolyline(bottomRightShell, {
            2, 3, 4, 5, 6, 7
        }), 0, -sy(10))
    end

    drawHelmetPlate(topShell, topShellInner)
    drawHelmetMask(bottomLeftShell)
    drawHelmetMask(bottomRightShell)

    local visorLine = currentHUDProfile == "clone" and withAlpha(palette.text, 210) or withAlpha(palette.amber, 196)
    local visorGlow = currentHUDProfile == "clone" and withAlpha(palette.holo, 92) or withAlpha(palette.holo, 72)

    drawGlowingPolyline(topTrim, visorLine, visorGlow)
    drawGlowingPolyline(bottomLeftTrim, visorLine, visorGlow)
    drawGlowingPolyline(bottomRightTrim, visorLine, visorGlow)

end

hook.Add("HUDShouldDraw", "MandoHUD.HideDefaultHUD", function(name)
    local ply = LocalPlayer()
    if not isHUDActive(ply) then
        return
    end

    if hiddenElements[name] then
        return false
    end
end)

concommand.Add("mandohud_toggle", function()
    RunConsoleCommand("cl_mandohud_enabled", cvEnabled:GetBool() and "0" or "1")
end)

/*hook.Add("Think", "MandoHUD.ToggleThirdPerson", function()
    local keyDown = input.IsKeyDown(KEY_T)
    if keyDown and not wasThirdPersonToggleDown and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not IsValid(vgui.GetKeyboardFocus()) then
        local ply = LocalPlayer()
        if IsValid(ply) and ply:Alive() then
            thirdPersonEnabled = not thirdPersonEnabled
        end
    end

    wasThirdPersonToggleDown = keyDown
end)

hook.Add("CalcView", "MandoHUD.ThirdPersonCamera", function(ply, origin, angles, fov)
    if not isThirdPersonActive(ply) then
        return
    end

    local targetOffset = Vector(thirdPersonSideOffset, 0, thirdPersonHeight)
    local desiredOrigin = origin
        - (angles:Forward() * thirdPersonDistance)
        + (angles:Right() * targetOffset.x)
        + (angles:Up() * targetOffset.z)

    local trace = util.TraceHull({
        start = origin,
        endpos = desiredOrigin,
        mins = Vector(-4, -4, -4),
        maxs = Vector(4, 4, 4),
        filter = ply
    })

    return {
        origin = trace.Hit and (trace.HitPos + (trace.HitNormal * 4)) or desiredOrigin,
        angles = angles,
        fov = fov,
        drawviewer = true
    }
end)

hook.Add("ShouldDrawLocalPlayer", "MandoHUD.DrawLocalPlayerThirdPerson", function(ply)
    if isThirdPersonActive(ply or LocalPlayer()) then
        return true
    end
end)*/

hook.Add("HUDPaint", "MandoHUD.DrawHelmetHUD", function()
    local ply = LocalPlayer()
    if not IsValid(ply) or not isnumber(FACTION_CLONE) or ply:Team() ~= FACTION_CLONE then
        return
    end

    local hudProfile = getHUDProfile(ply)
    currentHUDProfile = hudProfile == "clone" and "clone" or "mando"
    palette = paletteSets[currentHUDProfile] or paletteSets.mando
    local isShuttingDown, shutdownProgress = getHelmetShutdownProgress(ply)
    local isStartingUp, startupProgress, startupHolding = getHelmetStartupProgress(ply)
    local isDamageGlitching, damageGlitchIntensity, damageDropFrame = getDamageGlitchState(ply)
    local commsTransmission = getCurrentCommsTransmission(ply)
    local canDrawHUD = isHUDActive(ply)
    local thirdPersonActive = isThirdPersonActive(ply)

    if not canDrawHUD and not isShuttingDown and not isStartingUp then
        return
    end

    local drawHudElements = canDrawHUD
    if isShuttingDown and shouldSkipHelmetShutdownFrame(shutdownProgress) then
        drawHudElements = false
    end

    if isStartingUp and shouldSkipHelmetStartupFrame(startupProgress) then
        drawHudElements = false
    end

    if startupHolding then
        drawHudElements = false
    end

    if isDamageGlitching and damageDropFrame then
        drawHudElements = false
    end

    local sw = ScrW()
    local sh = ScrH()
    local visorLeftInset = math.max(sw * 0.04, sx(54))
    local visorRightInset = math.max(sw * 0.065, sx(92))
    local visorTopInset = math.max(sh * 0.06, sy(62))
    local visorBottomInset = math.max(sh * 0.09, sy(96))
    local topHeadingW = math.min(sw * 0.31, sx(600))
    local topHeadingH = sy(72)
    local topHeadingX = (sw * 0.5) - (topHeadingW * 0.5)
    local topHeadingY = visorTopInset + sy(46)

    local rightPanelW = math.min(sw * 0.19, sx(336))
    local rightPanelX = sw - visorRightInset - rightPanelW + sx(36)
    local rightRadarY = visorTopInset + sy(44)
    local radarH = sy(286)

    local vitalsW = math.min(sw * 0.42, sx(808))
    local vitalsH = sy(132)
    local vitalsX = sx(8)
    local vitalsY = sh - visorBottomInset - vitalsH - sy(24)
    local equipmentSideW = math.min(sw * 0.38, sx(732))
    local equipmentSideH = sy(164)
    local equipmentSideX = sw - equipmentSideW - sx(8)
    local equipmentSideY = sh - visorBottomInset - equipmentSideH - sy(8)
    local commsW = math.min(sw * 0.19, sx(360))
    local commsH = sy(88)
    local commsX = sw - visorRightInset - commsW - sx(26)
    local commsY = equipmentSideY - commsH - sy(26)

    if drawHudElements and thirdPersonActive then
        drawThirdPersonHUD(ply, commsTransmission)
    elseif drawHudElements then
        drawCompass(ply, topHeadingX, topHeadingY, topHeadingW, topHeadingH)
        drawRadar(rightPanelX, rightRadarY, rightPanelW, radarH, ply)
        drawComms(commsX, commsY, commsW, commsH, commsTransmission)
        drawVitals(vitalsX, vitalsY, vitalsW, vitalsH, ply)
        if shouldDrawEquipment(ply) then
            drawEquipmentSide(equipmentSideX, equipmentSideY, equipmentSideW, equipmentSideH, ply)
        end
        //drawReticle()
    end

    if isShuttingDown then
        drawHelmetShutdownFlicker(shutdownProgress)
    end

    if isStartingUp and not startupHolding then
        drawHelmetStartupFlicker(startupProgress)
    end

    if isDamageGlitching then
        drawDamageGlitchOverlay(damageGlitchIntensity)
    end

    if not thirdPersonActive then
        drawHelmetShell()
    end
end)
