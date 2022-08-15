INC_SERVER()

local vector_origin = vector_origin
ENT.NextThink1 = 0.1
function ENT:Initialize()
	self:SetModel("models/hunter/misc/sphere075x075.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.1, 0)
	self:SetupGenericProjectile(false)
	self:SetColor(Color(255,255,255, 120))
	self:SetAlpha(60)
	self:EmitSound("weapons/physcannon/physcannon_pickup.wav", math.random(2,255), math.random(1,50))
	self:SetMaterial("phoenix_storms/plastic")

	self.DieTime = CurTime() + (self.RageMode and 11 or 1.5)
	self.LastPhysicsUpdate = UnPredictedCurTime()
end
function ENT:PhysicsCollide(data, phys)
	if self.HitData then return end
	if self.HitData then return end
	self.HitData = data
	self:NextThink(CurTime())
end


function ENT:Think()
	if self.Exploded then
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	elseif self.DieTime < CurTime() then
		self:Remove()
	end
	local owner = self:GetOwner()
	if CurTime() >= self.NextThink1 then 
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 4048)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 10)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 10)))) and target:IsValidLivingZombie() and not target:GetZombieClassTable().NeverAlive then
			if target:IsValidLivingZombie() or ent.AllowSelfRicoShot then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()

				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(direction * 3500)
				target:TakeSpecialDamage(self.ProjDamage * (self.RageMode and (2) or math.max(1,GAMEMODE:GetWave() / 3)),DMG_ALWAYSGIB , owner, owner:GetActiveWeapon())
				break
			end
		end
		if ent.AllowSelfRicoShot then
			ent:TakeDamage(1500, self:GetOwner(), self)
		end
	end
		self.NextThink1 = CurTime() + 1.2
	end
	if self.HitData and not self.RageMode then
		self:Explode(self.HitData.HitPos, self.HitData.HitNormal)
		self:Remove()
	end

end

function ENT:Explode(hitpos, hitnormal)
	if self.Exploded then return end
	self.Exploded = true

	hitpos = hitpos or self:GetPos()
	hitnormal = hitnormal or self:GetForward()

	local owner = self:GetOwner()
	if owner:IsValidHuman() then
		local source = self:ProjectileDamageSource()
		local target = self.HitData.HitEntity

		if target:IsValidLivingZombie() and not target:GetZombieClassTable().NeverAlive then
			target:TakeSpecialDamage(self.ProjDamage * (self.RageMode and 2 or 1) or math.max(1,GAMEMODE:GetWave() / 4), DMG_ALWAYSGIB, owner, source, hitpos)
		end
	end

end
function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
	util.Effect("explosion_bonemesh", effectdata)
end
