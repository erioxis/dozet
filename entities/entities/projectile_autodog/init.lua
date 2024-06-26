INC_SERVER()

local vector_origin = vector_origin
ENT.NextThink1 = 0.3
function ENT:Initialize()
	self:SetModel("models/hunter/misc/sphere075x075.mdl")
	self:PhysicsInitSphere(20)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(1 * (self.Minidogs and 0.3 or self.UltraMinidogs and 0.1 or 1), 0)
	self:SetupGenericProjectile(false)
	self:SetColor((self.Minidogs and Color(95,47,7, 120) or Color(255,255,255, 120)))
	self:SetAlpha(60)
	self:EmitSound("weapons/physcannon/physcannon_pickup.wav", math.random(2,255), math.random(1,50))
	self:SetMaterial("phoenix_storms/plastic")

	self.DieTime = CurTime() + (self.Minidogs and 5 or 5)
	self.LastPhysicsUpdate = UnPredictedCurTime()
end


function ENT:Think()
	if self.Exploded then
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	elseif self.DieTime < CurTime() then
		self:Remove()
	end
	if CurTime() >= self.NextThink1 then 
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 2048)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) then
			if target:IsValidLivingZombie() then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()

				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(direction * 1500)
				--target:TakeSpecialDamage(self.ProjDamage + (target:GetZombieClassTable().Boss and target:Health() * 0.03 or target:Health() * 0.07),DMG_GENERIC ,self:GetOwner(), self:GetOwner():GetActiveWeapon())
				break
			end
		end
	end
		self.NextThink1 = CurTime() + 1
	end

end

function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
	util.Effect("explosion_bonemesh", effectdata)
	if not self.Mash then
		local ent = ents.Create("projectile_autodog")
	if ent:IsValid() then
		for i = 1, (self.Dogs or 1) do
			ent:SetPos(self:GetPos())
			ent:SetOwner(self:GetOwner())
			if self.Minidogs then
				ent.UltraMinidogs = true
				ent.Dogs = 5
			elseif not self.UltraMinidogs then
				ent.Mash = true
			end
			ent.ProjDamage = (self.Minidogs and self.ProjDamage * 0.5 or self.UltraMinidogs and self.ProjDamage * 0.1 or self.ProjDamage)
		end
	end
end
end
