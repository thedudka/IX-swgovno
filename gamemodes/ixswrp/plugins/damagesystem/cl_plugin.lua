local COLOR_CRITICAL = Color(170, 35, 35, 220)

hook.Add("PopulateCharacterInfo", "ixCriticalStateDescription", function(client, character, container)
	if (!IsValid(client) or !client:IsPlayer() or !client:IsCritical()) then
		return
	end

	local criticalRow = container:AddRow("criticalState")
	criticalRow:SetText("В критическом состоянии.")
	criticalRow:SetBackgroundColor(COLOR_CRITICAL)
	criticalRow:SizeToContents()
end)
