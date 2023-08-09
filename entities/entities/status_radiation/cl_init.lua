INC_CLIENT()

ENT.NextEmit = 0.3

function ENT:Draw()
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist then return end

	if owner.SpawnProtection then return end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.1

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)

	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 32)
		particle:SetDieTime(math.Rand(1.1, 5))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(1)
		particle:SetEndSize(2)
		particle:SetGravity(Vector(0, 0, 222))
		particle:SetAirResistance(1000)
		particle:SetStartLength(1)
		particle:SetEndLength(55)
		particle:SetColor(5, 120, 0)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
