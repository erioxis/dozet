function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local norm = data:GetNormal() * -1


	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)


	for i=1, 6 do
		particle = emitter:Add("zombiesurvival/baracat", pos)
		particle:SetVelocity(VectorRand():GetNormal() * 190)
		particle:SetDieTime(3*i)
		particle:SetStartAlpha(255)
		particle:SetStartSize(5)
		particle:SetEndSize(math.Rand(1, 14))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-4.5, 4.5)*i)
		particle:SetColor(0, 0, 0)
	end
	for i=1, 12 do
		particle = emitter:Add("zombiesurvival/baracat", pos)
		particle:SetVelocity(VectorRand():GetNormal() * 240)
		particle:SetDieTime(3)
		particle:SetStartAlpha(255)
		particle:SetStartSize(2*i)
		particle:SetEndSize(math.Rand(1, 12))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-14.5, 4.5)*i)
		particle:SetColor(255, 255, 0)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)

	local maxbound = Vector(3, 3, 3)
	local minbound = maxbound * -1
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
