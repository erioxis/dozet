function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

function EFFECT:Init(data)
	local pos = data:GetOrigin()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(28, 32)
	for i=1, 32 do
		local particle = emitter:Add("sprites/animglow02", pos)
		if particle then
			local vec_wow = VectorRand():GetNormalized() * math.Rand(46, 74)
			particle:SetVelocity(vec_wow * 3)
			particle:SetDieTime(3)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetColor(250,250,250)
			particle:SetStartSize(math.Rand(4, 6))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-1, 1))
			particle:SetCollide(true)
			particle:SetGravity( -vec_wow + Vector(0, 0, 35) )
			particle:SetLighting(true)
		end
	end	

	for i=1, 32 do
		local particle = emitter:Add("sprites/animglow02", pos)
		if particle then
			local vec_wow = VectorRand():GetNormalized() * math.Rand(46, 74)
			particle:SetDieTime(4)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetColor(250,250,250)
			particle:SetStartSize(math.Rand(1, 2))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-1, 1))
			particle:SetCollide(true)
			particle:SetGravity(vec_wow * 0.8)
			particle:SetLighting(true)
		end
	end

	for i=1, 35 do
		particle = emitter:Add("effects/blood2", pos)
		if particle then
			particle:SetVelocity( VectorRand():GetNormal() * 45 + Vector(0, 0, 35) )
			particle:SetGravity( VectorRand():GetNormal() * 45 + -Vector(0, 0, 125) )
			particle:SetDieTime(2.5)
			particle:SetStartAlpha(125)
			particle:SetStartSize(math.Rand(23, 36))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(-360, 360))
			particle:SetRollDelta(math.Rand(-4.5, 4.5))
			particle:SetColor(55, 50, 80)
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)


	sound.Play("physics/flesh/flesh_squishy_impact_hard"..math.random(4)..".wav", pos, 80, math.Rand(95, 110))
	sound.Play("buttons/button10.wav", pos, 80, math.Rand(55, 160))
end
