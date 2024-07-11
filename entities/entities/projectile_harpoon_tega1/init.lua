INC_SERVER()

local vector_origin = vector_origin

ENT.NextDamage = 0
ENT.TicksLeft = 25

function ENT:Initialize()
	self:SetModel("models/props_c17/truss03a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetupGenericProjectile(false)
	self:SetModelScale(0.3)

	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(126, 45))

	self:Fire("kill", "", 120)
	self.DieTime = CurTime() + 3
	self.LastPhysicsUpdate = UnPredictedCurTime()
end

function ENT:PhysicsUpdate(phys)
	if not self.InitVelocity then self.InitVelocity = self:GetVelocity() end

	local dt = (UnPredictedCurTime() - self.LastPhysicsUpdate)
	self.LastPhysicsUpdate = UnPredictedCurTime()

	phys:AddVelocity(self.InitVelocity * dt * 10)
end

function ENT:OnRemove()
	local owner = self:GetOwner()
	if owner:IsValidLivingHuman() then
		owner:Give(self.BaseWeapon)
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
	util.Effect("explosion", effectdata)
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.OurOldVelocity, self.PhysicsData.HitEntity)
	end

	local parent = self:GetParent()
	if parent:IsValid() and parent:IsPlayer() then
		if parent:IsValidLivingZombie() and not parent.SpawnProtection then
			if CurTime() >= self.NextDamage then
				self.NextDamage = CurTime() + 3

				util.Blood((parent:NearestPoint(self:GetPos()) + parent:WorldSpaceCenter()) / 2, math.random(4, 9), Vector(0, 0, 1), 100)
				parent:TakeSpecialDamage((self.ProjDamage or 55) * 1.2, DMG_SLASH, self:GetOwner(), self)
			end
		else
			self:Remove()
		end
	end

	if self.Exploded and not self.ColChange then
		self.ColChange = true	
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	end

	if self.DieTime < CurTime() then
		self:Remove()
	end

	self:NextThink(CurTime())
	return true
end

function ENT:Hit(vHitPos, vHitNormal, vel, hitent)
	if self.Exploded then return end

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	if hitent and hitent:IsValid() and hitent:IsPlayer() then
		hitent:AddLegDamage(17)

		self.Exploded = true

		hitent:TakeSpecialDamage(self.ProjDamage or 24, DMG_GENERIC, owner, self, self:GetPos())
		hitent:EmitSound("npc/strider/strider_skewer1.wav", 255, 1000)

		self.DieTime = CurTime() + 2

		self:GetPhysicsObject():SetVelocityInstantaneous(vector_origin)
		self:SetParent(hitent)
	end
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
