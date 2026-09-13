local PLUGIN = PLUGIN

PLUGIN.menuOpen = false
PLUGIN.weaponLockUntil = 0

-- Re-using the fonts created in the first plugin to save resources
local function setMenuOpen(state)
	PLUGIN.menuOpen = state
	PLUGIN.weaponLockUntil = state and 0 or CurTime() + 0.1
end

local function sendVoiceCommand(number)
	net.Start(PLUGIN.netMessage)
	net.WriteUInt(number, 4)
	net.SendToServer()
	setMenuOpen(false)
end

local function keyToCommand(button)
	local keys = {[KEY_1]=1, [KEY_2]=2, [KEY_3]=3, [KEY_4]=4, [KEY_5]=5, [KEY_6]=6, [KEY_7]=7, [KEY_8]=8, [KEY_9]=9}
	return keys[button]
end

hook.Add("PlayerButtonDown", "ixSecondaryVoiceMenu.Keys", function(client, button)
	if client ~= LocalPlayer() then return end

	-- Check if Menu 1 is currently open
	local firstPlugin = ix.plugin.Get("voicecommandmenu") -- Replace with your 1st plugin folder name
	local firstMenuOpen = firstPlugin and firstPlugin.menuOpen

	if button == KEY_F2 then
		-- If Menu 1 is open, allow F2 to pass through to Menu 1 to close it, but block Menu 2 from opening
		if firstMenuOpen then return end 
		setMenuOpen(true)
		return true
	end

	if not PLUGIN.menuOpen then return end

	if button == KEY_F4 then
		setMenuOpen(false)
		return true
	end

	local number = keyToCommand(button)
	if number then
		sendVoiceCommand(number)
		return true
	end
end)

hook.Add("HUDPaint", "ixSecondaryVoiceMenu.Draw", function()
	if not PLUGIN.menuOpen then return end

	local commands = PLUGIN:GetCommands(LocalPlayer())
	if not commands then return end 

	local width = math.min(360, ScrW() * 0.32)
	local entryHeight = 30
	local height = 66 + (#commands * entryHeight) + 30
	local x = math.max(24, ScreenScale(18))
	local y = (ScrH() - height) * 0.5

	draw.RoundedBox(6, x, y, width, height, Color(20, 24, 30, 235))
	draw.RoundedBox(6, x + 2, y + 2, width - 4, height - 4, Color(31, 37, 45, 245))
	draw.SimpleText("ДОП. ГОЛОСОВЫЕ СООБЩЕНИЯ", "ixVoiceCommandMenu.Title", x + 18, y + 14, Color(236, 239, 244), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText("Нажмите цифру для ответа", "ixVoiceCommandMenu.Entry", x + 18, y + 42, Color(160, 170, 182), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

	for number = 1, #commands do
		local command = commands[number]
		local entryY = y + 66 + ((number - 1) * entryHeight)
		draw.SimpleText(number .. ". " .. (command.label or "Unknown"), "ixVoiceCommandMenu.Entry", x + 20, entryY, Color(235, 238, 242), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	end

	draw.SimpleText("F4. Выйти из меню", "ixVoiceCommandMenu.Entry", x + 20, y + height - 28, Color(190, 198, 208), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end)
