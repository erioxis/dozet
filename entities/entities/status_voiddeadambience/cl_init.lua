INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.NextEmit = 0

function ENT:Initialize()
	self:DrawShadow(false)

	self.AmbientSound = CreateSound(self, "zombies/bully_loop.wav")
	self.AmbientSound:PlayEx(1.25, 25)
end

function ENT:OnRemove()
	self.AmbientSound:Stop()
end

function ENT:Think()
		local owner = self:GetOwner()
	if IsValid( owner ) then
		local wep = owner:GetActiveWeapon()
		if IsValid( wep ) and wep.IsSwinging and wep:IsSwinging() then
			self.AmbientSound:Stop()
		else
			self.AmbientSound:PlayEx(1.25, 25 + math.sin(RealTime()))
		end
	end

	self.AmbientSound:PlayEx(1.25, 25 + math.sin(RealTime() * 3) * 10)

end

function ENT:Draw()
	local owner = self:GetOwner()
	if not IsValid( owner ) or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner.SpawnProtection then return end
	local pos = owner:WorldSpaceCenter()
	local owner = self:GetOwner()
	local wep = owner:GetActiveWeapon()

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.05

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)

	local dir = (VectorRand() * 20 + Vector(0, 0, 40)):GetNormal()
	for i = 1, 11 do
		local particle = emitter:Add("effects/blood_core", pos + VectorRand() * 8 + Vector(0,0,9))
		if particle then
			particle:SetVelocity(dir * -40)
			particle:SetDieTime(math.Rand(0.9, 1.3))
			particle:SetStartAlpha( 215 )
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(3, 4))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-5, 5))
			particle:SetGravity(Vector(0, 0, 75))
			particle:SetCollide(true)
			particle:SetBounce(0.45)
			particle:SetAirResistance(12)
			particle:SetColor(54, 10, 48)
		end
	end

	for i = 1, 3 do
		local particle = emitter:Add("effects/blood_core", pos + VectorRand() * 22 + Vector(0,0,20))
		if particle then
			particle:SetVelocity(dir * 10)
			particle:SetDieTime(math.Rand(1.9, 2.4))
			particle:SetStartAlpha( 9 )
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(33, 45))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(0, 0))
			particle:SetGravity(Vector(0, 0, -45))
			particle:SetCollide(true)
			particle:SetBounce(0.95)
			particle:SetAirResistance(12)
			particle:SetColor(250, 20, 20)
		end
	end

	local particle = emitter:Add("sprites/flamelet" .. math.random(5), pos + VectorRand() * 12 + Vector(0,0,20))
	if particle then
		particle:SetVelocity(dir * 15)
		particle:SetDieTime(math.Rand(2.9, 3.4))
		particle:SetStartAlpha( 155 )
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(43, 65))
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-1, 1))
		particle:SetGravity(Vector(0, 0, 75))
		particle:SetCollide(true)
		particle:SetBounce(1.05)
		particle:SetAirResistance(12)
		particle:SetColor(15, 15, 15)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
