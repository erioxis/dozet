INC_CLIENT()



ENT.NextEmit = 0

function ENT:Draw()
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist then return end

	if owner.SpawnProtection then return end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.3

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(32, 24)

	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 72)
		particle:SetDieTime(math.Rand(1.1, 3))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(45)
		particle:SetEndSize(0)
		particle:SetGravity(Vector(0, 0, -10))
		particle:SetAirResistance(0)
		particle:SetStartLength(50)
		particle:SetEndLength(5)
		particle:SetColor(200, 5, 115)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
