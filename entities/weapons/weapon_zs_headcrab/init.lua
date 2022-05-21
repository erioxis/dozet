INC_SERVER()

function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if pl:IsPlayer() then
		local cursed = pl:GetStatus("hallow")
		if (cursed) then 
			pl:AddHallow(self:GetOwner(), cursed.DieTime - CurTime() + 10)
		end
		if (not cursed) then 
			pl:AddHallow(pl:GetOwner(), 2)
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end
