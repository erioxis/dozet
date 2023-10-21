INC_SERVER()

local vector_origin = vector_origin
ENT.NextHook = 0.6
function ENT:Initialize()
	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(1, 0)
	self:SetupGenericProjectile(false)
	self.trg = NULL
	self:SetColor(Color(9,30,30))
	self.Bounces = 0
	util.SpriteTrail(self, 0, Color(9,30,30), true, 4, 4, 32, 2, "cable/rope")

	self.DieTime = CurTime() + 11
	self.LastPhysicsUpdate = UnPredictedCurTime()
end

function ENT:PhysicsUpdate(phys)
	if not self.InitVelocity then self.InitVelocity = self:GetVelocity() end

	local dt = (UnPredictedCurTime() - self.LastPhysicsUpdate)
	self.LastPhysicsUpdate = UnPredictedCurTime()

end
function compare(a,b)
	return a.Health > b.Health
  end
function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.Exploded then
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	elseif self.DieTime < CurTime() then
		self:SetPos(self:GetOwner():GetPos())
		self.DieTime = 2222222 + CurTime()
		timer.Simple(0.3,function()
			self:Remove()
		end)
	end
	if !self.trg:IsValid() then
		local targets = {}
		for _, ent in pairs(ents.FindInSphere(self:GetPos(), 1548)) do
			if !ent:IsValid() then continue end
			target = ent
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30))))  then
				if target:IsValidLivingZombie() and target ~= self:GetOwner() then 
					targets[(#targets or 0) + 1] = {Health = ent:Health(), trg = target}
				end
			end
		end
		table.sort(targets, compare)
		for k, target1 in pairs(targets) do
			target = target1.trg
			--print( target1.Health)
			if target and target:IsValidLivingZombie() then
				self.trg = target
				break
			end
		end
	else
		local target = self.trg
		self.Bounces = self.Bounces + 1
		local targetpos = target:LocalToWorld(target:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		local phys = self:GetPhysicsObject()
		local unbounce = self.Bounces < 12
		phys:SetVelocityInstantaneous(direction * 30*(unbounce and 1 or 50) + (unbounce and VectorRand():GetNormal()*150 or Vector(0,0,0)) * math.Rand(1,2))
		self.trg = NULL
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
		if (ent.BeingControlled or ent:IsValidLivingZombie()) and owner:IsPlayer() then
			if ent:IsValidLivingZombie() then
				self.Exploded = true


				ent:TakeSpecialDamage(self.ProjDamage*5*(owner.ProjectileDamageMul or 1), DMG_DIRECT, owner, self)
				self:Remove()

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
