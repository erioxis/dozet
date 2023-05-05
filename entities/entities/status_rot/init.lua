INC_SERVER()
ENT.NoDamage = false
ENT.NextDamage = 0
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
	local owner = self:GetOwner()
	if owner:IsValid() and self.NextDamage < CurTime() then
		owner:TakeDamage(owner:GetMaxHealth()*0.01 *(owner:HasTrinket("bloodgrass") and self.NoDamage and 0 or 1), self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager or owner, self)
		if owner:IsSkillActive(SKILL_CQARMOR) then
			owner:SetHealth(owner:Health() * 0.99)
		end
		owner:AddUselessDamage(owner:GetMaxHealth()*0.01)
		if (owner:HasTrinket("bloodgrass")) then
			self.NoDamage = !self.NoDamage
		end
		self.NextDamage = CurTime() +0.5
	end
	if self:GetStartTime() + self:GetDuration() - CurTime() >= 10000 then
		owner:Kill()
	end
	if self:IsValid() and self.DieTime <= CurTime() then
		self:Remove()
	end
end
