
ITEM.name = "Generic Item"
ITEM.description = "Generic Description"
ITEM.model = Model("models/maxofs2d/hover_rings.mdl")
ITEM.category = "GM"
ITEM.nobusiness = true
ITEM.width = 1
ITEM.height = 1
ITEM.rarity = 0

function ITEM:GetName()
	return self:GetData("name", "Custom Item")
end

function ITEM:GetDescription()
	return self:GetData("description", "Custom item description.")
end

function ITEM:GetModel()
	return self:GetData("model", "models/Gibs/HGIBS.mdl")
end

function ITEM:GetRarity()
	return self:GetData("rarity", self.rarity)
end

function ITEM:GetCategoryOverride()
	return self:GetData("category", nil)
end

local function ContrastingTextColor(bg)
	local lum = (0.299 * bg.r + 0.587 * bg.g + 0.114 * bg.b) / 255
	return lum > 0.55 and Color(15, 15, 15) or Color(245, 245, 245)
end

local function PopulateRows(item, tooltip)
	if (not IsValid(tooltip)) then return end
	if (tooltip.ixCustomItemPopulated) then return end
	tooltip.ixCustomItemPopulated = true

	local rows = item:GetData("rows", {})
	if (not istable(rows)) then return end

	for i, row in ipairs(rows) do
		local panel = tooltip:AddRow("row" .. i)
		if (not IsValid(panel)) then continue end

		if (istable(row.color)) then
			local bg = Color(
				math.Clamp(tonumber(row.color.r) or 0, 0, 255),
				math.Clamp(tonumber(row.color.g) or 0, 0, 255),
				math.Clamp(tonumber(row.color.b) or 0, 0, 255),
				math.Clamp(tonumber(row.color.a) or 255, 0, 255)
			)

			if (panel.SetBackgroundColor) then
				panel:SetBackgroundColor(bg)
			end

			if (panel.SetTextColor) then
				panel:SetTextColor(ContrastingTextColor(bg))
			end
		end

		panel:SetText(row.text or "")
		panel:SetFont("ixSmallFont")

		if (panel.SetExpensiveShadow) then
			panel:SetExpensiveShadow(0.5)
		end

		if (panel.SizeToContents) then
			panel:SizeToContents()
		end
	end
end

function ITEM:OnPopulateTooltip(tooltip)
	PopulateRows(self, tooltip)
end

function ITEM:PopulateTooltip(tooltip)
	PopulateRows(self, tooltip)
end

function ITEM:OnTooltip(tooltip)
	PopulateRows(self, tooltip)
end

if (CLIENT) then
	hook.Add("OnPopulateItemTooltip", "ixCustomItem", function(panel, item)
		if (item and item.uniqueID and string.sub(item.uniqueID, 1, 10) == "customitem") then
			PopulateRows(item, panel)
		end
	end)
end

local function RegisterSizeVariants()
	if (not ix.item or not ix.item.list) then return end
	local base = ix.item.list["customitem"]
	if (not base) then return end

	for w = 1, 8 do
		for h = 1, 8 do
			if (w == 1 and h == 1) then continue end

			local key = "customitem_" .. w .. "x" .. h
			if (ix.item.list[key]) then continue end

			local variant = setmetatable({}, {__index = base})
			rawset(variant, "uniqueID", key)
			rawset(variant, "width", w)
			rawset(variant, "height", h)
			ix.item.list[key] = variant
		end
	end
end

hook.Add("InitializedItems", "ixCustomItemSizeVariants", RegisterSizeVariants)
hook.Add("InitPostEntity", "ixCustomItemSizeVariants", RegisterSizeVariants)
