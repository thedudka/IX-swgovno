ITEM.name = "Вибромеч Дроида-Коммандос"
ITEM.description = "Оружие ближнего боя, используемое дроидами-коммандос армии Конфедерации. Имеет зазубренный вибрирующий клинок, способный разрубать без особых усилий противника и наносить страшные увечья. Используется и как инструмент для проникновения, и как оружие для скрытного ликвидирования целей."
ITEM.model = "models/lscs/weapons/vibrosword.mdl"
ITEM.class = "rw_sw_bx_blade"
ITEM.category = "Ближний бой"
ITEM.isWeapon = true
ITEM.weaponCategory = "sidearm"
ITEM.width = 1
ITEM.height = 3
ITEM.rarity = 3
ITEM.price = 5000
ITEM.iconCam = {
	pos = Vector(-20.31, -0.65, 8.12),
	ang = Angle(-8.37, -1.37, 0),
	fov = 45
}


if ITEM.functions.Equip then
    local baseCanRun = ITEM.functions.Equip.OnCanRun

    ITEM.functions.Equip.OnCanRun = function(item)
        local client = item.player or item:GetOwner()

        if IsValid(client) and not client:IsCIS() then
            return false
        end

        if baseCanRun then
            return baseCanRun(item)
        end

        return true
    end
end