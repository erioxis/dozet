INC_SERVER()
<<<<<<< Updated upstream

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if ent:IsPlayer() then
		ent:GiveStatus("dimvision", 5)
=======
function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() then
	if not pl:IsSkillActive(SKILL_ANTINEGR) then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:GiveStatus("dimvision", 6)
			pl:AddCursed(self:GetOwner(),  10)
		end
		if (not cursed) then 
			pl:GiveStatus("dimvision", 12)
			pl:AddCursed(self:GetOwner(), 10)
		end
	else
		local cursed = pl:GetStatus("rot")
				local cursed1 = pl:GetStatus("cursed")
		if (cursed1) then 
			pl:GiveStatus("dimvision", 6)
					if (cursed) then 
			pl:AddRot(self:GetOwner(),5)
			end
			pl:AddCursed(self:GetOwner(),  5)
		end
		if (not cursed1) then 
			pl:GiveStatus("dimvision", 12)
								if (cursed) then 
			pl:AddRot(self:GetOwner(), 5)
			end
						pl:AddCursed(self:GetOwner(), 5)
		end
>>>>>>> Stashed changes
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end
