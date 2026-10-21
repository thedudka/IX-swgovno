AddCSLuaFile()

SWEP.Base = "weapon_base"
SWEP.PrintName = "Magnetic timebomb"
SWEP.Category = "Helix"
SWEP.Spawnable = false
SWEP.AdminOnly = true
SWEP.UseHands = true
SWEP.IsAlwaysRaised = true
SWEP.DrawViewModel = false
SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel = "models/epsilon/cwa_furniture/misc/eps_seismic_charge.mdl"
SWEP.HoldType = "slam"
SWEP.Instructions = [[ЛКМ: Установить
ПКМ: Установить на поверхность
Перезарядка: Изменить таймер]]

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

local DEFAULT_TIMER = 10
local TIMER_OPTIONS = {10, 15, 20, 30, 60, 5}

local function getVehicleTarget(entity)
	local current = entity
	local depth = 0

	while (IsValid(current) and depth < 8) do
		local class = current:GetClass()

		if (current:IsVehicle() or current.LVS or string.StartWith(class, "lvs_")) then
			return current
		end

		current = current:GetParent()
		depth = depth + 1
	end
end

function SWEP:Initialize()
	self:SetHoldType("slam")
	self.timeBombDelay = self.timeBombDelay or DEFAULT_TIMER
end

function SWEP:Deploy()
	self:SetHoldType("slam")
	return true
end

function SWEP:Think()
	self:SetHoldType("slam")
end

if (CLIENT) then
	function SWEP:DrawWorldModel()
		local owner = self:GetOwner()

		if (!IsValid(owner)) then
			self:DrawModel()
			return
		end

		local rightHandBone = owner:LookupBone("ValveBiped.Bip01_R_Hand")
		local leftHandBone = owner:LookupBone("ValveBiped.Bip01_L_Hand")
		local rightHandMatrix = rightHandBone and owner:GetBoneMatrix(rightHandBone)
		local leftHandMatrix = leftHandBone and owner:GetBoneMatrix(leftHandBone)

		if (!rightHandMatrix or !leftHandMatrix) then
			self:DrawModel()
			return
		end

		local handCenter = (rightHandMatrix:GetTranslation() + leftHandMatrix:GetTranslation()) * 0.5
		local outward = owner:GetForward()
		outward.z = 0
		outward:Normalize()

		local vertical = Vector(0, 0, 1)
		local modelAngles = vertical:AngleEx(outward)
		local modelPosition = handCenter + outward * 2

		self:SetRenderOrigin(modelPosition)
		self:SetRenderAngles(modelAngles)
		self:DrawModel()
		self:SetRenderOrigin()
		self:SetRenderAngles()
	end
end

local function consumeWeaponItem(weapon, client)
	local item = weapon.ixItem

	if (!item) then
		local character = client:GetCharacter()
		local inventory = character and character:GetInventory()

		if (inventory) then
			for _, inventoryItem in pairs(inventory:GetItems()) do
				if (inventoryItem.class == weapon:GetClass() and inventoryItem:GetData("equip")) then
					item = inventoryItem
					break
				end
			end
		end
	end

	weapon.ixItem = nil
	client:StripWeapon(weapon:GetClass())

	if (item) then
		client.carryWeapons = client.carryWeapons or {}

		if (item.weaponCategory and client.carryWeapons[item.weaponCategory] == weapon) then
			client.carryWeapons[item.weaponCategory] = nil
		end

		item:Remove()
	end
end

local function createCharge(weapon, position, angles, mode, anchor, surfaceNormal)
	local client = weapon:GetOwner()

	if (!IsValid(client)) then
		return false
	end

	local charge = ents.Create("ix_timebomb_charge")

	if (!IsValid(charge)) then
		client:Notify("Установка заряда не удалась.")
		return false
	end

	charge:SetPos(position)
	charge:SetAngles(angles)
	charge.placer = client
	charge:Spawn()
	charge:Activate()

	if (!charge:ConfigurePlacement(mode, anchor, position, surfaceNormal)) then
		charge:Remove()
		client:Notify("Установка заряда не удалась.")
		return false
	end

	local delay = mode == "npc" and 5 or (weapon.timeBombDelay or DEFAULT_TIMER)
	charge:Arm(delay, client)

	client:EmitSound("timebomb/plant.wav")

	if (mode == "npc") then
		client:Notify("Вы установили заряд на существо. Бегите.")
	else
		client:Notify("Заряд установлен. Детонация через " .. tostring(delay) .. " секунд.")
	end

	consumeWeaponItem(weapon, client)

	return true
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 1)

	if (CLIENT) then
		return
	end

	local client = self:GetOwner()

	if (!IsValid(client)) then
		return
	end

	local forward = client:GetAimVector()
	local shootPosition = client:GetShootPos()
	local placeTrace = util.TraceHull({
		start = shootPosition + forward * 8,
		endpos = shootPosition + forward * 42,
		mins = Vector(-6, -6, -6),
		maxs = Vector(6, 6, 6),
		filter = {client, self},
		mask = MASK_SOLID
	})
	local dropPosition = placeTrace.Hit and (placeTrace.HitPos - forward * 10) or placeTrace.HitPos

	if (placeTrace.StartSolid or placeTrace.HitSky) then
		client:ChatPrint("Здесь нельзя установить заряд.")
		return
	end

	createCharge(self, dropPosition, Angle(0, client:EyeAngles().y, 0), "free")
end

function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + 1)

	if (CLIENT) then
		return
	end

	local client = self:GetOwner()

	if (!IsValid(client)) then
		return
	end

	local trace = util.TraceLine({
		start = client:GetShootPos(),
		endpos = client:GetShootPos() + client:GetAimVector() * 96,
		filter = {client, self},
		mask = MASK_SOLID
	})

	if (!trace.Hit or trace.HitSky) then
		client:ChatPrint("Нельзя установить здесь заряд!")
		return
	end

	local mode
	local anchor = getVehicleTarget(trace.Entity)

	if (IsValid(trace.Entity) and trace.Entity:IsNPC()) then
		mode = "npc"
		anchor = trace.Entity
	elseif (IsValid(anchor)) then
		mode = "vehicle"
	elseif (trace.HitWorld or !IsValid(trace.Entity) or trace.Entity:IsWorld()) then
		mode = "world"
	elseif (trace.Entity:GetClass() == "ix_container") then
		mode = "container"
		anchor = trace.Entity
	elseif (trace.Entity:IsDoor()
		or trace.Entity:GetClass() == "func_door"
		or trace.Entity:GetClass() == "func_door_rotating"
		or trace.Entity:GetClass() == "prop_door_rotating") then
		mode = "door"
		anchor = trace.Entity
	elseif (trace.Entity:GetClass() == "prop_physics"
		or trace.Entity:GetClass() == "prop_physics_multiplayer") then
		mode = "prop"
		anchor = trace.Entity
	else
		client:ChatPrint("Нельзя установить здесь заряд!")
		return
	end

	local surfaceNormal = trace.HitNormal:GetNormalized()
	local worldUp = Vector(0, 0, 1)
	local longAxis = worldUp - surfaceNormal * worldUp:Dot(surfaceNormal)

	if (longAxis:LengthSqr() < 0.001) then
		local aimRight = client:EyeAngles():Right()
		longAxis = aimRight - surfaceNormal * aimRight:Dot(surfaceNormal)
	end

	longAxis:Normalize()
	local angles = longAxis:AngleEx(surfaceNormal)

	createCharge(self, trace.HitPos, angles, mode, anchor, surfaceNormal)
end

function SWEP:Reload()
	if (CLIENT or (self.nextTimeBombReload or 0) > CurTime()) then
		return
	end

	local currentIndex = 1

	for index, delay in ipairs(TIMER_OPTIONS) do
		if (delay == self.timeBombDelay) then
			currentIndex = index
			break
		end
	end

	local nextIndex = currentIndex % #TIMER_OPTIONS + 1

	self.timeBombDelay = TIMER_OPTIONS[nextIndex]
	self.nextTimeBombReload = CurTime() + 0.5

	local client = self:GetOwner()

	if (IsValid(client)) then
		client:ChatPrint("Время детонации установлено на " .. tostring(self.timeBombDelay) .. " секунд.")
	end
end
