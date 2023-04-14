INC_SERVER()

local vector_origin = vector_origin
ENT.NextThink1 = 0.3
function ENT:Initialize()
	self:SetModel("models/hunter/misc/sphere075x075.mdl")
	self:PhysicsInitSphere(20)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(1 * (self.Minidogs and 0.3 or 1), 0)
	self:SetupGenericProjectile(false)
	self:SetColor((self.Minidogs and Color(95,47,7, 120) or Color(255,255,255, 120)))
	self:SetAlpha(60)
	self:EmitSound("weapons/physcannon/physcannon_pickup.wav", math.random(2,255), math.random(1,50))
	self:SetMaterial("phoenix_storms/plastic")
	--self:GetOwner():TakeDamage(2)
	--self:GetOwner():AddPoints(-1)

	self.DieTime = CurTime() + (self.Minidogs and 3 or 6)
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
	if CurTime() >= self.NextThink1 then 
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 308)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) then
			if target:IsValidLivingZombie() and target:Health() >= 500 and !target:GetZombieClassTable().Boss and !target:GetZombieClassTable().BaraCat then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()

				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(direction * 1500)
				--target:TakeSpecialDamage(self.ProjDamage*0.2 + (target:GetZombieClassTable().Boss and target:Health() * 0.03 or target:Health() * 0.07),DMG_GENERIC ,self:GetOwner(), self:GetOwner():GetActiveWeapon())
				break
			end
		end
	end
		self.NextThink1 = CurTime() + 1
	end

end
function ENT:Hit(vHitPos, vHitNormal, ent)
	if self.Exploded then return end

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end
	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if ent:IsValid() then
		if owner:IsPlayer() then
			if ent:IsValidLivingZombie() then
				self.Exploded = true
				ent:TakeSpecialDamage(self.ProjDamage+ (ent:GetZombieClassTable().Boss and ent:Health() * 0.03 or ent:Health() * 0.07),DMG_GENERIC ,self:GetOwner(), self:GetOwner():GetActiveWeapon())
			end
		end
	end
	for _, d in pairs(ents.FindInSphere(self:GetPos(), 70)) do
		target = d
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), d:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) then
			if target == self:GetOwner() then
				target:TakeSpecialDamage(self.ProjDamage*0.2,DMG_GENERIC ,self:GetOwner(), self:GetOwner():GetActiveWeapon())
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
function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end