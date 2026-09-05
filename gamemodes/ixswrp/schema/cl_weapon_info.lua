surface.CreateFont( "ixWeaponStatsFont", {
	font = "Trebuchet MS",
	size = 22,
	weight = 600,
	extended = true
} )

local function addWeaponStats( tooltip, item )
	if not item or not item.EffectiveRange then
		return
	end

	local row = tooltip:AddRowAfter( "description", "weaponStats" )
	if item.Radius then
		row:SetText( string.format(
			"ЭФФЕКТИВНАЯ ДАЛЬНОСТЬ: ДО %s МЕТРОВ\nМАКСИМАЛЬНЫЙ УРОН ОТ ВЗРЫВА: %s\nРАДИУС ВЗРЫВА: %s МЕТРОВ",
			item.EffectiveRange,
			item.Damage,
			item.Radius
		) )
	else
		row:SetText( string.format(
			"ЭФФЕКТИВНАЯ ДАЛЬНОСТЬ: ДО %s МЕТРОВ\nУРОН ЗА СНАРЯД: %s\nВМЕСТИМОСТЬ МАГАЗИНА: %s\nРАЗБРОС: %.3f",
			item.EffectiveRange,
			item.Damage,
			item.MagazineCapacity,
			item.Accuracy
		) )
	end
	row:SetFont( "ixWeaponStatsFont" )
	row:SetBackgroundColor( Color( 251, 255, 0, 128) )
	row:SetTextColor( color_white )
	row:SizeToContents()
end

function Schema:PopulateEntityInfo( entity, tooltip )
	if not IsValid( entity ) or not entity.GetItemTable then
		return
	end

	addWeaponStats( tooltip, entity:GetItemTable() )
end

function Schema:PopulateItemTooltip( tooltip, item )
	addWeaponStats( tooltip, item )
end