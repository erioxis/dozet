function EFFECT:Init(effectdata)
	local pos = effectdata:GetOrigin()
	local normal = effectdata:GetNormal()
	local mag = effectdata:GetMagnitude()
	local col, rad = Color( 255, 255, 255 ), 250
	if mag == 1 then
		col = Color( 255, 0, 0, 255 )
		rad = 150
	elseif mag == 2 then
		col = Color( 155, 0, 255, 255 )
		rad = 250
	end

	local emitter = ParticleEmitter( pos, true )
	emitter:SetNearClip( 24, 32 )

	local particle = emitter:Add( "effects/select_ring", pos )
	if particle then
		particle:SetDieTime( 1 )
		particle:SetColor( col.r, col.g, col.b, 255 )
		particle:SetStartAlpha( 55 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( rad )
		particle:SetEndSize( 0 )
		particle:SetAngles( normal:Angle() )
	end

	emitter:Finish() emitter = nil collectgarbage( "step", 64 )
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

