function EFFECT:Init(data)
	local pos = data:GetOrigin()

	self.Start = pos
	self.StartTime = CurTime()

	self.Alpha = 255
	self.Life = 0

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(32, 48)
	local vector = VectorRand():GetNormal()
	for i=1, 5 do
		local particle = emitter:Add("sprites/glow04_noz", pos)
		if particle then
			particle:SetDieTime(0.5)
			particle:SetColor(255,16,10)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(4)
			particle:SetEndSize(0)
			particle:SetVelocity(vector * 50)
			particle:SetGravity(Vector(0,0,-60))
			particle:SetCollide(true)
			particle:SetBounce(0.5)
		end
	end

	for i=1, 3 do
		local particle = emitter:Add("effects/fire_cloud1", pos)
		if particle then
			particle:SetDieTime(0.25)
			particle:SetColor(235,20,10)
			particle:SetStartAlpha(178)
			particle:SetEndAlpha(0)
			particle:SetStartSize(0)
			particle:SetEndSize(15)
			particle:SetVelocity(vector * 50)
		end
	end

	for i=1, 2 do
		local particle = emitter:Add("sprites/flamelet"..math.random(1, 4), pos)
		if particle then
			particle:SetVelocity(vector * 10)
			particle:SetDieTime(0.25)
			particle:SetStartAlpha(170)
			particle:SetEndAlpha(0)
			particle:SetStartSize(48)
			particle:SetEndSize(1)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetColor(255, 230, 150)
			particle:SetRollDelta(math.Rand(-3, 3))
		end
	end

	for i=1, 8 do
		local particle = emitter:Add("effects/fire_embers"..math.random(1, 3), pos)
		if particle then
			particle:SetVelocity(vector * 50)
			particle:SetDieTime(0.375)
			particle:SetStartAlpha(130)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(15, 19))
			particle:SetEndSize(1)
			particle:SetRoll(math.Rand(0, 359))
			particle:SetRollDelta(math.Rand(-3, 3))
			particle:SetAirResistance(50)
			particle:SetCollide(true)
			particle:SetBounce(0.3)
			particle:SetColor(255, 23, 15)
			particle:SetGravity(Vector(0,0,-40))
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function EFFECT:Think()
	self.Life = self.Life + FrameTime() * 8
	self.Alpha = 255 * (1 - self.Life)
	return self.Life < 1
end

local glowmat = Material("sprites/glow04_noz")

function EFFECT:Render()
	render.SetMaterial(glowmat)
	render.DrawSprite(self.Start, 400, 400, Color(255, 120, 0, self.Alpha))
end
