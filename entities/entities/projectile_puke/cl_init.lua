INC_CLIENT()

ENT.NextEmit = 0

function ENT:Initialize()
	self:DrawShadow(false)

	self.Size = math.Rand(10, 14)
end

local colFlesh = Color(255, 255, 255, 255)
local matFlesh = Material("effects/fire_cloud2")
function ENT:Draw()
	local size = self.Size

	render.SetMaterial(matFlesh)
	local pos = self:GetPos()
	render.DrawSprite(pos, size, size, colFlesh)

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.05

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(36, 44)

	local particle = emitter:Add("effects/fire_embers"..math.random(1,3), pos + VectorRand():GetNormalized() * math.Rand(1, 4))
	particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(1, 4))
	particle:SetDieTime(math.Rand(0.6, 0.9))
	particle:SetStartAlpha(255)
	particle:SetEndAlpha(255)
	particle:SetStartSize((size * math.Rand(0.1, 0.42)) * self:GetModelScale())
	particle:SetEndSize(0)
	particle:SetRoll(math.Rand(0, 360))
	particle:SetRollDelta(math.Rand(-4, 4))
	particle:SetLighting(true)
	particle:SetColor(Color(245, 78, 49))

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
