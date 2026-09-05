--Special thanks to:
--datae for creating "Tacmove".
--I REALLY like this addon but have some problems and useless effects (as custom footstep timing (holy shit why I'm so focused on feet...)), soooo.
--ben "likesityoung" netanyahu for creating "Better Movement V2".
--which inspirated me to make "Anim-based Footsteps Timing" and some ideas for "Heavier Movement" (yes, when I was making a mod for the player's movement, I couldn't think of adding more speed sliders for the player to change, so there you have it).
--sApieNz for creating "Movement QoL".
--same as Better Movement V2, just ideas for "Heavier Movement".
 
local math = math
local meta = FindMetaTable("Player")

local function RCV(name, def, desc, mn, mx)
    return CreateConVar(name, def, {FCVAR_REPLICATED, FCVAR_ARCHIVE}, desc, mn, mx)
end

local hm_movement           = RCV("hm_movement",           1,   "Movement inertia and diagonal normalization",           0,  1)

local hm_exhaustion_rate    = RCV("hm_exhaustion_rate",    1,   "Rate of exhaustion buildup",                            0,  50)
local hm_exhaustion_slow    = RCV("hm_exhaustion_slow",    1,   "Limit movement speed when exhausted",                   0,  1)
local hm_stamina_sprint_cost= RCV("hm_stamina_sprint_cost",0.05,"Stamina cost per second while sprinting",               0,  1)
local hm_stamina_walk_cost  = RCV("hm_stamina_walk_cost",  0.0025,"Stamina cost per second while walking",               0,  1)
local hm_stamina_recover    = RCV("hm_stamina_recover",    0.25,"Stamina recovery rate (per second)",                    0,  5)
local hm_stamina_recover_delay= RCV("hm_stamina_recover_delay", 3, "Seconds before stamina starts recovering",           0,  15)

local hm_strafepenalty      = RCV("hm_strafepenalty",      1,   "Inertia reset on sudden direction change",              0,  1)
local hm_strafepenalty_thr  = RCV("hm_strafepenalty_thr",  0.998,"Dot product threshold for strafe penalty (walk)",      0,  1)
local hm_strafepenalty_thr_s= RCV("hm_strafepenalty_thr_s",0.99,"Dot product threshold for strafe penalty (sprint)",     0,  1)
local hm_sprintlimit        = RCV("hm_sprintlimit",        1,   "Block sprinting backwards",                             0,  1)
local hm_turnpenalty        = RCV("hm_turnpenalty",        1,   "Speed reduction when turning sharply",                  0,  1)
local hm_turnpenalty_thr    = RCV("hm_turnpenalty_thr",    1.5, "Angle delta threshold to start turn penalty (degrees)", 0,  45)
local hm_turnpenalty_scale  = RCV("hm_turnpenalty_scale",  0.018,"Turn penalty severity multiplier",                     0,  0.1)
local hm_turnpenalty_min    = RCV("hm_turnpenalty_min",    0.55,"Minimum speed multiplier during sharp turn",            0,  1)
local hm_backspeed          = RCV("hm_backspeed",          0.7, "Backward movement speed multiplier",                   0.1,1)
local hm_noairsprint        = RCV("hm_noairsprint",        1,   "Disable sprinting mid-air",                             0,  1)
local hm_noitemsprint       = RCV("hm_noitemsprint",       0,   "Disable sprint while holding objects",                  0,  1)
local hm_stairs             = RCV("hm_stairs",             1,   "Detect stairs and block sprint briefly",                0,  1)
local hm_matslow            = RCV("hm_matslow",            1,   "Speed penalty based on ground material",                0,  1)

local hm_crouchjump         = RCV("hm_crouchjump",         1,   "Crouch-jump policy: 0=free 1=one-duck 2=no-unduck 3=no-duck", 0, 3)
local hm_nojumpincrouch     = RCV("hm_nojumpincrouch",     1,   "Block jumping while crouched on ground",                0,  1)
local hm_jumpdelay          = RCV("hm_jumpdelay",          1,   "Delay jump input by 0.1s",                              0,  1)
local hm_jumpcooldown       = RCV("hm_jumpcooldown",       1,   "Reduce jump power when exhausted",                      0,  1)
local hm_jumpstamina        = RCV("hm_jumpstamina",        1,   "Jumping costs stamina",                                 0,  1)
local hm_jumpstamina_cost   = RCV("hm_jumpstamina_cost",   0.1, "Stamina cost per jump",                                 0,  1)
local hm_jumppower_base     = RCV("hm_jumppower_base",     200, "Base jump power",                                       50, 400)
local hm_jumppower_min      = RCV("hm_jumppower_min",      100, "Minimum jump power when fully exhausted",               0,  400)

local hm_landingpenalty     = RCV("hm_landingpenalty",     1,   "Hard landings add fatigue",                             0,  1)
local hm_landingslow        = RCV("hm_landingslow",        1,   "CS-style landing stamina slowdown",                     0,  1)

local hm_speed_sprint       = RCV("hm_speed_sprint",       240, "Sprint speed",                                          60, 400)
local hm_speed_walk         = RCV("hm_speed_walk",         140, "Walk speed",                                            60, 400)
local hm_speed_slowwalk     = RCV("hm_speed_slowwalk",     60,  "Slow walk speed (hold walk key)",                       10, 200)
local hm_speed_crouch       = RCV("hm_speed_crouch",       0.9, "Crouch speed multiplier",                               0.1,1)
local hm_speed_ladder       = RCV("hm_speed_ladder",       130, "Ladder climb speed",                                    10, 400)

local hm_woundpenalty       = RCV("hm_woundpenalty",       1,   "Dark Souls-inspired wound penalty: low HP slows movement", 0, 1)
local hm_woundpenalty_scale = RCV("hm_woundpenalty_scale", 0.75,"How strongly wounds affect movement speed",             0,  1)

local hm_vignette = CreateClientConVar("hm_vignette", 1, true, false, "Exhaustion vignette", 0, 1)

local MAT_SPEED = {
    [MAT_GRASS] = 0.95,
    [MAT_DIRT]  = 0.93,
    [MAT_SAND]  = 0.88,
    [MAT_SLOSH] = 0.87,
    [MAT_SNOW]  = 0.89,
}

local IN_SPEED_INV = bit.bnot(IN_SPEED)
local IN_DUCK_INV  = bit.bnot(IN_DUCK)

local STAMINA_MAX          = 100
local STAMINA_RECOVER_RATE = 60
local STAMINA_COST_LAND    = 70

local function SetExhaustion(ply, v) ply:SetNW2Float("HM_Exhaustion", v) end
local function GetExhaustion(ply)    return ply:GetNW2Float("HM_Exhaustion", 0) end
local function SetInertia(ply, v)    ply:SetNW2Float("HM_Inertia",    v) end
local function GetInertia(ply)       return ply:GetNW2Float("HM_Inertia",    0) end
local function SetRecovery(ply, v)   ply:SetNW2Float("HM_Recovery",   v) end
local function GetRecovery(ply)      return ply:GetNW2Float("HM_Recovery",   0) end


local function StaminaFrozen(ply)
    local mt = ply:GetMoveType()
    return mt == MOVETYPE_NOCLIP or mt == MOVETYPE_OBSERVER or ply:InVehicle()
end


hook.Add("PlayerSpawn", "HEAVIERSpawn", function(ply)
    if not hm_movement:GetBool() then return end
    timer.Simple(0, function()
        if not IsValid(ply) then return end
        ply:SetWalkSpeed(hm_speed_walk:GetInt())
        ply:SetRunSpeed(hm_speed_sprint:GetInt())
        ply:SetSlowWalkSpeed(math.min(hm_speed_slowwalk:GetInt(), hm_speed_walk:GetInt()))
        ply:SetCrouchedWalkSpeed(hm_speed_crouch:GetFloat())
        ply:SetViewOffsetDucked(Vector(0, 0, 42))
        ply:SetDuckSpeed(0.25)
        ply:SetUnDuckSpeed(0.2)
        ply:SetLadderClimbSpeed(hm_speed_ladder:GetInt())
    end)
end)

if SERVER then
    hook.Add("OnPlayerPhysicsPickup", "HEAVIERItemPickup", function(ply)
        if hm_noitemsprint:GetBool() then ply:SetNW2Bool("HM_ItemHold", true) end
    end)
    hook.Add("GravGunOnPickedUp", "HEAVIERGravPickup", function(ply)
        if hm_noitemsprint:GetBool() then ply:SetNW2Bool("HM_ItemHold", true) end
    end)
    hook.Add("OnPlayerPhysicsDrop", "HEAVIERItemDrop", function(ply)
        ply:SetNW2Bool("HM_ItemHold", false)
    end)
    hook.Add("GravGunOnDropped", "HEAVIERGravDrop", function(ply)
        ply:SetNW2Bool("HM_ItemHold", false)
    end)
end

hook.Add("StartCommand", "HEAVIERStartCmd", function(ply, cmd)
    local clampedSlow = math.min(hm_speed_slowwalk:GetInt(), hm_speed_walk:GetInt())
    if ply:GetSlowWalkSpeed() ~= clampedSlow then
        ply:SetSlowWalkSpeed(clampedSlow)
    end

    if hm_noairsprint:GetBool() and not ply:OnGround()
       and ply:WaterLevel() == 0
       and ply:GetMoveType() ~= MOVETYPE_NOCLIP
       and ply:GetMoveType() ~= MOVETYPE_LADDER then
        cmd:RemoveKey(IN_SPEED)
    end

    if hm_noitemsprint:GetBool() and ply:GetNW2Bool("HM_ItemHold", false) then
        cmd:RemoveKey(IN_SPEED)
    end

    if hm_nojumpincrouch:GetBool() and ply:Crouching() and ply:OnGround()
       and ply:GetMoveType() == MOVETYPE_WALK then
        cmd:RemoveKey(IN_JUMP)
    end

    local cj = hm_crouchjump:GetInt()
    if cj > 0 and not ply:OnGround()
       and ply:GetMoveType() == MOVETYPE_WALK
       and ply:WaterLevel() == 0 then
        if cj == 1 then
            if ply:Crouching() then
                ply.HEAVIER_HadDuck = true
            elseif ply.HEAVIER_HadDuck then
                cmd:RemoveKey(IN_DUCK)
            end
        elseif cj == 2 then
            if ply:Crouching() then cmd:AddKey(IN_DUCK) end
        elseif cj == 3 then
            cmd:RemoveKey(IN_DUCK)
        end
    else
        ply.HEAVIER_HadDuck = false
    end
end)

if CLIENT then
    local jump      = false
    local jumpdelay = 0
    local jumptimer = 0
    local jumpheld  = false

    hook.Add("CreateMove", "HEAVIERJumpDelay", function(cmd)
        if not hm_jumpdelay:GetBool() then return end
        local ply = LocalPlayer()
        if ply:OnGround() and cmd:KeyDown(IN_JUMP) and ply:Alive() and not jumpheld then
            if not jump then jumpdelay = CurTime() + 0.1 end
            jump      = true
            jumpheld  = true
            jumptimer = CurTime() + 0.5
            cmd:RemoveKey(IN_JUMP)
        end
        jumpheld = cmd:KeyDown(IN_JUMP)
        if jump and CurTime() > jumpdelay then
            cmd:AddKey(IN_JUMP)
            if not ply:OnGround() or CurTime() > jumptimer then jump = false end
        end
    end)

    hook.Add("CreateMove", "HEAVIERAirCtrl", function(cmd)
        local ply = LocalPlayer()
        if ply:OnGround() or ply:WaterLevel() >= 2 then return end
        local exhaustion = GetExhaustion(ply)
        if exhaustion <= 0.15 then return end
        local penalty = 1 - exhaustion * 0.55
        cmd:SetSideMove(cmd:GetSideMove()       * penalty)
        cmd:SetForwardMove(cmd:GetForwardMove() * penalty)
    end)

    hook.Add("CreateMove", "HEAVIERCreateMove", function(cmd)
        local ply   = LocalPlayer()
        local inert = GetInertia(ply)
        if hm_movement:GetBool()
           and (ply:WaterLevel() < 2 or ply:OnGround()) then
            local scale = (inert + 0.06) * 0.09
            cmd:SetForwardMove(cmd:GetForwardMove() * scale)
            cmd:SetSideMove(cmd:GetSideMove()       * scale)
            if math.abs(cmd:GetSideMove()) > 0 and math.abs(cmd:GetForwardMove()) > 0 then
                cmd:SetSideMove(cmd:GetSideMove()     * 0.707)
                cmd:SetForwardMove(cmd:GetForwardMove() * 0.707)
            end
        end
        if ply:GetNW2Bool("HM_LadderBlocked", false) then
            cmd:SetForwardMove(0)
            cmd:SetSideMove(0)
        end
    end)

    local mat_vignette = Material("vgui/zoom")
    local vign_smooth  = 0

    hook.Add("HUDPaint", "HEAVIERVign", function()
        if not hm_vignette:GetBool() then return end
        local ply = LocalPlayer()
        if not IsValid(ply) or not ply:Alive() then return end
        local exhaust = math.max(0, (GetExhaustion(ply) - 0.05) * 1.15)
        vign_smooth   = math.Approach(vign_smooth, exhaust, FrameTime() * 3)
        if vign_smooth < 0.005 then return end
        local w, h = ScrW(), ScrH()
        local a    = math.floor(vign_smooth * 220)
        surface.SetMaterial(mat_vignette)
        surface.SetDrawColor(0, 0, 0, a)
        surface.DrawTexturedRect(0, 0, w, h)
        surface.DrawTexturedRectUV(0, 0, w, h, 1, 1, 0, 0)
    end)
end

local hullduck_mins    = Vector(-16, -16, 0)
local hullduck_maxs    = Vector(16,  16,  36)
local hullducktac_mins = Vector(-16, -16, 0)
local hullducktac_maxs = Vector(16,  16,  48)

local JUMPING

hook.Add("SetupMove", "HEAVIERSetupMove", function(ply, mv, cmd)
    if not ply.HM_Tr then
        ply.HM_Tr            = {}
        ply.HM_TrOut         = {}
        ply.HM_Tr.output     = ply.HM_TrOut
        ply.HM_Tr.filter     = ply
        ply.HM_Tr.mask       = MASK_SOLID_BRUSHONLY

        ply.HM_DuckTr        = {}
        ply.HM_DuckTrOut     = {}
        ply.HM_DuckTr.output = ply.HM_DuckTrOut
        ply.HM_DuckTr.filter = ply
        ply.HM_DuckTr.mask   = MASK_PLAYERSOLID
    end

    local movetype = ply:GetMoveType()
    local onground = ply:OnGround()
    local FT       = FrameTime()
    local CT       = CurTime()

    if StaminaFrozen(ply) then
        ply.HM_WasOnGround = nil
        ply.HM_FallZVel    = nil
        return
    end

    local moving = mv:KeyDown(IN_FORWARD) or mv:KeyDown(IN_BACK)
                or mv:KeyDown(IN_MOVELEFT) or mv:KeyDown(IN_MOVERIGHT)

    local exhaustion = GetExhaustion(ply)

    if not onground then
        ply.HM_GroundMat = nil
    elseif hm_matslow:GetBool() then
        local tr    = ply.HM_Tr
        local trout = ply.HM_TrOut
        tr.start    = mv:GetOrigin()
        tr.endpos   = Vector(tr.start.x, tr.start.y, tr.start.z - 24)
        util.TraceLine(tr)
        ply.HM_GroundMat = trout.MatType
    end

    if hm_stairs:GetBool() and onground and movetype == MOVETYPE_WALK
       and mv:GetVelocity():Length2D() > 30 then
        local tr    = ply.HM_Tr
        local trout = ply.HM_TrOut
        local ang   = Angle(0, mv:GetAngles().y, 0)
        local fwd   = ang:Forward()
        local org   = mv:GetOrigin()

        tr.start  = org + Vector(0, 0, 4)
        tr.endpos = tr.start + fwd * 30
        util.TraceLine(tr)
        local hitLow = trout.Hit

        tr.start  = org + Vector(0, 0, 20)
        tr.endpos = tr.start + fwd * 30
        util.TraceLine(tr)
        local hitHigh = trout.Hit

        if hitLow and not hitHigh and (ply.HM_StairCooldown or 0) < CT then
            ply.HM_StairUntil    = CT + 0.35
            ply.HM_StairCooldown = CT + 0.6
        end
    end

    local blockSprint = false
    if exhaustion >= 0.95 then
        blockSprint = true
    elseif hm_sprintlimit:GetBool() and mv:GetForwardSpeed() < -50 then
        blockSprint = true
    elseif hm_stairs:GetBool() and (ply.HM_StairUntil or 0) > CT then
        blockSprint = true
    end

    if blockSprint then
        mv:SetButtons(bit.band(mv:GetButtons(), IN_SPEED_INV))
    end

    local sprinting = mv:KeyDown(IN_SPEED) and GetInertia(ply) > 0.1

    if mv:KeyPressed(IN_DUCK) and not ply:Crouching() then
        local lowduck = false
        local ang = mv:GetAngles()
        ang[1] = 0
        local f    = ang:Forward()
        local dtr  = ply.HM_DuckTr
        local dout = ply.HM_DuckTrOut
        dtr.start = mv:GetOrigin()
        dtr.start[3] = dtr.start[3] + 8
        dtr.endpos = Vector(dtr.start)
        dtr.endpos:Add(f * 32)
        util.TraceLine(dtr)
        if not dout.Hit then
            dtr.start  = dtr.endpos
            dtr.endpos = Vector(dtr.start)
            dtr.endpos[3] = dtr.endpos[3] + 40
            util.TraceLine(dtr)
            if dout.Hit then lowduck = true end
        end
        if lowduck then
            ply:SetViewOffsetDucked(Vector(0, 0, 28))
            ply:SetHullDuck(hullduck_mins, hullduck_maxs)
        else
            ply:SetViewOffsetDucked(Vector(0, 0, 42))
            ply:SetHullDuck(hullducktac_mins, hullducktac_maxs)
        end
    end

    if not ply:Crouching() and not onground and movetype ~= MOVETYPE_LADDER then
        ply:SetViewOffsetDucked(Vector(0, 0, 28))
        ply:SetHullDuck(hullduck_mins, hullduck_maxs)
    end

    ply:SetCrouchedWalkSpeed(math.max(0.1, hm_speed_crouch:GetFloat() - exhaustion * 0.45))

    if movetype == MOVETYPE_LADDER then
        SetExhaustion(ply, math.min(exhaustion + FT * 0.11 * hm_exhaustion_rate:GetFloat(), 1))
        SetRecovery(ply, CT + hm_stamina_recover_delay:GetFloat() + 1.5)
        exhaustion = GetExhaustion(ply)
        ply:SetNW2Bool("HM_LadderBlocked", exhaustion >= 0.9)
        ply.HM_WasOnGround = nil
        ply.HM_FallZVel    = nil
        ply.HM_LastYaw     = nil
        return
    else
        ply:SetNW2Bool("HM_LadderBlocked", false)
    end

    if hm_turnpenalty:GetBool() and onground and mv:GetVelocity():Length2D() > 30 then
        local curYaw  = mv:GetAngles().y
        local lastYaw = ply.HM_LastYaw
        if lastYaw then
            local delta = math.abs(math.AngleDifference(curYaw, lastYaw))
            local thr   = hm_turnpenalty_thr:GetFloat()
            if delta > thr then
                local penalty = math.Clamp(
                    1 - (delta - thr) * hm_turnpenalty_scale:GetFloat(),
                    hm_turnpenalty_min:GetFloat(), 1
                )
                local vel = mv:GetVelocity()
                vel.x = vel.x * penalty
                vel.y = vel.y * penalty
                mv:SetVelocity(vel)
            end
        end
    end
    ply.HM_LastYaw = mv:GetAngles().y

    if hm_landingslow:GetBool() or hm_landingpenalty:GetBool() then
        local wasOnGround  = ply.HM_WasOnGround
        ply.HM_WasOnGround = onground

        if not onground then
            local zv = mv:GetVelocity().z
            if not ply.HM_FallZVel or zv < ply.HM_FallZVel then
                ply.HM_FallZVel = zv
            end
        elseif wasOnGround == false then
            local fallvel = ply.HM_FallZVel or 0
            ply.HM_FallZVel = nil

            if hm_landingslow:GetBool() and fallvel < -200 then
                local cost = math.Clamp((math.abs(fallvel) - 200) / 250, 0, 1) * STAMINA_COST_LAND
                ply.HM_LandStamina = math.max(
                    ply.HM_LandStamina or 0,
                    (cost / STAMINA_RECOVER_RATE) * 1000
                )
            end

            if hm_landingpenalty:GetBool() and fallvel < -220 then
                local penalty = math.Clamp((math.abs(fallvel) - 220) / 380, 0, 1)
                SetInertia(ply, GetInertia(ply) * (1 - penalty * 0.85))
                if penalty > 0.35 then
                    SetExhaustion(ply, math.min(exhaustion + penalty * 0.25, 1))
                    SetRecovery(ply, CT + 2.5 * penalty)
                end
            end
        end
    else
        ply.HM_WasOnGround = nil
        ply.HM_FallZVel    = nil
        ply.HM_LandStamina = nil
    end

    -- Strafe penalty (with threshold CVars)
    local veldot = mv:GetVelocity():GetNormalized():Dot(
        ply:GetNW2Vector("HM_LastDir", vector_origin)
    )
    local strafeThr = sprinting and hm_strafepenalty_thr_s:GetFloat()
                                 or hm_strafepenalty_thr:GetFloat()
    if hm_strafepenalty:GetBool() and onground
       and veldot < strafeThr and veldot > 0 then
        SetInertia(ply, 0.06)
    end

    if not ply:Alive() then
        SetExhaustion(ply, 0)
        return
    end

    if bit.band(ply:GetEFlags(), EFL_IS_BEING_LIFTED_BY_BARNACLE) == EFL_IS_BEING_LIFTED_BY_BARNACLE then
        return
    end

    exhaustion = GetExhaustion(ply)

    local HPMod = 0
    if hm_woundpenalty:GetBool() then
        local hpRatio = ply:Health() / math.max(ply:GetMaxHealth(), 1)
        HPMod = math.Clamp((1 - hpRatio), 0, 1) * hm_woundpenalty_scale:GetFloat()
    end

    if moving then
        local exslow     = (hm_exhaustion_slow:GetBool() and exhaustion) or 0
        local target     = (mv:KeyDown(IN_WALK) and 0.04)
                        or math.min(1 - math.max(exslow * 1.18, 0.15) + 0.25, 1)
        local target_spd = (mv:KeyDown(IN_WALK) and 0.85) or 0.125
        local sprintmul  = (sprinting and ply:WaterLevel() < 1) and 3.5 or 1
        if hm_woundpenalty:GetBool() then
            target = target * (1 - HPMod * 0.4)
        end
        SetInertia(ply, math.Approach(GetInertia(ply), target, FT * target_spd * sprintmul))
    else
        SetInertia(ply, math.Approach(GetInertia(ply), 0, FT * 4))
    end

    if moving
       and (not mv:KeyDown(IN_WALK) or ply:GetVelocity():Length() > ply:GetSlowWalkSpeed())
       and exhaustion >= HPMod - 0.0001 then
        local rate
        if sprinting then
            rate = hm_stamina_sprint_cost:GetFloat() * hm_exhaustion_rate:GetFloat()
        else
            rate = hm_stamina_walk_cost:GetFloat()   * hm_exhaustion_rate:GetFloat()
        end
        SetExhaustion(ply, math.Approach(exhaustion, 1, FT * rate))
        SetRecovery(ply, CT + hm_stamina_recover_delay:GetFloat() * exhaustion)
    elseif not sprinting and (CT > GetRecovery(ply) or exhaustion < HPMod) then
        SetExhaustion(ply, math.Approach(exhaustion, HPMod, FT * hm_stamina_recover:GetFloat()))
    end

    if not moving and onground then
        mv:SetVelocity(mv:GetVelocity() * 0.9)
    end

    if onground then
        ply:SetNW2Vector("HM_LastDir", mv:GetVelocity():GetNormalized())
    end
end)

hook.Add("SetupMove", "HEAVIERJumpSetup", function(ply, move)
    if bit.band(move:GetButtons(), IN_JUMP) ~= 0 and
       bit.band(move:GetOldButtons(), IN_JUMP) == 0 and
       ply:OnGround() then
        if hm_jumpcooldown:GetBool() then
            local base = hm_jumppower_base:GetFloat()
            local mn   = hm_jumppower_min:GetFloat()
            ply:SetJumpPower(base - GetExhaustion(ply) * (base - mn))
        end
        if hm_jumpstamina:GetBool() then
            SetExhaustion(ply, math.min(GetExhaustion(ply) + hm_jumpstamina_cost:GetFloat(), 1))
            SetRecovery(ply, CurTime() + hm_stamina_recover_delay:GetFloat())
        end
        JUMPING = true
    end
end)

hook.Add("FinishMove", "HEAVIERMatSlow", function(ply, move)
    if not hm_matslow:GetBool() then return end
    if not ply:OnGround() or ply:GetMoveType() ~= MOVETYPE_WALK then return end
    local mul = MAT_SPEED[ply.HM_GroundMat]
    if not mul then return end
    local vel = move:GetVelocity()
    vel.x = vel.x * mul
    vel.y = vel.y * mul
    move:SetVelocity(vel)
end)

hook.Add("FinishMove", "HEAVIERStairs", function(ply, move)
    if not hm_stairs:GetBool() then return end
    if (ply.HM_StairUntil or 0) <= CurTime() then return end
    if ply:GetMoveType() ~= MOVETYPE_WALK then return end
    local walkspeed = ply:GetWalkSpeed()
    local vel       = move:GetVelocity()
    local xy        = math.sqrt(vel.x * vel.x + vel.y * vel.y)
    if xy > walkspeed and xy > 0 then
        local scale = walkspeed / xy
        vel.x = vel.x * scale
        vel.y = vel.y * scale
        move:SetVelocity(vel)
    end
end)

hook.Add("FinishMove", "HEAVIERLadder", function(ply, move)
    if ply:GetMoveType() ~= MOVETYPE_LADDER then return end
    local exhaustion  = GetExhaustion(ply)
    local vel         = move:GetVelocity()
    local FT          = FrameTime()
    if exhaustion >= 0.9 then
        move:SetVelocity(vel * math.max(1 - FT * 14, 0))
        return
    end
    local speedfactor = 1 - (exhaustion / 0.9) * 0.72
    local maxspeed    = ply:GetRunSpeed() * speedfactor
    local curspeed    = vel:Length()
    if curspeed > maxspeed and curspeed > 0 then
        move:SetVelocity(vel * (maxspeed / curspeed))
    end
end)

hook.Add("FinishMove", "HEAVIERLandSlow", function(ply, move)
    if not hm_landingslow:GetBool() then return end
    if ply:GetMoveType() == MOVETYPE_LADDER then return end
    local stamina = ply.HM_LandStamina or 0
    if stamina <= 0 then return end
    local FT    = FrameTime()
    local ratio = (STAMINA_MAX - (stamina / 1000) * STAMINA_RECOVER_RATE) / STAMINA_MAX
    ratio = math.pow(math.max(ratio, 0), FT * 70)
    local vel = move:GetVelocity()
    vel.x = vel.x * ratio
    vel.y = vel.y * ratio
    move:SetVelocity(vel)
    ply.HM_LandStamina = math.max(stamina - FT * 1000, 0)
end)

hook.Add("FinishMove", "HEAVIERBackSpeed", function(ply, move)
    if not hm_movement:GetBool() then return end
    if ply:GetMoveType() ~= MOVETYPE_WALK then return end
    if not ply:OnGround() then return end
    local vel = move:GetVelocity()
    local ang = Angle(0, move:GetAngles().y, 0)
    local fwd = ang:Forward()
    local dot = vel:GetNormalized():Dot(fwd)
    if dot < -0.5 then
        local mul = hm_backspeed:GetFloat()
        mul = mul + (1 - mul) * math.Clamp((-dot - 0.5) / 0.5, 0, 1)
        vel.x = vel.x * mul
        vel.y = vel.y * mul
        move:SetVelocity(vel)
    end
end)

hook.Add("FinishMove", "HEAVIERJumpBoost", function(ply, move)
    if not JUMPING then return end
    JUMPING = nil
    local forward = move:GetAngles()
    forward.p = 0
    forward = forward:Forward()
    local speedBoostPerc = (not ply:Crouching() and 0.5) or 0.1
    local speedAddition  = math.abs(move:GetForwardSpeed() * speedBoostPerc)
    local maxSpeed       = move:GetMaxSpeed() * (1 + speedBoostPerc)
    local newSpeed       = speedAddition + move:GetVelocity():Length2D()
    if newSpeed > maxSpeed then speedAddition = speedAddition - (newSpeed - maxSpeed) end
    if move:GetVelocity():Dot(forward) < 0 then speedAddition = -speedAddition end
    if newSpeed > 120 then
        move:SetVelocity((forward * -speedAddition) + move:GetVelocity())
    end
end)

if CLIENT then
    local HM_PRESETS = {
        ["Default"] = {
            hm_movement="1", hm_strafepenalty="1", hm_strafepenalty_thr="0.998",
            hm_strafepenalty_thr_s="0.99", hm_sprintlimit="1", hm_turnpenalty="1",
            hm_turnpenalty_thr="1.5", hm_turnpenalty_scale="0.018", hm_turnpenalty_min="0.55",
            hm_backspeed="0.7", hm_stairs="1", hm_noairsprint="1", hm_noitemsprint="0",
            hm_crouchjump="1", hm_nojumpincrouch="1",
            hm_exhaustion_slow="1", hm_jumpstamina="1", hm_jumpstamina_cost="0.1",
            hm_exhaustion_rate="1", hm_stamina_sprint_cost="0.05", hm_stamina_walk_cost="0.0025",
            hm_stamina_recover="0.25", hm_stamina_recover_delay="3",
            hm_jumpdelay="1", hm_jumpcooldown="1",
            hm_jumppower_base="200", hm_jumppower_min="100",
            hm_landingpenalty="1", hm_landingslow="1", hm_matslow="1",
            hm_woundpenalty="1", hm_woundpenalty_scale="0.75",
            hm_speed_walk="140", hm_speed_sprint="240", hm_speed_slowwalk="60",
            hm_speed_crouch="0.9", hm_speed_ladder="130", hm_vignette="1",
        },
        ["ServerSettings"] = {
            hm_movement="1", hm_strafepenalty="1", hm_strafepenalty_thr="0.998",
            hm_strafepenalty_thr_s="0.99", hm_sprintlimit="1", hm_turnpenalty="1",
            hm_turnpenalty_thr="1.5", hm_turnpenalty_scale="0.018", hm_turnpenalty_min="0.55",
            hm_backspeed="0.7", hm_stairs="1", hm_noairsprint="1", hm_noitemsprint="0",
            hm_crouchjump="1", hm_nojumpincrouch="1",
            hm_exhaustion_slow="1", hm_jumpstamina="1", hm_jumpstamina_cost="0.1",
            hm_exhaustion_rate="1", hm_stamina_sprint_cost="0.05", hm_stamina_walk_cost="0.0025",
            hm_stamina_recover="0.25", hm_stamina_recover_delay="3",
            hm_jumpdelay="1", hm_jumpcooldown="1",
            hm_jumppower_base="200", hm_jumppower_min="100",
            hm_landingpenalty="1", hm_landingslow="1", hm_matslow="1",
            hm_woundpenalty="1", hm_woundpenalty_scale="0.75",
            hm_speed_walk="140", hm_speed_sprint="240", hm_speed_slowwalk="60",
            hm_speed_crouch="0.9", hm_speed_ladder="130", hm_vignette="1",
        },
        ["Realistic"] = {
            hm_movement="1", hm_strafepenalty="1", hm_strafepenalty_thr="0.995",
            hm_strafepenalty_thr_s="0.985", hm_sprintlimit="1", hm_turnpenalty="1",
            hm_turnpenalty_thr="1.0", hm_turnpenalty_scale="0.025", hm_turnpenalty_min="0.45",
            hm_backspeed="0.55", hm_stairs="1", hm_noairsprint="1", hm_noitemsprint="1",
            hm_crouchjump="1", hm_nojumpincrouch="1",
            hm_exhaustion_slow="1", hm_jumpstamina="1", hm_jumpstamina_cost="0.15",
            hm_exhaustion_rate="8", hm_stamina_sprint_cost="0.09", hm_stamina_walk_cost="0.004",
            hm_stamina_recover="0.15", hm_stamina_recover_delay="5",
            hm_jumpdelay="1", hm_jumpcooldown="1",
            hm_jumppower_base="180", hm_jumppower_min="80",
            hm_landingpenalty="1", hm_landingslow="1", hm_matslow="1",
            hm_woundpenalty="1", hm_woundpenalty_scale="1",
            hm_speed_walk="110", hm_speed_sprint="190", hm_speed_slowwalk="45",
            hm_speed_crouch="0.6", hm_speed_ladder="90", hm_vignette="1",
        },
        ["CS-Like"] = {
            hm_movement="1", hm_strafepenalty="1", hm_strafepenalty_thr="0.998",
            hm_strafepenalty_thr_s="0.99", hm_sprintlimit="0", hm_turnpenalty="0",
            hm_turnpenalty_thr="1.5", hm_turnpenalty_scale="0.018", hm_turnpenalty_min="0.55",
            hm_backspeed="0.85", hm_stairs="0", hm_noairsprint="0", hm_noitemsprint="0",
            hm_crouchjump="0", hm_nojumpincrouch="0",
            hm_exhaustion_slow="0", hm_jumpstamina="0", hm_jumpstamina_cost="0.1",
            hm_exhaustion_rate="1", hm_stamina_sprint_cost="0.05", hm_stamina_walk_cost="0.0025",
            hm_stamina_recover="0.5", hm_stamina_recover_delay="1",
            hm_jumpdelay="0", hm_jumpcooldown="0",
            hm_jumppower_base="200", hm_jumppower_min="200",
            hm_landingpenalty="0", hm_landingslow="1", hm_matslow="0",
            hm_woundpenalty="0", hm_woundpenalty_scale="0.75",
            hm_speed_walk="200", hm_speed_sprint="320", hm_speed_slowwalk="100",
            hm_speed_crouch="0.5", hm_speed_ladder="200", hm_vignette="0",
        },
        ["Lightweight"] = {
            hm_movement="1", hm_strafepenalty="0", hm_strafepenalty_thr="0.998",
            hm_strafepenalty_thr_s="0.99", hm_sprintlimit="0", hm_turnpenalty="0",
            hm_turnpenalty_thr="1.5", hm_turnpenalty_scale="0.018", hm_turnpenalty_min="0.55",
            hm_backspeed="1", hm_stairs="0", hm_noairsprint="0", hm_noitemsprint="0",
            hm_crouchjump="0", hm_nojumpincrouch="0",
            hm_exhaustion_slow="0", hm_jumpstamina="0", hm_jumpstamina_cost="0.1",
            hm_exhaustion_rate="1", hm_stamina_sprint_cost="0.05", hm_stamina_walk_cost="0.0025",
            hm_stamina_recover="0.5", hm_stamina_recover_delay="1",
            hm_jumpdelay="0", hm_jumpcooldown="0",
            hm_jumppower_base="200", hm_jumppower_min="200",
            hm_landingpenalty="0", hm_landingslow="0", hm_matslow="0",
            hm_woundpenalty="0", hm_woundpenalty_scale="0.75",
            hm_speed_walk="140", hm_speed_sprint="240", hm_speed_slowwalk="60",
            hm_speed_crouch="0.9", hm_speed_ladder="130", hm_vignette="0",
        },
    }

    local COL_CLIENT   = Color( 60, 110, 200)
    local COL_MOVEMENT = Color( 50, 160,  70)
    local COL_STAMINA  = Color(190,  55,  55)
    local COL_JUMPING  = Color(120,  70, 190)
    local COL_WOUND    = Color(180, 120,  30)

    local function MakeHeader(panel, text, col)
        local lbl = vgui.Create("DLabel", panel)
        lbl:SetText(text)
        lbl:SetFont("DermaDefaultBold")
        lbl:SetTextColor(Color(255, 255, 255, 230))
        lbl:SetContentAlignment(5)
        lbl:SetTall(26)
        local c = col
        function lbl:Paint(w, h)
            local cut = 5
            surface.SetDrawColor(8, 8, 10, 245)
            surface.DrawRect(cut, 0, w - cut * 2, h)
            surface.DrawRect(0, cut, cut, h - cut * 2)
            surface.DrawRect(w - cut, cut, cut, h - cut * 2)
            surface.SetDrawColor(c.r, c.g, c.b, 190)
            surface.DrawRect(cut, 0, w - cut * 2, 1)
            surface.DrawRect(cut, h - 1, w - cut * 2, 1)
            surface.DrawRect(0, cut, 1, h - cut * 2)
            surface.DrawRect(w - 1, cut, 1, h - cut * 2)
            surface.SetDrawColor(c.r, c.g, c.b, 70)
            surface.DrawRect(cut, 1, w - cut * 2, 2)
            surface.DrawRect(cut, h - 3, w - cut * 2, 2)
        end
        panel:AddItem(lbl)
    end

    local function AddSpacer(panel)
        local sp = vgui.Create("DPanel", panel)
        sp:SetTall(5)
        function sp:Paint() end
        panel:AddItem(sp)
    end

    hook.Add("PopulateToolMenu", "HEAVIERSettings", function()
        spawnmenu.AddToolMenuOption("Options", "Heavier Movement.", "HMSettings:", "Heavier Movement.", "", "", function(panel)
            panel:ClearControls()

            local presets = vgui.Create("ControlPresets", panel)
            presets:SetPreset("HeavierMovement")
            for name, vals in pairs(HM_PRESETS) do
                presets:AddOption(name, vals)
            end
            for cv in pairs(HM_PRESETS["Default"]) do
                presets:AddConVar(cv)
            end
            panel:AddItem(presets)

            AddSpacer(panel)
            MakeHeader(panel, "CLIENT", COL_CLIENT)
            panel:AddItem(panel:CheckBox("Exhaustion Vignette", "hm_vignette"))

            AddSpacer(panel)
            MakeHeader(panel, "MOVEMENT", COL_MOVEMENT)
            panel:AddItem(panel:CheckBox("Movement System (inertia)",      "hm_movement"))
            panel:AddItem(panel:CheckBox("Strafe Penalty",                 "hm_strafepenalty"))
            panel:AddItem(panel:NumSlider("Strafe Threshold (walk)",       "hm_strafepenalty_thr",   0.9, 1,    3))
            panel:AddItem(panel:NumSlider("Strafe Threshold (sprint)",     "hm_strafepenalty_thr_s", 0.9, 1,    3))
            panel:AddItem(panel:CheckBox("Block Backward Sprint",          "hm_sprintlimit"))
            panel:AddItem(panel:NumSlider("Backward Speed Multiplier",     "hm_backspeed",           0.1, 1,    2))
            panel:AddItem(panel:CheckBox("Turn Speed Penalty",             "hm_turnpenalty"))
            panel:AddItem(panel:NumSlider("Turn Threshold (degrees)",      "hm_turnpenalty_thr",     0,   45,   1))
            panel:AddItem(panel:NumSlider("Turn Penalty Scale",            "hm_turnpenalty_scale",   0,   0.1,  3))
            panel:AddItem(panel:NumSlider("Turn Min Speed Mult",           "hm_turnpenalty_min",     0,   1,    2))
            panel:AddItem(panel:CheckBox("Stair Sprint Block",             "hm_stairs"))
            panel:AddItem(panel:CheckBox("Disable Air Sprint",             "hm_noairsprint"))
            panel:AddItem(panel:CheckBox("Disable Sprint While Holding",   "hm_noitemsprint"))
            panel:AddItem(panel:CheckBox("Material-Based Speed Penalty",   "hm_matslow"))
            local cj = panel:ComboBox("Crouch-Jump Settings:", "hm_crouchjump")
            cj:AddChoice("0 - Free air-crouching", 0)
            cj:AddChoice("1 - One air-duck",        1)
            cj:AddChoice("2 - No un-crouching",     2)
            cj:AddChoice("3 - No air-crouching",    3)
            panel:AddItem(cj)
            panel:AddItem(panel:CheckBox("Block Jump While Crouched",      "hm_nojumpincrouch"))
            panel:AddItem(panel:NumSlider("Walk Speed",      "hm_speed_walk",     60,  400, 0))
            panel:AddItem(panel:NumSlider("Sprint Speed",    "hm_speed_sprint",   60,  400, 0))
            panel:AddItem(panel:NumSlider("Slow Walk Speed", "hm_speed_slowwalk", 10,  200, 0))
            panel:AddItem(panel:NumSlider("Crouch Speed",    "hm_speed_crouch",   0.1, 1,   2))
            panel:AddItem(panel:NumSlider("Ladder Speed",    "hm_speed_ladder",   10,  400, 0))

            AddSpacer(panel)
            MakeHeader(panel, "STAMINA AND EXHAUSTION", COL_STAMINA)
            panel:AddItem(panel:CheckBox("Exhaustion Slowdown",          "hm_exhaustion_slow"))
            panel:AddItem(panel:NumSlider("Exhaustion Rate Multiplier",  "hm_exhaustion_rate",      0,    50,    0))
            panel:AddItem(panel:NumSlider("Sprint Stamina Cost/sec",     "hm_stamina_sprint_cost",  0,    1,     3))
            panel:AddItem(panel:NumSlider("Walk Stamina Cost/sec",       "hm_stamina_walk_cost",    0,    0.1,   4))
            panel:AddItem(panel:NumSlider("Stamina Recovery Rate",       "hm_stamina_recover",      0,    5,     2))
            panel:AddItem(panel:NumSlider("Recovery Delay (seconds)",    "hm_stamina_recover_delay",0,    15,    1))

            AddSpacer(panel)
            MakeHeader(panel, "JUMPING AND LANDING", COL_JUMPING)
            panel:AddItem(panel:CheckBox("Jump Delay (0.1s)",            "hm_jumpdelay"))
            panel:AddItem(panel:CheckBox("Jump Cooldown (exhaustion)",   "hm_jumpcooldown"))
            panel:AddItem(panel:NumSlider("Base Jump Power",             "hm_jumppower_base",       50,   400,   0))
            panel:AddItem(panel:NumSlider("Min Jump Power (exhausted)",  "hm_jumppower_min",        0,    400,   0))
            panel:AddItem(panel:CheckBox("Jumping Costs Stamina",        "hm_jumpstamina"))
            panel:AddItem(panel:NumSlider("Jump Stamina Cost",           "hm_jumpstamina_cost",     0,    1,     2))
            panel:AddItem(panel:CheckBox("Landing Fatigue",              "hm_landingpenalty"))
            panel:AddItem(panel:CheckBox("Landing Slowdown (CS-style)",  "hm_landingslow"))

            AddSpacer(panel)
            MakeHeader(panel, "WOUND PENALTY", COL_WOUND)
            panel:AddItem(panel:CheckBox("Enable Wound Penalty",         "hm_woundpenalty"))
            panel:AddItem(panel:NumSlider("Wound Penalty Scale",         "hm_woundpenalty_scale",   0,    1,     2))

            panel:AddItem(panel:ControlHelp("Speed changes require respawn to apply."))
            panel:AddItem(panel:ControlHelp("Thank you for using this addon!"))
        end)
    end)
end