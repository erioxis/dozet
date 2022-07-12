INC_SERVER()

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if eHitEntity:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", eHitEntity, owner) then
		eHitEntity:GiveStatus("frost", 5)
		local rot = eHitEntity:GetStatus("rot")
		if (rot) then 
			eHitEntity:AddRot(self:GetOwner(), rot.DieTime - CurTime() + 1)
		end
		if (not rot) then 
			eHitEntity:AddRot(eHitEntity:GetOwner(), 1)
		end
		eHitEntity:AddArmDamage(11)
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("hit_frost", effectdata)
end
