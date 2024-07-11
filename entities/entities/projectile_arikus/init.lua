INC_SERVER()

local vector_origin = vector_origin
ENT.NextThink1 = 0.3
function ENT:Initialize()
	self:SetModel("models/Gibs/HGIBS.mdl")
	self:PhysicsInitSphere(3)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:SetModelScale(1, 0)
	self:SetupGenericProjectile(false)
	self:SetColor(Color(3,240,255))
	self:SetAlpha(60)

	self.DieTime = CurTime() + 2
	self.LastPhysicsUpdate = UnPredictedCurTime()
end


function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end
	if self.Exploded then
		self:Remove()
	elseif self.DieTime < CurTime() then
		self:Remove()
	end
	local trg = self.Target
	if trg and trg:IsValid() then
		local targetpos = trg:LocalToWorld(trg:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		

		self:SetAngles(direction:Angle())

		local phys = self:GetPhysicsObject()
		phys:SetVelocityInstantaneous(direction * 440)
		--trg:TakeSpecialDamage(self.ProjDamage*0.05,DMG_GENERIC ,self:GetOwner(), self)
	end

end
function ENT:Hit(vHitPos, vHitNormal, ent)
	if self.Exploded then return end

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end
	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if ent:IsValid() then
		if ent:IsValidLivingZombie() then
			self.Exploded = true
			ent:TakeSpecialDamage(self.ProjDamage,DMG_GENERIC ,self:GetOwner(), self)
		end
	end
end
function ENT:OnRemove()
end
function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end