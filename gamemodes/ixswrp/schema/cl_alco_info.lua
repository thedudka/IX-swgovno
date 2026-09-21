surface.CreateFont( "ixHealthStatsFont", {
	font = "Trebuchet MS",
	size = 22,
	weight = 600,
	extended = true
} )

local function addAlcoStats( tooltip, item )
	if not item or not tonumber(item.DrunkAdd) or tonumber(item.DrunkAdd) <= 0  then
		return
	end

	local row = tooltip:AddRowAfter( "description", "AlcoStats" )
	if not IsValid( row ) then return end

	row:SetText( "Употребление алкоголя может повести за собой последствия" )

	row:SetFont( "ixHealthStatsFont" )
	row:SetBackgroundColor( Color( 250, 142, 0, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

hook.Add( "PopulateEntityInfo", "ixAlcoEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addAlcoStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixAlcoTooltip", function( tooltip, item )
	addAlcoStats( tooltip, item )
end )