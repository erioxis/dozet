INC_CLIENT()

ENT.NextEmit = 0
local beamcol, matBeam = Color(237, 140, 140), Material("effects/bloodstream")
function ENT:Draw()
	local owner = self:GetOwner()
	if CurTime() < self.NextEmit or MySelf ~= owner then return end
	self.NextEmit = CurTime() + 0.01

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)
	for i = 1, 5 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 12)
		if particle then
			particle:SetDieTime(1)
			particle:SetStartAlpha(230)
			particle:SetEndAlpha(0)
			particle:SetStartSize(3)
			particle:SetEndSize(0)
			particle:SetGravity(Vector(math.Rand(-5,5),math.Rand(-5,5),0))
			particle:SetAirResistance(-120)
			particle:SetStartLength(90)
			particle:SetEndLength(1)
			particle:SetColor(math.Rand(0,255), math.Rand(0,255), math.Rand(0,255))
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
