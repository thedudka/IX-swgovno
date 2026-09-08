local force = {}

force.PrintName = "Kneel Down"
force.Author = "UCCROW"
force.Description = "Baktığın mesafedeki tüm oyuncuları eğilmeye zorlar."
force.id = "kneeldown" -- sadece küçük harflerle

local lastForceUseTime = {}

local function ForcePressCtrl(targetPly, duration)
    if not targetPly:KeyDown(IN_DUCK) then
        targetPly:ConCommand("+duck")
    end

    timer.Simple(duration, function()
        targetPly:ConCommand("-duck")
    end)
end

force.StartUse = function(ply)
    local cooldown = 2 -- Cooldown süresi (saniye cinsinden)
    local pressCtrlDuration = 10 -- CTRL tuşuna basma süresi (saniye cinsinden)
    local range = 300 -- Etki menzili (birim olarak)
    local targetPlys = ents.FindInSphere(ply:GetPos(), range)

    if lastForceUseTime[ply] and (CurTime() - lastForceUseTime[ply]) < cooldown then
        return
    end

    if ply:lscsGetForce() < 25 then
        return
    end

    ply:lscsTakeForce(25)

    ply:EmitSound("ambient/levels/labs/electric_explosion1.wav")

    for _, targetPly in ipairs(targetPlys) do
        if IsValid(targetPly) and targetPly:IsPlayer() and targetPly:Alive() and targetPly ~= ply then
            ForcePressCtrl(targetPly, pressCtrlDuration)
        end
    end

    lastForceUseTime[ply] = CurTime()
end

force.StopUse = function(ply)
    -- Force'un kullanımı bırakıldığında yapılacaklar
end

LSCS:RegisterForce(force)
