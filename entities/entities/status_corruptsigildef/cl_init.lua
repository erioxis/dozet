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

	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 17)
		particle:SetDieTime(math.Rand(1.1, 1.5))
		particle:SetStartAlpha(0)
		particle:SetEndAlpha(255)
		particle:SetStartSize(10)
		particle:SetEndSize(15)
		particle:SetGravity(Vector(0, 0, 75))
		particle:SetAirResistance(300)
		particle:SetStartLength(35)
		particle:SetEndLength(1)
		particle:SetColor(80, 250, 50)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
