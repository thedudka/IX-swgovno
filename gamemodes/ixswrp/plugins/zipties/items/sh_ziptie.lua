ITEM.name = "Стяжки"
ITEM.description = "Оранжевые стяжки."
ITEM.model = Model("models/items/crossbowrounds.mdl")

ITEM.functions.Use = {
    name = "Связать",
    OnRun = function(itemTable)
        local client = itemTable.player
        local data = {}
            data.start = client:GetShootPos()
            data.endpos = data.start + client:GetAimVector() * 96
            data.filter = client
        local target = util.TraceLine(data).Entity
        local clientTarget = IsValid(target.ixPlayer) and target.ixPlayer or target

        if (IsValid(target) and clientTarget:IsPlayer() and clientTarget:GetCharacter()
        and !clientTarget:GetNetVar("tying") and !clientTarget:IsRestricted()) then
            itemTable.bBeingUsed = true

            client:SetAction("@tying", 5)

            client:DoStaredAction(target, function()
                local uses = itemTable:GetStacks()

                clientTarget:SetRestricted(true)
                clientTarget:SetNetVar("tying")
                clientTarget:NotifyLocalized("fTiedUp")

                if uses == 1 then
                    itemTable:Remove()
                else
                    itemTable:SetData("stack", uses - 1)
                end
            end, 5, function()
                client:SetAction()

                clientTarget:SetAction()
                clientTarget:SetNetVar("tying")

                itemTable.bBeingUsed = false
            end)

            clientTarget:SetNetVar("tying", true)
            clientTarget:SetAction("@fBeingTied", 5)
        else
            itemTable.player:NotifyLocalized("plyNotValid")
        end

        return false
    end,
    OnCanRun = function(itemTable)
        return !IsValid(itemTable.entity) or itemTable.bBeingUsed
    end
}

--function ITEM:CanTransfer(inventory, newInventory)
--    return !self.bBeingUsed
--end