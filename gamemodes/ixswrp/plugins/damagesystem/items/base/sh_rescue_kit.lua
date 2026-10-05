ITEM.name = "Реанимационный набор"
ITEM.description = "Базовый предмет для реанимации игроков в критическом состоянии."
ITEM.model = Model("models/items/healthkit.mdl")
ITEM.category = "Реанимационные наборы"
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 1
ITEM.useTime = 8
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
	local treatment = item.ixRescueTreatment
	if not treatment then
		return
	end

	local client = treatment.client
	item.ixRescueTreatment = nil

	if IsValid(client) then
		local steamID = client:SteamID64()
		timer.Remove("ixRescueKitWatch_" .. steamID)
		timer.Remove("ixRescueKitComplete_" .. steamID)

		client:SetAction(false)
		client.ixRescueTreatment = nil
	end
end

local function isItemInInventory(item, inventoryID)
	local inventory = ix.item.inventories[inventoryID]
	return inventory and inventory:GetItemByID(item.id) == item
end

local function startTreatment(item, client, target, targetEntity)
	if client.ixRescueTreatment then
		return false
	end

	if not IsValid(client) or not client:Alive() or not item or
		not IsValid(target) or not target:IsPlayer() or not target:Alive() or not target:IsCritical() then
		return false
	end

	local duration = math.max(tonumber(item.useTime) or 5, 0.1)
	local inventoryID = item.invID
	local steamID = client:SteamID64()
	local watchTimer = "ixRescueKitWatch_" .. steamID
	local completeTimer = "ixRescueKitComplete_" .. steamID

	local function resetTreatment(player)
		player = player or client
		timer.Remove(watchTimer)
		timer.Remove(completeTimer)

		if item and item.ixRescueTreatment and item.ixRescueTreatment.client == client then
			item.ixRescueTreatment = nil
		end
		if IsValid(player) then
			player:SetAction(false)
			player.ixRescueTreatment = nil
		end
	end

	local function completeTreatment()
		if not IsValid(client) or not client:Alive() or not item or
			not IsValid(target) or not target:IsPlayer() or not target:Alive() or not target:IsCritical() or
			not isItemInInventory(item, inventoryID) then
			resetTreatment()
			return
		end

		if targetEntity then
			local trace = client:GetEyeTrace()
			local tracedTarget = resolveTarget(trace.Entity)
			if not IsValid(tracedTarget) or tracedTarget ~= target then
				resetTreatment()
				return
			end
		end

		if item.useSound then
			target:EmitSound(item.useSound)
		end

		local reviveHealth = math.max(tonumber(item.reviveHealth) or 50, 0)
		local reviveArmor = math.max(tonumber(item.reviveArmor) or 0, 0)
		local revivePosition = target.ixCriticalPosition or target:GetPos()

		target:SetCriticalState(false)
		target:SetHealth(math.min(reviveHealth, target:GetMaxHealth()))
		target:SetArmor(reviveArmor)
		target:SetPos(revivePosition)
		target:SetCriticalBlood(300)
		consumeUse(item)
		resetTreatment()
	end

	client.ixRescueTreatment = true
	item.ixRescueTreatment = {client = client}

	timer.Create(watchTimer, 0.1, 0, function()
		if not IsValid(client) or not client:Alive() or not isItemInInventory(item, inventoryID) then
			resetTreatment()
		end
	end)

	if targetEntity then
		client:SetAction("Реанимация...", duration)
		client:DoStaredAction(targetEntity, completeTreatment, duration, resetTreatment)
	else
		client:SetAction("Реанимация...", duration)
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

	local trace = client:GetEyeTrace()
	local target = resolveTarget(trace.Entity)

	if not IsValid(target) or not target:IsPlayer() or not target:IsCritical() then
		return false
	end

	return true
end

ITEM.functions.Inject = {
	name = "Реанимировать",
	OnRun = function(item)
		local client = item.player
		if not IsValid(client) or not client:Alive() or client.ixRescueTreatment then
			return false
		end

		local trace = client:GetEyeTrace()
		local target = resolveTarget(trace.Entity)

		if not IsValid(target) or not target:IsPlayer() or not target:IsCritical() then
			return false
		end

		return startTreatment(item, client, target, trace.Entity)
	end,
	OnCanRun = function(item)
		return IsValid(item.player) and item.player:Alive() and not item.player.ixRescueTreatment
	end
}
