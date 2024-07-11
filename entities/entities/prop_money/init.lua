INC_SERVER()

ENT.DieTime = 0

function ENT:Initialize()
	self.ObjHealth = 25
	self.NextUse = CurTime() + 0.1
	if self.DieTime == 0 then
		self.DieTime = CurTime() + GAMEMODE.GibLifeTime
	end


	self:SetModel("models/props_trainstation/trainstation_clock001.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetTrigger(true)
	self:SetModelScale(0.7)
	self:SetColor(Color(245, 227, 62))
	self:SetTime(CurTime() + 3)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:Wake()
		phys:ApplyForceCenter(VectorRand():GetNormalized() * math.Rand(2000, 5000))
		phys:AddAngleVelocity(VectorRand() * 360)
	end
end

function ENT:Think()
	if self.DieTime >= 0 and self.DieTime <= CurTime() then
		self:Remove()
	end
end
function ENT:Use(activator, caller)
	if (self:GetOwner() and self:GetOwner() == activator or !self:GetOwner() or !self:GetOwner():IsValid()) and self.NextUse < CurTime() then
		activator:AddPoints(self:GetHP())
		self:Remove()
	end
end


