INC_CLIENT()

ENT.NextEmit = 0

function ENT:Initialize()
	self:SetColor(Color(20, 20, 20, 125))
end

function ENT:Draw()
	self:DrawModel()

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.02

	local pos = self:GetPos()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)

 	for i=1, 2 do
		local particle = emitter:Add("particles/smokey", pos)
		if particle then
			particle:SetDieTime(math.Rand(0.8, 0.9))
			particle:SetStartAlpha(215)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(3, 5))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 255))
			particle:SetRollDelta(math.Rand(-10, 10))
			particle:SetVelocity((self:GetVelocity():GetNormalized() * -1 + VectorRand():GetNormalized()):GetNormalized() * math.Rand(16, 48))
			particle:SetLighting(true)
			particle:SetColor(145, 45, 95)
		end
	end

	for i = 1, 2 do
		particle = emitter:Add( "effects/splashwake1", pos + VectorRand() * 10 )
		if particle then
			particle:SetDieTime( math.Rand( 0.14, 0.11 ) )
			particle:SetStartAlpha( math.Rand( 230, 190 ) )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 7 )
			particle:SetEndSize( math.Rand( 1, 2 ) )
			particle:SetRoll( math.Rand( 0, 359 ) )
			particle:SetRollDelta( math.Rand( -3, 3 ) )
			particle:SetColor( 25, 20, 25 )
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
