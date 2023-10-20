INC_SERVER()

if SERVER then
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
end
function ENT:EntityTakeDamage(ent, dmginfo)
	if ent ~= self:GetOwner() then return end

	local attacker = dmginfo:GetAttacker()
	if attacker:IsValidHuman() and dmginfo:GetInflictor().IsMelee then
		dmginfo:SetDamage(dmginfo:GetDamage() * 0.1)
	else
		dmginfo:SetDamage(dmginfo:GetDamage() * 2.2)
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
			local points = math.min(victim:Health(),attributeddamage) / victim:GetMaxHealth() * victim:GetZombieClassTable().Points
			applier.PointQueue = applier.PointQueue + points

			local pos = victim:GetPos()
			pos.z = pos.z + 32
			applier.LastDamageDealtPos = pos
			applier.LastDamageDealtTime = CurTime()
		end
	end
end
