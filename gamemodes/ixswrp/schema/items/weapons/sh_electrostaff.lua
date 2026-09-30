
ITEM.name = "Электрический посох"
ITEM.description = "Оружие ближнего боя, созданный специально для дроидов-стражей. Владельцам силы нет смысла использовать данное оружие, а для обычных существ оно слишком тяжелое и неудобное, однако для дроидов с подходящей прошивкой это полезное оружие как для обороны себя, так и для защиты других, за счет чего этот посох и получил статус телохранительного. Очень громоздкий, но крайне болезненный для любого агрессивного существа, которое решит напасть."
ITEM.model = "models/anzati/lightsabers/electrostaff.mdl"
ITEM.class = "weapon_lscs_electrodual"
ITEM.category = "Ближний бой"
ITEM.isWeapon = true
ITEM.weaponCategory = "primary"
ITEM.width = 6
ITEM.height = 1
ITEM.rarity = 3
ITEM.price = 5000
ITEM.iconCam = {
	pos = Vector(0, 138, 0),
	ang = Angle(0.88, 269.88, 0),
	fov = 45
}



if ITEM.functions.Equip then
    local baseCanRun = ITEM.functions.Equip.OnCanRun

    ITEM.functions.Equip.OnCanRun = function(item)
        local client = item.player or item:GetOwner()

        if IsValid(client) and not client:IsForceUser() then
            return false
        end

        if baseCanRun then
            return baseCanRun(item)
        end

        return true
    end
end