INC_SERVER()
function SWEP:FindZapperTarget(pos, owner)
	local target
	local targethealth = 99999
	local isheadcrab

	for k, ent in pairs(ents.FindInSphere(pos, 75)) do
		if ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
			isheadcrab = ent:IsHeadcrab()
			if (isheadcrab or ent:Health() < targethealth) and TrueVisibleFilters(pos, ent:NearestPoint(pos), self, ent) then
				targethealth = ent:Health()
				target = ent

				if isheadcrab then
					break
				end
			end
		end
	end

	return target
end
function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	local secondary = self:IsCharging()

	if secondary then
		self.OriginalMeleeDamage = self.MeleeDamage
		self.OriginalMeleeKnockBack = self.MeleeKnockBack
		self.MeleeDamage = self.MeleeDamage * self.MeleeDamageSecondaryMul
		self.MeleeKnockBack = self.MeleeKnockBack * self.MeleeKnockBackSecondaryMul
	end

	local owner = self:GetOwner()
	if hitent:IsValid() and hitent:IsPlayer() then
		hitent:AddLegDamageExt(secondary and 22 or 10, owner, self, SLOWTYPE_PULSE)
	end
	if hitent:IsPlayer() and hitent:IsValidLivingZombie() then
		local pos = self:LocalToWorld(Vector(0, 0, 29))
		local target = self:FindZapperTarget(pos, owner)

		local shocked = {}
		if target then
			local effectdata = EffectData()
				effectdata:SetOrigin(target:WorldSpaceCenter())
				effectdata:SetStart(pos)
				effectdata:SetEntity(self)
			util.Effect("tracer_zapper", effectdata)

			shocked[target] = true
			for i = 1, (secondary and 6 or 3) do
				local tpos = target:WorldSpaceCenter()

				for k, ent in pairs(ents.FindInSphere(tpos, 105)) do
					if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
						if WorldVisible(tpos, ent:NearestPoint(tpos)) then
							shocked[ent] = true
							target = ent

							timer.Simple(i * 0.15, function()
								if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end

								target:TakeDamage((secondary and self.MeleeDamage * 2 or self.MeleeDamage) / (i + 0.5), owner, self)

								local worldspace = ent:WorldSpaceCenter()
								effectdata = EffectData()
									effectdata:SetOrigin(worldspace)
									effectdata:SetStart(tpos)
									effectdata:SetEntity(target)
								util.Effect("tracer_zapper", effectdata)
							end)

							break
						end
					end
				end
			end
		end
	end

	if tr.HitWorld and tr.HitNormal.z > 0.8 and hitent == Entity(0) and secondary then
		local ice = ents.Create("env_electro")
		if ice:IsValid() then
			ice:SetPos(tr.HitPos)
			ice:SetOwner(owner)
			ice.Damage = self.MeleeDamage * 1.2
			ice.Team = owner:Team()
			ice:Spawn()
		end
	end
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if self:IsCharging() then
		self.MeleeDamage = self.OriginalMeleeDamage
		self.MeleeKnockBack = self.OriginalMeleeKnockBack
	end
end
