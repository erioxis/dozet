INC_SERVER()

function ENT:Initialize()
	self.DieTime = CurTime() + 4

	self:SetModel("models/weapons/w_knife_t.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetupGenericProjectile(false)
	self:SetAngles(self:GetOwner():GetAngles() - Angle(360,0,180))
	self.HitTime = CurTime()
	self.Knifed = 1
	self.MaxPierce = 1
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
		phys:SetMass(4)
		phys:SetMaterial("metal")
	end
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity, self.PhysicsData.OurOldVelocity)
	end
	if self.DieTime <= CurTime() then
		self:Remove()
	end
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity, vOldVelocity)
	if self.Knifed > self.MaxPierce or self.HitTime >= CurTime() then return end
	if eHitEntity and eHitEntity:IsValidLivingZombie() then
		eHitEntity:TakeSpecialDamage(self.Damage or 120,DMG_ALWAYSGIB, self:GetOwner(), self, nil,0)
		self.HitTime = CurTime() + 3
		self.Knifed = self.Knifed + 1
	end
end
function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end