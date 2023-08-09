INC_SERVER()

function ENT:Initialize()
	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(15)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetupGenericProjectile(false)
	self:SetModelScale(5)

	self.DieTime = CurTime() + 2
	self:GetOwner():EmitSound(Sound("zombiesurvival/sp_keepthemcoming.wav"))
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end
	if self.DieTime - CurTime() < 2 then
		self:GetPhysicsObject():SetVelocityInstantaneous(Vector(0,0,0))
		if self.DieTime <= CurTime() then
			self:Explode()
		end
	end
	if self.Exploded then
		self:Remove()
	end
end
function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end
	local dmg = dmginfo:GetDamage()
	local attacker = dmginfo:GetAttacker()
	local wep = dmginfo:GetInflictor()
	if wep.IsMelee then
		attacker:SetHealth(attacker:GetMaxHealth() + 20)
		self:GetOwner():TakeSpecialDamage(150 + (wep.Unarmed and 200), DMG_DIRECT, attacker, wep)
	else
		self:Remove()
	end
end
function ENT:OnRemove()
	self:Hit(self:GetPos(), Vector(0, 0, 1), NULL)
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)
	if owner:IsValid() then
		util.BlastDamagePlayer(self, owner, vHitPos + vHitNormal, 60, 40, DMG_DIRECT)
		if eHitEntity:IsPlayer() and owner:IsValidLivingZombie() then
			eHitEntity:AddLegDamage(53, owner,self)
		end
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("explosion_wispball", effectdata)
end
function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true
	local 	vHitPos = vHitPos or self:GetPos()
	local vHitNormal = vHitNormal or Vector(0, 0, 1)
	local owner = self:GetOwner()
	if owner:IsValid() then
		util.BlastDamagePlayer(self, owner, vHitPos + vHitNormal, 100, 50, DMG_DIRECT)
	end
	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("explosion_wispball", effectdata)
	self:Remove()
end

function ENT:PhysicsCollide(data, phys)
	if not self:HitFence(data, phys) then
		self.PhysicsData = data
	end

	self:NextThink(CurTime())
end
