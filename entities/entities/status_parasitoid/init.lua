INC_SERVER()
ENT.NextThinker = 1
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
	local dmger = self.Damager
	local lox = dmger:IsSkillActive(SKILL_LOX)
	if (owner) and not (dmger:GetStatus("rot")) then
		owner:TakeDamage((lox and owner:Health()*0.05 or owner:Health()*0.01),dmger and dmger:IsValid() and dmger:IsPlayer() and dmger or owner, self)
		if dmger and dmger:IsValid() and dmger:IsPlayer() and self.NextThinker <= CurTime() then
			dmger:SetHealth(math.min(dmger:Health() + (lox and owner:Health()*0.05 or owner:Health()*0.01), dmger:GetMaxHealth() * 1.1))
			dmger:SetBloodArmor(math.min(dmger:GetBloodArmor() + (lox and owner:Health()*0.05 or owner:Health()*0.01), dmger.MaxBloodArmor * 1.2))
			self.NextThinker = CurTime() + 0.5
		end
	end
	if self.DieTime <= CurTime() then
		self:Remove()
	end
end
