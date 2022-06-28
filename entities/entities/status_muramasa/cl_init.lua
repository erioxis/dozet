INC_CLIENT()

ENT.NextEmit = 0.02

function ENT:Draw()
	local owner = self:GetOwner()



	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.07

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 84)

	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 82)
		particle:SetDieTime(math.Rand(1.1, 4))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(1)
		particle:SetEndSize(7)
		particle:SetGravity(Vector(0, math.random(-110,110), math.random(0,65)))
		particle:SetAirResistance(30)
		particle:SetStartLength(10)
		particle:SetEndLength(320)
		particle:SetColor(0, 0, 255)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
