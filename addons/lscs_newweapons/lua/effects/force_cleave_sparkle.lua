function EFFECT:Init( data )
	self.Pos = data:GetOrigin()
	self.Col = data:GetStart() or Vector(255,100,0)
	
	self.LifeTime = 0.2
	self.DieTime = CurTime() + self.LifeTime

	local Col = self.Col
	local Pos = self.Pos
	local Dir = data:GetNormal()

	local emitter = ParticleEmitter( Pos, false )

	local particle = emitter:Add( "effects/muzzleflashx", Pos )
		
	if particle then
		particle:SetDieTime( 1 )
		particle:SetStartAlpha( math.Rand( 200, 255 ) )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( 5 )
		particle:SetEndSize( 0.5 )
		particle:SetRoll( math.Rand(-100,100) )
		particle:SetCollide( true )
		particle:SetBounce( 0.5 )
		particle:SetAirResistance( 0 )
		particle:SetColor( math.Rand( 100, 255 ), math.Rand( 100, 255 ), math.Rand( 100, 255 ) )
		particle:SetGravity( Vector(0,0,0) )
	end

	emitter:Finish()
end

function EFFECT:Think()
	if self.DieTime < CurTime() then 
		return false
	end

	return true
end

local mat = Material( "effects/muzzleflashx" )
function EFFECT:Render()
	local Scale = (self.DieTime - CurTime()) / self.LifeTime
	render.SetMaterial( mat )
	render.DrawSprite( self.Pos, 12, 12, Color( 150 * Scale, 200 * Scale, 255 * Scale, 255) ) 
end