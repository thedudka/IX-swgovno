local force = {}
force.PrintName = "Immunity [Advanced]"
force.Author = "Blu-x92 / Luna"
force.Description = "Incoming Force Power attacks are absorbed and regain Force Points. Also gives a permanent immunity against incoming Force Powers as long your own Force Points are above 50% even when this Power is not activated. Only the weak minded don't learn this ability."
force.id = "immunityii"

force.Equip = function( ply ) ply._lscsForceResistant = true end
force.UnEquip = function( ply ) ply._lscsForceResistant = nil ply:GetNWBool( "_lscsForceProtect", false ) end
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 1

	if ply:GetNWBool( "_lscsForceProtect", false ) then
		ply:SetNWBool( "_lscsForceProtect", false )
	else
		if ply:lscsGetForce() < 20 then return end

		ply:SetNWBool( "_lscsForceProtect", true )
		ply._lscsBlockTime = CurTime() + 30

		ply:EmitSound("lscs/force/protect.mp3")

		ply:lscsTakeForce( 20 )
	end

end
LSCS:RegisterForce( force )

local force = {}
force.PrintName = "Immunity [Mastered]"
force.Author = "Storm"
force.Description = "Gives a permanent immunity against incoming Force Powers as long your own Force Points are above 50% even when this Power is not activated. Only the weak minded don't learn this ability."
force.id = "immunityiii"

force.Equip = function( ply ) ply._lscsForceResistant = true end
force.UnEquip = function( ply ) ply._lscsForceResistant = nil ply:GetNWBool( "_lscsForceProtect", false ) end
force.StartUse = function( ply )
	local Time = CurTime()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end

	ply._lscsNextForce = Time + 1

	if ply:GetNWBool( "_lscsForceProtect", false ) then
		ply:SetNWBool( "_lscsForceProtect", false )
	else
		if ply:lscsGetForce() < 20 then return end

		ply:SetNWBool( "_lscsForceProtect", true )
		ply._lscsBlockTime = CurTime() + 40

		ply:EmitSound("lscs/force/protect.mp3")

		ply:lscsTakeForce( 20 )
	end

end
LSCS:RegisterForce( force )