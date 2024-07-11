INC_CLIENT()

ENT.NextEmit = 0.1

function ENT:Draw()
	local dmger = self.Damager
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist then return end

	if owner.SpawnProtection then return end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.35

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 55)

	for i = 1, 9 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 32)
		particle:SetDieTime(math.Rand(1.1, 5))
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(9 + i)
		particle:SetEndSize(12 + i)
		particle:SetGravity(Vector(0,0 + i * i, -120 * i))
		particle:SetAirResistance(30)
		particle:SetStartLength(35)
		particle:SetEndLength(15)
		particle:SetColor(125, 20, 255)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
