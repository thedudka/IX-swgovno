local force = {}
force.PrintName = "Rook"
force.Author = "UCCROW"
force.Description = ""
force.id = "rook" -- lowercase only
--force.Spawnable = false  -- uncomment to unlist in q-menu

--[[
-- adds a hook to Think with 0.1 second interval. Only uncomment if needed
force.OnClk =  function( ply, TIME )
	print(TIME)
end
]]

force.Equip = function( ply )
	print("i got equipped")
end

force.UnEquip = function( ply )
	print("i got unequipped :(")
end

force.StartUse = function(ply)
    if ply:lscsGetForce() < 24 then return end -- Yeterli miktarda force puanımız var mı?

    local targetPlayer = FindTargetPlayerInArea(ply, 300) -- 300 birimlik bir alanda hedef arayalım

    if not IsValid(targetPlayer) then return end -- Geçerli bir hedef bulunamazsa çık

    -- Burada LSCS:PlayerCanManipulate fonksiyonunu kullanarak hedefi manipüle edip edemeyeceğinizi kontrol edebilirsiniz
    -- if hook.Run( "LSCS:PlayerCanManipulate", ply, targetPlayer, false ) then return end

    ply:lscsTakeForce(24) -- Force'u harcayalım

    ply:EmitSound("npc/combine_gunship/ping_search.wav")

    LSCS:PlayVCDSequence(ply, "gesture_signal_halt", 0) -- Animasyonu oynayalım

    -- Hedef oyuncuyla yer değiştiren fonksiyonu çağıralım
    SwapPositions(ply, targetPlayer)

    -- Oyuncuların altında kıvılcım efekti ekleyen fonksiyonu çağıralım
    EmitSparksEffects(ply:GetPos(), targetPlayer:GetPos())
end

function FindTargetPlayerInArea(ply, radius)
    local targets = ents.FindInSphere(ply:GetPos(), radius)
    for _, ent in ipairs(targets) do
        if ent:IsPlayer() and ent ~= ply then
            return ent
        end
    end
    return nil
end

-- Örnek bir fonksiyon: Belirli bir görüş mesafesindeki bir oyuncuyu bulup döndüren fonksiyon
function FindTargetPlayerInView(ply, distance)
    local trace = util.TraceLine({
        start = ply:EyePos(),
        endpos = ply:EyePos() + ply:GetAimVector() * distance,
        filter = function(ent) return ent:IsPlayer() and ent ~= ply end
    })

    return trace.Entity
end

-- Örnek bir fonksiyon: Hedef oyuncuyla yer değiştiren fonksiyon
function SwapPositions(ply1, ply2)
    local pos1 = ply1:GetPos()
    local pos2 = ply2:GetPos()

    ply1:SetPos(pos2)
    ply2:SetPos(pos1)
end

-- Örnek bir fonksiyon: Oyuncuların altında kıvılcım efekti ekleyen fonksiyon
function EmitSparksEffects(pos1, pos2)
    EmitSparksEffect(pos1)
    EmitSparksEffect(pos2)
end

-- Örnek bir fonksiyon: Kıvılcım efekti ekleyen fonksiyon
function EmitSparksEffect(position)
    local effectData = EffectData()
    effectData:SetOrigin(position)
    effectData:SetMagnitude(1)
    effectData:SetScale(1)

    util.Effect("HelicopterMegaBomb", effectData)
end


force.StopUse = function( ply )
	-- called when the force power key is released
end

LSCS:RegisterForce( force )