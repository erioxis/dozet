
INC_SERVER()

function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:GiveStatus("dimvision", 6)
			pl:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() + 20)
		end
		if (not cursed) then 
			pl:GiveStatus("dimvision", 12)
			pl:AddCursed(pl:GetOwner(), 20)
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end