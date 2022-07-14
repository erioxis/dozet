INC_CLIENT()

ENT.NextEmit = 0

function ENT:Draw()
   if not MySelf:KeyDown(IN_SPEED) then return end
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end


	if owner.SpawnProtection then return end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.05

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(32, 24)

	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 62)
		particle:SetDieTime(math.Rand(1.1, 1.1))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(50)
		particle:SetEndSize(0)
		particle:SetGravity(Vector(math.random(-5,5), math.random(-5,5), math.random(-5,5)))
		particle:SetAirResistance(300)
		particle:SetStartLength(1)
		particle:SetEndLength(35)
		particle:SetColor(250, 250, 250)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
