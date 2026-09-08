ENT.Type 				= "anim"  
ENT.PrintName			= "Boulder" 
ENT.Author				= "Solace"  
ENT.Spawnable			= false
ENT.AdminSpawnable		= false


local modelList = {
"models/props_wasteland/rockgranite03a.mdl",
"models/props_wasteland/rockgranite03b.mdl",
"models/props_wasteland/rockgranite03c.mdl"
}

if SERVER then
	AddCSLuaFile( "shared.lua" )
	
	function ENT:Initialize()
		self:SetModel(table.Random( modelList ))

		self:PhysicsInit( SOLID_VPHYSICS ) 	
		self:SetSolid( SOLID_VPHYSICS ) 
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetCollisionGroup ( COLLISION_GROUP_INTERACTIVE )
		
		self.DieTime = CurTime() + 5

		local phys = self:GetPhysicsObject()
		phys:EnableGravity( false )
		phys:EnableDrag( false )
		phys:Wake()
		phys:SetAngleVelocity(Vector(math.Rand(0,180), math.Rand(0,180), math.Rand(0,180)))
		
		util.SpriteTrail( self, 0, Color( 255, 255, 255, 40 ), false, 36, 0, 0.3, 0.03125, "trails/smoke" )
	end
	
	function ENT:PhysicsCollide( data, phys )
		local ent = data.HitEntity
		local phys = self:GetPhysicsObject()
		local speed = phys:GetVelocity():LengthSqr()
		self.DamageCooldown = (self.DamageCooldown or CurTime() - 0.01)
		if speed > 40000 then
			self:EmitSound("physics/concrete/boulder_impact_hard1.wav", 90, math.random( 80, 120 ))
			if self.DamageCooldown < CurTime() then
				ent:TakeDamage( 1500, self:GetOwner(), self)
				self.DamageCooldown = CurTime() + 0.1
			end
		end
	end
	
	function ENT:Think()
		if self.IsThrown and self.DieTime <= CurTime() then
			self:Remove()
		end
	end
end