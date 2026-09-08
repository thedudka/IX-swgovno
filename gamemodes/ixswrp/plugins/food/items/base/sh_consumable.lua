ITEM.name = "Consumable"
ITEM.description = "A consumable item."
ITEM.model = Model("models/props_junk/watermelon01.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 1
ITEM.AddStam = 0
ITEM.AddHealth = 0
ITEM.useTime = 1
ITEM.useSound = "npc/barnacle/barnacle_gulp1.wav"

local function resolveTarget(entity)
	if IsValid(entity) and IsValid(entity.ixPlayer) then
		return entity.ixPlayer
	end

	return entity
end

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
	if not treatment then
		return
	end

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
	if IsValid(worldEntity) then
		return worldEntity.ixItemID == item.id
	end

	local inventory = ix.item.inventories[inventoryID]
	return inventory and inventory:GetItemByID(item.id) == item
end

local function startTreatment(item, client, target, targetEntity)
	if client.ixFoodTreatment then
		return false
	end

	if not IsValid(client) or not client:Alive() or not item or
		not IsValid(target) or not target:IsPlayer() or not target:Alive() or target:InCriticalState() then
		return false
	end

	local duration = math.max(tonumber(item.useTime) or 5, 0.1)
	if target ~= client then
		duration = duration * 0.5
	end
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
		if not IsValid(client) or not client:Alive() or not item or
			not IsValid(target) or not target:IsPlayer() or not target:Alive() or target:InCriticalState() or
			not isItemAvailable(item, inventoryID, worldEntity) then
			resetTreatment()
			return
		end

		local health = math.min(target:Health() + math.max(tonumber(item.AddHealth) or 0, 0), target:GetMaxHealth())
		local healthChanged = health > target:Health()

		if healthChanged then
			target:SetHealth(health)
		end

		local staminaBefore = target:GetLocalVar("stm", 0)
		local addStam = math.max(tonumber(item.AddStam) or 0, 0)
		if addStam > 0 and target.RestoreStamina then
			target:RestoreStamina(addStam)
		end
		local staminaChanged = target:GetLocalVar("stm", 0) > staminaBefore

		if item.useSound then
			target:EmitSound(item.useSound)
		end
		
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

	if targetEntity then
		client:SetAction("Применение...", duration)
		client:DoStaredAction(targetEntity, completeTreatment, duration, resetTreatment)
	else
		client:SetAction("Применение...", duration)
		timer.Create(completeTimer, duration, 1, completeTreatment)
	end

	return false
end

function ITEM:OnTransferred(curInv, inventory)
	cancelItemTreatment(self)
end

function ITEM:OnDrop()
	cancelItemTreatment(self)
end

function ITEM:OnRemoved()
	cancelItemTreatment(self)
end

function ITEM:OnInstanced(invID, x, y, item)
	if self:GetData("uses") == nil then
		self:SetData("uses", self.dUses)
	end
end

if CLIENT then
	function ITEM:GetDescription()
		local uses = getUses(self)

		return self.description .. "\n\nОсталось использований: " .. uses .. "/" .. self.dUses
	end
end

function ITEM:OnCanUse(client)
	if not IsValid(client) or not client:Alive() or not client:GetCharacter() or client.ixFoodTreatment then
		return false
	end

	return getUses(self) > 0
end

ITEM.functions.Use = {
	name = "Съесть",
	OnRun = function(item)
		local client = item.player
		if not IsValid(client) or not item:OnCanUse(client) then
			return false
		end

		return startTreatment(item, client, client)
	end,
	OnCanRun = function(item)
		return IsValid(item.player) and item:OnCanUse(item.player) and not item.player.ixFoodTreatment
	end
}

