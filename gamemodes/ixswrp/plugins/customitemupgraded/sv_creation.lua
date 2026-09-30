if (not SERVER) then return end

local MAX_NAME = 64
local MAX_DESC = 2048
local MAX_ROW_TEXT = 256
local MAX_ROWS = 24
local MAX_PAYLOAD = 32768

local function ClampString(value, maxLen)
	if (not isstring(value)) then return "" end
	if (#value > maxLen) then return string.sub(value, 1, maxLen) end
	return value
end

local function SanitizeColor(value)
	if (not istable(value)) then return nil end
	return {
		r = math.Clamp(tonumber(value.r) or 0, 0, 255),
		g = math.Clamp(tonumber(value.g) or 0, 0, 255),
		b = math.Clamp(tonumber(value.b) or 0, 0, 255),
		a = math.Clamp(tonumber(value.a) or 255, 0, 255)
	}
end

local function SanitizeDraft(raw)
	if (not istable(raw)) then return nil, "invalid payload" end

	local model = ClampString(raw.model or "", 256)
	if (model == "" or not util.IsValidModel(model)) then
		return nil, "invalid model path"
	end

	util.PrecacheModel(model)

	local rows = {}
	if (istable(raw.rows)) then
		for i, row in ipairs(raw.rows) do
			if (i > MAX_ROWS) then break end
			if (istable(row)) then
				rows[#rows + 1] = {
					text = ClampString(row.text or "", MAX_ROW_TEXT),
					color = SanitizeColor(row.color)
				}
			end
		end
	end

	return {
		name = ClampString(raw.name or "Custom Item", MAX_NAME),
		description = ClampString(raw.description or "", MAX_DESC),
		model = model,
		category = ClampString(raw.category or "", 64),
		width = math.Clamp(tonumber(raw.width) or 1, 1, 8),
		height = math.Clamp(tonumber(raw.height) or 1, 1, 8),
		rarity = math.Clamp(tonumber(raw.rarity) or 0, 0, 4),
		rows = rows
	}
end

ix.customItem = ix.customItem or {}
ix.customItem.SanitizeDraft = SanitizeDraft

local function ReadDraft()
	local length = net.ReadUInt(32)
	if (length <= 0 or length > MAX_PAYLOAD) then return nil, "payload too large" end

	local data = net.ReadData(length)
	if (not data) then return nil, "no payload" end

	local decoded = util.JSONToTable(util.Decompress(data) or "")
	return SanitizeDraft(decoded)
end

local function PickUniqueID(width, height)
	if (width == 1 and height == 1) then return "customitem" end
	local key = "customitem_" .. width .. "x" .. height
	if (ix.item.list and ix.item.list[key]) then return key end
	return "customitem"
end

net.Receive("ixCustomItemConfirm", function(_, client)
	if (not IsValid(client) or not client:IsAdmin()) then return end

	local draft, err = ReadDraft()
	if (not draft) then
		client:NotifyLocalized("ixCustomItemInvalid", err or "?")
		return
	end

	local character = client:GetCharacter()
	if (not character) then return end

	local uniqueID = PickUniqueID(draft.width, draft.height)

	local ok = pcall(function()
		character:GetInventory():Add(uniqueID, 1, draft)
	end)

	if (ok) then
		client:NotifyLocalized("ixCustomItemCreated", draft.name)
	else
		client:NotifyLocalized("ixCustomItemInvalid", "inventory rejected the item (probably no fitting slot)")
	end
end)
