local force = {}
force.PrintName = "Breach"
force.Author = "Kokushibo and vReinZeix"
force.Description = "Force open any door that blocks your path."
force.id = "breach"
force.Spawnable = true

force.Equip = function(ply)
    print("i got equipped")
end

force.UnEquip = function(ply)
    print("i got unequipped :(")
end

force.StartUse = function(ply)
    if ply:lscsGetForce() < 10 then return end -- Needs at least 10 strength

    local Time = CurTime()
    local CanDo = (ply._lscsNextForce or 0) < Time
    if not CanDo then return end

    ply._lscsNextForce = Time + 2 -- 2 second cooldown

    -- Detects the entity in front of the player
    local tr = util.TraceLine(util.GetPlayerTrace(ply))
    if not IsValid(tr.Entity) then return end

    ply:EmitSound("npc/combine_gunship/ping_search.wav")

    -- Check if the entity is a valid door
    if not (tr.Entity:GetClass() == "func_door" or 
            tr.Entity:GetClass() == "prop_door_rotating" or 
            tr.Entity:GetClass() == "func_door_rotating") then return end

    ply:lscsTakeForce(0) 
    tr.Entity:Fire("unlock", "", 0)
    tr.Entity:Fire("Open", "", 0)

    ply:EmitSound("lscs/force/open_door.mp3")

    return true
end

force.StopUse = function(ply)
    -- Here you could add logic to stop the action if necessary
end

LSCS:RegisterForce(force)