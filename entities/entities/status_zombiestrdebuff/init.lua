INC_SERVER()

function ENT:EntityTakeDamage(ent, dmginfo)
	if ent ~= self:GetOwner() then return end

	local attacker = dmginfo:GetAttacker()
	if attacker:IsValidHuman() then
		dmginfo:SetDamage(dmginfo:GetDamage() * 2.5)
	end
end

function ENT:PlayerHurt(victim, attacker, healthleft, damage)
	local applier = self.Applier
	if applier and applier:IsValidLivingHuman() and applier ~= attacker and victim:IsValidLivingZombie() then
		local attributeddamage = damage
		if healthleft < 0 then
			attributeddamage = attributeddamage + healthleft
		end

	end
end
