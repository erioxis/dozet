function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local norm = data:GetNormal()

	local particle
	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)
	for i = 1, 2 do
		particle = emitter:Add("!sprite_bloodspray"..math.random(8), pos + Vector(0,0,32))
		if particle then
			particle:SetVelocity(VectorRand():GetNormal() * 125)
			particle:SetDieTime(math.random(0.8,1.4))
			particle:SetStartAlpha(255)
			particle:SetStartSize( math.random(3,16) )
			particle:SetEndSize(0)
			particle:SetEndAlpha( 0 )
			particle:SetRoll( math.Rand( -360, 360 ) )
			particle:SetRollDelta( 2 )
			particle:SetColor( 255, 20, 20 )
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
