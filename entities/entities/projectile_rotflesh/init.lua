INC_SERVER()

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if eHitEntity:IsValidLivingPlayer() then
		eHitEntity:GiveStatus("frost", 5)
		if math.random(1,4) == 4 then
			local rot = eHitEntity:GetStatus("rot")
			if (rot) then 
				eHitEntity:GiveStatus("rot", rot.DieTime - CurTime() + 1)
				if rot and rot:IsValid() then
					rot:AddDamage(5, owner)
				end
			end
			if (not rot) then 
				eHitEntity:GiveStatus("rot", 1)
				if rot and rot:IsValid() then
					rot:AddDamage(5, owner)
				end
			end
		end
		eHitEntity:AddArmDamage(11)
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("hit_frost", effectdata)
end
