local PLUGIN = PLUGIN

PLUGIN.name = "Hidden toolgun and physgun"
PLUGIN.author = "somebody"
PLUGIN.description = "do what it does"


local toolgunSounds = {
	["Airboat.FireGunRevDown"] = true,
	["Toolgun.Single"] = true
}

hook.Add("EntityEmitSound", "rHideToolgunSound", function(data)
	local soundEnt = data.Entity
	local originalSound = data.OriginalSoundName

	if (!IsValid(soundEnt) or !soundEnt:IsPlayer()) then return end
	
	if (toolgunSounds[originalSound]) then
		return false
	end
end)

hook.Add("Think", "HiddenPhysgun_Model", function()
    for _, ply in ipairs(player.GetAll()) do
        local wep = ply:GetActiveWeapon()
        if IsValid(wep) and wep:GetClass() == "weapon_physgun" then
            if not wep:GetNoDraw() then
                wep:SetNoDraw(true)
            end
        end
    end
    
    for _, wep in ipairs(ents.FindByClass("weapon_physgun")) do
        if IsValid(wep) and not IsValid(wep:GetOwner()) then
            if wep:GetNoDraw() then
                wep:SetNoDraw(false)
            end
        end
    end
end)
hook.Add("CalcMainActivity", "HiddenPhysgun_Anim", function(ply, velocity)
    local wep = ply:GetActiveWeapon()
    
    if IsValid(wep) and wep:GetClass() == "weapon_physgun" then
        local ideal = ACT_HL2MP_IDLE
        local len2D = velocity:Length2D()


        if ply:WaterLevel() >= 2 then
            ideal = ACT_HL2MP_SWIM
        elseif ply:IsOnGround() then
            if len2D > 150 then
                ideal = ACT_HL2MP_RUN
            elseif len2D > 0.5 then
                ideal = ACT_HL2MP_WALK
            end

            if ply:Crouching() then
                ideal = (len2D > 0.5) and ACT_HL2MP_WALK_CROUCH or ACT_HL2MP_IDLE_CROUCH
            end
        else
            ideal = ACT_HL2MP_JUMP_PASSIVE
        end
        return ideal, -1 
    end
end)

hook.Add("UpdateAnimation", "HiddenPhysgun_BlockGestures", function(ply)
    local wep = ply:GetActiveWeapon()
    
    if IsValid(wep) and wep:GetClass() == "weapon_physgun" then
        ply:AnimSetGestureWeight(GESTURE_SLOT_ATTACK_AND_RELOAD, 0)
        ply:AnimSetGestureWeight(GESTURE_SLOT_CUSTOM, 0)
    end
end)
if CLIENT then
    hook.Add("DrawPhysgunBeam", "HiddenPhysgun_HideBeam", function(ply, wep, bRight, bLeft, vecSrc, vecDest)
        if ply ~= LocalPlayer() then return false end
        if hook.Run("ShouldDrawLocalPlayer", ply) then return false end
    end)
end