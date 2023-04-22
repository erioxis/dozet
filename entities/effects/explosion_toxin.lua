function EFFECT:Init(data)
	local pos = data:GetOrigin() + Vector(0, 0, 2)

	self.Start = pos
	self.StartTime = CurTime()

	self.Alpha = 255
	self.Life = 0

	sound.Play("ambient/explosions/explode_"..math.random(1,5)..".wav", pos, 80, math.random(135, 160), 0.7)

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(32, 48)
	local vector = VectorRand():GetNormal()
	for i=1, 3 do
		local particle = emitter:Add("sprites/glow04_noz", pos)
		if particle then
			particle:SetDieTime(1)
			particle:SetColor(10,255,10)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(24)
			particle:SetEndSize(0)
			particle:SetVelocity(vector * 350)
			particle:SetGravity(Vector(0,0,-600))
			particle:SetCollide(true)
			particle:SetBounce(0.5)
		end
	end

	for i=1, 2 do
		local particle = emitter:Add("sprites/flamelet"..math.random(1, 4), pos)
		if particle then
			particle:SetVelocity(vector * 110)
			particle:SetDieTime(math.Rand(0.5, 0.6))
			particle:SetStartAlpha(220)
			particle:SetEndAlpha(0)
			particle:SetStartSize(15)
			particle:SetEndSize(1)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetColor(55, 255, 55)
			particle:SetRollDelta(math.Rand(-3, 3))
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function EFFECT:Think()
	self.Life = self.Life + FrameTime() * 4
	self.Alpha = 255 * (1 - self.Life)
	return self.Life < 1
end

local glowmat = Material("sprites/glow04_noz")

function EFFECT:Render()
	render.SetMaterial(glowmat)
	render.DrawSprite(self.Start, 400, 400, Color(25, 250, 10, self.Alpha))
end
