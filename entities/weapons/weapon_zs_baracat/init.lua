INC_SERVER()

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
	if ent:IsValid() then
		--[[local vel = ent:GetPos() - self:GetOwner():GetPos()
		vel.z = 0
		vel:Normalize()
		vel = vel * 800
		vel.z = 350

		ent:KnockDown()
		ent:SetGroundEntity(NULL)
		ent:SetVelocity(vel)]]
		local owner = self:GetOwner()
		local noknockdown = true
		if CurTime() >= (ent.NextKnockdown or 0) then
			noknockdown = false
			ent.NextKnockdown = CurTime() + 4.7
		end
		timer.Simple(0, function() if ent:IsPlayer() and (ent:IsSkillActive(SKILL_BARA_CURSED) or owner.IdealHit and ent:GetActiveWeapon().ParryTiming) then 
			return
		end
		ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 2200 or 6000, nil, ent:IsPlayer() and ent:IsSkillActive(SKILL_STEEL_ASS) or noknockdown) end)
	end
	
end
