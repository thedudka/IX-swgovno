surface.CreateFont( "ixArmorStatsFont", {
	font = "Trebuchet MS",
	size = 22,
	weight = 600,
	extended = true
} )

local function addArmorKitStats( tooltip, item )
	if not item or not tonumber(item.armorAmount) or tonumber(item.armorAmount) <= 0 then
		return
	end

	local row = tooltip:AddRowAfter( "description", "armorStats" )
	if not IsValid( row ) then return end

	row:SetText( "ПРЕДМЕТ ДЛЯ ВОССТАНОВЛЕНИЯ БРОНИ" )

	row:SetFont( "ixArmorStatsFont" )
	row:SetBackgroundColor( Color( 2, 27, 255, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

hook.Add( "PopulateEntityInfo", "ixArmorEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addArmorKitStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixArmorTooltip", function( tooltip, item )
	addArmorKitStats( tooltip, item )
end )