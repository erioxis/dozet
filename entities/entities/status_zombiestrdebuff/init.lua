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
		if attributeddamage > 0 then
			attributeddamage = attributeddamage - (attributeddamage / 2)

			applier.DamageDealt[TEAM_HUMAN] = applier.DamageDealt[TEAM_HUMAN] + attributeddamage
			victim.DamagedBy[applier] = (victim.DamagedBy[applier] or 0) + attributeddamage
			if GAMEMODE.ObjectiveMap then return end
			local points = math.min(math.min(victim:Health(),attributeddamage) / victim:GetMaxHealth() * victim:GetZombieClassTable().Points,5 )
			applier.PointQueue = applier.PointQueue + points

			local pos = victim:GetPos()
			pos.z = pos.z + 32
			applier.LastDamageDealtPos = pos
			applier.LastDamageDealtTime = CurTime()
		end
	end
end
