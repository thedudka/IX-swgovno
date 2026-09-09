/*MandoComlink = MandoComlink or {}
MandoComlink.FrequencyNWKey = MandoComlink.FrequencyNWKey or "MandoHUDComlinkFrequency"
MandoComlink.SetFrequencyNetMessage = MandoComlink.SetFrequencyNetMessage or "MandoHUD.Comlink.SetFrequency"
MandoComlink.MaxFrequencyLength = MandoComlink.MaxFrequencyLength or 18

local comlinkFrame
local wasComlinkKeyDown = false

local function comlinkScaleX(value)
    return math.floor((ScrW() / 1920) * value)
end

local function comlinkScaleY(value)
    return math.floor((ScrH() / 1080) * value)
end

local function buildComlinkFonts()
    surface.CreateFont("MandoComlink.Title", {
        font = "Trebuchet MS",
        size = math.max(comlinkScaleY(22), 18),
        weight = 900,
        extended = true
    })

    surface.CreateFont("MandoComlink.Body", {
        font = "Trebuchet MS",
        size = math.max(comlinkScaleY(17), 14),
        weight = 700,
        extended = true
    })

    surface.CreateFont("MandoComlink.Small", {
        font = "Trebuchet MS",
        size = math.max(comlinkScaleY(14), 12),
        weight = 700,
        extended = true
    })
end

buildComlinkFonts()

hook.Add("OnScreenSizeChanged", "MandoComlink.RebuildFonts", function()
    buildComlinkFonts()
end)

local function withAlpha(col, alpha)
    return Color(col.r, col.g, col.b, alpha)
end

local palette = {
    shell = Color(5, 8, 12, 238),
    panel = Color(9, 14, 22, 224),
    amber = Color(255, 165, 52, 245),
    amberSoft = Color(255, 165, 52, 78),
    holo = Color(92, 220, 255, 220),
    holoSoft = Color(92, 220, 255, 42),
    text = Color(255, 229, 184, 245),
    textSoft = Color(255, 229, 184, 120)
}

local function getLocalFrequency()
    return MandoComlink.GetFrequency and MandoComlink.GetFrequency(LocalPlayer()) or ""
end

local function canUseComlinkMenu()
    return IsValid(LocalPlayer())
end

local function sendFrequencyUpdate(rawFrequency)
    net.Start(MandoComlink.SetFrequencyNetMessage)
    net.WriteString(rawFrequency or "")
    net.SendToServer()
end

local function paintCutPanel(x, y, width, height, cut, fillColor, lineColor)
    local poly = {
        { x = x + cut, y = y },
        { x = x + width - cut, y = y },
        { x = x + width, y = y + cut },
        { x = x + width, y = y + height - cut },
        { x = x + width - cut, y = y + height },
        { x = x + cut, y = y + height },
        { x = x, y = y + height - cut },
        { x = x, y = y + cut }
    }

    draw.NoTexture()
    surface.SetDrawColor(fillColor)
    surface.DrawPoly(poly)
    surface.SetDrawColor(lineColor)

    for index = 1, #poly do
        local pointA = poly[index]
        local pointB = poly[index + 1] or poly[1]
        surface.DrawLine(pointA.x, pointA.y, pointB.x, pointB.y)
    end
end

local function styleComlinkButton(button, baseColor, accentColor)
    function button:Paint(width, height)
        local hovered = self:IsHovered()
        local fillColor = hovered and withAlpha(baseColor, 62) or withAlpha(baseColor, 34)
        local lineColor = hovered and accentColor or withAlpha(accentColor, 188)

        paintCutPanel(0, 0, width, height, math.max(comlinkScaleX(8), 6), fillColor, lineColor)
        draw.SimpleText(string.upper(self:GetText()), "MandoComlink.Small", width * 0.5, height * 0.5 - 1, palette.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        return true
    end
end

function MandoComlink.ClosePanel()
    if IsValid(comlinkFrame) then
        comlinkFrame:Remove()
    end
end

function MandoComlink.OpenPanel()
    if not canUseComlinkMenu() then
        return
    end

    if IsValid(comlinkFrame) then
        comlinkFrame:MakePopup()
        comlinkFrame:Center()
        return
    end

    local frame = vgui.Create("DFrame")
    frame:SetSize(math.max(comlinkScaleX(360), 320), math.max(comlinkScaleY(210), 196))
    frame:Center()
    frame:MakePopup()
    frame:SetTitle("")
    frame:ShowCloseButton(false)
    frame:SetDraggable(true)
    frame:DockPadding(comlinkScaleX(18), comlinkScaleY(18), comlinkScaleX(18), comlinkScaleY(18))
    frame:SetDeleteOnClose(true)
    frame.OnClose = function()
        comlinkFrame = nil
    end

    function frame:Paint(width, height)
        draw.RoundedBox(0, 0, 0, width, height, withAlpha(palette.shell, 238))
        draw.RoundedBox(0, comlinkScaleX(2), comlinkScaleY(2), width - comlinkScaleX(4), height - comlinkScaleY(4), palette.panel)
        paintCutPanel(0, 0, width, height, math.max(comlinkScaleX(12), 9), Color(0, 0, 0, 0), withAlpha(palette.amber, 210))

        surface.SetDrawColor(withAlpha(palette.holo, 36))
        for offset = comlinkScaleY(52), height - comlinkScaleY(26), comlinkScaleY(18) do
            surface.DrawLine(comlinkScaleX(16), offset, width - comlinkScaleX(16), offset)
        end

        surface.SetDrawColor(withAlpha(palette.holo, 22))
        for offset = comlinkScaleX(18), width - comlinkScaleX(16), comlinkScaleX(24) do
            surface.DrawLine(offset, comlinkScaleY(56), offset, height - comlinkScaleY(34))
        end

        draw.SimpleText("SQUAD COMLINK", "MandoComlink.Title", comlinkScaleX(18), comlinkScaleY(14), palette.amber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        draw.SimpleText("FREQUENCY LINK", "MandoComlink.Small", width - comlinkScaleX(18), comlinkScaleY(18), palette.textSoft, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
        surface.SetDrawColor(withAlpha(palette.holo, 92))
        surface.DrawLine(comlinkScaleX(18), comlinkScaleY(44), width - comlinkScaleX(18), comlinkScaleY(44))
    end

    local closeButton = vgui.Create("DButton", frame)
    closeButton:SetText("X")
    closeButton:SetFont("MandoComlink.Small")
    closeButton:SetSize(comlinkScaleX(26), comlinkScaleY(24))
    closeButton:SetPos(frame:GetWide() - comlinkScaleX(40), comlinkScaleY(12))
    closeButton.DoClick = function()
        frame:Close()
    end

    function closeButton:Paint(width, height)
        local fillColor = self:IsHovered() and withAlpha(palette.amberSoft, 66) or Color(0, 0, 0, 0)
        paintCutPanel(0, 0, width, height, math.max(comlinkScaleX(6), 4), fillColor, withAlpha(palette.amber, 172))
        draw.SimpleText("X", "MandoComlink.Small", width * 0.5, height * 0.5 - 1, palette.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        return true
    end

    local frequencyLabel = vgui.Create("DLabel", frame)
    frequencyLabel:Dock(TOP)
    frequencyLabel:DockMargin(0, comlinkScaleY(36), 0, comlinkScaleY(6))
    frequencyLabel:SetFont("MandoComlink.Small")
    frequencyLabel:SetTextColor(palette.textSoft)
    frequencyLabel:SetText("SQUAD FREQUENCY")
    frequencyLabel:SetTall(comlinkScaleY(18))

    local frequencyEntry = vgui.Create("DTextEntry", frame)
    frequencyEntry:Dock(TOP)
    frequencyEntry:SetTall(comlinkScaleY(38))
    frequencyEntry:SetFont("MandoComlink.Body")
    frequencyEntry:SetText(getLocalFrequency())
    frequencyEntry:SetPlaceholderText("ENTER CHANNEL")
    frequencyEntry:SetUpdateOnType(true)
    frequencyEntry:SetDrawLanguageID(false)

    function frequencyEntry:OnValueChange(value)
        local normalized = MandoComlink.NormalizeFrequency and MandoComlink.NormalizeFrequency(value) or string.upper(value)
        if value ~= normalized then
            self:SetText(normalized)
            self:SetCaretPos(#normalized)
        end
    end

    function frequencyEntry:OnEnter()
        if self:GetValue() == "" then
            return
        end

        sendFrequencyUpdate(self:GetValue())
        frame:Close()
    end

    function frequencyEntry:Paint(width, height)
        paintCutPanel(0, 0, width, height, math.max(comlinkScaleX(8), 6), withAlpha(palette.shell, 204), withAlpha(palette.holo, 170))
        self:DrawTextEntryText(palette.text, palette.amber, palette.text)
        return true
    end

    local statusLabel = vgui.Create("DLabel", frame)
    statusLabel:Dock(TOP)
    statusLabel:DockMargin(0, comlinkScaleY(10), 0, comlinkScaleY(14))
    statusLabel:SetFont("MandoComlink.Small")
    statusLabel:SetTextColor(palette.textSoft)
    statusLabel:SetWrap(true)
    statusLabel:SetAutoStretchVertical(true)

    local buttonRow = vgui.Create("DPanel", frame)
    buttonRow:Dock(TOP)
    buttonRow:SetTall(comlinkScaleY(34))
    buttonRow.Paint = nil

    local connectButton = vgui.Create("DButton", buttonRow)
    connectButton:Dock(LEFT)
    connectButton:SetWide(frame:GetWide() * 0.5 - comlinkScaleX(24))
    connectButton:SetText("Connect")
    connectButton.DoClick = function()
        sendFrequencyUpdate(frequencyEntry:GetValue())
        frame:Close()
    end
    styleComlinkButton(connectButton, palette.holoSoft, palette.holo)

    local disconnectButton = vgui.Create("DButton", buttonRow)
    disconnectButton:Dock(RIGHT)
    disconnectButton:SetWide(frame:GetWide() * 0.5 - comlinkScaleX(24))
    disconnectButton:SetText("Disconnect")
    disconnectButton.DoClick = function()
        sendFrequencyUpdate("")
        frame:Close()
    end
    styleComlinkButton(disconnectButton, palette.amberSoft, palette.amber)

    local footerLabel = vgui.Create("DLabel", frame)
    footerLabel:Dock(BOTTOM)
    footerLabel:DockMargin(0, comlinkScaleY(12), 0, 0)
    footerLabel:SetFont("MandoComlink.Small")
    footerLabel:SetTextColor(palette.textSoft)
    footerLabel:SetText("Shared frequency links voice comms for everyone tuned to the same channel.")
    footerLabel:SetWrap(true)
    footerLabel:SetAutoStretchVertical(true)

    frame.Think = function()
        if not canUseComlinkMenu() then
            frame:Close()
            return
        end

        local activeFrequency = getLocalFrequency()
        if activeFrequency ~= "" then
            statusLabel:SetText("STATUS // LINKED TO " .. activeFrequency)
        else
            statusLabel:SetText("STATUS // STANDBY - NO ACTIVE FREQUENCY")
        end
    end

    comlinkFrame = frame
end

hook.Add("Think", "MandoComlink.KeybindToggle", function()
    local keyDown = input.IsKeyDown(KEY_K)
    if keyDown and not wasComlinkKeyDown and not gui.IsGameUIVisible() and not IsValid(vgui.GetKeyboardFocus()) then
        if IsValid(comlinkFrame) then
            comlinkFrame:Close()
        else
            MandoComlink.OpenPanel()
        end
    end

    wasComlinkKeyDown = keyDown
end)

concommand.Add("mandohud_comlink_menu", function()
    MandoComlink.OpenPanel()
end)*/
