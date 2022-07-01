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
	emitter:SetNearClip(32, 24)

	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 122)
		particle:SetDieTime(math.Rand(1.1, 5))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(50)
		particle:SetEndSize(0)
		particle:SetGravity(Vector(math.random(-35,5), math.random(-15,5), math.random(-10,5)))
		particle:SetAirResistance(300)
		particle:SetStartLength(1)
		particle:SetEndLength(35)
		particle:SetColor(255, 255, 255)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
