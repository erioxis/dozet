INC_SERVER()

ENT.LifeTime = 3

function ENT:Initialize()
	self:SetModel("models/combine_helicopter/helicopter_bomb01.mdl")
	self:SetColor(Color(255, 255, 0))
	self:PhysicsInitSphere(3)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.2, 0)
	self:DrawShadow(false)
	self:SetupGenericProjectile(true)

	self.Bounces = 0
	self.ExplodeTime = CurTime() + self.LifeTime
	self.Grace = CurTime() + 0.1
end

function ENT:Think()
	if self.ExplodeTime <= CurTime() then
		self:Explode(self:GetPos())
	end
	if self.PhysicsData then
		if self.Bounces <= 0 or self.PhysicsData.HitEntity:IsPlayer() or self.PhysicsData.HitEntity.ZombieConstruction then
			self:Explode(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
		end
		local phys = self.PhysicsData.PhysObject
		if phys:IsValid() then
			local hitnormal = self.PhysicsData.HitNormal
			local vel = self.PhysicsData.OurOldVelocity
			local normal = vel:GetNormalized()
			phys:SetVelocityInstantaneous((2 * hitnormal * hitnormal:Dot(normal * -1) + normal) * vel:Length() * 0.8)
		end
		if CurTime() >= self.Grace then
			self.Bounces = self.Bounces -2
		end
		self.PhysicsData = nil
	end

	self:NextThink(CurTime())
	return true
end

function ENT:Explode(hitpos, hitnormal, hitent)
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	local mul = 1
	local mul2 = 1
	if self:GetOwner():HasTrinket("ultra_mag") then
		mul = 0.2
		mul2 = 0.6
	end
	if owner:IsValidLivingHuman() then
		local source = self:ProjectileDamageSource()
		for _, pl in pairs(ents.FindInSphere(hitpos, 138)) do
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), pl:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) then
				if pl:IsValidLivingZombie() or pl == owner then
					pl:TakeSpecialDamage(((self.ProjDamage or 99) * mul2) * (pl == owner and 0.09 or 1), DMG_ACID,self:GetOwner(), self:GetOwner():GetActiveWeapon(), nil, 0)
					pl:PoisonDamage(4, owner, self)
					pl:SetVelocity(Vector(0,0,0))
				end
			end
		end
	end

	self:EmitSound(")weapons/explode5.wav", 80, 130)
	self:Remove()
end

function ENT:PhysicsCollide(data, physobj)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
