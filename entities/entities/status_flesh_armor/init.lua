INC_SERVER()
function ENT:PlayerSet(pPlayer, bExists)
	pPlayer.FleshStatus = self
end
function ENT:Think()
	if self:GetDamage() <= 0 or self:GetOwner():IsValidLivingZombie() then
		self:Remove()
		return
	end
	self:NextThink(CurTime()+0.1)
	return true
end

function ENT:EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	local owner = self:GetOwner()
	if attacker == self:GetOwner() then 
		if attacker:IsPlayer() and attacker:IsValidLivingHuman() then
			dmginfo:SetDamage(dmginfo:GetDamage() * 1.5)
			if !attacker:GetActiveWeapon().IsMelee then
				self:SetDamage(self:GetDamage()-5)
			end
		end
	elseif ent == self:GetOwner() then
		if ent and ent:IsValidLivingHuman() then
			local damage = dmginfo:GetDamage()
			local block = math.min(self:GetDamage(),damage)
			damage = damage - block
			dmginfo:SetDamage(damage)
			self:SetDamage(self:GetDamage()-block)
		end
	end
end
