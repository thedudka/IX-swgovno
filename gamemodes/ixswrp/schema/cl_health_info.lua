surface.CreateFont( "ixHealthStatsFont", {
	font = "Trebuchet MS",
	size = 22,
	weight = 600,
	extended = true
} )

local function addHealthKitStats( tooltip, item )
	if not item or not tonumber(item.healAmount) or tonumber(item.healAmount) <= 0 then
		return
	end

	local row = tooltip:AddRowAfter( "description", "healthStats" )
	if not IsValid( row ) then return end

	row:SetText( "ПРЕДМЕТ ДЛЯ ВОССТАНОВЛЕНИЯ ЗДОРОВЬЯ" )

	row:SetFont( "ixHealthStatsFont" )
	row:SetBackgroundColor( Color( 2, 255, 78, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

hook.Add( "PopulateEntityInfo", "ixHealthEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addHealthKitStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixHealthTooltip", function( tooltip, item )
	addHealthKitStats( tooltip, item )
end )