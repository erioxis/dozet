INC_SERVER()

function ENT:Initialize()
	self.DeathTime = CurTime() + 30

	self:SetModel("models/Roller.mdl")
	self:SetMaterial("models/flesh")
	self:SetColor(Color(0, 230, 0, 255))

	self:PhysicsInitSphere(10)
	self:SetSolid(SOLID_VPHYSICS)

	self:SetupGenericProjectile(false)

	self.LastPhysicsUpdate = UnPredictedCurTime()
end

local vecDown = Vector()
function ENT:PhysicsUpdate(phys)
	local dt = UnPredictedCurTime() - self.LastPhysicsUpdate
	self.LastPhysicsUpdate = UnPredictedCurTime()

	vecDown.z = dt * -100
	phys:AddVelocity(vecDown)
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.DeathTime <= CurTime() then
		self:Remove()
	end
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("explosion_doomball", effectdata)

	-- Massive damage to drones and manhacks.
	if eHitEntity and eHitEntity:IsValid() then
		eHitEntity:TakeDamage(eHitEntity.BeingControlled and 200 or 25, owner, self)

		if eHitEntity:GetClass() == "prop_manhack" or eHitEntity:GetClass() == "prop_manhack_saw" then
			eHitEntity:TakeDamage(760,owner,self)
		end

		if eHitEntity.FizzleStatusAOE then return end
	end

	for _, ent in pairs(util.BlastAlloc(self, owner, vHitPos, 128)) do
		if ent:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", ent, owner) and ent ~= owner then
			ent:GiveStatus("dimvision", 10,  owner)
			local gt = ent:GiveStatus("enfeeble", 5, owner)
			ent:GiveStatus("slow", 5,owner)
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
