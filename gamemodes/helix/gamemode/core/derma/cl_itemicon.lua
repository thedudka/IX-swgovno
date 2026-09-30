function PANEL:ExtraPaint(width, height)
	local itemTable = self.itemTable

	if itemTable then
		local rarity = itemTable:GetRarity()

		if rarity == 0 then
			return
		end

		surface.SetDrawColor(ColorAlpha(RARITY_COLORS[rarity], 20))
		surface.DrawRect(1, 1, width - 2, height - 2)
	end
end

function PANEL:Paint(width, height)
	surface.SetDrawColor(0, 0, 0, 85)
	surface.DrawRect(2, 2, width - 4, height - 4)

	--surface.SetDrawColor(Color(100, 100, 100, 60))
	--surface.DrawOutlinedRect(0, 0, width, height)

	surface.SetDrawColor(Color(25, 25, 25, 225))
	surface.DrawRect(2, 2, width - 4, height - 4)

	if(self.itemTable.backgroundColor) then
		surface.SetDrawColor(self.itemTable.backgroundColor)
		surface.DrawRect(2, 2, width - 4, height - 4)
	end

	self:ExtraPaint(width, height)
end

vgui.Register("ixItemIcon", PANEL, "SpawnIcon")