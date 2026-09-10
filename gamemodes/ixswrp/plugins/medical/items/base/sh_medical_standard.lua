ITEM.name = "Медицинский предмет"
ITEM.description = "Медицинский предмет, восстанавливающий здоровье и броню."
ITEM.model = Model("models/items/healthkit.mdl")
ITEM.category = "Медицина"
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 1
ITEM.healAmount = 25
ITEM.armorAmount = 0
ITEM.maxArmor = 100
ITEM.useTime = 5
ITEM.useSound = "items/medshot4.wav"

local function resolveTarget(entity)
	if IsValid(entity) and IsValid(entity.ixPlayer) then
		return entity.ixPlayer
	end

	return entity
end

local function getUses(item)
	return math.max(math.floor(tonumber(item:GetData("uses", item.dUses)) or item.dUses), 0)
end

local function consumeUse(item)
	local uses = getUses(item) - 1
	if uses <= 0 then
		item:Remove()
	else
		item:SetData("uses", uses)
	end
end

local function cancelItemTreatment(item)
	local treatment = item.ixMedicalTreatment
	if not treatment then
		return
	end

	local client = treatment.client
	item.ixMedicalTreatment = nil

	if IsValid(client) then
		local steamID = client:SteamID64()
		timer.Remove("ixMedicalStandardWatch_" .. steamID)
		timer.Remove("ixMedicalStandardComplete_" .. steamID)

		client:SetAction(false)
		client.ixMedicalTreatment = nil
	end
end

local function isItemInInventory(item, inventoryID)
	local inventory = ix.item.inventories[inventoryID]
	return inventory and inventory:GetItemByID(item.id) == item
end

local function startTreatment(item, client, target, targetEntity)
	if client.ixMedicalTreatment then
		return false
	end

	if not IsValid(client) or not client:Alive() or not item or
		not IsValid(target) or not target:IsPlayer() or not target:Alive() or target:InCriticalState() then
		return false
	end

	local duration = math.max(tonumber(item.useTime) or 5, 0.1)
	local inventoryID = item.invID
	local steamID = client:SteamID64()
	local watchTimer = "ixMedicalStandardWatch_" .. steamID
	local completeTimer = "ixMedicalStandardComplete_" .. steamID

	local function resetTreatment(player)
		player = player or client
		timer.Remove(watchTimer)
		timer.Remove(completeTimer)

		if item and item.ixMedicalTreatment and item.ixMedicalTreatment.client == client then
			item.ixMedicalTreatment = nil
		end
		if IsValid(player) then
			player:SetAction(false)
			player.ixMedicalTreatment = nil
		end
	end

	local function completeTreatment()
		if not IsValid(client) or not client:Alive() or not item or
			not IsValid(target) or not target:IsPlayer() or not target:Alive() or target:InCriticalState() or
			not isItemInInventory(item, inventoryID) then
			resetTreatment()
			return
		end

		local health = math.min(target:Health() + math.max(tonumber(item.healAmount) or 0, 0), target:GetMaxHealth())
		local armorAmount = math.max(tonumber(item.armorAmount) or 0, 0)
		local maxArmor = math.max(tonumber(item.maxArmor) or 100, 0)
		local armor = math.min(target:Armor() + armorAmount, maxArmor)
		local healthChanged = health > target:Health()
		local armorChanged = armor > target:Armor()

		if healthChanged then
			target:SetHealth(health)
		end

		if armorChanged then
			target:SetArmor(armor)
		end

		if not healthChanged and not armorChanged then
			resetTreatment()
			return
		end

		if item.useSound then
			target:EmitSound(item.useSound)
		end
		
		consumeUse(item)
		resetTreatment()
	end

	client.ixMedicalTreatment = true
	item.ixMedicalTreatment = {client = client}

	timer.Create(watchTimer, 0.1, 0, function()
		if not IsValid(client) or not client:Alive() or not isItemInInventory(item, inventoryID) then
			resetTreatment()
		end
	end)

	if targetEntity then
		client:SetAction("Применение...", duration * 0.5)
		client:DoStaredAction(targetEntity, completeTreatment, duration * 0.5, resetTreatment)
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
	if not IsValid(client) or not client:Alive() then
		return false
	end

	local canHeal = client:Health() < client:GetMaxHealth() and (tonumber(self.healAmount) or 0) > 0
	local canRestoreArmor = client:Armor() < (tonumber(self.maxArmor) or 100) and (tonumber(self.armorAmount) or 0) > 0

	return canHeal or canRestoreArmor
end

ITEM.functions.Use = {
	name = "Использовать",
	OnRun = function(item)
		local client = item.player
		if not IsValid(client) or not item:OnCanUse(client) then
			return false
		end

		return startTreatment(item, client, client)
	end,
	OnCanRun = function(item)
		return IsValid(item.player) and item:OnCanUse(item.player) and not item.player.ixMedicalTreatment
	end
}

ITEM.functions.Inject = {
	name = "Применить на",
	OnRun = function(item)
		local client = item.player
		if not IsValid(client) or not client:Alive() or client.ixMedicalTreatment then
			return false
		end

		local trace = client:GetEyeTrace()
		local target = resolveTarget(trace.Entity)

		if not IsValid(target) or not target:IsPlayer() or not target:Alive() or not target:GetCharacter() then
			return false
		end

		if target:IsCriticalState() then
			client:Notify("Пациенту нужен реанимационный набор!")
			return false
		end

		local maxArmor = tonumber(item.maxArmor) or 100
		local canHeal = target:Health() < target:GetMaxHealth() and (tonumber(item.healAmount) or 0) > 0
		local canRestoreArmor = target:Armor() < maxArmor and (tonumber(item.armorAmount) or 0) > 0

		if not canHeal and not canRestoreArmor then
			return false
		end

		return startTreatment(item, client, target, trace.Entity)
	end,
	OnCanRun = function(item)
		return IsValid(item.player) and item.player:Alive() and not item.player.ixMedicalTreatment
	end
}
