
if (not CLIENT) then return end

local MAX_PAYLOAD = 32768

local DEFAULT_ROW_COLOR = Color(60, 100, 160, 230)

local function MakeLabeledRow(parent, labelText, tall)
	local container = parent:Add("DPanel")
	container:Dock(TOP)
	container:DockMargin(0, 0, 0, 4)
	container:SetTall(tall or 22)
	container:SetPaintBackground(false)

	local label = container:Add("DLabel")
	label:Dock(LEFT)
	label:SetWide(120)
	label:SetText(labelText)
	label:SetTextColor(color_white)

	return container
end

local function MakeTextEntry(parent, labelText, default)
	local row = MakeLabeledRow(parent, labelText)
	local entry = row:Add("DTextEntry")
	entry:Dock(FILL)
	entry:SetText(tostring(default or ""))
	return entry
end

local function MakeTextArea(parent, labelText, default, tall)
	local row = MakeLabeledRow(parent, labelText, tall or 80)
	local entry = row:Add("DTextEntry")
	entry:Dock(FILL)
	entry:SetMultiline(true)
	entry:SetText(tostring(default or ""))
	return entry
end

local function MakeNumberEntry(parent, labelText, default, min, max)
	local row = MakeLabeledRow(parent, labelText)
	local entry = row:Add("DNumberWang")
	entry:Dock(FILL)
	entry:SetMin(min or 0)
	entry:SetMax(max or 1000000)
	entry:SetValue(default or 0)
	return entry
end

local function MakeColorButton(parent, default)
	local btn = parent:Add("DButton")
	btn:SetText("")
	btn.Color = default or table.Copy(DEFAULT_ROW_COLOR)

	btn.Paint = function(self, w, h)
		surface.SetDrawColor(40, 40, 40, 255)
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(self.Color)
		surface.DrawRect(2, 2, w - 4, h - 4)
		surface.SetDrawColor(0, 0, 0, 180)
		surface.DrawOutlinedRect(0, 0, w, h)
	end

	btn.DoClick = function(self)
		local popup = vgui.Create("DFrame")
		popup:SetSize(290, 360)
		popup:Center()
		popup:SetTitle("Pick Color")
		popup:MakePopup()

		local mixer = popup:Add("DColorMixer")
		mixer:Dock(FILL)
		mixer:DockMargin(8, 8, 8, 4)
		mixer:SetColor(self.Color)
		mixer:SetPalette(true)
		mixer:SetAlphaBar(true)
		mixer:SetWangs(true)

		local ok = popup:Add("DButton")
		ok:Dock(BOTTOM)
		ok:DockMargin(8, 4, 8, 8)
		ok:SetTall(28)
		ok:SetText("OK")
		ok.DoClick = function()
			self.Color = mixer:GetColor()
			popup:Close()
		end
	end

	return btn
end

local function BuildRowPanel(parent, list, rowData)
	rowData = rowData or {}

	local panel = parent:Add("DPanel")
	panel:Dock(TOP)
	panel:DockMargin(0, 0, 0, 6)
	panel:DockPadding(8, 0, 8, 0)
	panel:SetTall(58)

	local header = panel:Add("DPanel")
	header:Dock(TOP)
	header:SetTall(24)
	header:SetPaintBackground(false)

	local title = header:Add("DLabel")
	title:Dock(LEFT)
	title:SetWide(80)
	title:SetText("Tooltip Row")
	title:SetTextColor(color_white)

	local colorLabel = header:Add("DLabel")
	colorLabel:Dock(LEFT)
	colorLabel:SetWide(45)
	colorLabel:SetText("Color")
	colorLabel:SetTextColor(color_white)

	local initialColor
	if (istable(rowData.color) and rowData.color.r) then
		initialColor = Color(rowData.color.r, rowData.color.g, rowData.color.b, rowData.color.a or 255)
	end

	local colorBtn = MakeColorButton(header, initialColor)
	colorBtn:Dock(LEFT)
	colorBtn:SetWide(80)
	colorBtn:DockMargin(0, 2, 8, 2)
	panel.colorBtn = colorBtn

	local removeBtn = header:Add("DButton")
	removeBtn:Dock(RIGHT)
	removeBtn:SetWide(60)
	removeBtn:SetText("Remove")
	removeBtn.DoClick = function()
		for i, v in ipairs(list) do
			if (v == panel) then
				table.remove(list, i)
				break
			end
		end
		panel:Remove()
	end

	local downBtn = header:Add("DButton")
	downBtn:Dock(RIGHT)
	downBtn:SetWide(28)
	downBtn:SetText("v")
	downBtn.DoClick = function()
		for i, v in ipairs(list) do
			if (v == panel and list[i + 1]) then
				list[i], list[i + 1] = list[i + 1], list[i]
				list[i]:SetZPos(i)
				list[i + 1]:SetZPos(i + 1)
				break
			end
		end
	end

	local upBtn = header:Add("DButton")
	upBtn:Dock(RIGHT)
	upBtn:SetWide(28)
	upBtn:SetText("^")
	upBtn.DoClick = function()
		for i, v in ipairs(list) do
			if (v == panel and list[i - 1]) then
				list[i], list[i - 1] = list[i - 1], list[i]
				list[i]:SetZPos(i)
				list[i - 1]:SetZPos(i - 1)
				break
			end
		end
	end

	local textRow = panel:Add("DPanel")
	textRow:Dock(FILL)
	textRow:DockMargin(0, 4, 0, 0)
	textRow:SetPaintBackground(false)

	local textLabel = textRow:Add("DLabel")
	textLabel:Dock(LEFT)
	textLabel:SetWide(80)
	textLabel:SetText("Text")
	textLabel:SetTextColor(color_white)

	panel.textEntry = textRow:Add("DTextEntry")
	panel.textEntry:Dock(FILL)
	panel.textEntry:SetText(rowData.text or "")

	function panel:Collect()
		local c = self.colorBtn.Color
		return {
			text = self.textEntry:GetValue(),
			color = c and {
				r = c.r,
				g = c.g,
				b = c.b,
				a = c.a or 255
			} or nil
		}
	end

	list[#list + 1] = panel
	panel:SetZPos(#list)

	return panel
end

local function ClearRows(frame)
	for _, p in ipairs(frame.rowList) do
		if (IsValid(p)) then p:Remove() end
	end
	frame.rowList = {}
end

local function CollectDraft(frame)
	local draft = {
		name = frame.nameEntry:GetValue(),
		description = frame.descEntry:GetValue(),
		model = frame.modelEntry:GetValue(),
		category = frame.categoryEntry:GetValue(),
		width = frame.widthEntry:GetValue(),
		height = frame.heightEntry:GetValue(),
		rarity = frame.rarityEntry:GetValue(),
		rows = {}
	}

	for _, rowPanel in ipairs(frame.rowList) do
		if (IsValid(rowPanel)) then
			draft.rows[#draft.rows + 1] = rowPanel:Collect()
		end
	end

	return draft
end

local function PopulateForm(frame, draft)
	draft = draft or {}

	frame.nameEntry:SetText(draft.name or "")
	frame.descEntry:SetText(draft.description or "")
	frame.modelEntry:SetText(draft.model or "")
	frame.categoryEntry:SetText(draft.category or "")
	frame.widthEntry:SetValue(tonumber(draft.width) or 1)
	frame.heightEntry:SetValue(tonumber(draft.height) or 1)
	frame.rarityEntry:SetValue(tonumber(draft.rarity) or 0)

	ClearRows(frame)
	for _, row in ipairs(draft.rows or {}) do
		BuildRowPanel(frame.rowsContainer, frame.rowList, row)
	end
	frame:ReflowHeight()
end

local function SendCompressed(name, payload)
	local json = util.TableToJSON(payload) or "{}"
	local data = util.Compress(json) or json

	if (#data > MAX_PAYLOAD) then
		Derma_Message("Payload too large (" .. #data .. " bytes).", "Error", "OK")
		return false
	end

	net.Start(name)
	net.WriteUInt(#data, 32)
	net.WriteData(data, #data)
	net.SendToServer()
	return true
end

local function SendDraft(name, draft)
	return SendCompressed(name, draft)
end

local activeFrame

local function RefreshTemplateList(names)
	if (not IsValid(activeFrame)) then return end
	activeFrame.templateCombo:Clear()
	for _, n in ipairs(names or {}) do
		activeFrame.templateCombo:AddChoice(n, n)
	end
end

local function BuildFrame()
	local frame = vgui.Create("DFrame")
	frame:SetSize(720, 760)
	frame:Center()
	frame:SetTitle("Custom Item — Create")
	frame:SetSizable(true)
	frame:MakePopup()
	activeFrame = frame

	frame.OnClose = function()
		if (activeFrame == frame) then activeFrame = nil end
	end

	local scroll = frame:Add("DScrollPanel")
	scroll:Dock(FILL)
	scroll:DockMargin(8, 8, 8, 8)

	local function AddGap(tall)
		local gap = scroll:Add("DPanel")
		gap:Dock(TOP)
		gap:SetTall(tall or 14)
		gap:SetPaintBackground(false)
		return gap
	end

	local tplRow1 = scroll:Add("DPanel")
	tplRow1:Dock(TOP)
	tplRow1:SetTall(24)
	tplRow1:DockMargin(0, 0, 0, 4)
	tplRow1:SetPaintBackground(false)

	local tplLabel = tplRow1:Add("DLabel")
	tplLabel:Dock(LEFT)
	tplLabel:SetWide(120)
	tplLabel:SetText("Template")
	tplLabel:SetTextColor(color_white)

	frame.templateCombo = tplRow1:Add("DComboBox")
	frame.templateCombo:Dock(FILL)
	frame.templateCombo:SetValue("(none)")

	local loadBtn = tplRow1:Add("DButton")
	loadBtn:Dock(RIGHT)
	loadBtn:SetWide(80)
	loadBtn:DockMargin(4, 0, 0, 0)
	loadBtn:SetText("Load")
	loadBtn.DoClick = function()
		local sel = frame.templateCombo:GetSelected()
		if (not sel or sel == "" or sel == "(none)") then return end
		net.Start("ixCustomItemTplLoadRequest")
		net.WriteString(sel)
		net.SendToServer()
	end

	local deleteBtn = tplRow1:Add("DButton")
	deleteBtn:Dock(RIGHT)
	deleteBtn:SetWide(80)
	deleteBtn:DockMargin(4, 0, 0, 0)
	deleteBtn:SetText("Delete")
	deleteBtn.DoClick = function()
		local sel = frame.templateCombo:GetSelected()
		if (not sel or sel == "" or sel == "(none)") then return end
		Derma_Query("Delete template '" .. sel .. "'?", "Confirm", "Delete", function()
			net.Start("ixCustomItemTplDelete")
			net.WriteString(sel)
			net.SendToServer()
		end, "Cancel")
	end

	local tplRow2 = scroll:Add("DPanel")
	tplRow2:Dock(TOP)
	tplRow2:SetTall(24)
	tplRow2:DockMargin(0, 0, 0, 4)
	tplRow2:SetPaintBackground(false)

	local saveAsLabel = tplRow2:Add("DLabel")
	saveAsLabel:Dock(LEFT)
	saveAsLabel:SetWide(120)
	saveAsLabel:SetText("Save as")
	saveAsLabel:SetTextColor(color_white)

	local saveNameEntry = tplRow2:Add("DTextEntry")
	saveNameEntry:Dock(FILL)
	saveNameEntry:SetPlaceholderText("Template name")

	local saveBtn = tplRow2:Add("DButton")
	saveBtn:Dock(RIGHT)
	saveBtn:SetWide(80)
	saveBtn:DockMargin(4, 0, 0, 0)
	saveBtn:SetText("Save")
	saveBtn.DoClick = function()
		local name = string.Trim(saveNameEntry:GetValue() or "")
		if (name == "") then
			Derma_Message("Enter a template name first.", "Save Template", "OK")
			return
		end
		local draft = CollectDraft(frame)
		net.Start("ixCustomItemTplSave")
		net.WriteString(name)
		local json = util.TableToJSON(draft) or "{}"
		local data = util.Compress(json) or json
		if (#data > MAX_PAYLOAD) then
			Derma_Message("Template too large.", "Error", "OK")
			return
		end
		net.WriteUInt(#data, 32)
		net.WriteData(data, #data)
		net.SendToServer()
		saveNameEntry:SetText("")
	end

	AddGap()

frame.nameEntry = MakeTextEntry(scroll, "Name", "Custom Item")
	frame.descEntry = MakeTextArea(scroll, "Description", "", 90)
	frame.modelEntry = MakeTextEntry(scroll, "Model", "models/props_c17/oildrum001.mdl")
	frame.categoryEntry = MakeTextEntry(scroll, "Category", "")
	frame.widthEntry = MakeNumberEntry(scroll, "Width (cells)", 1, 1, 8)
	frame.heightEntry = MakeNumberEntry(scroll, "Height (cells)", 1, 1, 8)
	frame.rarityEntry = MakeNumberEntry(scroll, "Rarity (0-4)", 0, 0, 4)

	AddGap()

	local rowsHeader = scroll:Add("DPanel")
	rowsHeader:Dock(TOP)
	rowsHeader:SetTall(28)
	rowsHeader:DockMargin(0, 0, 0, 4)
	rowsHeader:SetPaintBackground(false)

	local rowsContainer = scroll:Add("DPanel")
	rowsContainer:Dock(TOP)
	rowsContainer:SetPaintBackground(false)
	rowsContainer:SetTall(0)
	frame.rowsContainer = rowsContainer

	frame.rowList = {}

	function frame:ReflowHeight()
		local total = 0
		for _, p in ipairs(self.rowList) do
			if (IsValid(p)) then total = total + p:GetTall() + 6 end
		end
		rowsContainer:SetTall(total + 4)
	end

	local addBtn = rowsHeader:Add("DButton")
	addBtn:Dock(RIGHT)
	addBtn:SetWide(100)
	addBtn:SetText("Add Row")
	addBtn.DoClick = function()
		BuildRowPanel(rowsContainer, frame.rowList, {})
		frame:ReflowHeight()
	end

	local footer = frame:Add("DPanel")
	footer:Dock(BOTTOM)
	footer:SetTall(36)
	footer:DockMargin(8, 4, 8, 8)
	footer:SetPaintBackground(false)

	local cancelBtn = footer:Add("DButton")
	cancelBtn:Dock(RIGHT)
	cancelBtn:SetWide(100)
	cancelBtn:SetText("Cancel")
	cancelBtn.DoClick = function() frame:Close() end

	local confirmBtn = footer:Add("DButton")
	confirmBtn:Dock(RIGHT)
	confirmBtn:SetWide(100)
	confirmBtn:DockMargin(0, 0, 4, 0)
	confirmBtn:SetText("Confirm")
	confirmBtn.DoClick = function()
		local working = CollectDraft(frame)
		if (SendDraft("ixCustomItemConfirm", working)) then
			frame:Close()
		end
	end

	net.Start("ixCustomItemTplListRequest")
	net.SendToServer()

	return frame
end

net.Receive("ixCustomItemOpenMenu", function()
	BuildFrame()
end)

local function ReadCompressed()
	local len = net.ReadUInt(32)
	if (len <= 0 or len > MAX_PAYLOAD) then return nil end
	local data = net.ReadData(len)
	if (not data) then return nil end
	return util.JSONToTable(util.Decompress(data) or "")
end

net.Receive("ixCustomItemTplListNames", function()
	local payload = ReadCompressed()
	if (not istable(payload)) then return end
	RefreshTemplateList(payload.names or {})
end)

net.Receive("ixCustomItemTplLoadResponse", function()
	local name = net.ReadString()
	local draft = ReadCompressed()
	if (not istable(draft)) then return end
	if (not IsValid(activeFrame)) then return end
	PopulateForm(activeFrame, draft)
	activeFrame:SetTitle("Custom Item — Create  (loaded: " .. name .. ")")
end)

