INC_SERVER()

local vector_origin = vector_origin
ENT.NextThink1 = 0.5
function ENT:Initialize()
	self:SetModel("models/hunter/misc/sphere075x075.mdl")
	self:PhysicsInitSphere(4.5)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.1, 0)
	self:SetupGenericProjectile(false)
	self:SetColor(Color(255,255,255, 120))
	self:SetAlpha(60)
	self:EmitSound("weapons/physcannon/physcannon_pickup.wav", math.random(2,255), math.random(1,50))
	self:SetMaterial("phoenix_storms/plastic")

	self.DieTime = CurTime() + (self.RageMode and 3 or 1.3)
	self.LastPhysicsUpdate = UnPredictedCurTime()
end
function ENT:PhysicsCollide(data, phys)
	if self.HitData then return end
	self.HitData = data
	self:NextThink(CurTime())
end


function ENT:Think()
	if self.Exploded and !self.RageMode  then
		self:Remove()
	elseif self.DieTime < CurTime() then
		self:Remove()
	end
	local owner = self:GetOwner()
	if CurTime() >= self.NextThink1 then 
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 256)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 10)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 10)))) and (target:IsValidLivingZombie() and not (target:GetZombieClassTable().CrowDa or target.SpawnProtection) or target.CanRicoChet) then
			if target:IsValidLivingZombie() or ent.AllowSelfRicoShot then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()
				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(direction * 1500)
				target:TakeSpecialDamage((self.ProjDamage * 0.5 * (self.RageMode and 0.5 or math.max(0.5,GAMEMODE:GetWave() / 12))),DMG_BULLET , owner, owner:GetActiveWeapon())
				break
			end
		end
		if ent.Coin then
			ent:TakeDamage(1500, self:GetOwner(), self)
		end
	end
		self.NextThink1 = CurTime() + 0.9
	end
	if self.HitData and not self.RageMode then
		self:Explode(self.HitData.HitPos, self.HitData.HitNormal)
		self:Remove()
	end

end

function ENT:Explode(hitpos, hitnormal)
	if self.Exploded then return end

	hitpos = hitpos or self:GetPos()
	hitnormal = hitnormal or self:GetForward()

	local owner = self:GetOwner()
	if owner:IsValidHuman() then
		local source = self:ProjectileDamageSource()
		local target = self.HitData.HitEntity

		if target:IsValidLivingZombie() and not target:GetZombieClassTable().NeverAlive then
			self.Exploded = true
			target:TakeSpecialDamage((self.ProjDamage * (self.RageMode and 0.5 or 1) or math.max(0.5,GAMEMODE:GetWave() / 6)), DMG_BULLET, owner, source, hitpos)
		end
	end

end
function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
	util.Effect("explosion_bonemesh", effectdata)
end
