EFFECT.LifeTime = 0.2

function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local normal = data:GetNormal() * 1
	local power = data:GetAttachment()

	pos = pos + normal

	self.Pos = pos
	self.Normal = normal
	self.DieTime = CurTime() + self.LifeTime
	self.Power = power

	sound.Play("physics/metal/metal_computer_impact_bullet"..math.random(1,3)..".wav", pos, 75*power, math.Rand(90, 120))

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)

	for i=1, math.random(3, 6) do
		local heading = VectorRand()
		heading:Normalize()

		local particle = emitter:Add("effects/spark", pos + heading * 8)
		if particle then
			particle:SetVelocity(175 * heading)
			particle:SetDieTime(math.Rand(0.5, 0.75))
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(255)
			particle:SetStartSize(math.Rand(3, 5))
			particle:SetEndSize(0)
			particle:SetColor(166, 160, 8)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-10, 10))
			particle:SetAirResistance(250)
		end		
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function EFFECT:Think()
	return CurTime() < self.DieTime
end

local matRefract = Material("refract_ring")
local matGlow = Material("sprites/glow04_noz")
local colGlow = Color(166, 160, 8)
function EFFECT:Render()
	local power = self.Power
	local delta = (self.DieTime - CurTime()) / self.LifeTime
	local basesize = 10 * power^2
	basesize = basesize + basesize ^ (1.5 - delta) 

	local pos = self.Pos
	matRefract:SetFloat("$refractamount", (0.25 + math.abs(math.sin(CurTime() * 5)) * math.pi * 0.25) * delta)
	render.SetMaterial(matRefract)
	render.UpdateRefractTexture()
	render.DrawSprite(pos, basesize, basesize)
	render.DrawQuadEasy(pos, self.Normal, basesize, basesize, COLOR_YELLOW, 0)
	render.DrawQuadEasy(pos, self.Normal, basesize, basesize, COLOR_YELLOW, 0)
	basesize = basesize * 3

	colGlow.a = delta * 255
	render.SetMaterial(matGlow)
	render.DrawSprite(pos, basesize, basesize, colGlow)
	render.DrawQuadEasy(pos, self.Normal, basesize, basesize, colGlow, 0)
	render.DrawQuadEasy(pos, self.Normal, basesize, basesize, colGlow, 0)
end
