INC_CLIENT()

ENT.NextEmit = 0

function ENT:Draw()
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist then return end

	if owner.SpawnProtection then return end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.5

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)

	for i = 1, 4 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 12)
		if particle then
			particle:SetDieTime(1)
			particle:SetStartAlpha(230)
			particle:SetEndAlpha(0)
			particle:SetStartSize(2)
			particle:SetEndSize(0)
			particle:SetGravity(Vector(0, 0, 75))
			particle:SetAirResistance(300)
			particle:SetStartLength(5)
			particle:SetEndLength(25)
			particle:SetColor(215, 215, 255)
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
