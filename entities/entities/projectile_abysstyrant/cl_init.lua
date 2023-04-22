INC_CLIENT()

ENT.NextEmit = 0

function ENT:Initialize()
	self:SetModelScale(1.1, 0)
	self:SetMaterial("models/props_wasteland/rockcliff04a")
end

function ENT:Draw()
	self:DrawModel()

	if CurTime() >= self.NextEmit and self:GetVelocity():LengthSqr() >= 256 then
		self.NextEmit = CurTime() + 0.005

		local emitter = ParticleEmitter(self:GetPos())
		emitter:SetNearClip(16, 24)

		local particle = emitter:Add("!sprite_bloodspray"..math.random(8), self:GetPos())
		if particle then
			particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(8, 16))
			particle:SetDieTime(0.6)
			particle:SetStartAlpha(230)
			particle:SetEndAlpha(230)
			particle:SetStartSize(0)
			particle:SetEndSize(10)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-25, 25))
			particle:SetColor(5, 0, 255)
			particle:SetLighting(true)
		end

		emitter:Finish() emitter = nil collectgarbage("step", 64)
	end
end
