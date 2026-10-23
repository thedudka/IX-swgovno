AddCSLuaFile()

SWEP.Base = "weapon_base"
SWEP.PrintName = "Thermal Pack"
SWEP.Category = "Helix"
SWEP.Spawnable = false
SWEP.AdminOnly = true
SWEP.UseHands = true
SWEP.IsAlwaysRaised = true
SWEP.DrawViewModel = false
SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel = "models/props/starwars/weapons/lasertrap.mdl"
SWEP.HoldType = "slam"
SWEP.Instructions = "ЛКМ: Установить\nПКМ: Установить на поверхность"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

local function getFactionGroup(client)
	if (client:IsNeutral()) then
		return "neutral"
	elseif (client:IsRepublic()) then
		return "republic"
	elseif (client:IsCIS()) then
		return "cis"
	end
end

local function getVehicleTarget(entity)
	local current = entity
	local depth = 0

	while (IsValid(current) and depth < 8) do
		local class = current:GetClass()

		if (class == "lvs_walker_atte_rear" or class == "lvs_walker_hsd_leg") then
			return current
		end

		if (current:IsVehicle() or current.LVS or string.StartWith(class, "lvs_")) then
			return current
		end

		current = current:GetParent()
		depth = depth + 1
	end
end

function SWEP:Initialize()
	self:SetHoldType("slam")
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

		local modelAngles = Vector(0, 0, 1):AngleEx(outward)
		modelAngles:RotateAroundAxis(Vector(0, 0, 1), 180)
		self:SetRenderOrigin(handCenter + outward * 2)
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

local function createDetpack(weapon, position, angles, mode, anchor, surfaceNormal)
	local client = weapon:GetOwner()

	if (!IsValid(client)) then
		return false
	end

	local faction = getFactionGroup(client)

	if (!faction) then
		client:Notify("Вы не знаете, как этим пользоваться.")
		return false
	end

	local charge = ents.Create("ix_detpack_charge")

	if (!IsValid(charge)) then
		client:Notify("Установка неудалась.")
		return false
	end

	charge:SetPos(position)
	charge:SetAngles(angles)
	charge.placer = client
	charge:Spawn()
	charge:Activate()

	if (!charge:ConfigurePlacement(mode, anchor, position, surfaceNormal, faction)) then
		charge:Remove()
		client:Notify("Здесь нельзя установить взрывпакет!")
		return false
	end

	client:EmitSound("timebomb/plant.wav")

	if (mode == "npc") then
		client:Notify("Вы установили взрывпакет на существо.")
	else
		client:Notify("Взрывпакет установлен.")
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
	local trace = util.TraceHull({
		start = shootPosition + forward * 8,
		endpos = shootPosition + forward * 42,
		mins = Vector(-6, -6, -6),
		maxs = Vector(6, 6, 6),
		filter = {client, self},
		mask = MASK_SOLID
	})
	local dropPosition = trace.Hit and (trace.HitPos - forward * 10) or trace.HitPos

	if (trace.StartSolid or trace.HitSky) then
		client:Notify("Здесь нельзя установить взрывпакет.")
		return
	end

	createDetpack(self, dropPosition, Angle(0, client:EyeAngles().y, 0), "free")
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

	local traceStart = client:GetShootPos()
	local trace = util.TraceLine({
		start = traceStart,
		endpos = traceStart + client:GetAimVector() * 96,
		filter = {client, self},
		mask = MASK_SOLID
	})

	if (!trace.Hit or trace.HitSky) then
		client:Notify("Здесь нельзя установить взрывпакет.")
		return
	end

	local targetEntity = trace.Entity
	local hitPosition = trace.HitPos
	local hitNormal = trace.HitNormal

	if (!isvector(hitNormal) or hitNormal:LengthSqr() < 0.001) then
		hitNormal = hitPosition - targetEntity:WorldSpaceCenter()
	end

	local anchor = getVehicleTarget(targetEntity)
	local mode

	if (IsValid(targetEntity) and targetEntity:IsNPC()) then
		mode = "npc"
		anchor = targetEntity
	elseif (IsValid(anchor)) then
		mode = "vehicle"
	elseif (trace.HitWorld or !IsValid(targetEntity) or targetEntity:IsWorld()) then
		mode = "world"
	elseif (targetEntity:GetClass() == "ix_container") then
		mode = "container"
		anchor = targetEntity
	elseif (targetEntity:IsDoor()
		or targetEntity:GetClass() == "func_door"
		or targetEntity:GetClass() == "func_door_rotating"
		or targetEntity:GetClass() == "prop_door_rotating") then
		mode = "door"
		anchor = targetEntity
	elseif (targetEntity:GetClass() == "prop_physics"
		or targetEntity:GetClass() == "prop_physics_multiplayer") then
		mode = "prop"
		anchor = targetEntity
	else
		client:Notify("Нельзя установить взрывпакет здесь.")
		return
	end

	local surfaceNormal = hitNormal:GetNormalized()
	local worldUp = Vector(0, 0, 1)
	local longAxis = worldUp - surfaceNormal * worldUp:Dot(surfaceNormal)

	if (longAxis:LengthSqr() < 0.001) then
		local aimRight = client:EyeAngles():Right()
		longAxis = aimRight - surfaceNormal * aimRight:Dot(surfaceNormal)
	end

	longAxis:Normalize()
	createDetpack(self, hitPosition, longAxis:AngleEx(surfaceNormal), mode, anchor, surfaceNormal)
end
