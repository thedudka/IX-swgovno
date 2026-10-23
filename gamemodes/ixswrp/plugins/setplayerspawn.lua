
local PLUGIN = PLUGIN
PLUGIN.name = "Set Player Spawn"
PLUGIN.author = "M!NT"
PLUGIN.description = "Sets the PLAYER spawn point entities (not character!) wherever you want."
PLUGIN.readme = "Wherever these entities are spawned, when a player joins them there, it will select one at random to spawn them at until they load a character."

if SERVER then
    hook.Add("PlayerSelectSpawn", "PlayerSpawnSelector", function(pl)
        local spawns = ents.FindByClass("player_spawn_anchor")
        if (#spawns < 1) then
            spawns = ents.FindByClass("info_player_start")
        end

        return spawns[math.random(#spawns)]
    end)
end

do
    local anchor = {}
    anchor.Type = "anim"
    anchor.Base = "base_gmodentity"
    anchor.PrintName = "Player Spawn Anchor"
    anchor.Author = "M!NT"
    anchor.Category = "HL2 RP"
    anchor.Contact = ""
    anchor.Purpose = ""
    anchor.Instructions = ""
    anchor.Spawnable = false
    anchor.AdminOnly = true

    function anchor:Initialize()
        self:SetModel("models/props_junk/Shoe001a.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(true)
            phys:Wake()
        end
    end

    function anchor:Draw()
        self:DrawModel()
    end

    scripted_ents.Register(anchor, "player_spawn_anchor")
end

CAMI.RegisterPrivilege({
	Name = "Helix - Manage Player Spawn Anchors",
	MinAccess = "superadmin"
})

ix.command.Add("AddSpawnPoint", {
    description = "Создает точку спавна на месте куда вы смотрите.",
    arguments = {},
    privilege = "Manage Player Spawn Anchors",
    OnRun = function(self, client, pbx)
        local ent = ents.Create("player_spawn_anchor")
        ent:SetPos(client:GetEyeTrace().HitPos)

        ix.saveEnts:SaveEntity(ent)
    end
})


ix.command.Add("ClearSpawnPoint", {
    description = "Очищает все точки спавна.",
    arguments = {},
    privilege = "Manage Player Spawn Anchors",
    OnRun = function(self, client, pbx)
        for _, ent in ipairs(ents.FindByClass("player_spawn_anchor")) do
            ent:Remove()
        end
    end
})
