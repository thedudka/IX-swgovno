
if (not SERVER) then return end

local TEMPLATE_DIR = "ix_customitem_tpl"
local MAX_TEMPLATES = 24
local MAX_NAME = 32
local MAX_PAYLOAD = 32768

local function GetSteamID(client)
	return client:SteamID64() or ("BOT_" .. client:UserID())
end

local function GetPath(client)
	return TEMPLATE_DIR .. "/" .. GetSteamID(client) .. ".txt"
end

local function ReadAll(client)
	local path = GetPath(client)
	if (not file.Exists(path, "DATA")) then return {} end
	local raw = file.Read(path, "DATA") or "{}"
	return util.JSONToTable(raw) or {}
end

local function WriteAll(client, tpls)
	file.CreateDir(TEMPLATE_DIR)
	file.Write(GetPath(client), util.TableToJSON(tpls) or "{}")
end

local function SanitizeName(name)
	if (not isstring(name)) then return "" end
	name = string.Trim(name)
	if (#name > MAX_NAME) then name = string.sub(name, 1, MAX_NAME) end
	return name
end

local function ReadCompressed()
	local len = net.ReadUInt(32)
	if (len <= 0 or len > MAX_PAYLOAD) then return nil end
	local data = net.ReadData(len)
	if (not data) then return nil end
	return util.JSONToTable(util.Decompress(data) or "")
end

local function WriteCompressed(tbl)
	local json = util.TableToJSON(tbl) or "{}"
	local data = util.Compress(json) or json
	net.WriteUInt(#data, 32)
	net.WriteData(data, #data)
end

local function SendNames(client)
	local tpls = ReadAll(client)
	local names = {}
	for name, _ in pairs(tpls) do
		names[#names + 1] = name
	end
	table.sort(names)

	net.Start("ixCustomItemTplListNames")
	WriteCompressed({names = names})
	net.Send(client)
end

net.Receive("ixCustomItemTplListRequest", function(_, client)
	if (not IsValid(client) or not client:IsAdmin()) then return end
	SendNames(client)
end)

net.Receive("ixCustomItemTplSave", function(_, client)
	if (not IsValid(client) or not client:IsAdmin()) then return end

	local name = SanitizeName(net.ReadString())
	if (name == "") then
		client:NotifyLocalized("ixCustomItemInvalid", "empty template name")
		return
	end

	local raw = ReadCompressed()
	if (not istable(raw)) then
		client:NotifyLocalized("ixCustomItemInvalid", "invalid template payload")
		return
	end

	local sanitizer = ix.customItem and ix.customItem.SanitizeDraft
	local draft = sanitizer and sanitizer(raw) or raw

	local tpls = ReadAll(client)
	if (not tpls[name]) then
		local count = 0
		for _ in pairs(tpls) do count = count + 1 end
		if (count >= MAX_TEMPLATES) then
			client:NotifyLocalized("ixCustomItemInvalid", "template limit reached")
			return
		end
	end

	tpls[name] = draft
	WriteAll(client, tpls)
	SendNames(client)
	client:NotifyLocalized("ixCustomItemTplSaved", name)
end)

net.Receive("ixCustomItemTplDelete", function(_, client)
	if (not IsValid(client) or not client:IsAdmin()) then return end

	local name = SanitizeName(net.ReadString())
	if (name == "") then return end

	local tpls = ReadAll(client)
	tpls[name] = nil
	WriteAll(client, tpls)
	SendNames(client)
end)

net.Receive("ixCustomItemTplLoadRequest", function(_, client)
	if (not IsValid(client) or not client:IsAdmin()) then return end

	local name = SanitizeName(net.ReadString())
	if (name == "") then return end

	local tpls = ReadAll(client)
	local draft = tpls[name]
	if (not draft) then return end

	net.Start("ixCustomItemTplLoadResponse")
	net.WriteString(name)
	WriteCompressed(draft)
	net.Send(client)
end)
