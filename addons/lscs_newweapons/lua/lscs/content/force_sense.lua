-- Normal
local force = {}
force.PrintName = "Sense"
force.Author = "Blu-x92 / Luna"
force.Description = "Augmented Vision. See through the lies of the Jedi and through walls"
force.id = "sense1"
force.OnClk = function(ply, TIME)
    if not ply:GetNWBool("_lscsForceSense", false) then return end

    if not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
        ply:SetNWBool("_lscsForceSense", false)
        return
    end

    ply:lscsTakeForce()

    if (ply._lscsSenseTime or 0) < TIME then
        ply:SetNWBool("_lscsForceSense", false)
    end
end
force.UnEquip = function(ply)
    ply:SetNWBool("_lscsForceSense", false)
end
force.StartUse = function(ply)
    local Time = CurTime()
    local CanDo = (ply._lscsNextForce or 0) < Time

    if not CanDo then return end

    ply._lscsNextForce = Time + 1

    if ply:GetNWBool("_lscsForceSense", false) then
        ply:SetNWBool("_lscsForceSense", false)
    else
        if ply:lscsGetForce() >= 75 then
            ply:SetNWBool("_lscsForceSense", true)
            ply._lscsSenseTime = CurTime() + 5
            ply:lscsTakeForce(75)
            ply:EmitSound("lscs/force/sense.mp3")
        end
    end
end
LSCS:RegisterForce(force)

-- Advanced
local force = {}
force.PrintName = "Sense [Advanced]"
force.Author = "Blu-x92 / Luna"
force.Description = "Augmented Vision. See through the lies of the Jedi and through walls"
force.id = "sense2"
force.OnClk = function(ply, TIME)
    if not ply:GetNWBool("_lscsForceSenseAdvanced", false) then return end

    if not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
        ply:SetNWBool("_lscsForceSenseAdvanced", false)
        return
    end

    ply:lscsTakeForce()

    if (ply._lscsSenseTime or 0) < TIME then
        ply:SetNWBool("_lscsForceSenseAdvanced", false)
    end
end
force.UnEquip = function(ply)
    ply:SetNWBool("_lscsForceSenseAdvanced", false)
end
force.StartUse = function(ply)
    local Time = CurTime()
    local CanDo = (ply._lscsNextForce or 0) < Time

    if not CanDo then return end

    ply._lscsNextForce = Time + 1

    if ply:GetNWBool("_lscsForceSenseAdvanced", false) then
        ply:SetNWBool("_lscsForceSenseAdvanced", false)
    else
        if ply:lscsGetForce() >= 50 then
            ply:SetNWBool("_lscsForceSenseAdvanced", true)
            ply._lscsSenseTime = CurTime() + 10
            ply:lscsTakeForce(50)
            ply:EmitSound("lscs/force/sense.mp3")
        end
    end
end
LSCS:RegisterForce(force)

-- Mastered
local force = {}
force.PrintName = "Sense [Mastered]"
force.Author = "Blu-x92 / Luna"
force.Description = "Augmented Vision. See through the lies of the Jedi and through walls"
force.id = "sense3"
force.OnClk = function(ply, TIME)
    if not ply:GetNWBool("_lscsForceSenseMastered", false) then return end

    if not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then
        ply:SetNWBool("_lscsForceSenseMastered", false)
        return
    end

    ply:lscsTakeForce()

    if (ply._lscsSenseTime or 0) < TIME then
        ply:SetNWBool("_lscsForceSenseMastered", false)
    end
end
force.UnEquip = function(ply)
    ply:SetNWBool("_lscsForceSenseMastered", false)
end
force.StartUse = function(ply)
    local Time = CurTime()
    local CanDo = (ply._lscsNextForce or 0) < Time

    if not CanDo then return end

    ply._lscsNextForce = Time + 1

    if ply:GetNWBool("_lscsForceSenseMastered", false) then
        ply:SetNWBool("_lscsForceSenseMastered", false)
    else
        if ply:lscsGetForce() >= 25 then
            ply:SetNWBool("_lscsForceSenseMastered", true)
            ply._lscsSenseTime = CurTime() + 15
            ply:lscsTakeForce(25)
            ply:EmitSound("lscs/force/sense.mp3")
        end
    end
end
LSCS:RegisterForce(force)
