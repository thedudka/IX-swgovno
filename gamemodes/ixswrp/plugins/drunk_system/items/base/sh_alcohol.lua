ITEM.name = "Alcohol Base"
ITEM.description = "An alcoholic beverage."
ITEM.model = Model("models/props_junk/glassjug01.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Alcohol"
ITEM.dUses = 1
ITEM.DrunkAdd = 10
ITEM.useTime = 0
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"

local function getUses(item)
    return math.max(math.floor(tonumber(item:GetData("uses", item.dUses)) or item.dUses), 0)
end

local function consumeUse(item, worldEntity)
    local uses = getUses(item) - 1
    if uses <= 0 then
        item:Remove()
        if IsValid(worldEntity) then
            worldEntity.ixIsSafe = true
            worldEntity:Remove()
        end
    else
        item:SetData("uses", uses)
    end
end

local function cancelItemTreatment(item)
    local treatment = item.ixFoodTreatment
    if not treatment then return end

    local client = treatment.client
    item.ixFoodTreatment = nil

    if IsValid(client) then
        local steamID = client:SteamID64()
        timer.Remove("ixFoodStandardWatch_" .. steamID)
        timer.Remove("ixFoodStandardComplete_" .. steamID)

        client:SetAction(false)
        client.ixFoodTreatment = nil
    end
end

local function isItemAvailable(item, inventoryID, worldEntity)
    if IsValid(worldEntity) then return worldEntity.ixItemID == item.id end
    local inventory = ix.item.inventories[inventoryID]
    return inventory and inventory:GetItemByID(item.id) == item
end

local function startTreatment(item, client, target, targetEntity)
    if client.ixFoodTreatment then return false end
    if not IsValid(client) or not client:Alive() or not item or not IsValid(target) or not target:IsPlayer() or not target:Alive() then return false end

    local duration = math.max(tonumber(item.useTime) or 5, 0.1)
    if target ~= client then duration = duration * 0.5 end

    local inventoryID = item.invID
    local worldEntity = item.entity
    local steamID = client:SteamID64()
    local watchTimer = "ixFoodStandardWatch_" .. steamID
    local completeTimer = "ixFoodStandardComplete_" .. steamID

    local function resetTreatment(player)
        player = player or client
        timer.Remove(watchTimer)
        timer.Remove(completeTimer)

        if item and item.ixFoodTreatment and item.ixFoodTreatment.client == client then
            item.ixFoodTreatment = nil
        end
        if IsValid(player) then
            player:SetAction(false)
            player.ixFoodTreatment = nil
        end
    end

    local function completeTreatment()
        if not IsValid(client) or not client:Alive() or not item or not IsValid(target) or not target:IsPlayer() or not target:Alive() or not isItemAvailable(item, inventoryID, worldEntity) then
            resetTreatment()
            return
        end

        local character = target:GetCharacter()
        if (character) then
            local currentDrunk = character:GetDrunk() or 0
            local drunkToAdd = math.max(tonumber(item.DrunkAdd) or 0, 0)
            local newDrunk = math.min(currentDrunk + drunkToAdd, 100)

            character:SetDrunk(newDrunk)

            
            if (newDrunk >= 100 and currentDrunk < 100) then
                target:Notify("Вы больше не можете стоять на ногах.")
                target:SetRagdolled(true, 60) 
            elseif (newDrunk >= 65 and currentDrunk < 65) then
                target:Notify("Вы чувствуете, как ваш язык развязывается.")
            elseif (newDrunk >= 45 and currentDrunk < 45) then
                target:Notify("Вы чувствуете головокружение.")
            elseif (newDrunk >= 25 and currentDrunk < 25) then
                target:Notify("Вы чувствуете тепло, но ваше зрение размыто.")
            end
        end

        if item.useSound then target:EmitSound(item.useSound) end

        consumeUse(item, worldEntity)
        resetTreatment()
    end

    client.ixFoodTreatment = true
    item.ixFoodTreatment = {client = client}

    timer.Create(watchTimer, 0.1, 0, function()
        if not IsValid(client) or not client:Alive() or not isItemAvailable(item, inventoryID, worldEntity) then
            resetTreatment()
        end
    end)

    client:SetAction("Применение...", duration)
    timer.Create(completeTimer, duration, 1, completeTreatment)

    return false
end

function ITEM:OnTransferred(curInv, inventory) cancelItemTreatment(self) end
function ITEM:OnDrop() cancelItemTreatment(self) end
function ITEM:OnRemoved() cancelItemTreatment(self) end
function ITEM:OnInstanced(invID, x, y, item)
    if self:GetData("uses") == nil then self:SetData("uses", self.dUses) end
end

if CLIENT then
    function ITEM:GetDescription()
        local uses = getUses(self)
        return self.description .. "\n\nОсталось глотков: " .. uses .. "/" .. self.dUses
    end
end

function ITEM:OnCanUse(client)
    if not IsValid(client) or not client:Alive() or not client:GetCharacter() or client.ixFoodTreatment then return false end
    return getUses(self) > 0
end

ITEM.functions.Use = {
    name = "Выпить",
    OnRun = function(item)
        local client = item.player
        if not IsValid(client) or not item:OnCanUse(client) then return false end
        return startTreatment(item, client, client)
    end,
    OnCanRun = function(item)
        return IsValid(item.player) and item:OnCanUse(item.player) and not item.player.ixFoodTreatment
    end
}