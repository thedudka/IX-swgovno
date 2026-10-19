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

if (SERVER) then
    local hiddenWeaponClasses = {
        weapon_physgun = true,
        gmod_tool = true
    }

    local function setHiddenWeaponDraw(weapon, hidden)
        if (!IsValid(weapon) or !hiddenWeaponClasses[weapon:GetClass()]) then
            return
        end

        if (weapon:GetNoDraw() != hidden) then
            weapon:SetNoDraw(hidden)
        end
    end

    local function updateWeaponDraw(weapon)
        if (!IsValid(weapon) or !hiddenWeaponClasses[weapon:GetClass()]) then
            return
        end

        local owner = weapon:GetOwner()
        setHiddenWeaponDraw(weapon, IsValid(owner) and owner:GetActiveWeapon() == weapon)
    end

    hook.Add("InitPostEntity", "HiddenPhysgun_InitializeWeaponModels", function()
        for class in pairs(hiddenWeaponClasses) do
            for _, weapon in ipairs(ents.FindByClass(class)) do
                updateWeaponDraw(weapon)
            end
        end
    end)

    hook.Add("OnEntityCreated", "HiddenPhysgun_InitializeCreatedWeapon", function(entity)
        if (!IsValid(entity) or !hiddenWeaponClasses[entity:GetClass()]) then
            return
        end

        timer.Simple(0, function()
            updateWeaponDraw(entity)
        end)
    end)

    hook.Add("WeaponEquip", "HiddenPhysgun_WeaponEquip", function(weapon)
        updateWeaponDraw(weapon)
    end)

    hook.Add("PlayerSwitchWeapon", "HiddenPhysgun_PlayerSwitchWeapon", function(_, oldWeapon, newWeapon)
        setHiddenWeaponDraw(oldWeapon, false)
        setHiddenWeaponDraw(newWeapon, true)
    end)

    hook.Add("PlayerDroppedWeapon", "HiddenPhysgun_PlayerDroppedWeapon", function(_, weapon)
        setHiddenWeaponDraw(weapon, false)
    end)
end
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