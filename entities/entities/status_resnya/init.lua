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
	if attacker ~= self:GetOwner() then return end
	local wep = dmginfo:GetAttacker():GetActiveWeapon()
	local inflictor = dmginfo:GetInflictor()

	if attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN and inflictor == wep and wep.IsMelee then
		local dmg = dmginfo:GetDamage()
		local extradamage = dmg * 0.35
		dmginfo:SetDamage(dmg + extradamage)
	end
end
