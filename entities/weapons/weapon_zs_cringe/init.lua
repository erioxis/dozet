INC_SERVER()




function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() then
		local gt = pl:GiveStatus("frost", 8)
		local cursed = pl:GetStatus("radiation")
		if (cursed) then 
			cursed:SetDTInt(1,cursed:GetDTInt(1)+3)
		end
		
		if (not cursed) then 
			local p = pl:GiveStatus("radiation",3)
			p:SetDTInt(1,1)
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end