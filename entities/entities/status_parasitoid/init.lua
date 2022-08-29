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
	if (owner) then
		owner:TakeDamage(owner:Health()*0.01,dmger and dmger:IsValid() and dmger:IsPlayer() and dmger or owner, self)
		if dmger and dmger:IsValid() and dmger:IsPlayer() and self.NextThinker <= CurTime() then
			dmger:SetHealth(math.min(dmger:Health() + dmger:GetMaxHealth() *0.06, dmger:GetMaxHealth() * 1.5))
			dmger:SetBloodArmor(math.min(dmger:GetBloodArmor() + dmger.MaxBloodArmor *0.06, dmger.MaxBloodArmor * 2))
			self.NextThinker = CurTime() + 0.5
		end
	end
	if self.DieTime <= CurTime() then
		self:Remove()
	end
end
