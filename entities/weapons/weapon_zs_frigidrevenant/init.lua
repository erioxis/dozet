INC_SERVER()

function SWEP:ApplyMeleeDamage(pl, trace, damage)

	if not pl:IsSkillActive(SKILL_ANTINEGR) then
		local gt = pl:GiveStatus("frost", 8)
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() + 20)
		end
		
		if (not cursed) then 
			pl:AddCursed(pl:GetOwner(), 20)
		end
	else
		local cursed = pl:GetStatus("rot")
		if (cursed) then 
			pl:GiveStatus("dimvision", 6)
			pl:AddRot(self:GetOwner(), cursed.DieTime - CurTime() + 5)
		end
		if (not cursed) then 
			pl:GiveStatus("dimvision", 12)
			pl:AddRot(pl:GetOwner(), 5)
		end
	end

	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end