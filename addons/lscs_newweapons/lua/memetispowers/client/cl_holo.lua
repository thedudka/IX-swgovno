if SERVER then return end

hook.Add("PreDrawHalos", "lscs_halos", function()
    if not IsValid(LocalPlayer()) then return end
    local rebuke = {}
    for k, v in ipairs(player.GetAll()) do
        if not IsValid(v) then continue end
        if v:GetNWFloat("lscs_rebuke", 0) < CurTime() then continue end
        table.insert(rebuke, v)
    end
    halo.Add(rebuke, Color(160,200,0))
end)