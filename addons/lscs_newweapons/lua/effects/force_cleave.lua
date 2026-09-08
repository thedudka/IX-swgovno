function EFFECT:Init( data )
	self.Pos = data:GetOrigin()
	self.Col = data:GetStart() or Vector(255,100,0)
	
	self.LifeTime = 0.5
	self.DieTime = CurTime() + self.LifeTime

	local Col = self.Col
	local Pos = self.Pos
	local Dir = data:GetNormal()
	
	local emitter = ParticleEmitter( Pos, false )
	
	for i = 0, 10 do
		local particle = emitter:Add( "decals/splash1", Pos )
		
		local vel = VectorRand() * 100 + Dir * 100
		
		if particle then
			particle:SetVelocity( vel )
			particle:SetAngles( vel:Angle() + Angle(0,90,0) )
			particle:SetDieTime( 0.5 )
			particle:SetStartAlpha( 100 )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 30 )
			particle:SetEndSize( 2 )
			particle:SetRoll( math.Rand(-100,100) )
			particle:SetRollDelta( math.Rand(-100,100) )
			particle:SetCollide( true )
			particle:SetBounce( 0.5 )
			particle:SetAirResistance( 0 )
			particle:SetColor( 110, 0, 0 )
			particle:SetGravity( Vector(0,0,0) )
		end
	end

	emitter:Finish()
end

function EFFECT:Think()
	if self.DieTime < CurTime() then 
		return false
	end

	return true
end

local mat = Material( "decals/splash1" )
function EFFECT:Render()
	local Scale = (self.DieTime - CurTime()) / self.LifeTime
	render.SetMaterial( mat )
	render.DrawSprite( self.Pos, 200, 5, Color( 0 * Scale, 0 * Scale, 0 * Scale, 255 * Scale) ) 
end