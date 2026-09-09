local PLUGIN = PLUGIN

local function CanAccessMenus(client)
    if not IsValid(client) then return false end

    if client:IsAdmin() or client:IsSuperAdmin() then
        return true
    end

    local char = client:GetCharacter()
    if char and char:HasFlags("e") then
        return true
    end

    return false
end

if CLIENT then
    function PLUGIN:OnSpawnMenuOpen()
        if not CanAccessMenus(LocalPlayer()) then
            return false
        end
    end

    function PLUGIN:OnContextMenuOpen()
        if not CanAccessMenus(LocalPlayer()) then
            return false
        end
    end

    function PLUGIN:SpawnmenuOpen()
        return CanAccessMenus(LocalPlayer())
    end

    function PLUGIN:ContextMenuOpen()
        return CanAccessMenus(LocalPlayer())
    end

    local function PatchPanel(pnl)
        if not IsValid(pnl) then return end
        
        local oldSetVisible = pnl.SetVisible
        pnl.SetVisible = function(self, visible)
            if visible and not CanAccessMenus(LocalPlayer()) then
                return -- Drop the draw signal entirely
            end
            return oldSetVisible(self, visible)
        end
    end

    hook.Add("InitPostEntity", "Helix_BlockMenuFlicker_VGUI", function()
        if g_SpawnMenu then PatchPanel(g_SpawnMenu) end
        if g_ContextMenu then PatchPanel(g_ContextMenu) end
    end)
end

-- Server-Side Safeguards (Prevents keybind/console execution)
if SERVER then
    function PLUGIN:PlayerSpawnEffect(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerSpawnNPC(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerSpawnObject(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerSpawnProp(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerSpawnRagdoll(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerSpawnSENT(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerSpawnVehicle(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerGiveSWEP(ply) return CanAccessMenus(ply) end
    function PLUGIN:PlayerSpawnSWEP(ply) return CanAccessMenus(ply) end
end