surface.CreateFont( "ixWeaponStatsFont", {
	font = "Doubleplus",
	size = 22,
	weight = 600,
	extended = true
} )

local function addWeaponStats( tooltip, item )
	if not item or not item.Firerate then
		return
	end

	local row = tooltip:AddRowAfter( "description", "weaponStats" )
	if not IsValid( row ) then return end
	if item.Radius then
		row:SetText( string.format(
			"МАКСИМАЛЬНЫЙ УРОН ОТ ВЗРЫВА: %s\nРАДИУС ВЗРЫВА: %s МЕТРОВ",
			item.Damage,
			item.Radius
		) )
	else
		row:SetText( string.format(
			"СКОРОСТРЕЛЬНОСТЬ: %s ВЫСТРЕЛОВ В МИНУТУ\nУРОН ЗА СНАРЯД: %s\nВМЕСТИМОСТЬ МАГАЗИНА: %s\nРАЗБРОС: %.3f",
			item.Firerate,
			item.Damage,
			item.MagazineCapacity,
			item.Accuracy
		) )
	end
	row:SetFont( "ixWeaponStatsFont" )
	row:SetBackgroundColor( Color( 80, 80, 80, 128) )
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