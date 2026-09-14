surface.CreateFont( "ixRescueKitStatsFont", {
	font = "Trebuchet MS",
	size = 22,
	weight = 600,
	extended = true
} )

local function addRescueKitStats( tooltip, item )
	if not item or not item.reviveHealth then
		return
	end

	local row = tooltip:AddRowAfter( "description", "rescueKitStats" )
	if not IsValid( row ) then return end

	row:SetText( string.format(
		"ПРЕДМЕТ ДЛЯ РЕАНИМАЦИИ ИЗ КРИТИЧЕСКОГО СОСТОЯНИЯ"
	) )

	row:SetFont( "ixRescueKitStatsFont" )
	row:SetBackgroundColor( Color( 255, 11, 2, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

hook.Add( "PopulateEntityInfo", "ixRescueKitEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addRescueKitStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixRescueKitTooltip", function( tooltip, item )
	addRescueKitStats( tooltip, item )
end )