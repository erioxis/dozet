INC_SERVER()

function ENT:Initialize()
	self:SetModel("models/props/cs_italy/orange.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetColor(Color(235, 178, 57))
	self:SetupGenericProjectile(false)

	self:Fire("kill", "", 0.45)
	self.LastPhysicsUpdate = UnPredictedCurTime()
end

local vecDown = Vector()
function ENT:PhysicsUpdate(phys)
	local dt = (UnPredictedCurTime() - self.LastPhysicsUpdate)
	self.LastPhysicsUpdate = UnPredictedCurTime()

	vecDown.z = dt * -75
	phys:AddVelocity(vecDown)
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.Exploded then
		self:Remove()
	end
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)
	if eHitEntity and eHitEntity:IsPlayer() then
		local cursed = eHitEntity:GetStatus("sticky")
		if (cursed) then 
			eHitEntity:GiveStatus("sticky",cursed.DieTime - CurTime() + 1.2)
		end
		if (not cursed) then 
			eHitEntity:GiveStatus("sticky",1.3)
		end
		if eHitEntity:IsValid() then
			eHitEntity:PoisonDamage(5, owner, self)
		end
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("hit_spit", effectdata)
end

function ENT:OnRemove()
	if not self.Exploded then
		local effectdata = EffectData()
			effectdata:SetOrigin(self:GetPos())
			effectdata:SetNormal(self:GetVelocity():GetNormalized())
		util.Effect("hit_spit", effectdata)
	end
end

function ENT:PhysicsCollide(data, phys)
	if not self:HitFence(data, phys) then
		self.PhysicsData = data
	end

	self:NextThink(CurTime())
end
