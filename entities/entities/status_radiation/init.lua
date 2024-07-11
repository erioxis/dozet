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
		local boss = owner:GetZombieClassTable().Boss
		local int = self:GetDTInt(1)
		local damage = owner:GetMaxHealth()*0.01*int
		if boss then
			damage = int+2
		end
		owner:TakeSpecialDamage(damage, DMG_DIRECT, self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager or owner, self, nil,0)
		self.NextDamage = CurTime() +0.1+(boss and 0.5 or 0)
	end
	if self:IsValid() and self.DieTime <= CurTime() then
		self:Remove()
	end
end
