surface.CreateFont( "ixHealthStatsFont", {
	font = "Trebuchet MS",
	size = 22,
	weight = 600,
	extended = true
} )

local function addstaminaStats( tooltip, item )
	if not item or not tonumber(item.AddStam) or tonumber(item.AddStam) <= 0  then
		return
	end

	local row = tooltip:AddRowAfter( "description", "staminaStats" )
	if not IsValid( row ) then return end

	row:SetText( "ПРЕДМЕТ ДЛЯ ВОССТАНОВЛЕНИЯ ВЫНОСЛИВОСТИ" )

	row:SetFont( "ixHealthStatsFont" )
	row:SetBackgroundColor( Color( 80, 80, 80, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

hook.Add( "PopulateEntityInfo", "ixstaminaEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addstaminaStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixstaminaTooltip", function( tooltip, item )
	addstaminaStats( tooltip, item )
end )