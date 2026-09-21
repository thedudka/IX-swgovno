local COLOR_DRUNK = Color(196, 176, 3, 220)

hook.Add("PopulateCharacterInfo", "ixDrunkStateDescription", function(client, character, container)
    local char = client:GetCharacter()
    local drunk = character:GetDrunk()
	if (!IsValid(client) or !client:IsPlayer() or not drunk > 45) then
		return
	end

	local criticalRow = container:AddRow("drunkState")
	criticalRow:SetText("Под влиянием алкоголя.")
	criticalRow:SetBackgroundColor(COLOR_DRUNK)
	criticalRow:SizeToContents()
end)