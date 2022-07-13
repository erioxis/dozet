INC_SERVER()

function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() then
	if not pl:IsSkillActive(SKILL_ANTINEGR) then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:GiveStatus("dimvision", 6)
			pl:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() + 10)
		end
		if (not cursed) then 
			pl:GiveStatus("dimvision", 12)
			pl:AddCursed(pl:GetOwner(), 10)
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
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end
