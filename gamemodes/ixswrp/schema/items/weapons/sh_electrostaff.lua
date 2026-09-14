
ITEM.name = "Электрический посох"
ITEM.description = "Оружие ближнего боя, созданный специально для дроидов-стражей. Владельцам силы нет смысла использовать данное оружие, а для обычных существ оно слишком тяжелое и неудобное, однако для дроидов с подходящей прошивкой это полезное оружие как для обороны себя, так и для защиты других, за счет чего этот посох и получил статус телохранительного. Очень громоздкий, но крайне болезненный для любого агрессивного существа, которое решит напасть."
ITEM.model = "models/red menace/fallenorder/props/purgetrooper/electrostaff.mdl"
ITEM.class = "weapon_lscs_electrodual"
ITEM.category = "Ближний бой"
ITEM.isWeapon = true
ITEM.weaponCategory = "primary"
ITEM.width = 6
ITEM.height = 1
ITEM.price = 5000
ITEM.iconCam = {
    ang	= Angle(25.000, 220.000, 0.000),
	pos	= Vector(950.460266, 797.688110, 577.581543),
    fov	= 7.5
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