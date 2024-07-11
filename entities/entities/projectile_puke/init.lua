INC_SERVER()

ENT.Damage = 11

function ENT:Initialize()
	self.DeathTime = CurTime() + (self.Sas and 8 or 1.2)

	self:DrawShadow(false)
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.1, 3)

end


function ENT:Think()
	if self.PhysicsData then
		self:Explode(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.DeathTime <= CurTime() then
		self:Remove()
	end
end

function ENT:Explode(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if eHitEntity:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", eHitEntity, owner) then
		local rot = eHitEntity:GetStatus("burn")
		eHitEntity:AddLegDamage(5)
		eHitEntity:AddLegDamageExt(2, owner, owner, SLOWTYPE_FLAME)
		eHitEntity:TakeSpecialDamage((self.ProjDamage or 3) / (eHitEntity:WaterLevel() == 0 and 1.5 or eHitEntity:WaterLevel()),DMG_BURN, owner, owner:GetActiveWeapon(), vHitPos)
		if (rot) then 
			eHitEntity:AddBurn(self:GetOwner(), rot.DieTime - CurTime() + 1)
		end
		if (not rot) then 
			eHitEntity:AddBurn(self:GetOwner(), 1)
		end
	end

end

function ENT:OnRemove()
	local effectdata = EffectData()
	effectdata:SetEntity(self:GetOwner())
		effectdata:SetOrigin(self:GetPos())
	util.Effect("hit_fire_small", effectdata)
end
function ENT:PhysicsCollide(data, phys)
	if not self:HitFence(data, phys) then
		self.PhysicsData = data
	end

	self:NextThink(CurTime())
end