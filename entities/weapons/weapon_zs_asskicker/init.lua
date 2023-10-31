INC_SERVER()

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if ent:IsValid() then
		--[[local vel = ent:GetPos() - self:GetOwner():GetPos()
		vel.z = 0
		vel:Normalize()
		vel = vel * 800
		vel.z = 350

		ent:KnockDown()
		ent:SetGroundEntity(NULL)
		ent:SetVelocity(vel)]]
		if math.random(9) == 1 and ent:IsPlayer() or ent:IsPlayer() and ent:IsSkillActive(SKILL_STEEL_ASS) then
		if ent:HasTrinket("antibaracat") then ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 600 or 1600, nil, noknockdown) 	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage) return end
			timer.Simple(3, function()
				ent:Kill()
			end)
		end
		if math.random(60) == 1 and not ent:IsPlayer() and not ent:GetClass() == "prop_obj_sigil" then
			ent:Remove()
		end
		local noknockdown = true
		if CurTime() >= (ent.NextKnockdown or 0) and ent:IsPlayer() then
			noknockdown = false
			ent.NextKnockdown = CurTime() + 12
			ent:GiveStatus("knockdown",6)
		end
		ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 1200 or 3200, nil)
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end
