INC_SERVER()



function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if  pl:IsPlayer() then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() + 10)
		end
		if (not cursed) then 
			pl:AddCursed(pl:GetOwner(), 10)
		end
		pl:GiveStatus("dimvision", 5)
	end





	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end
