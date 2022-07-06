function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local norm = data:GetNormal() * -1


	sound.Play("ambient/fire/mtov_flame2.wav", pos, 95, math.Rand(130, 300))
	sound.Play("ambient/fire/ignite.wav", pos, 95, math.Rand(180, 230))

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)


	for i=1, 6 do
		particle = emitter:Add("particles/smokey", pos)
		particle:SetVelocity(VectorRand():GetNormal() * 190)
		particle:SetDieTime(math.Rand(0.7, 0.85))
		particle:SetStartAlpha(math.Rand(50, 70))
		particle:SetStartSize(math.Rand(100,120))
		particle:SetEndSize(math.Rand(205, 210))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-4.5, 4.5))
		particle:SetColor(233, 100, 58)
	end
	for i=1, 12 do
		particle = emitter:Add("particles/smokey", pos)
		particle:SetVelocity(VectorRand():GetNormal() * 240)
		particle:SetDieTime(math.Rand(0.3, 0.6))
		particle:SetStartAlpha(math.Rand(90, 110))
		particle:SetStartSize(1)
		particle:SetEndSize(math.Rand(160, 190))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-4.5, 4.5))
		particle:SetColor(123, 30, 58)
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
