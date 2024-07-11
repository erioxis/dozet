INC_SERVER()

ENT.LifeTime = 3

function ENT:Initialize()
	self:SetModel("models/Gibs/HGIBS.mdl")
	self:PhysicsInitSphere(10) --self:PhysicsInitSphere(13)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(2, 0) --self:SetModelScale(2.5, 0)
	self:SetupGenericProjectile(true)

	self:SetMaterial("models/flesh")

	self.DeathTime = CurTime() + 30
	self.ExplodeTime = CurTime() + self.LifeTime
end

function ENT:Think()
	if self.PhysicsData then
		self:Explode(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.DeathTime <= CurTime() then
		self:Remove()
	end

	self:NextThink(CurTime())
	return true
end

function ENT:Explode(hitpos, hitnormal, hitent)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	local effectdata = EffectData()
		effectdata:SetOrigin(hitpos)
	util.Effect("explosion_bonemesh", effectdata)

	util.Blood(hitpos, 30, hitnormal, 300, true)

	for i = 1, 4 do
		for _, pl in pairs(ents.FindInSphere(hitpos, 90)) do
			if pl:IsValidLivingZombie() and not pl:GetStatus("zombie_regen") then
				local zombieclasstbl = pl:GetZombieClassTable()
				local ehp = zombieclasstbl.Boss and pl:GetMaxHealth() * 0.4 or pl:GetMaxHealth() * 1.25
				if pl:Health() <= ehp then
					local status = pl:GiveStatus("zombie_regen")
					if status and status:IsValid() then
						status:SetHealLeft(75)
					end
					local chains = pl:GiveStatus("chains",10)
					if chains and chains:IsValid() and pl ~= owner then
						chains:SetDTEntity(11,owner)
					end
					break
				end
			end
		end
<<<<<<< Updated upstream
	end
=======
		for _, pl in pairs(ents.FindInSphere(hitpos, 48)) do
			if pl:GetClass() == "prop_ffemitter" then break end
			if pl:IsValidLivingHuman() then
				pl:TakeDamage(5, self:GetOwner(), self)
				pl:PoisonDamage(4, owner, self)
				
			end
		end
	end

>>>>>>> Stashed changes
end

function ENT:PhysicsCollide(data, physobj)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
