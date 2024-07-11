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
		local hitent = eHitEntity
		if hitent:IsValid() and not hitent:IsPlayer() or (hitent:IsPlayer() and hitent:Team() ~= TEAM_UNDEAD) then
			hitent.TakedIce = (hitent.TakedIce or 0) + 2
	
			if hitent.FizzleStatusAOE then return end
		end
	
		for _, ent in pairs(util.BlastAlloc(self, owner, vHitPos, 60)) do
			if ent:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", ent, owner) and ent ~= owner then
				local nearest = ent:NearestPoint(vHitPos)
				local scalar = ((60 - nearest:Distance(vHitPos)) / 60)
	
				ent.TakedIce = (ent.TakedIce or 0) + 2 * scalar
				if (ent.TakedIce or 1) >= 90 then
					ent.TakedIce = 0
					timer.Create("IceShadeInductor"..ent:Name(),0.5, 3, function() 
						ent:SetBloodArmor(ent:GetBloodArmor() * 0.9)
						ent:SetHealth(ent:Health() * 0.9)
						local effectdata = EffectData()
							effectdata:SetOrigin(ent:GetPos())
							effectdata:SetNormal(vHitNormal)
						util.Effect("hit_ice", effectdata)
						ent:TakeDamage(ent:Health() * 0.15, owner, owner:GetActiveWeapon())
						for _, ent2 in pairs(util.BlastAlloc(self, owner, ent:GetPos(), 110)) do
							if ent2:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", ent2, owner) and ent2 ~= owner and ent2 ~= ent then
								local nearest = ent2:NearestPoint(vHitPos)
								local scalar = ((110 - nearest:Distance(vHitPos)) / 110)
					
								ent2:GiveStatus("frost", scalar * 7)
								ent2:AddLegDamageExt(18 * scalar, owner, self, SLOWTYPE_COLD)
								ent2:TakeDamage(44 * scalar, owner, owner:GetActiveWeapon())
								ent2.TakedIce = (ent.TakedIce or 0) + 2 * scalar
							end
						end
					end)
				end
			end
		end
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("hit_frost", effectdata)
end
