INC_SERVER()

local vector_origin = vector_origin
ENT.NextHook = 1
function ENT:Initialize()
	self:SetModel("models/gibs/HGIBS_rib.mdl")
	self:PhysicsInitSphere(13)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(2.2, 0)
	self:SetupGenericProjectile(false)

	self.DieTime = CurTime() + 10
	self.LastPhysicsUpdate = UnPredictedCurTime()
end

function ENT:PhysicsUpdate(phys)
	if not self.InitVelocity then self.InitVelocity = self:GetVelocity() end

	local dt = (UnPredictedCurTime() - self.LastPhysicsUpdate)
	self.LastPhysicsUpdate = UnPredictedCurTime()

	phys:AddVelocity(self.InitVelocity * dt * -0.3)
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.Exploded then
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	elseif self.DieTime < CurTime() then
		self:Remove()
	end
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 2048)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) and self.NextHook <= CurTime() and GAMEMODE:GetWave() >= 4 then
			if target:IsValidLivingHuman() then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()

				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(((direction * 1390) * ent:GetModelScale()) + phys:GetVelocity() * 5)
				self.NextHook = CurTime() + 0.04
				break
			end
		end
	end
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 2048)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) and self.NextHook <= CurTime() and GAMEMODE:GetWave() >= 4 then
			if target:IsValidLivingHuman() then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()

				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(((direction * 1390) * ent:GetModelScale()) + phys:GetVelocity() * 5)
				self.NextHook = CurTime() + 0.04
				break
			end
		end
	end
end

function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
	util.Effect("explosion_bonemesh", effectdata)
end

function ENT:Hit(vHitPos, vHitNormal, ent)
	if self.Exploded then return end

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if ent:IsValid() then
		if (ent.BeingControlled or ent:IsValidLivingHuman()) and owner:IsPlayer() then
			if ent:IsValidLivingHuman() then
				self.Exploded = true


				ent:TakeSpecialDamage((math.random(12) == 12 and 69 or 23), DMG_DIRECT, owner, self)
				ent:KnockDown()
				ent:SetVelocity(Vector(0,0,350))

				local status = ent:GiveStatus("devourer")
				if status and status:IsValid() then
					status:SetDamage(ent:HasTrinket("analgestic") and 5 or 15)
					status:SetPuller(owner)
					self:SetParent(status)
				end

				self:GetPhysicsObject():SetVelocityInstantaneous(vector_origin)
			else
				local vel = owner:GetAimVector() * -2000
				ent:GetPhysicsObject():SetVelocity(vel)
			end
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
