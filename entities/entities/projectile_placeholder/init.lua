INC_SERVER()
ENT.KnockbackScale = 1
function ENT:Initialize()
	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_NONE)
	self:SetupGenericProjectile(false)
	self.trg = NULL
	timer.Simple(0, function() self:GetPhysicsObject():SetVelocity(Vector(0,0,0)) end)
	self.DieTime = CurTime() + 1
	--self.TimeToDash = CurTime() + 1
	--self:Fire("kill", "", 4.75)
end
function ENT:Think()
	if self.Exploded or self.DieTime < CurTime() then
		self:Remove()
	end
end

