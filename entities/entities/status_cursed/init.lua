INC_SERVER()

function ENT:SetDie(fTime)
	if fTime == 0 or not fTime then
		self.DieTime = 0
	elseif fTime == -1 then
		self.DieTime = 999999999
	else
		self.DieTime = CurTime() + fTime
		self:SetDuration(fTime)
	end
end
function ENT:Think()
	self:EmitSound("npc/stalker/breathing3.wav", 30, 85)
	local cursed = self:GetOwner():GetStatus("cursed")
	local owner = self:GetOwner()

	if (cursed) then
		if (cursed.DieTime >= CurTime() + 100 * (owner.CurseMultiplier or 1)) and not owner:IsSkillActive(SKILL_CURSEDHEALTH) then
			cursed:GetOwner():Kill()
			cursed:Remove()
		
		elseif (cursed.DieTime >= CurTime() + owner:GetMaxHealth() * (owner.CurseMultiplier or 1)) and owner:IsSkillActive(SKILL_CURSEDHEALTH) then
			cursed:GetOwner():Kill()
			cursed:Remove()
		end
	end

	if self.DieTime <= CurTime() then
		self:Remove()
	end
end
