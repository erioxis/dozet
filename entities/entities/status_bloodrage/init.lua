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

function ENT:EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker:IsValid() and attacker:IsPlayer() then
		dmginfo:SetDamage(dmginfo:GetDamage() * (1 + 0.25 * self:GetDTInt(1)))
	end
end
