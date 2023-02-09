INC_SERVER()

local vector_origin = vector_origin
ENT.NextHook = 1
function ENT:Initialize()
	self:SetModel("models/gibs/HGIBS_rib.mdl")
	self:PhysicsInitSphere(13)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(2.2, 0)
	self:SetupGenericProjectile(false)
	self.trg = NULL

	self.DieTime = CurTime() + 10
	self.LastPhysicsUpdate = UnPredictedCurTime()
end

function ENT:PhysicsUpdate(phys)
	if not self.InitVelocity then self.InitVelocity = self:GetVelocity() end

	local dt = (UnPredictedCurTime() - self.LastPhysicsUpdate)
	self.LastPhysicsUpdate = UnPredictedCurTime()

	phys:AddVelocity(self.InitVelocity * dt * -0.3)
end
function compare(a,b)
	return a.Health < b.Health
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
	if !self.trg:IsValid() then
		local targets = {}
		for _, ent in pairs(ents.FindInSphere(self:GetPos(), 1048)) do
			if !ent:IsValid() then continue end
			target = ent
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30))))  then
				if target:IsValidLivingHuman() then 
					targets[(#targets or 0) + 1] = {Health = (ent:Health() + (ent:GetBloodArmor() or 1)/2) * (ent:HasTrinket("antidevo") and 2.5 or 1), trg = target}
				end
			end
		end
		table.sort(targets, compare)
		for k, target1 in pairs(targets) do
			target = target1.trg
			--print( target1.Health)
			if target and target:IsValidLivingHuman() and !target:IsSkillActive(SKILL_ANTI_DEVO) or !self:GetOwner().Zmainer and self.NextHook <= CurTime() then
				self.trg = target
				break
			end
		end
	else
		local target = self.trg
		local targetpos = target:LocalToWorld(target:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		self:SetAngles(direction:Angle())
		local phys = self:GetPhysicsObject()
		phys:SetVelocityInstantaneous(direction * 2000 + target:GetVelocity())
		self.NextHook = CurTime() + 0.11
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


				ent:TakeSpecialDamage((math.random(12) == 12 and 69 or 23), DMG_GENERIC, owner, self)
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
