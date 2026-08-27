MandoComlink = MandoComlink or {}

MandoComlink.FrequencyNWKey = "MandoHUDComlinkFrequency"
MandoComlink.SetFrequencyNetMessage = "MandoHUD.Comlink.SetFrequency"
MandoComlink.MaxFrequencyLength = 18

function MandoComlink.NormalizeFrequency(rawValue)
    local value = string.upper(string.Trim(tostring(rawValue or "")))
    value = string.gsub(value, "[^A-Z0-9%-%._/]", "")
    return string.sub(value, 1, MandoComlink.MaxFrequencyLength)
end

function MandoComlink.GetFrequency(ply)
    if not IsValid(ply) then
        return ""
    end

    return MandoComlink.NormalizeFrequency(ply:GetNWString(MandoComlink.FrequencyNWKey, ""))
end

function MandoComlink.ArePlayersLinked(listener, speaker)
    if not IsValid(listener) or not IsValid(speaker) or not listener:IsPlayer() or not speaker:IsPlayer() then
        return false
    end

    local listenerFrequency = MandoComlink.GetFrequency(listener)
    if listenerFrequency == "" then
        return false
    end

    return listenerFrequency == MandoComlink.GetFrequency(speaker)
end

if SERVER then
    AddCSLuaFile()
    util.AddNetworkString(MandoComlink.SetFrequencyNetMessage)

    local function isValidComlinkPlayer(ply)
        return IsValid(ply) and ply:IsPlayer()
    end

    local function canUseComlink(ply)
        return isValidComlinkPlayer(ply) and ply:Alive()
    end

    local function setPlayerFrequency(ply, rawFrequency)
        if not isValidComlinkPlayer(ply) then
            return ""
        end

        local frequency = MandoComlink.NormalizeFrequency(rawFrequency)
        ply:SetNWString(MandoComlink.FrequencyNWKey, frequency)
        return frequency
    end

    net.Receive(MandoComlink.SetFrequencyNetMessage, function(_, ply)
        if not isValidComlinkPlayer(ply) then
            return
        end

        local frequency = setPlayerFrequency(ply, net.ReadString())
        if frequency == "" then
            ply:ChatPrint("Comlink disconnected.")
            return
        end

        ply:ChatPrint("Comlink linked to frequency " .. frequency .. ".")
    end)

    hook.Add("PlayerCanHearPlayersVoice", "MandoHUD.ComlinkVoice", function(listener, speaker)
        if not canUseComlink(listener) or not canUseComlink(speaker) then
            return
        end

        if not MandoComlink.ArePlayersLinked(listener, speaker) then
            return
        end

        return true, false
    end)
end
