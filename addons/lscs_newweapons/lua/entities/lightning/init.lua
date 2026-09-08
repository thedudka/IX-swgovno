DEFINE_BASECLASS("base_anim")

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Lightning Entity"
ENT.Author = "YOU"
ENT.Category = "Custom Forces"

function ENT:Initialize()
    if SERVER then
        self:SetModel("models/props/cs_militia/militiarock02.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:DrawShadow(true)
        self:SetRenderMode(RENDERMODE_TRANSALPHA)
        self:SetColor(Color(255, 255, 255, 0)) -- Make the entity invisible

        local phys = self:GetPhysicsObject()

        if IsValid(phys) then
            phys:EnableMotion(false)
        end
    end
end

function ENT:PhysicsCollide(data, phys)
    timer.Simple(0.15, function()
        if not IsValid(self) then return end
        self:Remove()
    end)
end

function ENT:OnRemove()
    if not IsValid(self) then return end
    local pos = self:GetPos()

    local lightningStrike = ents.Create("lightning_entity") -- Yıldırım efektini oluştur
    lightningStrike:SetPos(pos + Vector(0, 0, 100)) -- Yıldırımı bu entity'nin pozisyonunun üstüne indir
    lightningStrike:SetParent(self) -- Yıldırımın bu entity'ye bağlı olduğunu belirt
    lightningStrike:Spawn()
    lightningStrike:Activate()

    timer.Simple(0.5, function() -- Yıldırımı belirli bir süre sonra kaldır
        if IsValid(lightningStrike) then
            lightningStrike:Remove()
        end
    end)

    local ex = ents.Create("env_explosion")
    local own = self.Owner
    ex:SetOwner(own)
    ex:SetKeyValue("iMagnitude", "0")
    ex:SetKeyValue("iRadiusOverride", "500")
    ex:SetPos(pos)
    ex:Spawn()
    ex:Activate()
    ex:Fire("Explode")
    util.BlastDamage(self, own, pos, 500, 2500)
end

-- Register the entity
scripted_ents.Register(ENT, "your_custom_entity_name")