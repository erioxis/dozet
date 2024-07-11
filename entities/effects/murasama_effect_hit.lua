EFFECT.LifeTime = 1

function EFFECT:Init(data)
	self:SetAngles(Angle(0, math.Rand(0, 360), 0))
	self:SetModel("models/props_phx/trains/monorail_curve.mdl")
	self:SetModelScale(0.1, 0)
	self:PhysicsInitBox(Vector(0,3,4), Vector(0,3,4))
	self:SetColor(Color(200, 0, 0))

	self.LifeTime = math.Rand(3, 5)
	self.DieTime = CurTime() + self.LifeTime

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:EnableGravity(false)
		phys:EnableDrag(true)
		phys:Wake()
		phys:SetDragCoefficient(200)
		phys:SetAngleDragCoefficient(9999999)
		phys:SetVelocityInstantaneous((data:GetNormal() + VectorRand()):GetNormalized() * math.Rand(140, 290))
	end
end

function EFFECT:Think()
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
		phys:AddVelocity(Vector(0, 0, 15 * FrameTime()))
	end

	return CurTime() < self.DieTime
end

