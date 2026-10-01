surface.CreateFont( "ixStatsFont", {
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

	row:SetText( "ПРОДУКТ СОДЕРЖИТ АЛКОГОЛЬ" )

	row:SetFont( "ixStatsFont" )
	row:SetBackgroundColor( Color( 250, 142, 0, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

local function addHealthKitStats( tooltip, item )
	if not item or not tonumber(item.healAmount) or tonumber(item.healAmount) <= 0 then
		return
	end

	local row = tooltip:AddRowAfter( "description", "healthStats" )
	if not IsValid( row ) then return end

	row:SetText( "ПРЕДМЕТ ДЛЯ ВОССТАНОВЛЕНИЯ ЗДОРОВЬЯ" )

	row:SetFont( "ixStatsFont" )
	row:SetBackgroundColor( Color( 2, 255, 78, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

local function addArmorKitStats( tooltip, item )
	if not item or not tonumber(item.armorAmount) or tonumber(item.armorAmount) <= 0 then
		return
	end

	local row = tooltip:AddRowAfter( "description", "armorStats" )
	if not IsValid( row ) then return end

	row:SetText( "ПРЕДМЕТ ДЛЯ ВОССТАНОВЛЕНИЯ БРОНИ" )

	row:SetFont( "ixStatsFont" )
	row:SetBackgroundColor( Color( 2, 27, 255, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

local function addRescueKitStats( tooltip, item )
	if not item or not item.reviveHealth then
		return
	end

	local row = tooltip:AddRowAfter( "description", "rescueKitStats" )
	if not IsValid( row ) then return end

	row:SetText( string.format(
		"ПРЕДМЕТ ДЛЯ РЕАНИМАЦИИ ИЗ КРИТИЧЕСКОГО СОСТОЯНИЯ"
	) )

	row:SetFont( "ixStatsFont" )
	row:SetBackgroundColor( Color( 255, 11, 2, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

local function addstaminaStats( tooltip, item )
	if not item or not tonumber(item.AddStam) or tonumber(item.AddStam) <= 0  then
		return
	end

	local row = tooltip:AddRowAfter( "description", "staminaStats" )
	if not IsValid( row ) then return end

	row:SetText( "ПРЕДМЕТ ДЛЯ ВОССТАНОВЛЕНИЯ ВЫНОСЛИВОСТИ" )

	row:SetFont( "ixStatsFont" )
	row:SetBackgroundColor( Color( 251, 255, 0, 128) )
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

hook.Add( "PopulateEntityInfo", "ixRescueKitEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addRescueKitStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixRescueKitTooltip", function( tooltip, item )
	addRescueKitStats( tooltip, item )
end )

hook.Add( "PopulateEntityInfo", "ixArmorEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addArmorKitStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixArmorTooltip", function( tooltip, item )
	addArmorKitStats( tooltip, item )
end )

hook.Add( "PopulateEntityInfo", "ixHealthEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addHealthKitStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixHealthTooltip", function( tooltip, item )
	addHealthKitStats( tooltip, item )
end )

hook.Add( "PopulateEntityInfo", "ixAlcoEntityInfo", function( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addAlcoStats( tooltip, entity:GetItemTable() )
end )

hook.Add( "PopulateItemTooltip", "ixAlcoTooltip", function( tooltip, item )
	addAlcoStats( tooltip, item )
end )

