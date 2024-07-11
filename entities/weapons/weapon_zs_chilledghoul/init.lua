INC_SERVER()
function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if ent:IsPlayer() then
		local owner = self:GetOwner()
		local gt = ent:GiveStatus("frost", 8, owner)

		ent:AddLegDamageExt(12, owner, self, SLOWTYPE_COLD)
        ent.TakedIce = (ent.TakedIce or 0) + 7
		if (ent.TakedIce or 1) >= 90 then
			ent.TakedIce = 0
			timer.Create("IceShadeInductor"..ent:Name(),0.5, 3, function() 
				ent:SetBloodArmor(ent:GetBloodArmor() * 0.4)
				ent:SetHealth(ent:Health() * 0.8)
				local effectdata = EffectData()
					effectdata:SetOrigin(ent:GetPos())
					effectdata:SetNormal(owner:GetEyeTrace().HitNormal)
				util.Effect("hit_ice", effectdata)
				ent:TakeDamage(ent:Health() * 0.15, owner, owner:GetActiveWeapon())
				for _, ent2 in pairs(util.BlastAlloc(self, owner, ent:GetPos(), 20)) do
					if ent2:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", ent2, owner) and ent2 ~= owner and ent2 ~= ent then
						local nearest = ent2:NearestPoint(ent:GetPos())
						local scalar = ((20 - nearest:Distance(ent:GetPos())) / 20)
			
						ent2:GiveStatus("frost", scalar * 7)
						ent2:AddLegDamageExt(18 * scalar, owner, self, SLOWTYPE_COLD)
						ent2:TakeDamage(44 * scalar, owner, owner:GetActiveWeapon())
						ent2.TakedIce = (ent.TakedIce or 0)
					end
				end
			end)
		end
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end