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
		if ent:IsPlayer() then
			if ent:IsSkillActive(SKILL_BARA_CURSED) then 
				return
			end
			if ent:HasTrinket("antibaracat") then ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 600 or 1600, nil, ent:IsPlayer() and ent:IsSkillActive(SKILL_STEEL_ASS) or noknockdown) 	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage) return end
			ent:GiveStatus("rot",3)
		elseif math.random(1,12) == 1 and not ent:IsPlayer() and not ent:GetClass() == "prop_obj_sigil" then
			ent:Remove()
		end
			local noknockdown = true
			if CurTime() >= (ent.NextKnockdown or 0) then
				noknockdown = false
				ent.NextKnockdown = CurTime() + 2
			end
		ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 600 or 1600, nil, ent:IsPlayer() and ent:IsSkillActive(SKILL_STEEL_ASS) or noknockdown)
	end
end
