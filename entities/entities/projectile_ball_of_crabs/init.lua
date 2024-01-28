INC_SERVER()

function ENT:Initialize()
	self.DeathTime = CurTime() + 30

	self:SetModel("models/Roller.mdl")
	self:SetMaterial("models/flesh")
	self:SetColor(Color(241, 213, 0))

	self:PhysicsInitSphere(10)
	self:SetSolid(SOLID_VPHYSICS)

	self:SetupGenericProjectile(false)

	self.LastPhysicsUpdate = UnPredictedCurTime()
end

local vecDown = Vector()
function ENT:PhysicsUpdate(phys)
	local dt = UnPredictedCurTime() - self.LastPhysicsUpdate
	self.LastPhysicsUpdate = UnPredictedCurTime()

	vecDown.z = dt * -100
	phys:AddVelocity(vecDown)
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.DeathTime <= CurTime() then
		self:Remove()
	end
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("explosion_doomball", effectdata)

	for i=1,15 do
		local ent = ents.Create('prop_glitch_crab')
		if ent:IsValid() then
			ent:SetPos(vHitPos)
			ent:SetOwner(owner)
			ent:Spawn()
			ent.CreatedByCrab = CurTime() + 2
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
