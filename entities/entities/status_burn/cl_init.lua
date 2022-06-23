INC_CLIENT()

ENT.NextEmit = 0.1

function ENT:Draw()
	local owner = self:GetOwner()



	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.25

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)

	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 32)
		particle:SetDieTime(math.Rand(1.1, 8))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(1)
		particle:SetEndSize(3)
		particle:SetGravity(Vector(0, 0, 15))
		particle:SetAirResistance(30)
		particle:SetStartLength(1)
		particle:SetEndLength(120)
		particle:SetColor(255, 120, 10)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
