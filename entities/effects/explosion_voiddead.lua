EFFECT.LifeTime = 1.45
EFFECT.Size = 256
function EFFECT:Init(effectdata)
	local pos = effectdata:GetOrigin()
	local normal = effectdata:GetNormal()

	self.Pos = pos + Vector( 0, 0, 25 )
	self.Normal = normal
	self.DieTime = CurTime() + self.LifeTime

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)
	local vector = VectorRand()
	for i=1, 15 do
		local particle = emitter:Add("sprites/heatwave", pos)
		if particle then
			particle:SetDieTime( math.random(0.7, 0.9) )
			particle:SetColor(50,90,95)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(15)
			particle:SetEndSize(1)
			particle:SetVelocity((normal + vector):GetNormal() * 150)
			particle:SetGravity(vector * 7 + Vector(0, 0, 20))
			particle:SetCollide(true)
			particle:SetBounce(0.75)
			particle:SetAirResistance(12)
		end
	end
	for i=1, 15 do
		local particle = emitter:Add("effects/splashwake1", pos)
		if particle then
			particle:SetDieTime( math.random(2.1, 2.9) )
			particle:SetColor(55,5,5)
			particle:SetStartAlpha(55)
			particle:SetEndAlpha(0)
			particle:SetStartSize(45)
			particle:SetEndSize(1)
			particle:SetVelocity((normal + vector):GetNormal() * 150)
			particle:SetGravity(vector * 10 + Vector(0, 0, 10))
			particle:SetCollide(true)
			particle:SetBounce(0.75)
			particle:SetAirResistance(12)
		end
	end
	emitter:Finish() emitter = nil collectgarbage("step", 64)

end

function EFFECT:Think()
	return CurTime() < self.DieTime
end

local matRefraction	= Material("refract_ring")
local matGlow = Material("effects/blueblackflash")
local colGlow = Color(255, 0, 0, 5)
local colorwhite = Color( 255, 255, 255, 255 )
function EFFECT:Render()
	local delta = math.Clamp((self.DieTime - CurTime()) / self.LifeTime, 0, 1)
	local rdelta =  delta
	local size = rdelta ^ 0.5 * self.Size
	local bgdelta = math.max( delta * 15, 0 )
	print( bgdelta )
	colGlow.a = delta * 100
	colGlow.r = 255 - delta * 255
	colGlow.g = bgdelta
	colGlow.b = bgdelta

	matRefraction:SetFloat("$refractamount", math.sin(delta * 2 * math.pi) * 0.2)
	render.SetMaterial(matGlow)
	render.UpdateRefractTexture()
	render.DrawQuadEasy(self.Pos, self.Normal, size, size, colGlow, 0)
	render.DrawQuadEasy(self.Pos, self.Normal * -1, size, size, colGlow, 0)
	render.DrawSprite(self.Pos, size, size, colGlow)

	size = size * 0.25

	matRefraction:SetFloat("matGlow", math.sin(delta * 2 * math.pi) * 0.2)
	render.SetMaterial(matGlow)
	render.UpdateRefractTexture()
	render.DrawQuadEasy(self.Pos, self.Normal, size, size, colGlow, 0)
	render.DrawQuadEasy(self.Pos, self.Normal * -1, size, size, colGlow, 0)
	render.DrawSprite(self.Pos, size, size, colGlow)
end
