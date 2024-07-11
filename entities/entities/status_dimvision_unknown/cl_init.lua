INC_CLIENT()
ENT.ParticleMaterial = "sprites/glow04_noz"

function ENT:Think()

	local owner = self:GetOwner()
	if owner ~= LocalPlayer() or GAMEMODE.SnowShow then return end

	local ownerpos = owner:GetPos()
	
	local startpos = VectorRand(-1800,1800)
	startpos.z = startpos.z < 0 and 0 or startpos.z
	startpos = startpos + ownerpos
	local emitter = ParticleEmitter(startpos)
	emitter:SetNearClip(24, 32)
	
	for i=1,132 do
		local startpos = VectorRand(-1800,1800)
		startpos.z = startpos.z < 0 and 0 or startpos.z
		startpos = startpos + ownerpos
		local particle = emitter:Add(self.ParticleMaterial, startpos)
		particle:SetDieTime(math.Rand(1.5, 5))
		particle:SetVelocity(Vector(0,900*math.Rand(0.7,1.3),30))
		particle:SetStartAlpha(100)
		particle:SetEndAlpha(255)
		particle:SetStartSize(math.Rand(6,12))
		particle:SetEndSize(1)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-2, 2))
	end
	


	emitter:Finish() emitter = nil collectgarbage("step", 64)

	self:NextThink(CurTime())
	return true
end

function ENT:SetParticleColor(particle)
	particle:SetColor(38, 102, 255)
end