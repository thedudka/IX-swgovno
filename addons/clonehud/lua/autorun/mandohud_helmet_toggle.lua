if SERVER then
    AddCSLuaFile()
end

local helmetStateKey = "MandoHUDHelmetRaised"
local helmetTransitionKey = "MandoHUDHelmetRaiseTransition"
local helmetTransitionEndKey = "MandoHUDHelmetRaiseTransitionEnd"
local helmetStartupTransitionKey = "MandoHUDHelmetLowerTransition"
local helmetStartupTransitionStartKey = "MandoHUDHelmetLowerTransitionStart"
local helmetStartupTransitionEndKey = "MandoHUDHelmetLowerTransitionEnd"
local helmetChatCommands = {
    ["!helmet"] = true,
    ["/helmet"] = true
}

local helmetBodygroupKeywords = {
    "helmet",
    "visor",
    "mask"
}

local raisedBodygroupKeywords = {
    "up",
    "open",
    "raised",
    "flip"
}

local helmetBoneKeywords = {
    "helmet",
    "visor",
    "mask"
}

local raisedHelmetOffset = Vector(0, 0, 6)
local raisedHelmetBodygroupValue = 3
local helmetTransitionDuration = 0.45
local helmetStartupDelay = 0.18

if CLIENT then
    return
end

local storedBodygroups = setmetatable({}, { __mode = "k" })
local storedBonePositions = setmetatable({}, { __mode = "k" })
local announceHelmetState

local function getHelmetTransitionTimerName(ply)
    return "MandoHUD.HelmetRaiseTransition." .. (IsValid(ply) and ply:EntIndex() or 0)
end

local function getHelmetStartupTransitionTimerName(ply)
    return "MandoHUD.HelmetLowerTransition." .. (IsValid(ply) and ply:EntIndex() or 0)
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

local function copyVector(value)
    if not value then
        return Vector(0, 0, 0)
    end

    return Vector(value.x, value.y, value.z)
end

local function findHelmetBodygroup(ply)
    for _, bodygroup in ipairs(ply:GetBodyGroups() or {}) do
        if (bodygroup.num or 0) > 1 and hasKeywordMatch(bodygroup.name, helmetBodygroupKeywords) then
            return bodygroup
        end
    end
end

local function getRaisedBodygroupValue(bodygroup)
    local bodygroupCount = math.max((bodygroup and bodygroup.num or 1) - 1, 0)
    if bodygroupCount <= 0 then
        return 0
    end

    for index, submodel in ipairs(bodygroup.submodels or {}) do
        if hasKeywordMatch(submodel, raisedBodygroupKeywords) then
            return math.min(index - 1, bodygroupCount)
        end
    end

    return math.min(raisedHelmetBodygroupValue, bodygroupCount)
end

local function applyHelmetBodygroup(ply, raised)
    if not IsValid(ply) then
        return false
    end

    if not raised then
        local originalStates = storedBodygroups[ply]
        if not originalStates then
            return false
        end

        local restored = false
        for bodygroupIndex, originalValue in pairs(originalStates) do
            ply:SetBodygroup(bodygroupIndex, originalValue)
            restored = true
        end

        storedBodygroups[ply] = nil
        return restored
    end

    local bodygroup = findHelmetBodygroup(ply)
    if not bodygroup then
        return false
    end

    local bodygroupIndex = bodygroup.id or 0
    storedBodygroups[ply] = storedBodygroups[ply] or {}

    if storedBodygroups[ply][bodygroupIndex] == nil then
        storedBodygroups[ply][bodygroupIndex] = ply:GetBodygroup(bodygroupIndex)
    end

    ply:SetBodygroup(bodygroupIndex, getRaisedBodygroupValue(bodygroup))
    return true
end

local function findHelmetBone(ply)
    local boneCount = ply:GetBoneCount() or 0

    for boneIndex = 0, boneCount - 1 do
        local boneName = ply:GetBoneName(boneIndex)
        if boneName and boneName ~= "__INVALIDBONE__" and hasKeywordMatch(boneName, helmetBoneKeywords) then
            return boneIndex
        end
    end
end

local function applyHelmetBoneOffset(ply, raised)
    if not IsValid(ply) then
        return false
    end

    if not raised then
        local originalBones = storedBonePositions[ply]
        if not originalBones then
            return false
        end

        local restored = false
        for boneIndex, originalPosition in pairs(originalBones) do
            ply:ManipulateBonePosition(boneIndex, originalPosition)
            restored = true
        end

        storedBonePositions[ply] = nil
        return restored
    end

    local boneIndex = findHelmetBone(ply)
    if boneIndex == nil then
        return false
    end

    storedBonePositions[ply] = storedBonePositions[ply] or {}

    if storedBonePositions[ply][boneIndex] == nil then
        storedBonePositions[ply][boneIndex] = copyVector(ply:GetManipulateBonePosition(boneIndex))
    end

    ply:ManipulateBonePosition(boneIndex, storedBonePositions[ply][boneIndex] + raisedHelmetOffset)
    return true
end

local function clearHelmetRaiseTransition(ply)
    timer.Remove(getHelmetTransitionTimerName(ply))

    if not IsValid(ply) then
        return
    end

    ply:SetNWBool(helmetTransitionKey, false)
    ply:SetNWFloat(helmetTransitionEndKey, 0)
end

local function clearHelmetStartupTransition(ply)
    timer.Remove(getHelmetStartupTransitionTimerName(ply))

    if not IsValid(ply) then
        return
    end

    ply:SetNWBool(helmetStartupTransitionKey, false)
    ply:SetNWFloat(helmetStartupTransitionStartKey, 0)
    ply:SetNWFloat(helmetStartupTransitionEndKey, 0)
end

local function setHelmetRaised(ply, raised)
    if not IsValid(ply) then
        return false, false
    end

    ply:SetNWBool(helmetStateKey, raised)

    if raised then
        return applyHelmetBodygroup(ply, true), applyHelmetBoneOffset(ply, true)
    end

    return applyHelmetBodygroup(ply, false), applyHelmetBoneOffset(ply, false)
end

local function beginHelmetRaiseSequence(ply)
    if not IsValid(ply) then
        return
    end

    clearHelmetStartupTransition(ply)
    clearHelmetRaiseTransition(ply)
    ply:SetNWBool(helmetStateKey, false)
    ply:SetNWBool(helmetTransitionKey, true)
    ply:SetNWFloat(helmetTransitionEndKey, CurTime() + helmetTransitionDuration)

    timer.Create(getHelmetTransitionTimerName(ply), helmetTransitionDuration, 1, function()
        if not IsValid(ply) then
            return
        end

        clearHelmetRaiseTransition(ply)
        local bodygroupChanged, boneChanged = setHelmetRaised(ply, true)
        announceHelmetState(ply, true, bodygroupChanged, boneChanged)
    end)
end

local function beginHelmetLowerSequence(ply)
    if not IsValid(ply) then
        return
    end

    clearHelmetRaiseTransition(ply)
    clearHelmetStartupTransition(ply)

    local bodygroupChanged, boneChanged = setHelmetRaised(ply, false)
    local startupBeginTime = CurTime() + helmetStartupDelay
    ply:SetNWBool(helmetStartupTransitionKey, true)
    ply:SetNWFloat(helmetStartupTransitionStartKey, startupBeginTime)
    ply:SetNWFloat(helmetStartupTransitionEndKey, startupBeginTime + helmetTransitionDuration)

    timer.Create(getHelmetStartupTransitionTimerName(ply), helmetStartupDelay + helmetTransitionDuration, 1, function()
        if not IsValid(ply) then
            return
        end

        clearHelmetStartupTransition(ply)
        announceHelmetState(ply, false, bodygroupChanged, boneChanged)
    end)
end

local function parseHelmetCommand(text)
    local normalizedText = normalizeLookupValue(text)
    if normalizedText == "" then
        return
    end

    local command, argument = string.match(normalizedText, "^(%S+)%s*(.-)%s*$")
    if not helmetChatCommands[command or ""] then
        return
    end

    if argument == "" or argument == "toggle" then
        return true
    end

    if argument == "on" or argument == "up" or argument == "raise" or argument == "raised" then
        return true, true
    end

    if argument == "off" or argument == "down" or argument == "lower" or argument == "lowered" then
        return true, false
    end

    return true
end

announceHelmetState = function(ply, raised, bodygroupChanged, boneChanged)
    if not IsValid(ply) then
        return
    end

    if raised then
        local message = "Дисплей отключен."
        if not bodygroupChanged and not boneChanged then
            message = message .. ""
        end

        ply:ChatPrint(message)
        return
    end

    ply:ChatPrint("Дисплей включен.")
end

hook.Add("PlayerSay", "MandoHUD.HelmetChatCommand", function(ply, text)
    local isHelmetCommand, forcedState = parseHelmetCommand(text)
    if not isHelmetCommand then
        return
    end

    local raised = forcedState
    if raised == nil then
        raised = not (ply:GetNWBool(helmetStateKey, false) or ply:GetNWBool(helmetTransitionKey, false))
    end

    if raised then
        if ply:GetNWBool(helmetStateKey, false) or ply:GetNWBool(helmetTransitionKey, false) then
            return ""
        end

        beginHelmetRaiseSequence(ply)
        return ""
    end

    beginHelmetLowerSequence(ply)
    return ""
end)

hook.Add("PlayerSpawn", "MandoHUD.ReapplyHelmetState", function(ply)
    timer.Simple(0, function()
        if not IsValid(ply) then
            return
        end

        clearHelmetRaiseTransition(ply)
        clearHelmetStartupTransition(ply)

        if not ply:GetNWBool(helmetStateKey, false) then
            return
        end

        storedBodygroups[ply] = nil
        storedBonePositions[ply] = nil
        setHelmetRaised(ply, true)
    end)
end)

hook.Add("PlayerDisconnected", "MandoHUD.ClearHelmetState", function(ply)
    clearHelmetRaiseTransition(ply)
    clearHelmetStartupTransition(ply)
    storedBodygroups[ply] = nil
    storedBonePositions[ply] = nil
end)
