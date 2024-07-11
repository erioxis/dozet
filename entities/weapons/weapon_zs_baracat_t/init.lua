INC_SERVER()

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
	if ent:IsValid() then
		if ent:IsPlayer() and ent:IsSkillActive(SKILL_STEEL_ASS) then 
			return
		end
		ent:ThrowFromPositionSetZ(trace.StartPos, 5000, nil)
	end
	
end
