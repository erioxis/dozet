INC_SERVER()

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if ent:IsPlayer() then
		ent:GiveStatus("dimvision", 2.5)
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end

function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:AddCursed(self:GetOwner(), 10,nil,nil,true)
		end
		if (not cursed) then 
			pl:AddCursed(self:GetOwner(), 20)
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end