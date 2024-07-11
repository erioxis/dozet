INC_CLIENT()

function ENT:DrawTranslucent()
	local delta = math.max(0, self.DieTime - CurTime())
	local size = math.min(4, (0.25 + delta) * 0.45)
	local normal = -self:GetUp()

	local icea
	if size == 1 then
		icea = delta * -0.2
	else
		icea = -0.3
		self.Rotation = self.Rotation + FrameTime() * 6
	end
	self:SetAngles(Angle(180, self.Rotation, 0))
	self:SetModelScale(size*0.35, 0)

	if render.SupportsVertexShaders_2_0() then
		render.EnableClipping(true)
		render.PushCustomClipPlane(normal, normal:Dot(self:GetPos()))
	end

	self:DrawModel()
	render.SetBlend(1)

	if render.SupportsVertexShaders_2_0() then
		render.PopCustomClipPlane()
		render.EnableClipping(false)
	end
end

function ENT:Initialize()
	self:DrawShadow(true)
	self.DieTime = CurTime() + 1.65
	self.Rotation = math.Rand(0, 360)
	self:SetColor(Color(55, 15, 155, 255))
	self:SetMaterial("models/shadertest/envball_3")
	--ExplosiveEffect(self:GetPos(), 48, 100, DMGTYPE_ICE)


	self:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(160, 180))
	self:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(160, 180))

	local emitter = ParticleEmitter(self:GetPos())
	emitter:SetNearClip(40, 48)

	local ang = Angle(0,0,0)
	local up = Vector(0,0,1)
	local pos = self:GetPos() - (VectorRand() + VectorRand():GetNormalized() * 250)
	util.ScreenShake(pos, 5, 45, 0.75, 400)
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end